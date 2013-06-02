--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.sites DROP CONSTRAINT sites_pkey;
DROP TABLE public.sites;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: sites; Type: TABLE; Schema: public; Owner: planyourpicnic; Tablespace: 
--

CREATE TABLE sites (
    id integer NOT NULL,
    suburb text,
    park_name text,
    has_toilet boolean,
    has_bbq boolean,
    has_playground boolean,
    location point
);


ALTER TABLE public.sites OWNER TO planyourpicnic;

--
-- Name: sites_pkey; Type: CONSTRAINT; Schema: public; Owner: planyourpicnic; Tablespace: 
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
