
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


INSERT INTO pois (id, location, type) VALUES (0, 'IIT_PRIMARY_KEY, IIT_ADMIN_UNIT', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (0, 'IIT_NE_ID', 'IIT_INV_TYPE', 'IIT_PRIMARY_KEY, IIT_ADMIN_UNIT', 'BBQ_ASSET_ID', 2, NULL, 'BBQ_Y_POS', NULL, 'BBQ_HOTPLATE', 'LU_NUMBER');
INSERT INTO pois (id, location, type) VALUES (1, 'BBQ123, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (1, '4,325,150', 'BBQ', 'BBQ123, 18', 'BBQ123', 2, NULL, '584,504', NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (2, 'BBQ105, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (2, '4,223,956', 'BBQ', 'BBQ105, 18', 'BBQ105', 2, NULL, '604,017', NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (3, 'BBQ106, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (3, '4,223,982', 'BBQ', 'BBQ106, 18', 'BBQ106', 2, NULL, '604,063', NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (4, 'BBQ125, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (4, '5,823,000', 'BBQ', 'BBQ125, 18', 'BBQ125', 2, NULL, NULL, NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (5, 'BBQ126, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (5, '5,823,001', 'BBQ', 'BBQ126, 18', 'BBQ126', 2, NULL, NULL, NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (6, 'BBQ127, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (6, '5,823,003', 'BBQ', 'BBQ127, 18', 'BBQ127', 2, NULL, NULL, NULL, 'DOUBLE', '302');
INSERT INTO pois (id, location, type) VALUES (7, 'BBQ128, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (7, '5,823,004', 'BBQ', 'BBQ128, 18', 'BBQ128', 2, NULL, NULL, NULL, 'DOUBLE', '300');
INSERT INTO pois (id, location, type) VALUES (8, 'BBQ130, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (8, '6,050,715', 'BBQ', 'BBQ130, 18', 'BBQ130', 2, NULL, NULL, NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (9, 'BBQ1, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (9, '2,524,152', 'BBQ', 'BBQ1, 18', 'BBQ1', 2, NULL, '597,205', NULL, 'DOUBLE', '236');
INSERT INTO pois (id, location, type) VALUES (10, 'BBQ2, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (10, '2,524,153', 'BBQ', 'BBQ2, 18', 'BBQ2', 2, NULL, '597,203', NULL, 'SINGLE', '235');
INSERT INTO pois (id, location, type) VALUES (11, 'BBQ3, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (11, '2,524,154', 'BBQ', 'BBQ3, 18', 'BBQ3', 2, NULL, '596,793', NULL, 'DOUBLE', '240');
INSERT INTO pois (id, location, type) VALUES (12, 'BBQ4, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (12, '2,524,155', 'BBQ', 'BBQ4, 18', 'BBQ4', 2, NULL, '596,820', NULL, 'DOUBLE', '238');
INSERT INTO pois (id, location, type) VALUES (13, 'BBQ5, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (13, '2,524,156', 'BBQ', 'BBQ5, 18', 'BBQ5', 2, NULL, '598,145', NULL, 'DOUBLE', '0');
INSERT INTO pois (id, location, type) VALUES (14, 'BBQ6, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (14, '2,524,157', 'BBQ', 'BBQ6, 18', 'BBQ6', 2, NULL, '595,068', NULL, 'DOUBLE', '275');
INSERT INTO pois (id, location, type) VALUES (15, 'BBQ7, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (15, '2,524,158', 'BBQ', 'BBQ7, 18', 'BBQ7', 2, NULL, '605,691', NULL, 'DOUBLE', '86');
INSERT INTO pois (id, location, type) VALUES (16, 'BBQ8, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (16, '2,524,159', 'BBQ', 'BBQ8, 18', 'BBQ8', 2, NULL, '605,761', NULL, 'DOUBLE', '82');
INSERT INTO pois (id, location, type) VALUES (17, 'BBQ12, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (17, '2,524,163', 'BBQ', 'BBQ12, 18', 'BBQ12', 2, NULL, '605,153', NULL, 'DOUBLE', '48');
INSERT INTO pois (id, location, type) VALUES (18, 'BBQ13, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (18, '2,524,164', 'BBQ', 'BBQ13, 18', 'BBQ13', 2, NULL, '605,236', NULL, 'DOUBLE', '88');
INSERT INTO pois (id, location, type) VALUES (19, 'BBQ14, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (19, '2,524,165', 'BBQ', 'BBQ14, 18', 'BBQ14', 2, NULL, '605,224', NULL, 'DOUBLE', '40');
INSERT INTO pois (id, location, type) VALUES (20, 'BBQ15, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (20, '2,524,166', 'BBQ', 'BBQ15, 18', 'BBQ15', 2, NULL, '603,615', NULL, 'DOUBLE', '80');
INSERT INTO pois (id, location, type) VALUES (21, 'BBQ16, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (21, '2,524,167', 'BBQ', 'BBQ16, 18', 'BBQ16', 2, NULL, '603,741', NULL, 'DOUBLE', '38');
INSERT INTO pois (id, location, type) VALUES (22, 'BBQ17, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (22, '2,524,168', 'BBQ', 'BBQ17, 18', 'BBQ17', 2, NULL, '603,797', NULL, 'DOUBLE', '36');
INSERT INTO pois (id, location, type) VALUES (23, 'BBQ20, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (23, '2,524,171', 'BBQ', 'BBQ20, 18', 'BBQ20', 2, NULL, '601,274', NULL, 'DOUBLE', '0');
INSERT INTO pois (id, location, type) VALUES (24, 'BBQ21, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (24, '2,524,172', 'BBQ', 'BBQ21, 18', 'BBQ21', 2, NULL, '603,213', NULL, 'DOUBLE', '67');
INSERT INTO pois (id, location, type) VALUES (25, 'BBQ22, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (25, '2,524,173', 'BBQ', 'BBQ22, 18', 'BBQ22', 2, NULL, '602,651', NULL, 'DOUBLE', '69');
INSERT INTO pois (id, location, type) VALUES (26, 'BBQ23, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (26, '2,524,174', 'BBQ', 'BBQ23, 18', 'BBQ23', 2, NULL, '602,723', NULL, 'DOUBLE', '70');
INSERT INTO pois (id, location, type) VALUES (27, 'BBQ24, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (27, '2,524,175', 'BBQ', 'BBQ24, 18', 'BBQ24', 2, NULL, '602,658', NULL, 'DOUBLE', '72');
INSERT INTO pois (id, location, type) VALUES (28, 'BBQ25, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (28, '2,524,176', 'BBQ', 'BBQ25, 18', 'BBQ25', 2, NULL, '603,308', NULL, 'DOUBLE', '62');
INSERT INTO pois (id, location, type) VALUES (29, 'BBQ26, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (29, '2,524,177', 'BBQ', 'BBQ26, 18', 'BBQ26', 2, NULL, '603,318', NULL, 'DOUBLE', '65');
INSERT INTO pois (id, location, type) VALUES (30, 'BBQ27, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (30, '2,524,178', 'BBQ', 'BBQ27, 18', 'BBQ27', 2, NULL, '609,667', NULL, 'DOUBLE', '11');
INSERT INTO pois (id, location, type) VALUES (31, 'BBQ28, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (31, '2,524,179', 'BBQ', 'BBQ28, 18', 'BBQ28', 2, NULL, '609,656', NULL, 'DOUBLE', '9');
INSERT INTO pois (id, location, type) VALUES (32, 'BBQ29, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (32, '2,524,180', 'BBQ', 'BBQ29, 18', 'BBQ29', 2, NULL, '609,794', NULL, 'DOUBLE', '25');
INSERT INTO pois (id, location, type) VALUES (33, 'BBQ30, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (33, '2,524,181', 'BBQ', 'BBQ30, 18', 'BBQ30', 2, NULL, '609,842', NULL, 'DOUBLE', '23');
INSERT INTO pois (id, location, type) VALUES (34, 'BBQ31, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (34, '2,524,182', 'BBQ', 'BBQ31, 18', 'BBQ31', 2, NULL, '609,862', NULL, 'DOUBLE', '17');
INSERT INTO pois (id, location, type) VALUES (35, 'BBQ32, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (35, '2,524,183', 'BBQ', 'BBQ32, 18', 'BBQ32', 2, NULL, '609,867', NULL, 'DOUBLE', '15');
INSERT INTO pois (id, location, type) VALUES (36, 'BBQ33, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (36, '2,524,184', 'BBQ', 'BBQ33, 18', 'BBQ33', 2, NULL, '610,011', NULL, 'DOUBLE', '19');
INSERT INTO pois (id, location, type) VALUES (37, 'BBQ34, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (37, '2,524,185', 'BBQ', 'BBQ34, 18', 'BBQ34', 2, NULL, '610,148', NULL, 'DOUBLE', '21');
INSERT INTO pois (id, location, type) VALUES (38, 'BBQ35, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (38, '2,524,186', 'BBQ', 'BBQ35, 18', 'BBQ35', 2, NULL, '609,292', NULL, 'DOUBLE', '94');
INSERT INTO pois (id, location, type) VALUES (39, 'BBQ36, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (39, '2,524,187', 'BBQ', 'BBQ36, 18', 'BBQ36', 2, NULL, '610,034', NULL, 'DOUBLE', '13');
INSERT INTO pois (id, location, type) VALUES (40, 'BBQ37, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (40, '2,524,188', 'BBQ', 'BBQ37, 18', 'BBQ37', 2, NULL, '610,025', NULL, 'DOUBLE', '7');
INSERT INTO pois (id, location, type) VALUES (41, 'BBQ38, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (41, '2,524,189', 'BBQ', 'BBQ38, 18', 'BBQ38', 2, NULL, '609,072', NULL, 'DOUBLE', '33');
INSERT INTO pois (id, location, type) VALUES (42, 'BBQ39, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (42, '2,524,190', 'BBQ', 'BBQ39, 18', 'BBQ39', 2, NULL, '609,033', NULL, 'DOUBLE', '31');
INSERT INTO pois (id, location, type) VALUES (43, 'BBQ40, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (43, '2,524,191', 'BBQ', 'BBQ40, 18', 'BBQ40', 2, NULL, '610,886', NULL, 'DOUBLE', '5');
INSERT INTO pois (id, location, type) VALUES (44, 'BBQ41, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (44, '2,524,192', 'BBQ', 'BBQ41, 18', 'BBQ41', 2, NULL, '610,273', NULL, 'DOUBLE', '34');
INSERT INTO pois (id, location, type) VALUES (45, 'BBQ42, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (45, '2,524,193', 'BBQ', 'BBQ42, 18', 'BBQ42', 2, NULL, '615,982', NULL, 'DOUBLE', '0');
INSERT INTO pois (id, location, type) VALUES (46, 'BBQ43, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (46, '2,524,194', 'BBQ', 'BBQ43, 18', 'BBQ43', 2, NULL, '616,019', NULL, 'DOUBLE', '0');
INSERT INTO pois (id, location, type) VALUES (47, 'BBQ44, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (47, '2,524,195', 'BBQ', 'BBQ44, 18', 'BBQ44', 2, NULL, '611,597', NULL, 'DOUBLE', '74');
INSERT INTO pois (id, location, type) VALUES (48, 'BBQ45, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (48, '2,524,196', 'BBQ', 'BBQ45, 18', 'BBQ45', 2, NULL, '611,142', NULL, 'DOUBLE', '92');
INSERT INTO pois (id, location, type) VALUES (49, 'BBQ46, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (49, '2,524,197', 'BBQ', 'BBQ46, 18', 'BBQ46', 2, NULL, '611,115', NULL, 'DOUBLE', '90');
INSERT INTO pois (id, location, type) VALUES (50, 'BBQ47, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (50, '2,524,198', 'BBQ', 'BBQ47, 18', 'BBQ47', 2, NULL, '612,001', NULL, 'DOUBLE', '1');
INSERT INTO pois (id, location, type) VALUES (51, 'BBQ48, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (51, '2,524,199', 'BBQ', 'BBQ48, 18', 'BBQ48', 2, NULL, '611,413', NULL, 'DOUBLE', '3');
INSERT INTO pois (id, location, type) VALUES (52, 'BBQ49, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (52, '2,524,200', 'BBQ', 'BBQ49, 18', 'BBQ49', 2, NULL, '611,553', NULL, 'DOUBLE', '78');
INSERT INTO pois (id, location, type) VALUES (53, 'BBQ50, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (53, '2,524,201', 'BBQ', 'BBQ50, 18', 'BBQ50', 2, NULL, '611,582', NULL, 'DOUBLE', '76');
INSERT INTO pois (id, location, type) VALUES (54, 'BBQ53, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (54, '2,524,204', 'BBQ', 'BBQ53, 18', 'BBQ53', 2, NULL, '615,171', NULL, 'SINGLE', NULL);
INSERT INTO pois (id, location, type) VALUES (55, 'BBQ54, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (55, '2,524,205', 'BBQ', 'BBQ54, 18', 'BBQ54', 2, NULL, '615,184', NULL, 'SINGLE', NULL);
INSERT INTO pois (id, location, type) VALUES (56, 'BBQ55, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (56, '2,524,206', 'BBQ', 'BBQ55, 18', 'BBQ55', 2, NULL, '615,191', NULL, 'SINGLE', NULL);
INSERT INTO pois (id, location, type) VALUES (57, 'BBQ56, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (57, '2,524,207', 'BBQ', 'BBQ56, 18', 'BBQ56', 2, NULL, '615,174', NULL, 'SINGLE', NULL);
INSERT INTO pois (id, location, type) VALUES (58, 'BBQ57, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (58, '2,524,208', 'BBQ', 'BBQ57, 18', 'BBQ57', 2, NULL, '610,893', NULL, 'DOUBLE', '96');
INSERT INTO pois (id, location, type) VALUES (59, 'BBQ58, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (59, '2,524,209', 'BBQ', 'BBQ58, 18', 'BBQ58', 2, NULL, '588,647', NULL, 'DOUBLE', '281');
INSERT INTO pois (id, location, type) VALUES (60, 'BBQ59, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (60, '2,524,210', 'BBQ', 'BBQ59, 18', 'BBQ59', 2, NULL, '589,967', NULL, 'DOUBLE', '256');
INSERT INTO pois (id, location, type) VALUES (61, 'BBQ60, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (61, '2,524,211', 'BBQ', 'BBQ60, 18', 'BBQ60', 2, NULL, '591,957', NULL, 'DOUBLE', '248');
INSERT INTO pois (id, location, type) VALUES (62, 'BBQ61, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (62, '2,524,212', 'BBQ', 'BBQ61, 18', 'BBQ61', 2, NULL, '591,964', NULL, 'DOUBLE', '250');
INSERT INTO pois (id, location, type) VALUES (63, 'BBQ62, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (63, '2,524,213', 'BBQ', 'BBQ62, 18', 'BBQ62', 2, NULL, '591,601', NULL, 'DOUBLE', '242');
INSERT INTO pois (id, location, type) VALUES (64, 'BBQ63, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (64, '2,524,214', 'BBQ', 'BBQ63, 18', 'BBQ63', 2, NULL, '591,579', NULL, 'DOUBLE', '244');
INSERT INTO pois (id, location, type) VALUES (65, 'BBQ64, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (65, '2,524,215', 'BBQ', 'BBQ64, 18', 'BBQ64', 2, NULL, '591,566', NULL, 'DOUBLE', '246');
INSERT INTO pois (id, location, type) VALUES (66, 'BBQ65, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (66, '2,524,216', 'BBQ', 'BBQ65, 18', 'BBQ65', 2, NULL, '589,504', NULL, 'DOUBLE', '279');
INSERT INTO pois (id, location, type) VALUES (67, 'BBQ66, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (67, '2,524,217', 'BBQ', 'BBQ66, 18', 'BBQ66', 2, NULL, '584,479', NULL, 'DOUBLE', '0');
INSERT INTO pois (id, location, type) VALUES (68, 'BBQ67, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (68, '2,524,218', 'BBQ', 'BBQ67, 18', 'BBQ67', 2, NULL, '598,809', NULL, 'SINGLE', '260');
INSERT INTO pois (id, location, type) VALUES (69, 'BBQ68, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (69, '2,524,219', 'BBQ', 'BBQ68, 18', 'BBQ68', 2, NULL, '598,805', NULL, 'DOUBLE', '258');
INSERT INTO pois (id, location, type) VALUES (70, 'BBQ69, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (70, '2,524,220', 'BBQ', 'BBQ69, 18', 'BBQ69', 2, NULL, '599,768', NULL, 'DOUBLE', '221');
INSERT INTO pois (id, location, type) VALUES (71, 'BBQ70, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (71, '2,524,221', 'BBQ', 'BBQ70, 18', 'BBQ70', 2, NULL, '600,053', NULL, 'DOUBLE', '223');
INSERT INTO pois (id, location, type) VALUES (72, 'BBQ71, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (72, '2,524,222', 'BBQ', 'BBQ71, 18', 'BBQ71', 2, NULL, '600,062', NULL, 'DOUBLE', '225');
INSERT INTO pois (id, location, type) VALUES (73, 'BBQ73, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (73, '2,524,224', 'BBQ', 'BBQ73, 18', 'BBQ73', 2, NULL, '600,137', NULL, 'DOUBLE', '229');
INSERT INTO pois (id, location, type) VALUES (74, 'BBQ74, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (74, '2,524,225', 'BBQ', 'BBQ74, 18', 'BBQ74', 2, NULL, '600,554', NULL, 'DOUBLE', '231');
INSERT INTO pois (id, location, type) VALUES (75, 'BBQ75, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (75, '2,524,226', 'BBQ', 'BBQ75, 18', 'BBQ75', 2, NULL, '602,027', NULL, 'DOUBLE', '205');
INSERT INTO pois (id, location, type) VALUES (76, 'BBQ76, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (76, '2,524,227', 'BBQ', 'BBQ76, 18', 'BBQ76', 2, NULL, '601,930', NULL, 'DOUBLE', '207');
INSERT INTO pois (id, location, type) VALUES (77, 'BBQ77, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (77, '2,524,228', 'BBQ', 'BBQ77, 18', 'BBQ77', 2, NULL, '601,905', NULL, 'DOUBLE', '203');
INSERT INTO pois (id, location, type) VALUES (78, 'BBQ78, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (78, '2,524,229', 'BBQ', 'BBQ78, 18', 'BBQ78', 2, NULL, '601,895', NULL, 'DOUBLE', '283');
INSERT INTO pois (id, location, type) VALUES (79, 'BBQ79, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (79, '2,524,230', 'BBQ', 'BBQ79, 18', 'BBQ79', 2, NULL, '601,958', NULL, 'DOUBLE', '281');
INSERT INTO pois (id, location, type) VALUES (80, 'BBQ80, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (80, '2,524,231', 'BBQ', 'BBQ80, 18', 'BBQ80', 2, NULL, '602,266', NULL, 'DOUBLE', '213');
INSERT INTO pois (id, location, type) VALUES (81, 'BBQ81, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (81, '2,524,232', 'BBQ', 'BBQ81, 18', 'BBQ81', 2, NULL, '602,488', NULL, 'DOUBLE', '219');
INSERT INTO pois (id, location, type) VALUES (82, 'BBQ82, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (82, '2,524,233', 'BBQ', 'BBQ82, 18', 'BBQ82', 2, NULL, '602,748', NULL, 'DOUBLE', '277');
INSERT INTO pois (id, location, type) VALUES (83, 'BBQ83, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (83, '2,524,234', 'BBQ', 'BBQ83, 18', 'BBQ83', 2, NULL, '602,621', NULL, 'DOUBLE', '217');
INSERT INTO pois (id, location, type) VALUES (84, 'BBQ84, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (84, '2,524,235', 'BBQ', 'BBQ84, 18', 'BBQ84', 2, NULL, '602,808', NULL, 'DOUBLE', '211');
INSERT INTO pois (id, location, type) VALUES (85, 'BBQ85, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (85, '2,524,236', 'BBQ', 'BBQ85, 18', 'BBQ85', 2, NULL, '602,870', NULL, 'DOUBLE', '210');
INSERT INTO pois (id, location, type) VALUES (86, 'BBQ86, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (86, '2,524,237', 'BBQ', 'BBQ86, 18', 'BBQ86', 2, NULL, '602,901', NULL, 'DOUBLE', '215');
INSERT INTO pois (id, location, type) VALUES (87, 'BBQ88, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (87, '2,524,239', 'BBQ', 'BBQ88, 18', 'BBQ88', 2, NULL, '608,371', NULL, 'DOUBLE', '50');
INSERT INTO pois (id, location, type) VALUES (88, 'BBQ89, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (88, '2,524,240', 'BBQ', 'BBQ89, 18', 'BBQ89', 2, NULL, '608,686', NULL, 'DOUBLE', '27');
INSERT INTO pois (id, location, type) VALUES (89, 'BBQ90, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (89, '2,524,241', 'BBQ', 'BBQ90, 18', 'BBQ90', 2, NULL, '608,688', NULL, 'SINGLE', '29');
INSERT INTO pois (id, location, type) VALUES (90, 'BBQ92, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (90, '2,524,243', 'BBQ', 'BBQ92, 18', 'BBQ92', 2, NULL, '617,171', NULL, 'DOUBLE', '0');
INSERT INTO pois (id, location, type) VALUES (91, 'BBQ94, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (91, '2,524,245', 'BBQ', 'BBQ94, 18', 'BBQ94', 2, NULL, '589,400', NULL, 'DOUBLE', '287');
INSERT INTO pois (id, location, type) VALUES (92, 'BBQ95, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (92, '2,524,246', 'BBQ', 'BBQ95, 18', 'BBQ95', 2, NULL, '589,538', NULL, 'DOUBLE', '271');
INSERT INTO pois (id, location, type) VALUES (93, 'BBQ96, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (93, '2,524,247', 'BBQ', 'BBQ96, 18', 'BBQ96', 2, NULL, '589,483', NULL, 'DOUBLE', '269');
INSERT INTO pois (id, location, type) VALUES (94, 'BBQ98, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (94, '2,524,249', 'BBQ', 'BBQ98, 18', 'BBQ98', 2, NULL, '589,441', NULL, 'DOUBLE', '285');
INSERT INTO pois (id, location, type) VALUES (95, 'BBQ99, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (95, '2,524,250', 'BBQ', 'BBQ99, 18', 'BBQ99', 2, NULL, '613,727', NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (96, 'BBQ100, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (96, '2,524,251', 'BBQ', 'BBQ100, 18', 'BBQ100', 2, NULL, '613,769', NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (97, 'BBQ101, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (97, '2,524,252', 'BBQ', 'BBQ101, 18', 'BBQ101', 2, NULL, '589,599', NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (98, 'BBQ102, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (98, '2,524,253', 'BBQ', 'BBQ102, 18', 'BBQ102', 2, NULL, '589,762', NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (99, 'BBQ103, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (99, '2,524,254', 'BBQ', 'BBQ103, 18', 'BBQ103', 2, NULL, '589,897', NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (100, 'BBQ104, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (100, '2,524,255', 'BBQ', 'BBQ104, 18', 'BBQ104', 2, NULL, '590,123', NULL, 'DOUBLE', NULL);
INSERT INTO pois (id, location, type) VALUES (101, 'BBQ124, 18', 'bbq');
INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (101, '5,706,719', 'BBQ', 'BBQ124, 18', 'BBQ124', 2, NULL, NULL, NULL, 'DOUBLE', '98');
