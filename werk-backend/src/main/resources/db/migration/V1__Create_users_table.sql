CREATE TYPE rate_type AS ENUM ('HOURLY', 'FIXED');

CREATE TABLE users (
    id UUID PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    bio TEXT,
    skills TEXT,                       -- free-text tags for now (Phase 2 = structured)
    rate_type rate_type,
    rate_amount NUMERIC(10,2),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
