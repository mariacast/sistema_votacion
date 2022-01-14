--
-- PostgreSQL database dump
--

-- Dumped from database version 10.19 (Ubuntu 10.19-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.19 (Ubuntu 10.19-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: votacionApi_barrio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."votacionApi_barrio" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    municipio_id integer NOT NULL
);


ALTER TABLE public."votacionApi_barrio" OWNER TO postgres;

--
-- Name: votacionApi_barrio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."votacionApi_barrio_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."votacionApi_barrio_id_seq" OWNER TO postgres;

--
-- Name: votacionApi_barrio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."votacionApi_barrio_id_seq" OWNED BY public."votacionApi_barrio".id;


--
-- Name: votacionApi_departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."votacionApi_departamento" (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public."votacionApi_departamento" OWNER TO postgres;

--
-- Name: votacionApi_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."votacionApi_departamento_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."votacionApi_departamento_id_seq" OWNER TO postgres;

--
-- Name: votacionApi_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."votacionApi_departamento_id_seq" OWNED BY public."votacionApi_departamento".id;


--
-- Name: votacionApi_municipio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."votacionApi_municipio" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    departamento_id integer
);


ALTER TABLE public."votacionApi_municipio" OWNER TO postgres;

--
-- Name: votacionApi_municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."votacionApi_municipio_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."votacionApi_municipio_id_seq" OWNER TO postgres;

--
-- Name: votacionApi_municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."votacionApi_municipio_id_seq" OWNED BY public."votacionApi_municipio".id;


--
-- Name: votacionApi_puestovotacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."votacionApi_puestovotacion" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(50) NOT NULL,
    municipio_id integer NOT NULL,
    latitud character varying(200),
    longitud character varying(200)
);


ALTER TABLE public."votacionApi_puestovotacion" OWNER TO postgres;

--
-- Name: votacionApi_puestovotacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."votacionApi_puestovotacion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."votacionApi_puestovotacion_id_seq" OWNER TO postgres;

--
-- Name: votacionApi_puestovotacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."votacionApi_puestovotacion_id_seq" OWNED BY public."votacionApi_puestovotacion".id;


--
-- Name: votacionApi_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."votacionApi_users" (
    id integer NOT NULL,
    nombres character varying(50) NOT NULL,
    apellidos character varying(50) NOT NULL,
    identificacion character varying(50) NOT NULL,
    celular character varying(50) NOT NULL,
    direccion character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    password text NOT NULL,
    rol integer NOT NULL,
    barrio_id integer NOT NULL,
    latitud character varying(200) NOT NULL,
    longitud character varying(200) NOT NULL,
    CONSTRAINT "votacionApi_users_rol_check" CHECK ((rol >= 0))
);


ALTER TABLE public."votacionApi_users" OWNER TO postgres;

--
-- Name: votacionApi_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."votacionApi_users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."votacionApi_users_id_seq" OWNER TO postgres;

--
-- Name: votacionApi_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."votacionApi_users_id_seq" OWNED BY public."votacionApi_users".id;


--
-- Name: votacionApi_votante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."votacionApi_votante" (
    id integer NOT NULL,
    nombres character varying(50) NOT NULL,
    apellidos character varying(50) NOT NULL,
    identificacion character varying(50) NOT NULL,
    celular character varying(50) NOT NULL,
    direccion character varying(50) NOT NULL,
    num_mesa character varying(50) NOT NULL,
    lider_id integer NOT NULL,
    puesto_votacion_id integer NOT NULL
);


ALTER TABLE public."votacionApi_votante" OWNER TO postgres;

--
-- Name: votacionApi_votante_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."votacionApi_votante_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."votacionApi_votante_id_seq" OWNER TO postgres;

--
-- Name: votacionApi_votante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."votacionApi_votante_id_seq" OWNED BY public."votacionApi_votante".id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: votacionApi_barrio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_barrio" ALTER COLUMN id SET DEFAULT nextval('public."votacionApi_barrio_id_seq"'::regclass);


--
-- Name: votacionApi_departamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_departamento" ALTER COLUMN id SET DEFAULT nextval('public."votacionApi_departamento_id_seq"'::regclass);


--
-- Name: votacionApi_municipio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_municipio" ALTER COLUMN id SET DEFAULT nextval('public."votacionApi_municipio_id_seq"'::regclass);


