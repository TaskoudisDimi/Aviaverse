// query is a manual test tool for the library RAG pilot: embeds a question
// the same way a real chat request would (RETRIEVAL_QUERY task type) and
// prints the closest chunks by cosine similarity, so retrieval quality can
// be checked before wiring this into the live AI Instructor chat.
//
// Usage:
//
//	go run ./cmd/query -q "How does an air data computer work?"
package main

import (
	"context"
	"database/sql"
	"flag"
	"fmt"
	"log"
	"os"
	"strings"

	_ "github.com/lib/pq"
	"google.golang.org/genai"
)

const (
	embedModel = "gemini-embedding-001"
	embedDims  = 768
)

func main() {
	question := flag.String("q", "", "question to search the library for")
	topK := flag.Int("k", 5, "number of chunks to return")
	flag.Parse()
	if *question == "" {
		log.Fatal("-q is required")
	}

	db, err := sql.Open("postgres", os.Getenv("DATABASE_URL"))
	if err != nil {
		log.Fatalf("db open: %v", err)
	}
	defer db.Close()

	ctx := context.Background()
	apiKey := os.Getenv("GEMINI_API_KEY")
	gc, err := genai.NewClient(ctx, &genai.ClientConfig{APIKey: apiKey, Backend: genai.BackendGeminiAPI})
	if err != nil {
		log.Fatalf("gemini client: %v", err)
	}

	dims := int32(embedDims)
	result, err := gc.Models.EmbedContent(ctx, embedModel,
		[]*genai.Content{genai.NewContentFromText(*question, genai.RoleUser)},
		&genai.EmbedContentConfig{TaskType: "RETRIEVAL_QUERY", OutputDimensionality: &dims},
	)
	if err != nil {
		log.Fatalf("embed query: %v", err)
	}
	vec := result.Embeddings[0].Values

	var b strings.Builder
	b.WriteByte('[')
	for i, f := range vec {
		if i > 0 {
			b.WriteByte(',')
		}
		fmt.Fprintf(&b, "%g", f)
	}
	b.WriteByte(']')

	rows, err := db.Query(`
		SELECT d.title, c.chunk_index, c.content, 1 - (c.embedding <=> $1::vector) AS similarity
		FROM library_chunks c
		JOIN library_documents d ON d.id = c.document_id
		ORDER BY c.embedding <=> $1::vector
		LIMIT $2`, b.String(), *topK)
	if err != nil {
		log.Fatalf("query: %v", err)
	}
	defer rows.Close()

	fmt.Printf("Question: %s\n\n", *question)
	n := 0
	for rows.Next() {
		n++
		var title, content string
		var idx int
		var sim float64
		if err := rows.Scan(&title, &idx, &content, &sim); err != nil {
			log.Fatalf("scan: %v", err)
		}
		fmt.Printf("--- #%d  similarity=%.4f  %s [chunk %d] ---\n%s\n\n", n, sim, title, idx, content)
	}
}
