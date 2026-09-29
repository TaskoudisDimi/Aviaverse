-- AI Instructor library: RAG (retrieval-augmented generation) over uploaded reference PDFs.
-- Chunks are embedded with Gemini's embedding model (768-dim, truncated via OutputDimensionality)
-- and retrieved by cosine similarity at chat time to ground answers in the book library.

CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS library_documents (
    id              SERIAL PRIMARY KEY,
    title           TEXT NOT NULL,
    source_filename TEXT NOT NULL UNIQUE,
    page_count      INT,
    chunk_count     INT NOT NULL DEFAULT 0,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS library_chunks (
    id          BIGSERIAL PRIMARY KEY,
    document_id INT NOT NULL REFERENCES library_documents(id) ON DELETE CASCADE,
    chunk_index INT NOT NULL,
    content     TEXT NOT NULL,
    embedding   vector(768) NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS library_chunks_document_id_idx ON library_chunks (document_id);

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_indexes WHERE indexname = 'library_chunks_embedding_idx'
    ) THEN
        CREATE INDEX library_chunks_embedding_idx ON library_chunks
            USING hnsw (embedding vector_cosine_ops);
    END IF;
END $$;