--
-- Name: votacionApi_puestovotacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_puestovotacion" ALTER COLUMN id SET DEFAULT nextval('public."votacionApi_puestovotacion_id_seq"'::regclass);


--
-- Name: votacionApi_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_users" ALTER COLUMN id SET DEFAULT nextval('public."votacionApi_users_id_seq"'::regclass);


--
-- Name: votacionApi_votante id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_votante" ALTER COLUMN id SET DEFAULT nextval('public."votacionApi_votante_id_seq"'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add barrio	7	add_barrio
26	Can change barrio	7	change_barrio
27	Can delete barrio	7	delete_barrio
28	Can view barrio	7	view_barrio
29	Can add departamento	8	add_departamento
30	Can change departamento	8	change_departamento
31	Can delete departamento	8	delete_departamento
32	Can view departamento	8	view_departamento
33	Can add municipio	9	add_municipio
34	Can change municipio	9	change_municipio
35	Can delete municipio	9	delete_municipio
36	Can view municipio	9	view_municipio
37	Can add puesto votacion	10	add_puestovotacion
38	Can change puesto votacion	10	change_puestovotacion
39	Can delete puesto votacion	10	delete_puestovotacion
40	Can view puesto votacion	10	view_puestovotacion
41	Can add votante	11	add_votante
42	Can change votante	11	change_votante
43	Can delete votante	11	delete_votante
44	Can view votante	11	view_votante
45	Can add users	12	add_users
46	Can change users	12	change_users
47	Can delete users	12	delete_users
48	Can view users	12	view_users
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$sI41WSLwiG6Vnx6fF9vPIw$fTzOJjvMqLGR4NyuIIMiwR/FbZcj4QJAl9ULTq4k2IQ=	\N	f	edwin1	EDWIN	SANCHEZ		f	t	2022-01-14 13:07:49.159374-05
2	pbkdf2_sha256$260000$xcbKRHCzPsIUuSOe3Titlq$LOIX7rkUsFGyut508+pxkqGNRJ0qXOsnesrDiOlle7s=	\N	f	alejandra1	ALEJANDRA	GONZALEZ		f	t	2022-01-14 13:08:24.218331-05
3	pbkdf2_sha256$260000$M4U3bLbhGQyjkxA25EqmP9$00jzSX5kxfhx9Xiqw6FhfnubKTzmr4eCtdvxryWC8EI=	\N	f	julian1	JULIAN	LOPEZ CAICEDO		f	t	2022-01-14 13:09:01.422753-05
4	pbkdf2_sha256$260000$w5H1EqEzw2s0QYAYwor4W1$qAnGocKfsl08slZRJQT2llqiqkwIgHCeQtZw77PjO+M=	\N	f	andrea1	ANDREA	QUIÑONES		f	t	2022-01-14 13:09:38.279374-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	votacionApi	barrio
8	votacionApi	departamento
9	votacionApi	municipio
10	votacionApi	puestovotacion
11	votacionApi	votante
12	votacionApi	users
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-01-14 12:46:18.408784-05
2	auth	0001_initial	2022-01-14 12:46:18.460187-05
3	admin	0001_initial	2022-01-14 12:46:18.475413-05
4	admin	0002_logentry_remove_auto_add	2022-01-14 12:46:18.481636-05
5	admin	0003_logentry_add_action_flag_choices	2022-01-14 12:46:18.491127-05
6	contenttypes	0002_remove_content_type_name	2022-01-14 12:46:18.50953-05
7	auth	0002_alter_permission_name_max_length	2022-01-14 12:46:18.517169-05
8	auth	0003_alter_user_email_max_length	2022-01-14 12:46:18.525763-05
9	auth	0004_alter_user_username_opts	2022-01-14 12:46:18.532532-05
10	auth	0005_alter_user_last_login_null	2022-01-14 12:46:18.541612-05
11	auth	0006_require_contenttypes_0002	2022-01-14 12:46:18.543342-05
12	auth	0007_alter_validators_add_error_messages	2022-01-14 12:46:18.550091-05
13	auth	0008_alter_user_username_max_length	2022-01-14 12:46:18.5626-05
14	auth	0009_alter_user_last_name_max_length	2022-01-14 12:46:18.570009-05
15	auth	0010_alter_group_name_max_length	2022-01-14 12:46:18.578865-05
16	auth	0011_update_proxy_permissions	2022-01-14 12:46:18.586841-05
17	auth	0012_alter_user_first_name_max_length	2022-01-14 12:46:18.59668-05
18	sessions	0001_initial	2022-01-14 12:46:18.604275-05
19	votacionApi	0001_initial	2022-01-14 12:46:18.646916-05
20	votacionApi	0002_barrio_municipio	2022-01-14 12:46:18.65694-05
21	votacionApi	0003_users	2022-01-14 12:46:18.670388-05
22	votacionApi	0004_auto_20220114_0025	2022-01-14 12:46:18.713702-05
23	votacionApi	0005_auto_20220114_0404	2022-01-14 12:46:18.730567-05
24	votacionApi	0006_auto_20220114_1439	2022-01-14 12:46:18.742381-05
25	votacionApi	0007_uuarios	2022-01-14 12:46:18.75141-05
26	votacionApi	0008_alter_users_options	2022-01-14 12:46:18.757926-05
27	votacionApi	0009_alter_users_options	2022-01-14 12:46:18.762749-05
28	votacionApi	0010_delete_uuarios	2022-01-14 12:46:18.765133-05
29	votacionApi	0011_alter_municipio_departamento	2022-01-14 12:52:13.019048-05
30	votacionApi	0012_alter_departamento_nombre	2022-01-14 12:55:08.225121-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: votacionApi_barrio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."votacionApi_barrio" (id, nombre, municipio_id) FROM stdin;
1	La Granja	1
2	San Francisco	1
\.


