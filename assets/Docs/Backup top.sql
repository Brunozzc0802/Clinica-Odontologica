--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-11-03 17:21:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 74152)
-- Name: consultas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consultas (
    id integer NOT NULL,
    profissional_id integer NOT NULL,
    paciente_id integer NOT NULL,
    procedimento_id integer NOT NULL,
    data date NOT NULL,
    horainicio time without time zone NOT NULL,
    horafim time without time zone NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    status character varying(255)
);


ALTER TABLE public.consultas OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 74151)
-- Name: consultas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consultas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.consultas_id_seq OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 229
-- Name: consultas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consultas_id_seq OWNED BY public.consultas.id;


--
-- TOC entry 228 (class 1259 OID 74119)
-- Name: grupo_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupo_usuarios (
    id integer NOT NULL,
    usuario_id integer,
    permissoes_id integer,
    ativo boolean DEFAULT true
);


ALTER TABLE public.grupo_usuarios OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 74118)
-- Name: grupo_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupo_usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grupo_usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 227
-- Name: grupo_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupo_usuarios_id_seq OWNED BY public.grupo_usuarios.id;


--
-- TOC entry 220 (class 1259 OID 74058)
-- Name: pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pacientes (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf character varying(14) NOT NULL,
    telefone character varying(15),
    cep character varying(9),
    endereco character varying(200),
    ativo boolean DEFAULT true,
    data_nascimento date
);


ALTER TABLE public.pacientes OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 74057)
-- Name: pacientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pacientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pacientes_id_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 219
-- Name: pacientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pacientes_id_seq OWNED BY public.pacientes.id;


--
-- TOC entry 226 (class 1259 OID 74086)
-- Name: permissoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissoes (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text,
    ativo boolean DEFAULT true
);


ALTER TABLE public.permissoes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 74085)
-- Name: permissoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissoes_id_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 225
-- Name: permissoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissoes_id_seq OWNED BY public.permissoes.id;


--
-- TOC entry 224 (class 1259 OID 74078)
-- Name: procedimentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.procedimentos (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    valor numeric(10,2) NOT NULL,
    duracao time without time zone NOT NULL,
    ativo boolean DEFAULT true
);


ALTER TABLE public.procedimentos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 74077)
-- Name: procedimentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.procedimentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.procedimentos_id_seq OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 223
-- Name: procedimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.procedimentos_id_seq OWNED BY public.procedimentos.id;


--
-- TOC entry 222 (class 1259 OID 74068)
-- Name: profissionais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profissionais (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf character varying(14) NOT NULL,
    telefone character varying(15),
    email character varying(100),
    cep character varying(9),
    endereco character varying(200),
    ativo boolean DEFAULT true
);


ALTER TABLE public.profissionais OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 74067)
-- Name: profissionais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profissionais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profissionais_id_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 221
-- Name: profissionais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profissionais_id_seq OWNED BY public.profissionais.id;


--
-- TOC entry 218 (class 1259 OID 74051)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    senha character varying(100) NOT NULL,
    ativo boolean,
    grupo character varying(50)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 74050)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4783 (class 2604 OID 74155)
-- Name: consultas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas ALTER COLUMN id SET DEFAULT nextval('public.consultas_id_seq'::regclass);


