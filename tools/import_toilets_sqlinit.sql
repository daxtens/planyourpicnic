--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.toilets DROP CONSTRAINT toilets_pkey;
ALTER TABLE public.toilets ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.toilets_id_seq;
DROP TABLE public.toilets;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: toilets; Type: TABLE; Schema: public; Owner: planyourpicnic; Tablespace: 
--

CREATE TABLE toilets (
    id integer NOT NULL,
    asset_id text,
    division_name text,
    location_description text,
    toilet_type_text text,
    location point
);


ALTER TABLE public.toilets OWNER TO planyourpicnic;

--
-- Name: toilets_id_seq; Type: SEQUENCE; Schema: public; Owner: planyourpicnic
--

CREATE SEQUENCE toilets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.toilets_id_seq OWNER TO planyourpicnic;

--
-- Name: toilets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: planyourpicnic
--

ALTER SEQUENCE toilets_id_seq OWNED BY toilets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: planyourpicnic
--

ALTER TABLE ONLY toilets ALTER COLUMN id SET DEFAULT nextval('toilets_id_seq'::regclass);


--
-- Name: toilets_pkey; Type: CONSTRAINT; Schema: public; Owner: planyourpicnic; Tablespace: 
--

ALTER TABLE ONLY toilets
    ADD CONSTRAINT toilets_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
