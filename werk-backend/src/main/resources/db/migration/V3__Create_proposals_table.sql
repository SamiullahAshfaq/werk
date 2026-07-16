CREATE TYPE proposal_status AS ENUM ('PENDING', 'ACCEPTED', 'REJECTED');

CREATE TABLE proposals (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    gig_id UUID NOT NULL REFERENCES gigs(id),
    freelancer_id UUID NOT NULL REFERENCES users(id),
    bid_amount NUMERIC(10,2) NOT NULL CHECK (bid_amount > 0),
    cover_message TEXT,
    delivery_days INT NOT NULL CHECK (delivery_days > 0),
    status proposal_status NOT NULL DEFAULT 'PENDING',
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_proposals_gig_id ON proposals(gig_id);
CREATE INDEX idx_proposals_freelancer_id ON proposals(freelancer_id);

-- only one active (pending) proposal per freelancer per gig; resubmission allowed after rejection
CREATE UNIQUE INDEX idx_proposals_active_unique ON proposals(gig_id, freelancer_id) WHERE status = 'PENDING';