--
-- TOC entry 4781 (class 2604 OID 74122)
-- Name: grupo_usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo_usuarios ALTER COLUMN id SET DEFAULT nextval('public.grupo_usuarios_id_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 74061)
-- Name: pacientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes ALTER COLUMN id SET DEFAULT nextval('public.pacientes_id_seq'::regclass);


--
-- TOC entry 4779 (class 2604 OID 74089)
-- Name: permissoes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissoes ALTER COLUMN id SET DEFAULT nextval('public.permissoes_id_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 74081)
-- Name: procedimentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.procedimentos ALTER COLUMN id SET DEFAULT nextval('public.procedimentos_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 74071)
-- Name: profissionais id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profissionais ALTER COLUMN id SET DEFAULT nextval('public.profissionais_id_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 74054)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4963 (class 0 OID 74152)
-- Dependencies: 230
-- Data for Name: consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consultas (id, profissional_id, paciente_id, procedimento_id, data, horainicio, horafim, ativo, status) FROM stdin;
1	1	1	1	2025-02-10	09:30:00	10:30:00	t	\N
2	1	6	1	2025-10-09	10:00:00	10:30:00	t	\N
3	1	5	1	2025-10-01	10:00:00	10:30:00	t	\N
4	3	6	1	2025-10-09	10:00:00	10:30:00	t	\N
\.


--
-- TOC entry 4961 (class 0 OID 74119)
-- Dependencies: 228
-- Data for Name: grupo_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupo_usuarios (id, usuario_id, permissoes_id, ativo) FROM stdin;
\.


--
-- TOC entry 4953 (class 0 OID 74058)
-- Dependencies: 220
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pacientes (id, nome, cpf, telefone, cep, endereco, ativo, data_nascimento) FROM stdin;
3	João Pedro	12111112888	(41) 91238-1092	81570340	Rua Simão Brante	f	2005-11-25
2	Gustavo	12122222135	(41) 91283-1923	81570340	Rua Simão Brante	f	2025-09-29
1	Bruno	12331231111	(42) 99837-9401	81570340	Rua Simão Brante	f	2018-01-16
6	Bruno	12333335555	(54) 35435-4354	81570340	Rua Simão Brante	t	2025-10-01
10	cccccc	44444444444	(11) 11111-1111	81570340	Rua Simão Brante	f	2025-10-01
9	bbbbbbbb	99995567655	(11) 11111-1111	81570340	Rua Simão Brante	f	2025-10-29
7	aaaaaaaabbbbb	88888888888	(23) 33333-3111	81570340	Rua Simão Brante	f	2015-02-26
4	Gustavo	99999999999	(41) 23092-1093	81570340	Rua Simão Brante	f	2025-10-01
5	Bruno	13012574948	(42) 99837-9401	81570340	Rua Simão Brante	f	2008-10-24
\.


--
-- TOC entry 4959 (class 0 OID 74086)
-- Dependencies: 226
-- Data for Name: permissoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissoes (id, nome, descricao, ativo) FROM stdin;
\.


--
-- TOC entry 4957 (class 0 OID 74078)
-- Dependencies: 224
-- Data for Name: procedimentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.procedimentos (id, nome, valor, duracao, ativo) FROM stdin;
1	Limpeza	50.00	00:30:00	t
\.


--
-- TOC entry 4955 (class 0 OID 74068)
-- Dependencies: 222
-- Data for Name: profissionais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profissionais (id, nome, cpf, telefone, email, cep, endereco, ativo) FROM stdin;
1	Guilherme	11111223888	(41) 99837-9401	81314112	aasdaaaa	guilhermejose@gmail.com	t
2	Teste123	98987987897	(98) 19209-1382	123123123	skdskamda	nasjdnsjada	t
3	Bruno	13012574948	(42) 99837-9401	brunotesser2019@gmail.com	81570340	Rua Simão brante	t
\.


--
-- TOC entry 4951 (class 0 OID 74051)
-- Dependencies: 218
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nome, senha, ativo, grupo) FROM stdin;
1	admin	1234	t	Administrador
3	Jota	1234	f	Profissional
5	Kauan	10102020	f	Recepcionista
4	Gustavo	1234	f	Recepcionista
6	Gustavo	1234	f	Adminstrador
7	medico	1234	f	Profissional
8	Jota	1234	f	Profissional
9	Jota	1234	f	Adminstrador
2	Bruno	1234	f	Recepcionista
10	Bruno	1234	f	Recepcionista
12	Aaaaa	1231111	f	Profissional
11	João	1010	f	Profissional
13	Fer	1020	t	Recepcionista
\.


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 229
-- Name: consultas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consultas_id_seq', 4, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 227
-- Name: grupo_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupo_usuarios_id_seq', 1, false);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 219
-- Name: pacientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pacientes_id_seq', 10, true);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 225
-- Name: permissoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissoes_id_seq', 1, false);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 223
-- Name: procedimentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.procedimentos_id_seq', 1, true);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 221
-- Name: profissionais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profissionais_id_seq', 3, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 13, true);


--
-- TOC entry 4802 (class 2606 OID 74158)
-- Name: consultas consultas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_pkey PRIMARY KEY (id);


--
-- TOC entry 4800 (class 2606 OID 74125)
-- Name: grupo_usuarios grupo_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo_usuarios
    ADD CONSTRAINT grupo_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4788 (class 2606 OID 74137)
-- Name: pacientes pacientes_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_cpf_key UNIQUE (cpf);


--
-- TOC entry 4790 (class 2606 OID 74064)
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4798 (class 2606 OID 74094)
-- Name: permissoes permissoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT permissoes_pkey PRIMARY KEY (id);


--
-- TOC entry 4796 (class 2606 OID 74084)
-- Name: procedimentos procedimentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.procedimentos
    ADD CONSTRAINT procedimentos_pkey PRIMARY KEY (id);


--
-- TOC entry 4792 (class 2606 OID 74076)
-- Name: profissionais profissionais_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profissionais
    ADD CONSTRAINT profissionais_cpf_key UNIQUE (cpf);


--
-- TOC entry 4794 (class 2606 OID 74074)
-- Name: profissionais profissionais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profissionais
    ADD CONSTRAINT profissionais_pkey PRIMARY KEY (id);


--
-- TOC entry 4786 (class 2606 OID 74056)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4803 (class 2606 OID 74131)
-- Name: grupo_usuarios grupo_usuarios_permissoes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo_usuarios
    ADD CONSTRAINT grupo_usuarios_permissoes_id_fkey FOREIGN KEY (permissoes_id) REFERENCES public.permissoes(id) ON DELETE CASCADE;


--
-- TOC entry 4804 (class 2606 OID 74126)
-- Name: grupo_usuarios grupo_usuarios_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo_usuarios
    ADD CONSTRAINT grupo_usuarios_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


-- Completed on 2025-11-03 17:21:48

--
-- PostgreSQL database dump complete
--