--
-- Data for Name: votacionApi_departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."votacionApi_departamento" (id, nombre) FROM stdin;
2	Tolima
3	Valle
4	Nariño
1	Bogota
\.


--
-- Data for Name: votacionApi_municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."votacionApi_municipio" (id, nombre, departamento_id) FROM stdin;
1	Bogota	1
2	Zipaquira	1
3	Ibague	2
4	cali	3
\.


--
-- Data for Name: votacionApi_puestovotacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."votacionApi_puestovotacion" (id, nombre, direccion, municipio_id, latitud, longitud) FROM stdin;
9	Kenedy	TRV 13F 45B BIS SUR 04	1	4.5698032	-74.1203122
10	La Flora	digonal 5h num 47 01 bogota	1	4.6226916	-74.10713299999999
11	centro	calle 49a sur numero 34 84 bogota	1	4.5869228	-74.1347413
\.


--
-- Data for Name: votacionApi_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."votacionApi_users" (id, nombres, apellidos, identificacion, celular, direccion, username, password, rol, barrio_id, latitud, longitud) FROM stdin;
1	Edwin	Sanchez	679786786876	312987888	digonal 5h num 47 01 bogota	edwin1	827ccb0eea8a706c4c34a16891f84e7b	2	1	4.6226916	-74.10713299999999
2	Alejandra	Gonzalez	912987389172	761238917837	TRV 13F 45B BIS SUR 04	alejandra1	827ccb0eea8a706c4c34a16891f84e7b	2	2	4.5706676	-74.12003910000001
3	Julian	lopez caicedo	2132128	890898	digonal 5h num 47 01 bogota	julian1	827ccb0eea8a706c4c34a16891f84e7b	2	1	4.6226916	-74.10713299999999
4	Andrea	Quiñones	123177989	89786757544	calle 49a sur numero 34 84 bogota	andrea1	827ccb0eea8a706c4c34a16891f84e7b	1	1	4.5869228	-74.1347413
\.


--
-- Data for Name: votacionApi_votante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."votacionApi_votante" (id, nombres, apellidos, identificacion, celular, direccion, num_mesa, lider_id, puesto_votacion_id) FROM stdin;
1	Carlos	Rivera	12243897	8798798765	digonal 5h num 47 01 bogota	12	1	9
2	paola	sanchez	12341880	989080986	TRV 13F 45B BIS SUR 04	15	1	9
3	yulli	santos	234234238	898098098	calle 49 a sur 34 83 bogota	18	1	9
4	tomas	guzman	231434298787	0980796876	digonal 5h num 47 01 bogota	20	2	10
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: votacionApi_barrio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."votacionApi_barrio_id_seq"', 2, true);


--
-- Name: votacionApi_departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."votacionApi_departamento_id_seq"', 3, true);


--
-- Name: votacionApi_municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."votacionApi_municipio_id_seq"', 4, true);


--
-- Name: votacionApi_puestovotacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."votacionApi_puestovotacion_id_seq"', 11, true);


