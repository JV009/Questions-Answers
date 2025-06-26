--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

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
-- Name: answers; Type: TABLE; Schema: public; Owner: sasha
--

CREATE TABLE public.answers (
    id bigint NOT NULL,
    body character varying NOT NULL,
    question_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.answers OWNER TO sasha;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: sasha
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.answers_id_seq OWNER TO sasha;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasha
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: sasha
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO sasha;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: sasha
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    title character varying NOT NULL,
    body character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.questions OWNER TO sasha;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: sasha
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questions_id_seq OWNER TO sasha;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasha
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: sasha
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO sasha;

--
-- Name: users; Type: TABLE; Schema: public; Owner: sasha
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone
);


ALTER TABLE public.users OWNER TO sasha;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: sasha
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO sasha;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasha
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: sasha
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: sasha
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: sasha
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: sasha
--

COPY public.answers (id, body, question_id, created_at, updated_at, user_id) FROM stdin;
24	233	10	2025-04-05 07:26:23.101149	2025-04-05 07:26:23.101149	1
62	dsdaaaa	10	2025-04-26 07:36:40.359354	2025-04-26 07:36:40.359354	1
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: sasha
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2025-02-25 06:58:30.145317	2025-02-25 06:58:30.145325
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: sasha
--

COPY public.questions (id, title, body, created_at, updated_at, user_id) FROM stdin;
10	Вопрос 1	текст 1 вопроса	2025-03-29 17:04:47.805333	2025-03-29 17:04:47.805333	1
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: sasha
--

COPY public.schema_migrations (version) FROM stdin;
20250225064957
20250225073614
20250303141934
20250303144756
20250307132502
20250307132636
20250312142847
20250312142922
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sasha
--

COPY public.users (id, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at) FROM stdin;
1	2025-03-16 05:16:24.793597	2025-03-16 05:16:24.793597	s@mail.ru	$2a$12$0P7ajLQ6VKQuNWXXs104Tu4VUCHphA6nQ/FjugH5huoaWJK827r2S	\N	\N	\N
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasha
--

SELECT pg_catalog.setval('public.answers_id_seq', 62, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasha
--

SELECT pg_catalog.setval('public.questions_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasha
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: sasha
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: sasha
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: sasha
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sasha
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: sasha
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_answers_on_question_id; Type: INDEX; Schema: public; Owner: sasha
--

CREATE INDEX index_answers_on_question_id ON public.answers USING btree (question_id);


--
-- Name: index_answers_on_user_id; Type: INDEX; Schema: public; Owner: sasha
--

CREATE INDEX index_answers_on_user_id ON public.answers USING btree (user_id);


--
-- Name: index_questions_on_user_id; Type: INDEX; Schema: public; Owner: sasha
--

CREATE INDEX index_questions_on_user_id ON public.questions USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: sasha
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: sasha
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: questions fk_rails_047ab75908; Type: FK CONSTRAINT; Schema: public; Owner: sasha
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_rails_047ab75908 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: answers fk_rails_3d5ed4418f; Type: FK CONSTRAINT; Schema: public; Owner: sasha
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_3d5ed4418f FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: answers fk_rails_584be190c2; Type: FK CONSTRAINT; Schema: public; Owner: sasha
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_584be190c2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

