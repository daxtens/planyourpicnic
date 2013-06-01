--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.playgrounds DROP CONSTRAINT playgrounds_pkey;
ALTER TABLE public.playgrounds ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.playgrounds_id_seq;
DROP TABLE public.playgrounds;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: playgrounds; Type: TABLE; Schema: public; Owner: planyourpicnic; Tablespace: 
--

CREATE TABLE playgrounds (
    id integer NOT NULL,
    asset_id text,
    division_name text,
    surface_type text,
    area integer,
    perimeter integer,
    location point
);


ALTER TABLE public.playgrounds OWNER TO planyourpicnic;

--
-- Name: playgrounds_id_seq; Type: SEQUENCE; Schema: public; Owner: planyourpicnic
--

CREATE SEQUENCE playgrounds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playgrounds_id_seq OWNER TO planyourpicnic;

--
-- Name: playgrounds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: planyourpicnic
--

ALTER SEQUENCE playgrounds_id_seq OWNED BY playgrounds.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: planyourpicnic
--

ALTER TABLE ONLY playgrounds ALTER COLUMN id SET DEFAULT nextval('playgrounds_id_seq'::regclass);


--
-- Name: playgrounds_pkey; Type: CONSTRAINT; Schema: public; Owner: planyourpicnic; Tablespace: 
--

ALTER TABLE ONLY playgrounds
    ADD CONSTRAINT playgrounds_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
