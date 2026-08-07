CREATE TYPE gig_status AS ENUM ('OPEN', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED');

CREATE TABLE gigs (
    id UUID PRIMARY KEY,
    client_id UUID NOT NULL REFERENCES users(id),
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    budget NUMERIC(10,2) NOT NULL CHECK (budget > 0),
    category VARCHAR(50),              -- plain dropdown value, no taxonomy yet
    deadline DATE,
    status gig_status NOT NULL DEFAULT 'OPEN',
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_gigs_client_id ON gigs(client_id);
CREATE INDEX idx_gigs_status ON gigs(status);
