--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.furniture DROP CONSTRAINT furniture_pkey;
ALTER TABLE public.furniture ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.furniture_id_seq;
DROP TABLE public.furniture;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: furniture; Type: TABLE; Schema: public; Owner: planyourpicnic; Tablespace: 
--

CREATE TABLE furniture (
    id integer NOT NULL,
    asset_id text,
    feature_type text,
    division_name text,
    location_name text,
    location point
);


ALTER TABLE public.furniture OWNER TO planyourpicnic;

--
-- Name: furniture_id_seq; Type: SEQUENCE; Schema: public; Owner: planyourpicnic
--

CREATE SEQUENCE furniture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.furniture_id_seq OWNER TO planyourpicnic;

--
-- Name: furniture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: planyourpicnic
--

ALTER SEQUENCE furniture_id_seq OWNED BY furniture.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: planyourpicnic
--

ALTER TABLE ONLY furniture ALTER COLUMN id SET DEFAULT nextval('furniture_id_seq'::regclass);


--
-- Name: furniture_pkey; Type: CONSTRAINT; Schema: public; Owner: planyourpicnic; Tablespace: 
--

ALTER TABLE ONLY furniture
    ADD CONSTRAINT furniture_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
