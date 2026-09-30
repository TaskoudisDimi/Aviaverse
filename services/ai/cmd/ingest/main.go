// ingest extracts text from a reference PDF, splits it into overlapping
// chunks, embeds each chunk with Gemini, and stores the vectors in
// library_documents / library_chunks for retrieval by the AI Instructor.
//
// Usage:
//
//	go run ./cmd/ingest -pdf "/path/to/book.pdf" -title "Book Title"
package main

import (
	"bytes"
	"context"
	"database/sql"
	"flag"
	"fmt"
	"log"
	"os"
	"os/exec"
	"strings"
	"time"

	_ "github.com/lib/pq"
	"google.golang.org/genai"
)

const (
	embedModel   = "gemini-embedding-001"
	embedDims    = 768
	chunkSize    = 1200 // characters
	chunkOverlap = 150  // characters
	batchSize    = 20   // chunks per embedding API call
)

func main() {
	pdfPath := flag.String("pdf", "", "path to the source PDF")
	title := flag.String("title", "", "human-readable title for the document")
	flag.Parse()

	if *pdfPath == "" || *title == "" {
		log.Fatal("both -pdf and -title are required")
	}

	db, err := sql.Open("postgres", os.Getenv("DATABASE_URL"))
	if err != nil {
		log.Fatalf("db open: %v", err)
	}
	defer db.Close()
	if err := db.Ping(); err != nil {
		log.Fatalf("db ping: %v", err)
	}

	sourceFilename := *pdfPath
	var existingID int
	err = db.QueryRow(`SELECT id FROM library_documents WHERE source_filename = $1`, sourceFilename).Scan(&existingID)
	if err == nil {
		log.Fatalf("already ingested as document id %d (%q) — delete that row first to re-ingest", existingID, *title)
	} else if err != sql.ErrNoRows {
		log.Fatalf("check existing: %v", err)
	}

	log.Printf("extracting text from %s ...", *pdfPath)
	text, pageCount, err := extractText(*pdfPath)
	if err != nil {
		log.Fatalf("extract text: %v", err)
	}
	log.Printf("extracted %d chars across %d pages", len(text), pageCount)

	chunks := chunkText(text)
	log.Printf("split into %d chunks", len(chunks))
	if len(chunks) == 0 {
		log.Fatal("no chunks produced — is the PDF text-based (not scanned images)?")
	}

	ctx := context.Background()
	apiKey := os.Getenv("GEMINI_API_KEY")
	if apiKey == "" {
		log.Fatal("GEMINI_API_KEY not set")
	}
	gc, err := genai.NewClient(ctx, &genai.ClientConfig{APIKey: apiKey, Backend: genai.BackendGeminiAPI})
	if err != nil {
		log.Fatalf("gemini client: %v", err)
	}

	var docID int
	err = db.QueryRow(
		`INSERT INTO library_documents (title, source_filename, page_count) VALUES ($1, $2, $3) RETURNING id`,
		*title, sourceFilename, pageCount,
	).Scan(&docID)
	if err != nil {
		log.Fatalf("insert document: %v", err)
	}
	log.Printf("document id %d created", docID)

	inserted := 0
	for start := 0; start < len(chunks); start += batchSize {
		end := start + batchSize
		if end > len(chunks) {
			end = len(chunks)
		}
		batch := chunks[start:end]

		embeddings, err := embedBatch(ctx, gc, *title, batch)
		if err != nil {
			log.Fatalf("embed batch [%d:%d]: %v", start, end, err)
		}
		if len(embeddings) != len(batch) {
			log.Fatalf("embedding count mismatch: got %d for %d chunks", len(embeddings), len(batch))
		}

		tx, err := db.Begin()
		if err != nil {
			log.Fatalf("begin tx: %v", err)
		}
		for i, chunk := range batch {
			vecLit := vectorLiteral(embeddings[i])
			_, err := tx.Exec(
				`INSERT INTO library_chunks (document_id, chunk_index, content, embedding) VALUES ($1, $2, $3, $4::vector)`,
				docID, start+i, chunk, vecLit,
			)
			if err != nil {
				tx.Rollback()
				log.Fatalf("insert chunk %d: %v", start+i, err)
			}
		}
		if err := tx.Commit(); err != nil {
			log.Fatalf("commit tx: %v", err)
		}
		inserted += len(batch)
		log.Printf("progress: %d/%d chunks embedded and stored", inserted, len(chunks))
	}

	if _, err := db.Exec(`UPDATE library_documents SET chunk_count = $1 WHERE id = $2`, inserted, docID); err != nil {
		log.Fatalf("update chunk_count: %v", err)
	}

	log.Printf("done — document id %d (%q): %d chunks ingested", docID, *title, inserted)
}

