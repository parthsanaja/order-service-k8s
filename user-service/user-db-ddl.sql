
CREATE SEQUENCE IF NOT EXISTS public.users_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.user_transaction_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;


CREATE TABLE IF NOT EXISTS public.users
(
    name character(50) COLLATE pg_catalog."default" NOT NULL,
    balance numeric(10,5),
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    CONSTRAINT users_pkey PRIMARY KEY (id)
    )

CREATE TABLE IF NOT EXISTS public.user_transaction
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer,
    amount numeric(20,2),
    status character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT user_transaction_pkey PRIMARY KEY (id)
    )