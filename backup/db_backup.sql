--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: commenting_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commenting_applications (
    id integer NOT NULL,
    content character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "guestRequestId" integer
);


ALTER TABLE public.commenting_applications OWNER TO postgres;

--
-- Name: commenting_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commenting_applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commenting_applications_id_seq OWNER TO postgres;

--
-- Name: commenting_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commenting_applications_id_seq OWNED BY public.commenting_applications.id;


--
-- Name: credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credentials (
    id integer NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.credentials OWNER TO postgres;

--
-- Name: credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credentials_id_seq OWNER TO postgres;

--
-- Name: credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credentials_id_seq OWNED BY public.credentials.id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedbacks (
    id integer NOT NULL,
    "commentatorName" character varying(255) NOT NULL,
    "commentatorSurname" character varying(255) NOT NULL,
    comment character varying(255) NOT NULL,
    estimation integer DEFAULT 5 NOT NULL,
    status character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "guestRequestId" integer
);


ALTER TABLE public.feedbacks OWNER TO postgres;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedbacks_id_seq OWNER TO postgres;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;


--
-- Name: guest_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guest_requests (
    id integer NOT NULL,
    surname character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    patronymic character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    "commentGuest" character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    "typeAssistance" character varying(255) DEFAULT NULL::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.guest_requests OWNER TO postgres;

--
-- Name: guest_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guest_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guest_requests_id_seq OWNER TO postgres;

--
-- Name: guest_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guest_requests_id_seq OWNED BY public.guest_requests.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    surname character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    patronymic character varying(255) NOT NULL,
    post character varying(255) NOT NULL,
    "placeWorkOrStudy" character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "credentialId" integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: commenting_applications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commenting_applications ALTER COLUMN id SET DEFAULT nextval('public.commenting_applications_id_seq'::regclass);


--
-- Name: credentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials ALTER COLUMN id SET DEFAULT nextval('public.credentials_id_seq'::regclass);


--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- Name: guest_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guest_requests ALTER COLUMN id SET DEFAULT nextval('public.guest_requests_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: commenting_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commenting_applications (id, content, "createdAt", "updatedAt", "userId", "guestRequestId") FROM stdin;
1	ждите звонка	2023-11-17 22:07:49.831+04	2023-11-17 22:07:49.831+04	2	1
2	ждите звонка	2023-11-17 22:07:49.861+04	2023-11-17 22:07:49.861+04	2	2
3	ждите звонка	2023-11-17 22:07:49.883+04	2023-11-17 22:07:49.883+04	2	3
4	ждите звонка	2023-11-17 22:07:49.903+04	2023-11-17 22:07:49.903+04	2	4
5	ждите звонка	2023-11-17 22:07:49.927+04	2023-11-17 22:07:49.927+04	2	5
\.


--
-- Data for Name: credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credentials (id, login, password, role, "createdAt", "updatedAt") FROM stdin;
1	admin	$2b$05$VovQcnydw1GSN9JIrrpUreUdv2KExS/LxvmtQajtUqPMN8H3pzNXS	ADMIN	2023-11-17 22:07:32.197+04	2023-11-17 22:07:32.197+04
2	volunteer	$2b$05$FPgA/TC0uiySpks4JDjTWOnVwYj.giAYY9uWQKbOH.C2pVLab1Ate	VOLUNTEER	2023-11-17 22:07:32.227+04	2023-11-17 22:07:32.227+04
\.


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedbacks (id, "commentatorName", "commentatorSurname", comment, estimation, status, "createdAt", "updatedAt", "guestRequestId") FROM stdin;
1	Andrey	Andreev	comment 1	5	MODERATION	2023-11-17 22:07:49.571+04	2023-11-17 22:07:49.571+04	\N
2	Timur	Timurov	comment 2	5	MODERATION	2023-11-17 22:07:49.619+04	2023-11-17 22:07:49.619+04	\N
3	Vasiliy	Vasiliev	comment 3	5	MODERATION	2023-11-17 22:07:49.651+04	2023-11-17 22:07:49.651+04	\N
4	Oleg	Olegov	comment 4	5	MODERATION	2023-11-17 22:07:49.67+04	2023-11-17 22:07:49.67+04	\N
5	Egor	Egorov	comment 5	5	MODERATION	2023-11-17 22:07:49.696+04	2023-11-17 22:07:49.696+04	\N
\.


--
-- Data for Name: guest_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guest_requests (id, surname, name, patronymic, phone, "commentGuest", status, "typeAssistance", "createdAt", "updatedAt") FROM stdin;
1	Andreev	Andrey	Andreevich	+78007006052	commentGuest 1	NEW	\N	2023-11-17 22:07:49.722+04	2023-11-17 22:07:49.722+04
2	Timurov	Timur	Timurovich	+78007006053	commentGuest 2	NEW	\N	2023-11-17 22:07:49.75+04	2023-11-17 22:07:49.75+04
3	Vasiliev	Vasiliy	Vasilievich	+78007006054	commentGuest 3	NEW	\N	2023-11-17 22:07:49.764+04	2023-11-17 22:07:49.764+04
4	Olegov	Oleg	Olegovich	+78007006055	commentGuest 4	NEW	\N	2023-11-17 22:07:49.792+04	2023-11-17 22:07:49.792+04
5	Egorov	Egor	Egorovich	+78007006056	commentGuest 5	NEW	\N	2023-11-17 22:07:49.816+04	2023-11-17 22:07:49.816+04
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, surname, name, patronymic, post, "placeWorkOrStudy", phone, email, "createdAt", "updatedAt", "credentialId") FROM stdin;
1	Petrov	Petr	Petrovich	Admin	SSTU	+78007006050	admin@mail.ru	2023-11-17 22:07:32.219+04	2023-11-17 22:07:32.219+04	1
2	Ivanov	Ivan	Ivanovich	Volunteer	SSTU	+78007006051	volunteer@mail.ru	2023-11-17 22:07:32.234+04	2023-11-17 22:07:32.234+04	2
\.


--
-- Name: commenting_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commenting_applications_id_seq', 5, true);


--
-- Name: credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credentials_id_seq', 2, true);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedbacks_id_seq', 5, true);


--
-- Name: guest_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guest_requests_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: commenting_applications commenting_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commenting_applications
    ADD CONSTRAINT commenting_applications_pkey PRIMARY KEY (id);


--
-- Name: credentials credentials_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_login_key UNIQUE (login);


--
-- Name: credentials credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: guest_requests guest_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guest_requests
    ADD CONSTRAINT guest_requests_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: commenting_applications commenting_applications_guestRequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commenting_applications
    ADD CONSTRAINT "commenting_applications_guestRequestId_fkey" FOREIGN KEY ("guestRequestId") REFERENCES public.guest_requests(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: commenting_applications commenting_applications_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commenting_applications
    ADD CONSTRAINT "commenting_applications_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: feedbacks feedbacks_guestRequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT "feedbacks_guestRequestId_fkey" FOREIGN KEY ("guestRequestId") REFERENCES public.guest_requests(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_credentialId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_credentialId_fkey" FOREIGN KEY ("credentialId") REFERENCES public.credentials(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

