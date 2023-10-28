CREATE TABLE IF NOT EXISTS public.orders
(
    id integer NOT NULL,
    amount double precision,
    product_id character varying(255) COLLATE pg_catalog."default",
    product_price double precision,
    qty integer,
    status character varying(255) COLLATE pg_catalog."default",
    user_id integer,
    CONSTRAINT orders_pkey PRIMARY KEY (id),
    CONSTRAINT orders_status_check CHECK (status::text = ANY (ARRAY['Pending'::character varying, 'Completed'::character varying, 'Cancelled'::character varying, 'Payment_Error'::character varying]::text[]))
    )