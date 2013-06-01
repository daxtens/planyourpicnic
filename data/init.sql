

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


INSERT INTO pois (location, type) VALUES ('-35.45581137378915, 149.08430158724218', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (1, 'POINT HUT DISTRICT PARK', 'GORDON', '149.08430158724218, -35.45581137378915', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.27989081985249, 149.1510077258796', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (2, 'REMEMBERANCE PARK', 'CAMPBELL', '149.1510077258796, -35.27989081985249', 'ELECTRIC', 2, FALSE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.27947593093122, 149.15127078352003', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (3, 'REMEMBERANCE PARK', 'CAMPBELL', '149.15127078352003, -35.27947593093122', 'ELECTRIC', 2, NULL, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES (NULL, 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (4, 'TELOPEA PARK', 'BARTON SOUTH', NULL, 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES (NULL, 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (5, 'BOWEN PARK', 'BARTON SOUTH', NULL, 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES (NULL, 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (6, 'MOLONGLO REACH WATER SKI', 'FYSHWICK', NULL, 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES (NULL, 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (7, 'MOLONGLO REACH WATER SKI', 'FYSHWICK', NULL, 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES (NULL, 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (8, 'JAMES HARRISON STREET NEIGHBOURHOOD PARK', 'DUNLOP', NULL, 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.34134041511183, 149.09026721719138', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (9, 'EDISON DISTRICT PARK', 'PHILLIP', '149.09026721719138, -35.34134041511183', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.34135859467093, 149.09003625142404', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (10, 'EDISON DISTRICT PARK', 'PHILLIP', '149.09003625142404, -35.34135859467093', 'ELECTRIC', 1, TRUE, 'CONCRETE', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.34505813342126, 149.0831540980166', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (11, 'PHILLIP TOWN CENTRE', 'PHILLIP', '149.0831540980166, -35.34505813342126', 'ELECTRIC', 2, FALSE, 'BRICK', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.3448124381079, 149.08691577253225', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (12, 'PHILLIP TOWN CENTRE', 'PHILLIP', '149.08691577253225, -35.3448124381079', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.332869488298314, 149.0889719915733', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (13, 'GROOM STREET - PEDESTRIAN PARKLAND', 'HUGHES', '149.0889719915733, -35.332869488298314', 'WOOD', 2, FALSE, 'CONCRETE', FALSE, 'LOW', NULL);
INSERT INTO pois (location, type) VALUES ('-35.36061776783144, 149.05728092085437', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (14, 'ARALUEN STREET - NEIGHBOURHOOD PARK', 'FISHER', '149.05728092085437, -35.36061776783144', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.264823177488445, 149.13324544241698', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (15, 'LOWANNA STREET - NEIGHBOURHOOD PARK', 'BRADDON', '149.13324544241698, -35.264823177488445', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.26419153693818, 149.13398072939992', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (16, 'LOWANNA STREET - NEIGHBOURHOOD PARK', 'BRADDON', '149.13398072939992, -35.26419153693818', 'ELECTRIC', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.269676805965446, 149.128439420567', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (17, 'HAIG PARK', 'TURNER', '149.128439420567, -35.269676805965446', 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.268930626060246, 149.1265261670954', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (18, 'HAIG PARK', 'TURNER', '149.1265261670954, -35.268930626060246', 'ELECTRIC', 2, TRUE, 'TILE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.26902239704774, 149.14236208552208', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (19, 'CORROBOREE PARK', 'AINSLIE', '149.14236208552208, -35.26902239704774', 'ELECTRIC', 2, FALSE, 'STEEL', FALSE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.283530138869736, 149.13638451233865', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (20, 'GLEBE PARK', 'CITY', '149.13638451233865, -35.283530138869736', 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.2823942736987, 149.13664652742972', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (21, 'GLEBE PARK', 'CITY', '149.13664652742972, -35.2823942736987', 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.28188989156852, 149.13633798464767', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (22, 'GLEBE PARK', 'CITY', '149.13633798464767, -35.28188989156852', 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.30459210706816, 149.16736624753833', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (23, 'MOLONGLO REACH DISTRICT PARK', 'CAMPBELL', '149.16736624753833, -35.30459210706816', 'ELECTRIC', 2, FALSE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.287184879675145, 149.10143598784438', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (24, 'BLACK MOUNTAIN PENINSULA DISTRICT PARK', 'ACTON', '149.10143598784438, -35.287184879675145', 'ELECTRIC', 2, FALSE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29225136284666, 149.0995839823143', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (25, 'BLACK MOUNTAIN PENINSULA DISTRICT PARK', 'ACTON', '149.0995839823143, -35.29225136284666', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.291602044204275, 149.1001328861308', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (26, 'BLACK MOUNTAIN PENINSULA DISTRICT PARK', 'ACTON', '149.1001328861308, -35.291602044204275', 'ELECTRIC', 2, FALSE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29218723280686, 149.10096897573715', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (27, 'BLACK MOUNTAIN PENINSULA DISTRICT PARK', 'ACTON', '149.10096897573715, -35.29218723280686', 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.286308708304276, 149.12471558600586', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (28, 'ACTON PARK DISTRICT PARK', 'ACTON', '149.12471558600586, -35.286308708304276', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.28621888604077, 149.12439669728315', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (29, 'ACTON PARK DISTRICT PARK', 'ACTON', '149.12439669728315, -35.28621888604077', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.22903485914802, 149.07420663256198', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (30, 'GINNINDERRA PENINSULA DISTRICT PARK', 'BELCONNEN', '149.07420663256198, -35.22903485914802', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.22913409881397, 149.07401998246425', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (31, 'DIDDAMS CLOSE PEDESTRIAN PARKLAND', 'BELCONNEN', '149.07401998246425, -35.22913409881397', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.227895857251475, 149.06272754914428', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (32, 'JOYNTON SMITH DRIVE PEDESTRIAN PARKLAND', 'BELCONNEN', '149.06272754914428, -35.227895857251475', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.22746293031728, 149.06344121508812', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (33, 'LAKE GINNINDERRA WESTERN FORESHORES', 'BELCONNEN', '149.06344121508812, -35.22746293031728', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'CAST_IRON');
INSERT INTO pois (location, type) VALUES ('-35.22728270573626, 149.06337519244357', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (34, 'LAKE GINNINDERRA WESTERN FORESHORES', 'BELCONNEN', '149.06337519244357, -35.22728270573626', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.22723772550238, 149.06318843778723', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (35, 'LAKE GINNINDERRA WESTERN FORESHORES', 'BELCONNEN', '149.06318843778723, -35.22723772550238', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'NONE', 'DUAL');
INSERT INTO pois (location, type) VALUES ('-35.22593987665947, 149.0632315141529', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (36, 'LAKE GINNINDERRA WESTERN FORESHORES', 'BELCONNEN', '149.0632315141529, -35.22593987665947', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.22470531643638, 149.0628243087729', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (37, 'LAKE GINNINDERRA WESTERN FORESHORES', 'BELCONNEN', '149.0628243087729, -35.22470531643638', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'CAST_IRON');
INSERT INTO pois (location, type) VALUES ('-35.23242128827743, 149.0602809704526', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (38, 'TOTTERDELL STREET PEDESTRIAN PARKLAND', 'BELCONNEN', '149.0602809704526, -35.23242128827743', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.225729578357466, 149.0696018681482', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (39, 'GINNINDERRA PENINSULA DISTRICT PARK', 'BELCONNEN', '149.0696018681482, -35.225729578357466', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.22581078556837, 149.06941520670023', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (40, 'GINNINDERRA PENINSULA DISTRICT PARK', 'BELCONNEN', '149.06941520670023, -35.22581078556837', 'ELECTRIC', 2, TRUE, 'CONCRETE', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.23439785686701, 149.07337606172158', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (41, 'JOHN KNIGHT MEMORIAL PARK', 'BELCONNEN', '149.07337606172158, -35.23439785686701', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.23474935758308, 149.07336535334284', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (42, 'JOHN KNIGHT MEMORIAL PARK', 'BELCONNEN', '149.07336535334284, -35.23474935758308', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.21805196616149, 149.06710314413485', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (43, 'CARLILE STREET PEDESTRIAN PARKLAND', 'EVATT', '149.06710314413485, -35.21805196616149', 'ELECTRIC', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.22358119240674, 149.0569255278184', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (44, 'TATTERSALL CRESCENT NEIGHBOURHOOD PARK', 'FLOREY', '149.0569255278184, -35.22358119240674', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.1721217148012, 149.06969397257734', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (45, 'HALL PARK', 'HALL', '149.06969397257734, -35.1721217148012', 'WOOD', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.171788197995035, 149.06978153671787', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (46, 'HALL PARK', 'HALL', '149.06978153671787, -35.171788197995035', 'WOOD', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.21165575907552, 149.03108956980003', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (47, 'UMBAGONG DISTRICT PARK', 'LATHAM', '149.03108956980003, -35.21165575907552', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.21575693192697, 149.02885028353302', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (48, 'UMBAGONG DISTRICT PARK', 'LATHAM', '149.02885028353302, -35.21575693192697', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.216000254080946, 149.0289821294878', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (49, 'UMBAGONG DISTRICT PARK', 'LATHAM', '149.0289821294878, -35.216000254080946', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'TAP', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.208016481554345, 149.01410064265275', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (50, 'MARKS PLACE PEDESTRIAN PARKLAND', 'MACGREGOR', '149.01410064265275, -35.208016481554345', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.21331593791127, 149.01479281707643', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (51, 'HARPER STREET PEDESTRIAN PARKLAND', 'MACGREGOR', '149.01479281707643, -35.21331593791127', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'NONE', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.212030150237915, 149.08573492631857', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (52, 'PALMERVILLE HERITAGE PARK', 'MCKELLAR', '149.08573492631857, -35.212030150237915', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.21176889213245, 149.08555897379725', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (53, 'PALMERVILLE HERITAGE PARK', 'MCKELLAR', '149.08555897379725, -35.21176889213245', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.17938536020483, 149.1306347140522', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (54, 'YERRABI DISTRICT PARK', 'GUNGAHLIN', '149.1306347140522, -35.17938536020483', 'ELECTRIC', 1, FALSE, 'STEEL', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.179267952181405, 149.13087604123282', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (55, 'YERRABI DISTRICT PARK', 'GUNGAHLIN', '149.13087604123282, -35.179267952181405', 'ELECTRIC', 1, FALSE, 'STEEL', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.17920490694801, 149.13083203799187', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (56, 'YERRABI DISTRICT PARK', 'GUNGAHLIN', '149.13083203799187, -35.17920490694801', 'ELECTRIC', 1, TRUE, 'STEEL', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.179358354920225, 149.1306017418361', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (57, 'YERRABI DISTRICT PARK', 'GUNGAHLIN', '149.1306017418361, -35.179358354920225', 'ELECTRIC', 1, TRUE, 'STEEL', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.21792974846826, 149.14217979972778', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (58, 'BAILLIEU LANE PEDESTRIAN PARKLAND', 'MITCHELL', '149.14217979972778, -35.21792974846826', 'GAS', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.418473263436844, 149.08393667282357', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (59, 'GRIFFIN PLACE - PEDESTRIAN PARKLAND', 'MONASH', '149.08393667282357, -35.418473263436844', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.406579932416214, 149.078784929065', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (60, 'NEWMAN-MORRIS CIRCUIT - NEIGHBOURHOOD PARK', 'OXLEY', '149.078784929065, -35.406579932416214', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.38865427563898, 149.06053318352699', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (61, 'KAMBAH DISTRICT PARK', 'KAMBAH', '149.06053318352699, -35.38865427563898', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.38859123502866, 149.06042308720956', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (62, 'KAMBAH DISTRICT PARK', 'KAMBAH', '149.06042308720956, -35.38859123502866', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.39186201914013, 149.06214210143943', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (63, 'KAMBAH DISTRICT PARK', 'KAMBAH', '149.06214210143943, -35.39186201914013', 'ELECTRIC', 2, FALSE, 'STEEL', TRUE, 'BOX', NULL);
INSERT INTO pois (location, type) VALUES ('-35.392060317259286, 149.06208720022866', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (64, 'KAMBAH DISTRICT PARK', 'KAMBAH', '149.06208720022866, -35.392060317259286', 'ELECTRIC', 2, FALSE, 'STEEL', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.39217750803989, 149.06202123981333', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (65, 'KAMBAH DISTRICT PARK', 'KAMBAH', '149.06202123981333, -35.39217750803989', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.41075995778424, 149.06473046198218', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (66, 'TUGGERANONG TOWN PARK', 'GREENWAY', '149.06473046198218, -35.41075995778424', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.45603643569598, 149.08469832967276', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (67, 'POINT HUT DISTRICT PARK', 'GORDON', '149.08469832967276, -35.45603643569598', 'ELECTRIC', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.32679556973443, 149.17665814523707', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (68, 'MARYBOROUGH STREET - PEDESTRIAN PARKLAND', 'FYSHWICK', '149.17665814523707, -35.32679556973443', 'ELECTRIC', 1, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.32683172635146, 149.17658123898545', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (69, 'MARYBOROUGH STREET - PEDESTRIAN PARKLAND', 'FYSHWICK', '149.17658123898545, -35.32683172635146', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.318224680302826, 149.1120714236933', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (70, 'BEDFORD STREET - NEIGHBOURHOOD PARK', 'DEAKIN', '149.1120714236933, -35.318224680302826', 'GAS', 2, TRUE, 'CONCRETE', TRUE, 'WALL', 'CAST_IRON');
INSERT INTO pois (location, type) VALUES ('-35.31563203124345, 149.13729238303222', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (71, 'TELOPEA PARK', 'BARTON', '149.13729238303222, -35.31563203124345', 'ELECTRIC', 2, FALSE, 'STEEL', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.315551022987194, 149.1371932937981', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (72, 'TELOPEA PARK', 'BARTON', '149.1371932937981, -35.315551022987194', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.314874452037614, 149.1377859932168', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (73, 'TELOPEA PARK', 'BARTON', '149.1377859932168, -35.314874452037614', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.311113681357206, 149.14014399875', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (74, 'TELOPEA PARK', 'BARTON', '149.14014399875, -35.311113681357206', 'GAS', 2, TRUE, 'CONCRETE', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29786761215841, 149.10926436287255', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (75, 'ALEXANDRINA DRIVE - PEDESTRIAN PARKLAND', 'YARRALUMLA', '149.10926436287255, -35.29786761215841', 'GAS', 2, TRUE, 'STEEL', FALSE, 'LOCK', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29874071702086, 149.11060663897456', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (76, 'ALEXANDRINA DRIVE - PEDESTRIAN PARKLAND', 'YARRALUMLA', '149.11060663897456, -35.29874071702086', 'GAS', 2, TRUE, 'STEEL', FALSE, 'LOCK', NULL);
INSERT INTO pois (location, type) VALUES ('-35.2989568016604, 149.12108370443633', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (77, 'LENNOX GARDENS', 'YARRALUMLA', '149.12108370443633, -35.2989568016604', 'ELECTRIC', 2, FALSE, 'CONCRETE', FALSE, 'LOCK', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29904659161348, 149.1214466134771', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (78, 'LENNOX GARDENS', 'YARRALUMLA', '149.1214466134771, -35.29904659161348', 'ELECTRIC', 2, FALSE, 'CONCRETE', FALSE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29847846196022, 149.1218086126338', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (79, 'LENNOX GARDENS', 'YARRALUMLA', '149.1218086126338, -35.29847846196022', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.295724446221506, 149.09514664524562', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (80, 'WESTON PARK', 'YARRALUMLA', '149.09514664524562, -35.295724446221506', 'GAS', 2, TRUE, 'CONCRETE', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29372488558414, 149.09338568810165', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (81, 'WESTON PARK', 'YARRALUMLA', '149.09338568810165, -35.29372488558414', 'GAS', 2, TRUE, 'CONCRETE', TRUE, 'TAP_WALL', 'DUAL');
INSERT INTO pois (location, type) VALUES ('-35.29138379127552, 149.09018445841244', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (82, 'WESTON PARK', 'YARRALUMLA', '149.09018445841244, -35.29138379127552', 'ELECTRIC', 2, TRUE, 'CONCRETE', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.292526339753515, 149.09319757386874', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (83, 'WESTON PARK', 'YARRALUMLA', '149.09319757386874, -35.292526339753515', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'WALL', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.290842369487386, 149.0911732353872', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (84, 'WESTON PARK', 'YARRALUMLA', '149.0911732353872, -35.290842369487386', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.290282921910084, 149.0921509885024', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (85, 'WESTON PARK', 'YARRALUMLA', '149.0921509885024, -35.290282921910084', 'GAS', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.2900012116651, 149.09547037048418', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (86, 'WESTON PARK', 'YARRALUMLA', '149.09547037048418, -35.2900012116651', 'GAS', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.240678337293915, 149.12402471614314', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (87, 'ELLENBOROUGH STREET - PEDESTRIAN PARKLAND', 'LYNEHAM', '149.12402471614314, -35.240678337293915', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.23787629161338, 149.0742466320383', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (88, 'JOHN KNIGHT MEMORIAL PARK', 'BELCONNEN', '149.0742466320383, -35.23787629161338', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.23785828981654, 149.07420267671318', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (89, 'JOHN KNIGHT MEMORIAL PARK', 'BELCONNEN', '149.07420267671318, -35.23785828981654', 'ELECTRIC', 1, TRUE, 'CONCRETE', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.1614086096141, 149.0631010787332', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (90, 'VICTORIA STREET ROAD VERGE', 'HALL', '149.0631010787332, -35.1614086096141', 'WOOD', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.411659018894845, 149.12023733459992', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (91, 'FADDEN PINES DISTRICT PARK', 'FADDEN', '149.12023733459992, -35.411659018894845', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.41041549747595, 149.12002646680193', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (92, 'FADDEN PINES DISTRICT PARK', 'FADDEN', '149.12002646680193, -35.41041549747595', 'ELECTRIC', 2, FALSE, 'CONCRETE', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.410911784139124, 149.11936662529087', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (93, 'FADDEN PINES DISTRICT PARK', 'FADDEN', '149.11936662529087, -35.410911784139124', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.4112887282731, 149.12108449887032', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (94, 'FADDEN PINES DISTRICT PARK', 'FADDEN', '149.12108449887032, -35.4112887282731', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.192418702451185, 149.11000236792742', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (95, 'CANDLEBARK CLOSE NEIGHBOURHOOD PARK', 'NICHOLLS', '149.11000236792742, -35.192418702451185', 'ELECTRIC', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.19204005755238, 149.1101336494905', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (96, 'CANDLEBARK CLOSE NEIGHBOURHOOD PARK', 'NICHOLLS', '149.1101336494905, -35.19204005755238', 'ELECTRIC', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.4099036097063, 149.0650931574052', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (97, 'TUGGERANONG TOWN PARK', 'GREENWAY', '149.0650931574052, -35.4099036097063', 'ELECTRIC', 2, NULL, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.408432320486845, 149.06979270489398', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (98, 'LAKE TUGGERANONG DISTRICT PARK', 'GREENWAY', '149.06979270489398, -35.408432320486845', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.407215248123386, 149.0705733758516', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (99, 'LAKE TUGGERANONG DISTRICT PARK', 'GREENWAY', '149.0705733758516, -35.407215248123386', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.40517795959149, 149.07150750524184', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (100, 'LAKE TUGGERANONG DISTRICT PARK', 'GREENWAY', '149.07150750524184, -35.40517795959149', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES (NULL, 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (101, 'BUNYA CLOSE PEDESTRIAN PARKLAND', 'PALMERSTON', NULL, 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