--
-- Name: votacionApi_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."votacionApi_users_id_seq"', 4, true);


--
-- Name: votacionApi_votante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."votacionApi_votante_id_seq"', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: votacionApi_barrio votacionApi_barrio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_barrio"
    ADD CONSTRAINT "votacionApi_barrio_pkey" PRIMARY KEY (id);


--
-- Name: votacionApi_departamento votacionApi_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_departamento"
    ADD CONSTRAINT "votacionApi_departamento_pkey" PRIMARY KEY (id);


--
-- Name: votacionApi_municipio votacionApi_municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_municipio"
    ADD CONSTRAINT "votacionApi_municipio_pkey" PRIMARY KEY (id);


--
-- Name: votacionApi_puestovotacion votacionApi_puestovotacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_puestovotacion"
    ADD CONSTRAINT "votacionApi_puestovotacion_pkey" PRIMARY KEY (id);


--
-- Name: votacionApi_users votacionApi_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_users"
    ADD CONSTRAINT "votacionApi_users_pkey" PRIMARY KEY (id);


--
-- Name: votacionApi_votante votacionApi_votante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_votante"
    ADD CONSTRAINT "votacionApi_votante_pkey" PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: votacionApi_barrio_municipio_id_ffe9dd13; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "votacionApi_barrio_municipio_id_ffe9dd13" ON public."votacionApi_barrio" USING btree (municipio_id);


--
-- Name: votacionApi_municipio_departamento_id_f720c127; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "votacionApi_municipio_departamento_id_f720c127" ON public."votacionApi_municipio" USING btree (departamento_id);


--
-- Name: votacionApi_puestovotacion_municipio_id_b6be8e67; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "votacionApi_puestovotacion_municipio_id_b6be8e67" ON public."votacionApi_puestovotacion" USING btree (municipio_id);


--
-- Name: votacionApi_users_barrio_id_12f2688d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "votacionApi_users_barrio_id_12f2688d" ON public."votacionApi_users" USING btree (barrio_id);


--
-- Name: votacionApi_votante_lider_id_1b8b6ee3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "votacionApi_votante_lider_id_1b8b6ee3" ON public."votacionApi_votante" USING btree (lider_id);


--
-- Name: votacionApi_votante_puesto_votacion_id_4d71ea7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "votacionApi_votante_puesto_votacion_id_4d71ea7d" ON public."votacionApi_votante" USING btree (puesto_votacion_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: votacionApi_barrio votacionApi_barrio_municipio_id_ffe9dd13_fk_votacionA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_barrio"
    ADD CONSTRAINT "votacionApi_barrio_municipio_id_ffe9dd13_fk_votacionA" FOREIGN KEY (municipio_id) REFERENCES public."votacionApi_municipio"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: votacionApi_municipio votacionApi_municipi_departamento_id_f720c127_fk_votacionA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_municipio"
    ADD CONSTRAINT "votacionApi_municipi_departamento_id_f720c127_fk_votacionA" FOREIGN KEY (departamento_id) REFERENCES public."votacionApi_departamento"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: votacionApi_puestovotacion votacionApi_puestovo_municipio_id_b6be8e67_fk_votacionA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_puestovotacion"
    ADD CONSTRAINT "votacionApi_puestovo_municipio_id_b6be8e67_fk_votacionA" FOREIGN KEY (municipio_id) REFERENCES public."votacionApi_municipio"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: votacionApi_users votacionApi_users_barrio_id_12f2688d_fk_votacionApi_barrio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_users"
    ADD CONSTRAINT "votacionApi_users_barrio_id_12f2688d_fk_votacionApi_barrio_id" FOREIGN KEY (barrio_id) REFERENCES public."votacionApi_barrio"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: votacionApi_votante votacionApi_votante_lider_id_1b8b6ee3_fk_votacionApi_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_votante"
    ADD CONSTRAINT "votacionApi_votante_lider_id_1b8b6ee3_fk_votacionApi_users_id" FOREIGN KEY (lider_id) REFERENCES public."votacionApi_users"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: votacionApi_votante votacionApi_votante_puesto_votacion_id_4d71ea7d_fk_votacionA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."votacionApi_votante"
    ADD CONSTRAINT "votacionApi_votante_puesto_votacion_id_4d71ea7d_fk_votacionA" FOREIGN KEY (puesto_votacion_id) REFERENCES public."votacionApi_puestovotacion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

