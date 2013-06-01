

CREATE USER planyourpicnic WITH PASSWORD planyourpicnic;
CREATE DATABASE planyourpicnic;
GRANT ALL PRIVILEGES ON DATABASE planyourpicnic TO planyourpicnic;

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


INSERT INTO pois (location, type) VALUES ('-35.45737064261896, 149.08309520402537', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (1, 'POINT HUT DISTRICT PARK', 'GORDON', '-35.45737064261896, 149.08309520402537', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.281451138989425, 149.14980510290192', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (2, 'REMEMBERANCE PARK', 'CAMPBELL', '-35.281451138989425, 149.14980510290192', 'ELECTRIC', 2, FALSE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.28103625357118, 149.15006817119664', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (3, 'REMEMBERANCE PARK', 'CAMPBELL', '-35.28103625357118, 149.15006817119664', 'ELECTRIC', 2, NULL, 'STEEL', FALSE, 'TAP', NULL);
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
INSERT INTO pois (location, type) VALUES ('-35.342899996818296, 149.08906264044825', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (9, 'EDISON DISTRICT PARK', 'PHILLIP', '-35.342899996818296, 149.08906264044825', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.3429181740362, 149.0888316704444', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (10, 'EDISON DISTRICT PARK', 'PHILLIP', '-35.3429181740362, 149.0888316704444', 'ELECTRIC', 1, TRUE, 'CONCRETE', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.34661763611248, 149.0819493439275', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (11, 'PHILLIP TOWN CENTRE', 'PHILLIP', '-35.34661763611248, 149.0819493439275', 'ELECTRIC', 2, FALSE, 'BRICK', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.34637197882621, 149.08571108669096', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (12, 'PHILLIP TOWN CENTRE', 'PHILLIP', '-35.34637197882621, 149.08571108669096', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.33442907559154, 149.08776751829365', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (13, 'GROOM STREET - PEDESTRIAN PARKLAND', 'HUGHES', '-35.33442907559154, 149.08776751829365', 'WOOD', 2, FALSE, 'CONCRETE', FALSE, 'LOW', NULL);
INSERT INTO pois (location, type) VALUES ('-35.36217697840341, 149.05607549139197', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (14, 'ARALUEN STREET - NEIGHBOURHOOD PARK', 'FISHER', '-35.36217697840341, 149.05607549139197', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.26638335229035, 149.1320427370237', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (15, 'LOWANNA STREET - NEIGHBOURHOOD PARK', 'BRADDON', '-35.26638335229035, 149.1320427370237', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.26575172039858, 149.13277804596848', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (16, 'LOWANNA STREET - NEIGHBOURHOOD PARK', 'BRADDON', '-35.26575172039858, 149.13277804596848', 'ELECTRIC', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.27123692260874, 149.12723656090068', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (17, 'HAIG PARK', 'TURNER', '-35.27123692260874, 149.12723656090068', 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.27049072528009, 149.12532328560332', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (18, 'HAIG PARK', 'TURNER', '-35.27049072528009, 149.12532328560332', 'ELECTRIC', 2, TRUE, 'TILE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.27058265349084, 149.1411594746599', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (19, 'CORROBOREE PARK', 'AINSLIE', '-35.27058265349084, 149.1411594746599', 'ELECTRIC', 2, FALSE, 'STEEL', FALSE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.28509030481664, 149.1351815842968', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (20, 'GLEBE PARK', 'CITY', '-35.28509030481664, 149.1351815842968', 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.28395444468796, 149.1354436206887', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (21, 'GLEBE PARK', 'CITY', '-35.28395444468796, 149.1354436206887', 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.283450060571695, 149.13513508006588', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (22, 'GLEBE PARK', 'CITY', '-35.283450060571695, 149.13513508006588', 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.30615253588544, 149.16616354036455', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (23, 'MOLONGLO REACH DISTRICT PARK', 'CAMPBELL', '-35.30615253588544, 149.16616354036455', 'ELECTRIC', 2, FALSE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.288744690132965, 149.1002324055555', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (24, 'BLACK MOUNTAIN PENINSULA DISTRICT PARK', 'ACTON', '-35.288744690132965, 149.1002324055555', 'ELECTRIC', 2, FALSE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29381114394521, 149.09838029323365', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (25, 'BLACK MOUNTAIN PENINSULA DISTRICT PARK', 'ACTON', '-35.29381114394521, 149.09838029323365', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29316183216673, 149.09892921608628', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (26, 'BLACK MOUNTAIN PENINSULA DISTRICT PARK', 'ACTON', '-35.29316183216673, 149.09892921608628', 'ELECTRIC', 2, FALSE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29374702782616, 149.099765311383', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (27, 'BLACK MOUNTAIN PENINSULA DISTRICT PARK', 'ACTON', '-35.29374702782616, 149.099765311383', 'ELECTRIC', 2, TRUE, 'STEEL', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.28786875223458, 149.12351241642114', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (28, 'ACTON PARK DISTRICT PARK', 'ACTON', '-35.28786875223458, 149.12351241642114', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.28777892699244, 149.12319352355036', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (29, 'ACTON PARK DISTRICT PARK', 'ACTON', '-35.28777892699244, 149.12319352355036', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.23059452357089, 149.07300344272267', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (30, 'GINNINDERRA PENINSULA DISTRICT PARK', 'BELCONNEN', '-35.23059452357089, 149.07300344272267', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.23069376116979, 149.0728167879597', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (31, 'DIDDAMS CLOSE PEDESTRIAN PARKLAND', 'BELCONNEN', '-35.23069376116979, 149.0728167879597', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.229455410003276, 149.06152417934112', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (32, 'JOYNTON SMITH DRIVE PEDESTRIAN PARKLAND', 'BELCONNEN', '-35.229455410003276, 149.06152417934112', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.22902249108845, 149.06223786390981', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (33, 'LAKE GINNINDERRA WESTERN FORESHORES', 'BELCONNEN', '-35.22902249108845, 149.06223786390981', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'CAST_IRON');
INSERT INTO pois (location, type) VALUES ('-35.228842266236164, 149.0621718427946', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (34, 'LAKE GINNINDERRA WESTERN FORESHORES', 'BELCONNEN', '-35.228842266236164, 149.0621718427946', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.228797284241935, 149.06198508560138', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (35, 'LAKE GINNINDERRA WESTERN FORESHORES', 'BELCONNEN', '-35.228797284241935, 149.06198508560138', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'NONE', 'DUAL');
INSERT INTO pois (location, type) VALUES ('-35.22749943859961, 149.06202818186748', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (36, 'LAKE GINNINDERRA WESTERN FORESHORES', 'BELCONNEN', '-35.22749943859961, 149.06202818186748', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.22626487696531, 149.06162098773459', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (37, 'LAKE GINNINDERRA WESTERN FORESHORES', 'BELCONNEN', '-35.22626487696531, 149.06162098773459', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'CAST_IRON');
INSERT INTO pois (location, type) VALUES ('-35.23398080702988, 149.059077491885', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (38, 'TOTTERDELL STREET PEDESTRIAN PARKLAND', 'BELCONNEN', '-35.23398080702988, 149.059077491885', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.227289204066544, 149.06839864816337', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (39, 'GINNINDERRA PENINSULA DISTRICT PARK', 'BELCONNEN', '-35.227289204066544, 149.06839864816337', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.22737040924885, 149.06821198231674', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (40, 'GINNINDERRA PENINSULA DISTRICT PARK', 'BELCONNEN', '-35.22737040924885, 149.06821198231674', 'ELECTRIC', 2, TRUE, 'CONCRETE', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.23595750157838, 149.07217277845177', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (41, 'JOHN KNIGHT MEMORIAL PARK', 'BELCONNEN', '-35.23595750157838, 149.07217277845177', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.23630900143666, 149.07216206469843', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (42, 'JOHN KNIGHT MEMORIAL PARK', 'BELCONNEN', '-35.23630900143666, 149.07216206469843', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.21961158341024, 149.06589999464063', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (43, 'CARLILE STREET PEDESTRIAN PARKLAND', 'EVATT', '-35.21961158341024, 149.06589999464063', 'ELECTRIC', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.22514069670089, 149.05572212227975', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (44, 'TATTERSALL CRESCENT NEIGHBOURHOOD PARK', 'FLOREY', '-35.22514069670089, 149.05572212227975', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.173681455139146, 149.06849154451115', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (45, 'HALL PARK', 'HALL', '-35.173681455139146, 149.06849154451115', 'WOOD', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.17334793990527, 149.06857911506222', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (46, 'HALL PARK', 'HALL', '-35.17334793990527, 149.06857911506222', 'WOOD', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.21321503201417, 149.0298858977006', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (47, 'UMBAGONG DISTRICT PARK', 'LATHAM', '-35.21321503201417, 149.0298858977006', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.21731617383421, 149.02764651254313', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (48, 'UMBAGONG DISTRICT PARK', 'LATHAM', '-35.21731617383421, 149.02764651254313', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.21755949677854, 149.0277783571634', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (49, 'UMBAGONG DISTRICT PARK', 'LATHAM', '-35.21755949677854, 149.0277783571634', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'TAP', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.20957559336832, 149.01289673339048', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (50, 'MARKS PLACE PEDESTRIAN PARKLAND', 'MACGREGOR', '-35.20957559336832, 149.01289673339048', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.21487504526508, 149.0135888414269', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (51, 'HARPER STREET PEDESTRIAN PARKLAND', 'MACGREGOR', '-35.21487504526508, 149.0135888414269', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'NONE', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.21358996541761, 149.08453218506432', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (52, 'PALMERVILLE HERITAGE PARK', 'MCKELLAR', '-35.21358996541761, 149.08453218506432', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.21332870611908, 149.0843562333795', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (53, 'PALMERVILLE HERITAGE PARK', 'MCKELLAR', '-35.21332870611908, 149.0843562333795', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.18094568997232, 149.12943322378052', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (54, 'YERRABI DISTRICT PARK', 'GUNGAHLIN', '-35.18094568997232, 149.12943322378052', 'ELECTRIC', 1, FALSE, 'STEEL', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.180828284588884, 149.1296745568289', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (55, 'YERRABI DISTRICT PARK', 'GUNGAHLIN', '-35.180828284588884, 149.1296745568289', 'ELECTRIC', 1, FALSE, 'STEEL', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.1807652390512, 149.1296305537608', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (56, 'YERRABI DISTRICT PARK', 'GUNGAHLIN', '-35.1807652390512, 149.1296305537608', 'ELECTRIC', 1, TRUE, 'STEEL', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.18091868441728, 149.1294002513962', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (57, 'YERRABI DISTRICT PARK', 'GUNGAHLIN', '-35.18091868441728, 149.1294002513962', 'ELECTRIC', 1, TRUE, 'STEEL', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.219490111672215, 149.1409779398723', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (58, 'BAILLIEU LANE PEDESTRIAN PARKLAND', 'MITCHELL', '-35.219490111672215, 149.1409779398723', 'GAS', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.42003261198098, 149.0827308402124', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (59, 'GRIFFIN PLACE - PEDESTRIAN PARKLAND', 'MONASH', '-35.42003261198098, 149.0827308402124', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.408139255948974, 149.07757918508935', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (60, 'NEWMAN-MORRIS CIRCUIT - NEIGHBOURHOOD PARK', 'OXLEY', '-35.408139255948974, 149.07757918508935', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.390213456738884, 149.059327392895', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (61, 'KAMBAH DISTRICT PARK', 'KAMBAH', '-35.390213456738884, 149.059327392895', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.390150415169394, 149.05921729562516', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (62, 'KAMBAH DISTRICT PARK', 'KAMBAH', '-35.390150415169394, 149.05921729562516', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.39342120919123, 149.06093629069255', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (63, 'KAMBAH DISTRICT PARK', 'KAMBAH', '-35.39342120919123, 149.06093629069255', 'ELECTRIC', 2, FALSE, 'STEEL', TRUE, 'BOX', NULL);
INSERT INTO pois (location, type) VALUES ('-35.393619506322985, 149.06088138558704', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (64, 'KAMBAH DISTRICT PARK', 'KAMBAH', '-35.393619506322985, 149.06088138558704', 'ELECTRIC', 2, FALSE, 'STEEL', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.393736696185506, 149.06081542229433', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (65, 'KAMBAH DISTRICT PARK', 'KAMBAH', '-35.393736696185506, 149.06081542229433', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.41231913171552, 149.06352441425855', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (66, 'TUGGERANONG TOWN PARK', 'GREENWAY', '-35.41231913171552, 149.06352441425855', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.457595707986066, 149.0834919499188', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (67, 'POINT HUT DISTRICT PARK', 'GORDON', '-35.457595707986066, 149.0834919499188', 'ELECTRIC', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.32835604318044, 149.17545526911474', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (68, 'MARYBOROUGH STREET - PEDESTRIAN PARKLAND', 'FYSHWICK', '-35.32835604318044, 149.17545526911474', 'ELECTRIC', 1, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.328392198954376, 149.17537836100448', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (69, 'MARYBOROUGH STREET - PEDESTRIAN PARKLAND', 'FYSHWICK', '-35.328392198954376, 149.17537836100448', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.319784529498286, 149.11086756430961', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (70, 'BEDFORD STREET - NEIGHBOURHOOD PARK', 'DEAKIN', '-35.319784529498286, 149.11086756430961', 'GAS', 2, TRUE, 'CONCRETE', TRUE, 'WALL', 'CAST_IRON');
INSERT INTO pois (location, type) VALUES ('-35.317192137093954, 149.13608899540762', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (71, 'TELOPEA PARK', 'BARTON', '-35.317192137093954, 149.13608899540762', 'ELECTRIC', 2, FALSE, 'STEEL', TRUE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.31711112802666, 149.13598990567058', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (72, 'TELOPEA PARK', 'BARTON', '-35.31711112802666, 149.13598990567058', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.31643456443724, 149.13658262529796', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (73, 'TELOPEA PARK', 'BARTON', '-35.31643456443724, 149.13658262529796', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.312673825341506, 149.13894072705975', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (74, 'TELOPEA PARK', 'BARTON', '-35.312673825341506, 149.13894072705975', 'GAS', 2, TRUE, 'CONCRETE', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.299427477463105, 149.10806075684857', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (75, 'ALEXANDRINA DRIVE - PEDESTRIAN PARKLAND', 'YARRALUMLA', '-35.299427477463105, 149.10806075684857', 'GAS', 2, TRUE, 'STEEL', FALSE, 'LOCK', NULL);
INSERT INTO pois (location, type) VALUES ('-35.30030059379762, 149.10940304307266', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (76, 'ALEXANDRINA DRIVE - PEDESTRIAN PARKLAND', 'YARRALUMLA', '-35.30030059379762, 149.10940304307266', 'GAS', 2, TRUE, 'STEEL', FALSE, 'LOCK', NULL);
INSERT INTO pois (location, type) VALUES ('-35.300516782223745, 149.11988028527622', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (77, 'LENNOX GARDENS', 'YARRALUMLA', '-35.300516782223745, 149.11988028527622', 'ELECTRIC', 2, FALSE, 'CONCRETE', FALSE, 'LOCK', NULL);
INSERT INTO pois (location, type) VALUES ('-35.30060657559404, 149.12024319922125', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (78, 'LENNOX GARDENS', 'YARRALUMLA', '-35.30060657559404, 149.12024319922125', 'ELECTRIC', 2, FALSE, 'CONCRETE', FALSE, 'NONE', NULL);
INSERT INTO pois (location, type) VALUES ('-35.300038450767865, 149.1206052130071', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (79, 'LENNOX GARDENS', 'YARRALUMLA', '-35.300038450767865, 149.1206052130071', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29728417565665, 149.09394282856493', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (80, 'WESTON PARK', 'YARRALUMLA', '-35.29728417565665, 149.09394282856493', 'GAS', 2, TRUE, 'CONCRETE', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29528460181499, 149.09218187080137', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (81, 'WESTON PARK', 'YARRALUMLA', '-35.29528460181499, 149.09218187080137', 'GAS', 2, TRUE, 'CONCRETE', TRUE, 'TAP_WALL', 'DUAL');
INSERT INTO pois (location, type) VALUES ('-35.29294348070529, 149.08898062082815', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (82, 'WESTON PARK', 'YARRALUMLA', '-35.29294348070529, 149.08898062082815', 'ELECTRIC', 2, TRUE, 'CONCRETE', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.2940860567021, 149.09199377108604', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (83, 'WESTON PARK', 'YARRALUMLA', '-35.2940860567021, 149.09199377108604', 'ELECTRIC', 2, TRUE, 'STEEL', TRUE, 'WALL', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.2924020699275, 149.08996942279038', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (84, 'WESTON PARK', 'YARRALUMLA', '-35.2924020699275, 149.08996942279038', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.29184263328922, 149.09094720097067', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (85, 'WESTON PARK', 'YARRALUMLA', '-35.29184263328922, 149.09094720097067', 'GAS', 2, TRUE, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.291560956685665, 149.09426664409975', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (86, 'WESTON PARK', 'YARRALUMLA', '-35.291560956685665, 149.09426664409975', 'GAS', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.242238471960455, 149.1228222090476', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (87, 'ELLENBOROUGH STREET - PEDESTRIAN PARKLAND', 'LYNEHAM', '-35.242238471960455, 149.1228222090476', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.2394359375419, 149.07304331232157', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (88, 'JOHN KNIGHT MEMORIAL PARK', 'BELCONNEN', '-35.2394359375419, 149.07304331232157', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP_WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.23941793534658, 149.07299935650863', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (89, 'JOHN KNIGHT MEMORIAL PARK', 'BELCONNEN', '-35.23941793534658, 149.07299935650863', 'ELECTRIC', 1, TRUE, 'CONCRETE', TRUE, 'WALL', NULL);
INSERT INTO pois (location, type) VALUES ('-35.16296830708231, 149.06189869543797', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (90, 'VICTORIA STREET ROAD VERGE', 'HALL', '-35.16296830708231, 149.06189869543797', 'WOOD', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.413218744860856, 149.11903222764903', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (91, 'FADDEN PINES DISTRICT PARK', 'FADDEN', '-35.413218744860856, 149.11903222764903', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.411975224087755, 149.1188213747372', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (92, 'FADDEN PINES DISTRICT PARK', 'FADDEN', '-35.411975224087755, 149.1188213747372', 'ELECTRIC', 2, FALSE, 'CONCRETE', FALSE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.412471503070165, 149.1181615144885', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (93, 'FADDEN PINES DISTRICT PARK', 'FADDEN', '-35.412471503070165, 149.1181615144885', 'ELECTRIC', 2, FALSE, 'CONCRETE', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.41284846351037, 149.11987941200383', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (94, 'FADDEN PINES DISTRICT PARK', 'FADDEN', '-35.41284846351037, 149.11987941200383', 'ELECTRIC', 2, TRUE, 'CONCRETE', TRUE, 'TAP', 'ALUMINIUM');
INSERT INTO pois (location, type) VALUES ('-35.19397880009252, 149.10880033186908', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (95, 'CANDLEBARK CLOSE NEIGHBOURHOOD PARK', 'NICHOLLS', '-35.19397880009252, 149.10880033186908', 'ELECTRIC', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.193600157294995, 149.10893162126092', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (96, 'CANDLEBARK CLOSE NEIGHBOURHOOD PARK', 'NICHOLLS', '-35.193600157294995, 149.10893162126092', 'ELECTRIC', 2, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.411462789163856, 149.06388712867113', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (97, 'TUGGERANONG TOWN PARK', 'GREENWAY', '-35.411462789163856, 149.06388712867113', 'ELECTRIC', 2, NULL, 'STEEL', TRUE, 'TAP', NULL);
INSERT INTO pois (location, type) VALUES ('-35.409991550137114, 149.06858677881831', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (98, 'LAKE TUGGERANONG DISTRICT PARK', 'GREENWAY', '-35.409991550137114, 149.06858677881831', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.40877448827168, 149.06936748131807', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (99, 'LAKE TUGGERANONG DISTRICT PARK', 'GREENWAY', '-35.40877448827168, 149.06936748131807', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES ('-35.406737213589736, 149.070301657102', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (100, 'LAKE TUGGERANONG DISTRICT PARK', 'GREENWAY', '-35.406737213589736, 149.070301657102', 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO pois (location, type) VALUES (NULL, 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (101, 'BUNYA CLOSE PEDESTRIAN PARKLAND', 'PALMERSTON', NULL, 'ELECTRIC', 2, TRUE, NULL, NULL, NULL, NULL);
