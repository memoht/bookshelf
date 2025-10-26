--
-- PostgreSQL database dump
--

\restrict 9itoYr36d49FY2G1VKrk61b0Nl1fVIAE1PTeTvlc72gBaXV878qIhUgLeR58W1E

-- Dumped from database version 17.6 (Postgres.app)
-- Dumped by pg_dump version 17.6 (Postgres.app)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: book_categories; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.book_categories AS ENUM (
    'fiction',
    'nonfiction',
    'reference'
);


--
-- Name: book_formats; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.book_formats AS ENUM (
    'hardcover',
    'paperback',
    'ebook',
    'audiobook'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.books (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    author text NOT NULL,
    category public.book_categories DEFAULT 'fiction'::public.book_categories NOT NULL,
    format public.book_formats DEFAULT 'paperback'::public.book_formats NOT NULL,
    isbn text
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    filename text NOT NULL
);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (filename);


--
-- PostgreSQL database dump complete
--

\unrestrict 9itoYr36d49FY2G1VKrk61b0Nl1fVIAE1PTeTvlc72gBaXV878qIhUgLeR58W1E

SET search_path TO "$user", public;

INSERT INTO schema_migrations (filename) VALUES
('20251025210135_create_books.rb');
