-- Table: public.events

-- DROP TABLE IF EXISTS public.events;

CREATE TABLE IF NOT EXISTS public.events
(
    event_time timestamp with time zone,
    event_id uuid NOT NULL,
    CONSTRAINT events_pkey PRIMARY KEY (event_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.events
    OWNER to postgres;