// extractText runs pdftotext -layout on the given PDF and returns the full
// text plus the page count (parsed from pdfinfo).
func extractText(pdfPath string) (string, int, error) {
	infoCmd := exec.Command("pdfinfo", pdfPath)
	infoOut, err := infoCmd.Output()
	pageCount := 0
	if err == nil {
		for _, line := range strings.Split(string(infoOut), "\n") {
			if strings.HasPrefix(line, "Pages:") {
				fmt.Sscanf(strings.TrimSpace(strings.TrimPrefix(line, "Pages:")), "%d", &pageCount)
			}
		}
	}

	var out bytes.Buffer
	cmd := exec.Command("pdftotext", "-layout", pdfPath, "-")
	cmd.Stdout = &out
	if err := cmd.Run(); err != nil {
		return "", 0, fmt.Errorf("pdftotext: %w", err)
	}
	// pdftotext occasionally emits raw bytes that aren't valid UTF-8 (stray
	// Latin-1 bytes from a PDF's font encoding table) — Postgres rejects
	// those outright on insert, so strip them here instead of per-chunk.
	return strings.ToValidUTF8(out.String(), ""), pageCount, nil
}

// chunkText splits text into overlapping chunks, preferring to break on
// paragraph or sentence boundaries near the target chunk size. Chunks that
// are mostly whitespace (e.g. blank pages) are skipped.
func chunkText(text string) []string {
	// Collapse excessive blank lines but keep paragraph breaks.
	paragraphs := strings.Split(text, "\n\n")

	var chunks []string
	var current strings.Builder

	flush := func() {
		// Byte-offset slicing below (overlap carry-forward, hard-split) can
		// land mid-rune even when the source text is valid UTF-8 — sanitize
		// each chunk right before it's stored rather than trying to make
		// every slice point rune-aware.
		s := strings.ToValidUTF8(strings.TrimSpace(current.String()), "")
		if len(s) >= 40 { // skip near-empty fragments
			chunks = append(chunks, s)
		}
		current.Reset()
	}

	for _, p := range paragraphs {
		p = strings.TrimSpace(p)
		if p == "" {
			continue
		}
		if current.Len()+len(p)+2 > chunkSize && current.Len() > 0 {
			flush()
			// carry the tail of the previous chunk forward for overlap
			prev := chunks[len(chunks)-1]
			if len(prev) > chunkOverlap {
				current.WriteString(prev[len(prev)-chunkOverlap:])
				current.WriteString("\n\n")
			}
		}
		current.WriteString(p)
		current.WriteString("\n\n")

		// A single paragraph longer than chunkSize: hard-split it.
		for current.Len() > chunkSize+chunkOverlap {
			s := current.String()
			cut := chunkSize
			if idx := strings.LastIndexByte(s[:chunkSize], ' '); idx > chunkSize/2 {
				cut = idx
			}
			chunks = append(chunks, strings.ToValidUTF8(strings.TrimSpace(s[:cut]), ""))
			rest := s[cut:]
			current.Reset()
			current.WriteString(rest)
		}
	}
	flush()
	return chunks
}

func embedBatch(ctx context.Context, gc *genai.Client, title string, texts []string) ([][]float32, error) {
	dims := int32(embedDims)
	contents := make([]*genai.Content, len(texts))
	for i, t := range texts {
		contents[i] = genai.NewContentFromText(t, genai.RoleUser)
	}

	var lastErr error
	for attempt := 0; attempt < 4; attempt++ {
		if attempt > 0 {
			time.Sleep(time.Duration(attempt) * 2 * time.Second)
		}
		result, err := gc.Models.EmbedContent(ctx, embedModel, contents, &genai.EmbedContentConfig{
			TaskType:             "RETRIEVAL_DOCUMENT",
			Title:                title,
			OutputDimensionality: &dims,
		})
		if err == nil {
			out := make([][]float32, len(result.Embeddings))
			for i, e := range result.Embeddings {
				out[i] = e.Values
			}
			return out, nil
		}
		lastErr = err
		log.Printf("embed attempt %d failed: %v (retrying)", attempt+1, err)
	}
	return nil, lastErr
}

func vectorLiteral(v []float32) string {
	var b strings.Builder
	b.WriteByte('[')
	for i, f := range v {
		if i > 0 {
			b.WriteByte(',')
		}
		fmt.Fprintf(&b, "%g", f)
	}
	b.WriteByte(']')
	return b.String()
}
