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
\.


--
-- Data for Name: credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credentials (id, login, password, role, "createdAt", "updatedAt") FROM stdin;
1	admin	$2b$05$W4f2zj5lE7IlLKIPSULIdOhxFhP5l3UCU9RU0QtM5ZTQ.9cuQ8Y0m	ADMIN	2023-11-16 22:03:52.912+04	2023-11-16 22:03:52.912+04
\.


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedbacks (id, "commentatorName", "commentatorSurname", comment, estimation, status, "createdAt", "updatedAt", "guestRequestId") FROM stdin;
\.


--
-- Data for Name: guest_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guest_requests (id, surname, name, patronymic, phone, "commentGuest", status, "typeAssistance", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, surname, name, patronymic, post, "placeWorkOrStudy", phone, email, "createdAt", "updatedAt", "credentialId") FROM stdin;
1	Админов	Админ	Админович	Админ	СГТУ	+78007006050	admin@mail.ru	2023-11-16 22:03:52.935+04	2023-11-16 22:03:52.935+04	1
\.


--
-- Name: commenting_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commenting_applications_id_seq', 1, false);


--
-- Name: credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credentials_id_seq', 1, true);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedbacks_id_seq', 1, false);


--
-- Name: guest_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guest_requests_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


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

