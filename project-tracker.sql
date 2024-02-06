--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: grades; Type: TABLE; Schema: public; Owner: joshu
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    student_github character varying(30),
    project_title character varying(100),
    grade integer
);


ALTER TABLE public.grades OWNER TO joshu;

--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: joshu
--

CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grades_id_seq OWNER TO joshu;

--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joshu
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: joshu
--

CREATE TABLE public.projects (
    title character varying(100) NOT NULL,
    descripton character varying(100),
    max_grade integer
);


ALTER TABLE public.projects OWNER TO joshu;

--
-- Name: students; Type: TABLE; Schema: public; Owner: joshu
--

CREATE TABLE public.students (
    github character varying(30) NOT NULL,
    first_name character varying(30),
    last_name character varying(30)
);


ALTER TABLE public.students OWNER TO joshu;

--
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: joshu
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: joshu
--

COPY public.grades (id, student_github, project_title, grade) FROM stdin;
10	jhacks	markov	10
11	jhacks	blockly	2
12	sdevelops	markov	50
13	sdevelops	blockly	100
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: joshu
--

COPY public.projects (title, descripton, max_grade) FROM stdin;
markov	tweets generated from markov chains	50
blockly	Programmatic Logic Puzzle Game	100
India	Going to India	100
USA	The winner is	75
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: joshu
--

COPY public.students (github, first_name, last_name) FROM stdin;
jhacks	Jane	Hacker
sdevelops	sarah	develops
\.


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joshu
--

SELECT pg_catalog.setval('public.grades_id_seq', 13, true);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: joshu
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: joshu
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (title);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: joshu
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (github);


--
-- Name: grades grades_project_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: joshu
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_project_title_fkey FOREIGN KEY (project_title) REFERENCES public.projects(title);


--
-- Name: grades grades_student_github_fkey; Type: FK CONSTRAINT; Schema: public; Owner: joshu
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_student_github_fkey FOREIGN KEY (student_github) REFERENCES public.students(github);


--
-- PostgreSQL database dump complete
--

