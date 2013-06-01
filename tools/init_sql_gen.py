#!/usr/bin/env python

# Create the SQL initialisation script
# Takes BBQ data CSV as argument

import sys
import csv


print """

CREATE USER planyourpicnic WITH PASSWORD planyourpicnic;
CREATE DATABASE planyourpicnic;
GRANT ALL PRIVILEGES ON DATABASE planyourpicnic TO planyourpicnic;


CREATE EXTENSION cube;
CREATE EXTENSION earthdistance;


--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.pois DROP CONSTRAINT pois_pkey;
ALTER TABLE ONLY public.bbqs DROP CONSTRAINT bbqs_pkey;
ALTER TABLE public.pois ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.pois_id_seq;
DROP TABLE public.pois;
DROP TABLE public.bbqs;
DROP TYPE public.poi_type;
DROP TYPE public.bbq_type;
DROP TYPE public.bbq_hotplate_material;
DROP TYPE public.bbq_climb_access;
DROP TYPE public.bbq_bench_type;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: bbq_bench_type; Type: TYPE; Schema: public; Owner: planyourpicnic
--

CREATE TYPE bbq_bench_type AS ENUM (
    'STEEL',
    'CONCRETE',
    'BRICK',
    'TILE'
);


ALTER TYPE public.bbq_bench_type OWNER TO planyourpicnic;

--
-- Name: bbq_climb_access; Type: TYPE; Schema: public; Owner: planyourpicnic
--

CREATE TYPE bbq_climb_access AS ENUM (
    'NONE',
    'TAP',
    'WALL',
    'LOW',
    'TAP_WALL',
    'BOX',
    'LOCK'
);


ALTER TYPE public.bbq_climb_access OWNER TO planyourpicnic;

--
-- Name: bbq_hotplate_material; Type: TYPE; Schema: public; Owner: planyourpicnic
--

CREATE TYPE bbq_hotplate_material AS ENUM (
    'CAST_IRON',
    'ALUMINIUM',
    'DUAL'
);


ALTER TYPE public.bbq_hotplate_material OWNER TO planyourpicnic;

--
-- Name: bbq_type; Type: TYPE; Schema: public; Owner: planyourpicnic
--

CREATE TYPE bbq_type AS ENUM (
    'ELECTRIC',
    'GAS',
    'WOOD'
);


ALTER TYPE public.bbq_type OWNER TO planyourpicnic;

--
-- Name: poi_type; Type: TYPE; Schema: public; Owner: planyourpicnic
--

CREATE TYPE poi_type AS ENUM (
    'bbq',
    'toilet',
    'playground',
    'furniture',
    'attraction'
);


ALTER TYPE public.poi_type OWNER TO planyourpicnic;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bbqs; Type: TABLE; Schema: public; Owner: planyourpicnic; Tablespace: 
--

CREATE TABLE bbqs (
    id integer NOT NULL,
    name character varying(64),
    suburb character varying(32),
    location point,
    type bbq_type,
    hotplates integer,
    tap boolean,
    bench_type bbq_bench_type,
    wired_door boolean,
    climb_access bbq_climb_access,
    hotplate_material bbq_hotplate_material
);


ALTER TABLE public.bbqs OWNER TO planyourpicnic;

--
-- Name: pois; Type: TABLE; Schema: public; Owner: planyourpicnic; Tablespace: 
--

CREATE TABLE pois (
    id integer NOT NULL,
    location point,
    type poi_type NOT NULL
);


ALTER TABLE public.pois OWNER TO planyourpicnic;

--
-- Name: pois_id_seq; Type: SEQUENCE; Schema: public; Owner: planyourpicnic
--

CREATE SEQUENCE pois_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pois_id_seq OWNER TO planyourpicnic;

--
-- Name: pois_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: planyourpicnic
--

ALTER SEQUENCE pois_id_seq OWNED BY pois.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: planyourpicnic
--

ALTER TABLE ONLY pois ALTER COLUMN id SET DEFAULT nextval('pois_id_seq'::regclass);


--
-- Data for Name: bbqs; Type: TABLE DATA; Schema: public; Owner: planyourpicnic
--

COPY bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) FROM stdin;
\.


--
-- Data for Name: pois; Type: TABLE DATA; Schema: public; Owner: planyourpicnic
--

COPY pois (id, location, type) FROM stdin;
\.


--
-- Name: pois_id_seq; Type: SEQUENCE SET; Schema: public; Owner: planyourpicnic
--

SELECT pg_catalog.setval('pois_id_seq', 1, false);


--
-- Name: bbqs_pkey; Type: CONSTRAINT; Schema: public; Owner: planyourpicnic; Tablespace: 
--

ALTER TABLE ONLY bbqs
    ADD CONSTRAINT bbqs_pkey PRIMARY KEY (id);


--
-- Name: pois_pkey; Type: CONSTRAINT; Schema: public; Owner: planyourpicnic; Tablespace: 
--

ALTER TABLE ONLY pois
    ADD CONSTRAINT pois_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

"""


current_id = 1

# Import the data
with open(sys.argv[1]) as csvfile:
    reader = csv.reader(csvfile)
    for line in reader:
        
        print "INSERT INTO pois (location, type) VALUES (%s, 'bbq');" % ((line[2] and line[3]) and "'%s, %s'" % (line[2], line[3]) or 'NULL')
        
        
        print "INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (%d, '%s', '%s', %s, '%s', %d, %s, %s, %s, %s, %s);" % \
            (current_id,
            line[0],
            line[1],
            (line[3] and line[2]) and "'%s, %s'" % (line[3], line[2]) or 'NULL',
            line[4],
            line[5]=='SINGLE' and 1 or 2,
            line[6] == 'Y' and 'TRUE' or (line[6] == 'N' and 'FALSE' or 'NULL'),
            line[7] and "'" + line[7] + "'" or 'NULL',
            line[8] == 'YES' and 'TRUE' or (line[8] == 'NO' and 'FALSE' or 'NULL'),
            line[9] and "'" + line[9] + "'" or 'NULL',
            line[10] and (line[10] == 'CAST IRON' and "'CAST_IRON'" or "'" + line[10] + "'") or 'NULL')
        
        current_id += 1
