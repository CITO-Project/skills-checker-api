--
-- PostgreSQL database dump
--

-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.1

-- Started on 2022-02-25 16:33:30

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

--
-- TOC entry 196 (class 1259 OID 16405)
-- Name: answer; Type: TABLE; Schema: public; Owner: skillschecker
--

CREATE TABLE public.answer (
    id integer NOT NULL,
    text text NOT NULL,
    "order" integer NOT NULL,
    special text,
    product integer,
    question integer,
    value integer NOT NULL,
    skipto text
);


ALTER TABLE public.answer OWNER TO skillschecker;

--
-- TOC entry 197 (class 1259 OID 16411)
-- Name: answer_id_seq; Type: SEQUENCE; Schema: public; Owner: skillschecker
--

CREATE SEQUENCE public.answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answer_id_seq OWNER TO skillschecker;

--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 197
-- Name: answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skillschecker
--

ALTER SEQUENCE public.answer_id_seq OWNED BY public.answer.id;


--
-- TOC entry 198 (class 1259 OID 16413)
-- Name: category; Type: TABLE; Schema: public; Owner: skillschecker
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name text NOT NULL,
    text text,
    resource text,
    description text,
    product integer,
    colour text
);


ALTER TABLE public.category OWNER TO skillschecker;

--
-- TOC entry 199 (class 1259 OID 16419)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: skillschecker
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO skillschecker;

--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 199
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skillschecker
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 200 (class 1259 OID 16421)
-- Name: course; Type: TABLE; Schema: public; Owner: skillschecker
--

CREATE TABLE public.course (
    id integer NOT NULL,
    title text,
    description text,
    level integer,
    skill text,
    location text,
    link text,
    product integer,
    address text,
    enrolment_start timestamp with time zone,
    enrolment_finish timestamp with time zone,
    contact_person text,
    contact_telephone text,
    contact_email text,
    external_id text,
    contact_attention text
);


ALTER TABLE public.course OWNER TO skillschecker;

--
-- TOC entry 201 (class 1259 OID 16427)
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: skillschecker
--

CREATE SEQUENCE public.course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_id_seq OWNER TO skillschecker;

--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 201
-- Name: course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skillschecker
--

ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;


--
-- TOC entry 202 (class 1259 OID 16429)
-- Name: interest; Type: TABLE; Schema: public; Owner: skillschecker
--

CREATE TABLE public.interest (
    id integer NOT NULL,
    product integer,
    name text NOT NULL,
    text text NOT NULL,
    description text,
    resource text,
    category integer
);


ALTER TABLE public.interest OWNER TO skillschecker;

--
-- TOC entry 203 (class 1259 OID 16435)
-- Name: interest_id_seq; Type: SEQUENCE; Schema: public; Owner: skillschecker
--

CREATE SEQUENCE public.interest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interest_id_seq OWNER TO skillschecker;

--
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 203
-- Name: interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skillschecker
--

ALTER SEQUENCE public.interest_id_seq OWNED BY public.interest.id;


--
-- TOC entry 204 (class 1259 OID 16437)
-- Name: product; Type: TABLE; Schema: public; Owner: skillschecker
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE public.product OWNER TO skillschecker;

--
-- TOC entry 205 (class 1259 OID 16443)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: skillschecker
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO skillschecker;

--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 205
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skillschecker
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 206 (class 1259 OID 16445)
-- Name: question; Type: TABLE; Schema: public; Owner: skillschecker
--

CREATE TABLE public.question (
    id integer NOT NULL,
    product integer,
    scenario integer,
    type text NOT NULL,
    question text NOT NULL,
    description text,
    pedagogical_type text
);


ALTER TABLE public.question OWNER TO skillschecker;

--
-- TOC entry 207 (class 1259 OID 16451)
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: skillschecker
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO skillschecker;

--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 207
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skillschecker
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- TOC entry 208 (class 1259 OID 16453)
-- Name: questionorder; Type: TABLE; Schema: public; Owner: skillschecker
--

CREATE TABLE public.questionorder (
    id integer NOT NULL,
    product integer NOT NULL,
    name text NOT NULL,
    "order" integer NOT NULL,
    description text
);


ALTER TABLE public.questionorder OWNER TO skillschecker;

--
-- TOC entry 209 (class 1259 OID 16459)
-- Name: questionorder_id_seq; Type: SEQUENCE; Schema: public; Owner: skillschecker
--

CREATE SEQUENCE public.questionorder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionorder_id_seq OWNER TO skillschecker;

--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 209
-- Name: questionorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skillschecker
--

ALTER SEQUENCE public.questionorder_id_seq OWNED BY public.questionorder.id;


--
-- TOC entry 210 (class 1259 OID 16461)
-- Name: scenario; Type: TABLE; Schema: public; Owner: skillschecker
--

CREATE TABLE public.scenario (
    id integer NOT NULL,
    product integer,
    interest integer,
    name text NOT NULL,
    description text,
    level integer NOT NULL,
    resource text,
    text text NOT NULL
);


ALTER TABLE public.scenario OWNER TO skillschecker;

--
-- TOC entry 211 (class 1259 OID 16467)
-- Name: scenario_id_seq; Type: SEQUENCE; Schema: public; Owner: skillschecker
--

CREATE SEQUENCE public.scenario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scenario_id_seq OWNER TO skillschecker;

--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 211
-- Name: scenario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skillschecker
--

ALTER SEQUENCE public.scenario_id_seq OWNED BY public.scenario.id;


--
-- TOC entry 3731 (class 2604 OID 16469)
-- Name: answer id; Type: DEFAULT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.answer ALTER COLUMN id SET DEFAULT nextval('public.answer_id_seq'::regclass);


--
-- TOC entry 3732 (class 2604 OID 16470)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3733 (class 2604 OID 16471)
-- Name: course id; Type: DEFAULT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);


--
-- TOC entry 3734 (class 2604 OID 16472)
-- Name: interest id; Type: DEFAULT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.interest ALTER COLUMN id SET DEFAULT nextval('public.interest_id_seq'::regclass);


--
-- TOC entry 3735 (class 2604 OID 16473)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3736 (class 2604 OID 16474)
-- Name: question id; Type: DEFAULT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- TOC entry 3737 (class 2604 OID 16475)
-- Name: questionorder id; Type: DEFAULT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.questionorder ALTER COLUMN id SET DEFAULT nextval('public.questionorder_id_seq'::regclass);


--
-- TOC entry 3738 (class 2604 OID 16476)
-- Name: scenario id; Type: DEFAULT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.scenario ALTER COLUMN id SET DEFAULT nextval('public.scenario_id_seq'::regclass);


--
-- TOC entry 3876 (class 0 OID 16405)
-- Dependencies: 196
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: skillschecker
--

INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (2, 'Difficult', 1, NULL, 1, 1, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (5, 'Reading the words in the weather forecast', 0, NULL, 1, 2, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1, 'Very difficult', 0, NULL, 1, 1, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (6, 'Recognising the numbers', 1, NULL, 1, 2, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (7, 'Finding the weather information on my phone', 2, NULL, 1, 2, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (16, 'A little difficult', 2, NULL, 1, 6, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (197, 'Very difficult', 0, NULL, 1, 31, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (8, 'Yes', 0, NULL, 1, 3, 0, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (9, 'No', 1, NULL, 1, 3, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (14, 'Very difficult', 0, NULL, 1, 6, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (15, 'Difficult', 1, NULL, 1, 6, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (10, 'Yes', 0, NULL, 1, 4, 0, 'dimension_fluency_1');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (11, 'No', 1, NULL, 1, 4, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (18, 'Typing the invitation text', 0, NULL, 1, 7, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (19, 'Writing the date, start time and end time', 1, NULL, 1, 7, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (20, 'Using applications such as WhatsApp to send and receive messages', 2, NULL, 1, 7, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (21, 'Very difficult', 0, NULL, 1, 8, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (22, 'Difficult', 1, NULL, 1, 8, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (12, 'Yes', 0, NULL, 1, 5, 0, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (13, 'No', 1, NULL, 1, 5, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (26, 'Selecting a suitable monthly repayment option', 1, NULL, 1, 9, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (27, 'Accessing and using the online loan calculator', 2, NULL, 1, 9, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (28, 'Very difficult', 0, NULL, 1, 10, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (29, 'Difficult', 1, NULL, 1, 10, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (39, 'Yes', 0, NULL, 1, 13, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (40, 'No', 1, NULL, 1, 13, 1, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (32, 'Reading the text in the video', 0, NULL, 1, 11, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (33, 'Calculating the interest charged', 1, NULL, 1, 11, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (34, 'Using the calculator on my phone', 2, NULL, 1, 11, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (35, 'None', 3, 'none', 1, 2, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (36, 'None', 3, 'none', 1, 7, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (37, 'None', 3, 'none', 1, 9, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (38, 'None', 3, 'none', 1, 11, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (41, 'Yes', 0, NULL, 1, 14, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (42, 'No', 1, NULL, 1, 14, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (25, 'Reading the information needed', 0, NULL, 1, 9, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (837, 'Lett', 3, NULL, 2, 188, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (838, 'Veldig vanskelig', 0, NULL, 2, 189, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (839, 'Vanskelig', 1, NULL, 2, 189, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (840, 'Litt vanskelig', 2, NULL, 2, 189, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (841, 'Lett', 3, NULL, 2, 189, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (843, 'Tolke grafen', 1, NULL, 2, 190, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (844, 'Finne værinformasjon for Roma på internett', 2, NULL, 2, 190, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (845, 'Ingen', 3, 'none', 2, 190, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (846, 'Lese oppskriften', 0, NULL, 2, 191, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (847, 'Justere mengdene', 1, NULL, 2, 191, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (848, 'Sende SMS med oversikt over ingrediensene til vennene mine', 2, NULL, 2, 191, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (3, 'A little difficult', 2, NULL, 1, 1, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (849, 'Ingen', 3, 'none', 2, 191, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (23, 'A little difficult', 2, NULL, 1, 8, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (30, 'A little difficult', 2, NULL, 1, 10, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (850, 'Veldig vanskelig', 0, NULL, 2, 192, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (851, 'Vanskelig', 1, NULL, 2, 192, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (852, 'Litt vanskelig', 2, NULL, 2, 192, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (853, 'Lett', 3, NULL, 2, 192, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (855, 'Finne ut av regnestykkene', 1, NULL, 2, 193, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (856, 'Laste opp og dele bilder på nettet', 2, NULL, 2, 193, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (857, 'Ingen', 3, 'none', 2, 193, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (858, 'Veldig vanskelig', 0, NULL, 2, 194, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (859, 'Vanskelig', 1, NULL, 2, 194, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (860, 'Litt vanskelig', 2, NULL, 2, 194, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (861, 'Lett', 3, NULL, 2, 194, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (863, 'Difficult', 1, NULL, 3, 195, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (864, 'A little difficult', 2, NULL, 3, 195, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (865, 'Easy', 3, NULL, 3, 195, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (866, 'Reading the words in the weather forecast', 0, NULL, 3, 196, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (867, 'Recognising the numbers', 1, NULL, 3, 196, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (868, 'Finding the weather information on my phone', 2, NULL, 3, 196, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (198, 'Difficult', 1, NULL, 1, 31, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (199, 'A little difficult', 2, NULL, 1, 31, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (201, 'Reading the words in the weather forecast', 0, NULL, 1, 32, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (202, 'Recognising the numbers', 1, NULL, 1, 32, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (203, 'Finding the weather information on my phone', 2, NULL, 1, 32, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (204, 'None', 3, 'none', 1, 32, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (205, 'Very difficult', 0, NULL, 1, 33, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (206, 'Difficult', 1, NULL, 1, 33, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (207, 'A little difficult', 2, NULL, 1, 33, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (209, 'Typing the invitation text', 0, NULL, 1, 34, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (210, 'Writing the date, start time and end time', 1, NULL, 1, 34, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (211, 'Using applications such as WhatsApp to send and receive messages', 2, NULL, 1, 34, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (212, 'None', 3, 'none', 1, 34, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (213, 'Very difficult', 0, NULL, 1, 35, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (214, 'Difficult', 1, NULL, 1, 35, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (215, 'A little difficult', 2, NULL, 1, 35, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (219, 'Accessing and using the online loan calculator', 2, NULL, 1, 36, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (869, 'None', 3, 'none', 3, 196, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (870, 'Very difficult', 0, NULL, 3, 197, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (871, 'Difficult', 1, NULL, 3, 197, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (872, 'A little difficult', 2, NULL, 3, 197, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (873, 'Easy', 3, NULL, 3, 197, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (874, 'Typing the message', 0, NULL, 3, 198, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (875, 'Writing the date, start time and end time', 1, NULL, 3, 198, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (877, 'None', 3, 'none', 3, 198, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (878, 'Very difficult', 0, NULL, 3, 199, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (879, 'Difficult', 1, NULL, 3, 199, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (880, 'A little difficult', 2, NULL, 3, 199, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (881, 'Easy', 3, NULL, 3, 199, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (882, 'Reading the information needed', 0, NULL, 3, 200, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (883, 'Selecting a suitable monthly payment option', 1, NULL, 3, 200, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (884, 'Finding and using the loan calculator', 2, NULL, 3, 200, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (885, 'None', 3, 'none', 3, 200, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (886, 'Very difficult', 0, NULL, 3, 201, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (887, 'Difficult', 1, NULL, 3, 201, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (842, 'Lese teksten', 0, NULL, 2, 190, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (854, 'Lese teksten', 0, NULL, 2, 193, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (220, 'None', 3, 'none', 1, 36, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (221, 'Very difficult', 0, NULL, 1, 37, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (222, 'Difficult', 1, NULL, 1, 37, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (223, 'A little difficult', 2, NULL, 1, 37, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (225, 'Reading the text in the video', 0, NULL, 1, 38, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (226, 'Calculating the interest charged', 1, NULL, 1, 38, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (227, 'Using the calculator on my phone', 2, NULL, 1, 38, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (228, 'None', 3, 'none', 1, 38, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (217, 'Reading the information needed', 0, NULL, 1, 36, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (229, 'Very difficult', 0, NULL, 1, 39, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (230, 'Difficult', 1, NULL, 1, 39, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (231, 'A little difficult', 2, NULL, 1, 39, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (218, 'Selecting a suitable monthly repayment option', 1, NULL, 1, 36, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (235, 'Typing and selecting words and numbers', 2, NULL, 1, 40, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (236, 'None', 3, 'none', 1, 40, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (256, 'None', 3, 'none', 1, 45, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (257, 'Very difficult', 0, NULL, 1, 46, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (258, 'Difficult', 1, NULL, 1, 46, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (259, 'A little difficult', 2, NULL, 1, 46, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (233, 'Recognising the words', 0, NULL, 1, 40, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (208, 'Easy', 3, NULL, 1, 33, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (216, 'Easy', 3, NULL, 1, 35, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (224, 'Easy', 3, NULL, 1, 37, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (232, 'Easy', 3, NULL, 1, 39, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (260, 'Easy', 3, NULL, 1, 46, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (606, 'Veldig vanskelig', 0, NULL, 2, 131, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (607, 'Vanskelig', 1, NULL, 2, 131, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (244, 'Easy', 3, NULL, 1, 42, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (252, 'Easy', 3, NULL, 1, 44, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (608, 'Litt vanskelig', 2, NULL, 2, 131, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (234, 'Writing numbers', 1, NULL, 1, 40, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (609, 'Lett', 3, NULL, 2, 131, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (610, 'Lese værvarselet', 0, NULL, 2, 132, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (238, 'Searching the training course website', 1, NULL, 1, 41, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (611, 'Forstå tallene', 1, NULL, 2, 132, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (239, 'Identifying courses within 10 kilometres of the city centre', 2, NULL, 1, 41, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (612, 'Finne informasjon om været på telefonen', 2, NULL, 2, 132, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (247, 'Using the online booking system', 2, NULL, 1, 43, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (254, 'Working out the best deal', 1, NULL, 1, 45, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (237, 'Reading the text', 0, NULL, 1, 41, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (240, 'None', 3, 'none', 1, 41, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (241, 'Very difficult', 0, NULL, 1, 42, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (242, 'Difficult', 1, NULL, 1, 42, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (243, 'A little difficult', 2, NULL, 1, 42, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (245, 'Reading the text', 0, NULL, 1, 43, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (246, 'Paying the fees', 1, NULL, 1, 43, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (248, 'None', 3, 'none', 1, 43, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (249, 'Very difficult', 0, NULL, 1, 44, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (250, 'Difficult', 1, NULL, 1, 44, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (251, 'A little difficult', 2, NULL, 1, 44, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (253, 'Reading the text', 0, NULL, 1, 45, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (255, 'Finding the textbook online', 2, NULL, 1, 45, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (376, 'Very difficult', 0, NULL, 1, 63, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (377, 'Difficult', 1, NULL, 1, 63, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (378, 'A little difficult', 2, NULL, 1, 63, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (382, 'Typing and selecting words and numbers', 2, NULL, 1, 64, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (383, 'None', 3, 'none', 1, 64, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (380, 'Recognising the words', 0, NULL, 1, 64, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (637, 'Ingen', 3, 'none', 2, 138, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (381, 'Writing numbers', 1, NULL, 1, 64, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (638, 'Veldig vanskelig', 0, NULL, 2, 139, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (416, 'Very difficult', 0, NULL, 1, 73, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (385, 'Searching the training course website', 1, NULL, 1, 65, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (639, 'Vanskelig', 1, NULL, 2, 139, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (640, 'Litt vanskelig', 2, NULL, 2, 139, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (641, 'Lett', 3, NULL, 2, 139, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (643, 'Forstå tallene', 1, NULL, 2, 140, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (645, 'Ingen', 3, 'none', 2, 140, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (646, 'Veldig vanskelig', 0, NULL, 2, 141, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (647, 'Vanskelig', 1, NULL, 2, 141, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (648, 'Litt vanskelig', 2, NULL, 2, 141, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (649, 'Lett', 3, NULL, 2, 141, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (386, 'Identifying courses within 10 kilometres of the city centre', 2, NULL, 1, 65, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (653, 'Ingen', 3, 'none', 2, 142, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (654, 'Veldig vanskelig', 0, NULL, 2, 143, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (401, 'Working out the best deal', 1, NULL, 1, 69, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (655, 'Vanskelig', 1, NULL, 2, 143, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (656, 'Litt vanskelig', 2, NULL, 2, 143, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (657, 'Lett', 3, NULL, 2, 143, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (634, 'Lese teksten i videoen', 0, NULL, 2, 138, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (613, 'Ingen', 3, 'none', 2, 132, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (614, 'Veldig vanskelig', 0, NULL, 2, 133, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (615, 'Vanskelig', 1, NULL, 2, 133, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (618, 'Skrive invitasjon', 0, NULL, 2, 134, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (619, 'Skrive dato, start og sluttid', 1, NULL, 2, 134, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (621, 'Ingen', 3, 'none', 2, 134, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (622, 'Veldig vanskelig', 0, NULL, 2, 135, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (623, 'Vanskelig', 1, NULL, 2, 135, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (624, 'Litt vanskelig', 2, NULL, 2, 135, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (625, 'Lett', 3, NULL, 2, 135, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (626, 'Lese nødvendig informasjon', 0, NULL, 2, 136, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (627, 'Velge månedlige avdrag som passer', 1, NULL, 2, 136, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (628, 'Tilgang og bruken av online lånekalkulator', 2, NULL, 2, 136, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (629, 'Ingen', 3, 'none', 2, 136, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (630, 'Veldig vanskelig', 0, NULL, 2, 137, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (631, 'Vanskelig', 1, NULL, 2, 137, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (632, 'Litt vanskelig', 2, NULL, 2, 137, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (633, 'Lett', 3, NULL, 2, 137, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (635, 'Beregning av rentebeløp', 1, NULL, 2, 138, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (636, 'Bruke kalkulatoren på telefonen min', 2, NULL, 2, 138, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (642, 'Lese teksten', 0, NULL, 2, 140, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (644, 'Velge riktig annonsen ved å klikke på den', 2, NULL, 2, 140, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (650, 'Lese informasjonen', 0, NULL, 2, 142, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (651, 'Bruk av tall og symboler for å lage et trygt passord', 1, NULL, 2, 142, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (652, 'Skrive inn informasjonen', 2, NULL, 2, 142, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (658, 'Lese teksten', 0, NULL, 2, 144, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (661, 'Ingen', 3, 'none', 2, 144, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (662, 'Veldig vanskelig', 0, NULL, 2, 145, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (663, 'Vanskelig', 1, NULL, 2, 145, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (664, 'Litt vanskelig', 2, NULL, 2, 145, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (394, 'Using the online booking system', 2, NULL, 1, 67, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (384, 'Reading the text', 0, NULL, 1, 65, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (387, 'None', 3, 'none', 1, 65, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (388, 'Very difficult', 0, NULL, 1, 66, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (389, 'Difficult', 1, NULL, 1, 66, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (390, 'A little difficult', 2, NULL, 1, 66, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (392, 'Reading the text', 0, NULL, 1, 67, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (393, 'Paying the fees', 1, NULL, 1, 67, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (395, 'None', 3, 'none', 1, 67, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (396, 'Very difficult', 0, NULL, 1, 68, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (397, 'Difficult', 1, NULL, 1, 68, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (398, 'A little difficult', 2, NULL, 1, 68, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (400, 'Reading the text', 0, NULL, 1, 69, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (402, 'Finding the textbook online', 2, NULL, 1, 69, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (403, 'None', 3, 'none', 1, 69, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (404, 'Very difficult', 0, NULL, 1, 70, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (405, 'Difficult', 1, NULL, 1, 70, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (406, 'A little difficult', 2, NULL, 1, 70, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (665, 'Lett', 3, NULL, 2, 145, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (669, 'Ingen', 3, 'none', 2, 146, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (379, 'Easy', 3, NULL, 1, 63, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (670, 'Veldig vanskelig', 0, NULL, 2, 147, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (671, 'Vanskelig', 1, NULL, 2, 147, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (672, 'Litt vanskelig', 2, NULL, 2, 147, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (673, 'Lett', 3, NULL, 2, 147, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (391, 'Easy', 3, NULL, 1, 66, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (399, 'Easy', 3, NULL, 1, 68, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (407, 'Easy', 3, NULL, 1, 70, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (417, 'Difficult', 1, NULL, 1, 73, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (418, 'A little difficult', 2, NULL, 1, 73, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (421, 'Using numbers and symbols for a secure password', 1, NULL, 1, 74, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (423, 'None', 3, 'none', 1, 74, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (448, 'Very difficult', 0, NULL, 1, 81, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (449, 'Difficult', 1, NULL, 1, 81, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (450, 'A little difficult', 2, NULL, 1, 81, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (453, 'Using numbers and symbols for a secure password', 1, NULL, 1, 82, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (455, 'None', 3, 'none', 1, 82, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (677, 'Ingen', 3, 'none', 2, 148, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (441, 'Recognising the numbers', 1, NULL, 1, 79, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (456, 'Reading the text', 0, NULL, 1, 83, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (424, 'Reading the text', 0, NULL, 1, 75, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (443, 'None', 3, 'none', 1, 79, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (444, 'Very difficult', 0, NULL, 1, 80, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (445, 'Difficult', 1, NULL, 1, 80, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (446, 'A little difficult', 2, NULL, 1, 80, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (473, 'Recognising the numbers', 1, NULL, 1, 87, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (457, 'Calculating the monthly pay', 1, NULL, 1, 83, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (458, 'Finding bus driver jobs online', 2, NULL, 1, 83, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (459, 'None', 3, 'none', 1, 83, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (460, 'Very difficult', 0, NULL, 1, 84, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (461, 'Difficult', 1, NULL, 1, 84, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (462, 'A little difficult', 2, NULL, 1, 84, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (442, 'Selecting the correct ad by clicking on it', 2, NULL, 1, 79, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (496, 'Reading the requirements', 0, NULL, 1, 93, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (497, 'Interpreting the graph', 1, NULL, 1, 93, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (498, 'Preparing a PowerPoint presentation', 2, NULL, 1, 93, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (499, 'None', 3, 'none', 1, 93, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (500, 'Very difficult', 0, NULL, 1, 94, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (501, 'Difficult', 1, NULL, 1, 94, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (502, 'A little difficult', 2, NULL, 1, 94, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (474, 'Selecting the correct ad by clicking on it', 2, NULL, 1, 87, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (425, 'Calculating the monthly pay', 1, NULL, 1, 75, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (426, 'Finding bus driver jobs online', 2, NULL, 1, 75, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (427, 'None', 3, 'none', 1, 75, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (428, 'Very difficult', 0, NULL, 1, 76, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (429, 'Difficult', 1, NULL, 1, 76, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (430, 'A little difficult', 2, NULL, 1, 76, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (420, 'Reading the information', 0, NULL, 1, 74, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (464, 'Reading the requirements', 0, NULL, 1, 85, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (465, 'Interpreting the graph', 1, NULL, 1, 85, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (466, 'Preparing a PowerPoint presentation', 2, NULL, 1, 85, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (467, 'None', 3, 'none', 1, 85, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (468, 'Very difficult', 0, NULL, 1, 86, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (469, 'Difficult', 1, NULL, 1, 86, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (470, 'A little difficult', 2, NULL, 1, 86, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (452, 'Reading the information', 0, NULL, 1, 82, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (681, 'Ingen', 3, 'none', 2, 149, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (682, 'Veldig vanskelig', 0, NULL, 2, 150, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (475, 'None', 3, 'none', 1, 87, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (476, 'Very difficult', 0, NULL, 1, 88, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (477, 'Difficult', 1, NULL, 1, 88, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (478, 'A little difficult', 2, NULL, 1, 88, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (683, 'Vanskelig', 1, NULL, 2, 150, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (684, 'Litt vanskelig', 2, NULL, 2, 150, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (685, 'Lett', 3, NULL, 2, 150, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (689, 'Ingen', 3, 'none', 2, 151, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (422, 'Typing the information', 2, NULL, 1, 74, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (690, 'Veldig vanskelig', 0, NULL, 2, 152, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (691, 'Vanskelig', 1, NULL, 2, 152, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (692, 'Litt vanskelig', 2, NULL, 2, 152, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (693, 'Lett', 3, NULL, 2, 152, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (659, 'Beregning av månedslønn', 1, NULL, 2, 144, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (454, 'Typing the information', 2, NULL, 1, 82, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (419, 'Easy', 3, NULL, 1, 73, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (451, 'Easy', 3, NULL, 1, 81, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (667, 'Tolke grafen', 1, NULL, 2, 146, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (668, 'Lage en Power Point presentasjon', 2, NULL, 2, 146, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (674, 'Lese værvarselet', 0, NULL, 2, 148, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (675, 'Forstå tallene', 1, NULL, 2, 148, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (676, 'Finne informasjon om været på telefonen', 2, NULL, 2, 148, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (678, 'Skrive invitasjon', 0, NULL, 2, 149, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (679, 'Skrive dato, start og sluttid', 1, NULL, 2, 149, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (686, 'Lese nødvendig informasjon', 0, NULL, 2, 151, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (687, 'Velge månedlige avdrag som passer', 1, NULL, 2, 151, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (688, 'Tilgang og bruken av online lånekalkulator', 2, NULL, 2, 151, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (694, 'Lese teksten i videoen', 0, NULL, 2, 153, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (530, 'Uploading and sharing your photos online', 2, NULL, 1, 103, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (447, 'Easy', 3, NULL, 1, 80, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (463, 'Easy', 3, NULL, 1, 84, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (503, 'Easy', 3, NULL, 1, 94, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (431, 'Easy', 3, NULL, 1, 76, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (471, 'Easy', 3, NULL, 1, 86, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (529, 'Working out the calculations needed', 1, NULL, 1, 103, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (594, 'Uploading and sharing your photos online', 2, NULL, 1, 119, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (472, 'Reading the words', 0, NULL, 1, 87, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (593, 'Working out the calculations needed', 1, NULL, 1, 119, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (504, 'Very difficult', 0, NULL, 1, 97, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (505, 'Difficult', 1, NULL, 1, 97, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (506, 'A little difficult', 2, NULL, 1, 97, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (508, 'Reading the words', 0, NULL, 1, 98, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (509, 'Recognising the numbers', 1, NULL, 1, 98, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (511, 'None', 3, 'none', 1, 98, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (512, 'Very difficult', 0, NULL, 1, 99, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (513, 'Difficult', 1, NULL, 1, 99, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (514, 'A little difficult', 2, NULL, 1, 99, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (516, 'Reading the text', 0, NULL, 1, 100, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (517, 'Interpreting the graph', 1, NULL, 1, 100, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (518, 'Finding weather information for Rome online', 2, NULL, 1, 100, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (519, 'None', 3, 'none', 1, 100, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (520, 'Very difficult', 0, NULL, 1, 101, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (521, 'Difficult', 1, NULL, 1, 101, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (522, 'A little difficult', 2, NULL, 1, 101, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (524, 'Reading the recipe', 0, NULL, 1, 102, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (525, 'Adjusting the quantities', 1, NULL, 1, 102, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (526, 'Texting the ingredients to my friends', 2, NULL, 1, 102, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (527, 'None', 3, 'none', 1, 102, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (697, 'Ingen', 3, 'none', 2, 153, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (698, 'Veldig vanskelig', 0, NULL, 2, 154, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (699, 'Vanskelig', 1, NULL, 2, 154, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (700, 'Litt vanskelig', 2, NULL, 2, 154, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (701, 'Lett', 3, NULL, 2, 154, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (702, 'Veldig vanskelig', 0, NULL, 2, 155, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (703, 'Vanskelig', 1, NULL, 2, 155, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (704, 'Litt vanskelig', 2, NULL, 2, 155, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (705, 'Lett', 3, NULL, 2, 155, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (576, 'Very difficult', 0, NULL, 1, 115, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (577, 'Difficult', 1, NULL, 1, 115, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (578, 'A little difficult', 2, NULL, 1, 115, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (580, 'Reading the text', 0, NULL, 1, 116, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (581, 'Interpreting the graph', 1, NULL, 1, 116, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (582, 'Finding weather information for Rome online', 2, NULL, 1, 116, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (583, 'None', 3, 'none', 1, 116, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (709, 'Ingen', 3, 'none', 2, 156, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (528, 'Reading the text', 0, NULL, 1, 103, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (531, 'None', 3, 'none', 1, 103, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (532, 'Very difficult', 0, NULL, 1, 104, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (533, 'Difficult', 1, NULL, 1, 104, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (534, 'A little difficult', 2, NULL, 1, 104, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (510, 'Finding the bus timetable on my phone', 2, NULL, 1, 98, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (713, 'Ingen', 3, 'none', 2, 157, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (714, 'Veldig vanskelig', 0, NULL, 2, 158, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (715, 'Vanskelig', 1, NULL, 2, 158, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (568, 'Reading the words', 0, NULL, 1, 113, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (569, 'Recognising the numbers', 1, NULL, 1, 113, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (571, 'None', 3, 'none', 1, 113, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (572, 'Very difficult', 0, NULL, 1, 114, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (573, 'Difficult', 1, NULL, 1, 114, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (574, 'A little difficult', 2, NULL, 1, 114, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (570, 'Finding the bus timetable on my phone', 2, NULL, 1, 113, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (584, 'Reading the recipe', 0, NULL, 1, 117, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (585, 'Adjusting the quantities', 1, NULL, 1, 117, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (586, 'Texting the ingredients to my friends', 2, NULL, 1, 117, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (587, 'None', 3, 'none', 1, 117, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (588, 'Very difficult', 0, NULL, 1, 118, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (589, 'Difficult', 1, NULL, 1, 118, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (590, 'A little difficult', 2, NULL, 1, 118, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (592, 'Reading the text', 0, NULL, 1, 119, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (595, 'None', 3, 'none', 1, 119, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (596, 'Very difficult', 0, NULL, 1, 120, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (597, 'Difficult', 1, NULL, 1, 120, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (507, 'Easy', 3, NULL, 1, 97, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (515, 'Easy', 3, NULL, 1, 99, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (523, 'Easy', 3, NULL, 1, 101, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (716, 'Litt vanskelig', 2, NULL, 2, 158, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (579, 'Easy', 3, NULL, 1, 115, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (717, 'Lett', 3, NULL, 2, 158, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (479, 'Easy', 3, NULL, 1, 88, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (535, 'Easy', 3, NULL, 1, 104, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (575, 'Easy', 3, NULL, 1, 114, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (591, 'Easy', 3, NULL, 1, 118, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (599, 'Easy', 3, NULL, 1, 120, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (721, 'Ingen', 3, 'none', 2, 159, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (722, 'Veldig vanskelig', 0, NULL, 2, 160, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (723, 'Vanskelig', 1, NULL, 2, 160, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (724, 'Litt vanskelig', 2, NULL, 2, 160, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (725, 'Lett', 3, NULL, 2, 160, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (729, 'Ingen', 3, 'none', 2, 161, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (695, 'Beregning av rentebeløp', 1, NULL, 2, 153, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (696, 'Bruke kalkulatoren på telefonen min', 2, NULL, 2, 153, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (440, 'Reading the text', 0, NULL, 1, 79, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (706, 'Lese teksten', 0, NULL, 2, 156, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (707, 'Forstå tallene', 1, NULL, 2, 156, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (708, 'Velge riktig annonsen ved å klikke på den', 2, NULL, 2, 156, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (710, 'Lese informasjonen', 0, NULL, 2, 157, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (711, 'Bruk av tall og symboler for å lage et trygt passord', 1, NULL, 2, 157, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (712, 'Skrive inn informasjonen', 2, NULL, 2, 157, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (718, 'Lese teksten', 0, NULL, 2, 159, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (719, 'Beregning av månedslønn', 1, NULL, 2, 159, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (720, 'Finne bussjåfør stillinger på nettet', 2, NULL, 2, 159, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (726, 'Lese kravene', 0, NULL, 2, 161, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (727, 'Tolke grafen', 1, NULL, 2, 161, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (728, 'Lage en Power Point presentasjon', 2, NULL, 2, 161, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (598, 'A little difficult', 2, NULL, 1, 120, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (4, 'Easy', 3, NULL, 1, 1, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (730, 'Veldig vanskelig', 0, NULL, 2, 162, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (731, 'Vanskelig', 1, NULL, 2, 162, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (17, 'Easy', 3, NULL, 1, 6, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (24, 'Easy', 3, NULL, 1, 8, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (31, 'Easy', 3, NULL, 1, 10, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (732, 'Litt vanskelig', 2, NULL, 2, 162, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (733, 'Lett', 3, NULL, 2, 162, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (734, 'Veldig vanskelig', 0, NULL, 2, 163, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (735, 'Vanskelig', 1, NULL, 2, 163, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (736, 'Litt vanskelig', 2, NULL, 2, 163, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (200, 'Easy', 3, NULL, 1, 31, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (737, 'Lett', 3, NULL, 2, 163, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (741, 'Ingen', 3, 'none', 2, 164, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (745, 'Ingen', 3, 'none', 2, 165, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (746, 'Veldig vanskelig', 0, NULL, 2, 166, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (747, 'Vanskelig', 1, NULL, 2, 166, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (748, 'Litt vanskelig', 2, NULL, 2, 166, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (749, 'Lett', 3, NULL, 2, 166, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (753, 'Ingen', 3, 'none', 2, 167, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (754, 'Veldig vanskelig', 0, NULL, 2, 168, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (755, 'Vanskelig', 1, NULL, 2, 168, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (756, 'Litt vanskelig', 2, NULL, 2, 168, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (757, 'Lett', 3, NULL, 2, 168, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (758, 'Veldig vanskelig', 0, NULL, 2, 169, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (759, 'Vanskelig', 1, NULL, 2, 169, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (760, 'Litt vanskelig', 2, NULL, 2, 169, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (761, 'Lett', 3, NULL, 2, 169, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (765, 'Ingen', 3, 'none', 2, 170, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (769, 'Ingen', 3, 'none', 2, 171, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (770, 'Veldig vanskelig', 0, NULL, 2, 172, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (771, 'Vanskelig', 1, NULL, 2, 172, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (772, 'Litt vanskelig', 2, NULL, 2, 172, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (773, 'Lett', 3, NULL, 2, 172, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (777, 'Ingen', 3, 'none', 2, 173, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (778, 'Veldig vanskelig', 0, NULL, 2, 174, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (779, 'Vanskelig', 1, NULL, 2, 174, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (780, 'Litt vanskelig', 2, NULL, 2, 174, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (781, 'Lett', 3, NULL, 2, 174, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (785, 'Ingen', 3, 'none', 2, 175, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (786, 'Veldig vanskelig', 0, NULL, 2, 176, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (787, 'Vanskelig', 1, NULL, 2, 176, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (788, 'Litt vanskelig', 2, NULL, 2, 176, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (789, 'Lett', 3, NULL, 2, 176, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (793, 'Ingen', 3, 'none', 2, 177, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (794, 'Veldig vanskelig', 0, NULL, 2, 178, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (795, 'Vanskelig', 1, NULL, 2, 178, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (796, 'Litt vanskelig', 2, NULL, 2, 178, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (797, 'Lett', 3, NULL, 2, 178, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (798, 'Veldig vanskelig', 0, NULL, 2, 179, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (799, 'Vanskelig', 1, NULL, 2, 179, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (800, 'Litt vanskelig', 2, NULL, 2, 179, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (801, 'Lett', 3, NULL, 2, 179, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (802, 'Lese ordene', 0, NULL, 2, 180, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (803, 'Forstå tallene', 1, NULL, 2, 180, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (804, 'Finne bussruten på mobiltelefonen min ', 2, NULL, 2, 180, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (805, 'Ingen', 3, 'none', 2, 180, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (806, 'Veldig vanskelig', 0, NULL, 2, 181, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (807, 'Vanskelig', 1, NULL, 2, 181, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (808, 'Litt vanskelig', 2, NULL, 2, 181, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (809, 'Lett', 3, NULL, 2, 181, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (811, 'Tolke grafen', 1, NULL, 2, 182, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (812, 'Finne værinformasjon for Roma på internett', 2, NULL, 2, 182, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (813, 'Ingen', 3, 'none', 2, 182, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (814, 'Veldig vanskelig', 0, NULL, 2, 183, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (815, 'Vanskelig', 1, NULL, 2, 183, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (816, 'Litt vanskelig', 2, NULL, 2, 183, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (817, 'Lett', 3, NULL, 2, 183, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (818, 'Lese oppskriften', 0, NULL, 2, 184, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (819, 'Justere mengdene', 1, NULL, 2, 184, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (820, 'Sende SMS med oversikt over ingrediensene til vennene mine', 2, NULL, 2, 184, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (821, 'Ingen', 3, 'none', 2, 184, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (823, 'Finne ut av regnestykkene', 1, NULL, 2, 185, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (824, 'Laste opp og dele bilder på nettet', 2, NULL, 2, 185, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (825, 'Ingen', 3, 'none', 2, 185, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (826, 'Veldig vanskelig', 0, NULL, 2, 186, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (827, 'Vanskelig', 1, NULL, 2, 186, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (828, 'Litt vanskelig', 2, NULL, 2, 186, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (829, 'Lett', 3, NULL, 2, 186, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (830, 'Lese ordene', 0, NULL, 2, 187, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (831, 'Forstå tallene', 1, NULL, 2, 187, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (832, 'Finne bussruten på mobiltelefonen min ', 2, NULL, 2, 187, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (833, 'Ingen', 3, 'none', 2, 187, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (834, 'Veldig vanskelig', 0, NULL, 2, 188, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (835, 'Vanskelig', 1, NULL, 2, 188, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (836, 'Litt vanskelig', 2, NULL, 2, 188, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (862, 'Very difficult', 0, NULL, 3, 195, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (742, 'Lese teksten', 0, NULL, 2, 165, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (743, 'Søke på kurset hjemmeside', 1, NULL, 2, 165, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (750, 'Lese teksten', 0, NULL, 2, 167, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (751, 'Betale avgifter', 1, NULL, 2, 167, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (752, 'Bruke online booking system', 2, NULL, 2, 167, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (762, 'Lese teksten', 0, NULL, 2, 170, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (763, 'Working ut den beste avtale', 1, NULL, 2, 170, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (764, 'Finne lærebok online', 2, NULL, 2, 170, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (766, 'Forstå teksten', 0, NULL, 2, 171, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (767, 'Skrive tall', 1, NULL, 2, 171, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (768, 'Skrive og velge ord og tall', 2, NULL, 2, 171, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (774, 'Lese teksten', 0, NULL, 2, 173, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (775, 'Søke på kurset hjemmeside', 1, NULL, 2, 173, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (776, 'Identifisere kurs innen 10 kilometer fra sentrum av byen', 2, NULL, 2, 173, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (782, 'Lese teksten', 0, NULL, 2, 175, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (783, 'Betale avgifter', 1, NULL, 2, 175, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (784, 'Bruke online booking system', 2, NULL, 2, 175, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (790, 'Lese teksten', 0, NULL, 2, 177, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (791, 'Working ut den beste avtale', 1, NULL, 2, 177, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (792, 'Finne lærebok online', 2, NULL, 2, 177, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (810, 'Lese teksten', 0, NULL, 2, 182, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (822, 'Lese teksten', 0, NULL, 2, 185, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (893, 'None', 3, 'none', 3, 202, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (894, 'Very difficult', 0, NULL, 3, 203, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (895, 'Difficult', 1, NULL, 3, 203, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (896, 'A little difficult', 2, NULL, 3, 203, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (897, 'Easy', 3, NULL, 3, 203, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (899, 'Recognising the numbers', 1, NULL, 3, 204, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (901, 'None', 3, 'none', 3, 204, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (902, 'Very difficult', 0, NULL, 3, 205, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (903, 'Difficult', 1, NULL, 3, 205, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (904, 'A little difficult', 2, NULL, 3, 205, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (905, 'Easy', 3, NULL, 3, 205, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (909, 'None', 3, 'none', 3, 206, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (910, 'Very difficult', 0, NULL, 3, 207, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (911, 'Difficult', 1, NULL, 3, 207, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (912, 'A little difficult', 2, NULL, 3, 207, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (913, 'Easy', 3, NULL, 3, 207, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (917, 'None', 3, 'none', 3, 208, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (918, 'Very difficult', 0, NULL, 3, 209, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (919, 'Difficult', 1, NULL, 3, 209, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (920, 'A little difficult', 2, NULL, 3, 209, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (921, 'Easy', 3, NULL, 3, 209, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (925, 'None', 3, 'none', 3, 210, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (926, 'Very difficult', 0, NULL, 3, 211, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (927, 'Difficult', 1, NULL, 3, 211, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (928, 'A little difficult', 2, NULL, 3, 211, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (929, 'Easy', 3, NULL, 3, 211, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (933, 'None', 3, 'none', 3, 212, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (937, 'None', 3, 'none', 3, 213, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (938, 'Very difficult', 0, NULL, 3, 214, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (939, 'Difficult', 1, NULL, 3, 214, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (940, 'A little difficult', 2, NULL, 3, 214, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (941, 'Easy', 3, NULL, 3, 214, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (945, 'None', 3, 'none', 3, 215, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (946, 'Very difficult', 0, NULL, 3, 216, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (947, 'Difficult', 1, NULL, 3, 216, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (948, 'A little difficult', 2, NULL, 3, 216, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (949, 'Easy', 3, NULL, 3, 216, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (953, 'None', 3, 'none', 3, 217, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (954, 'Very difficult', 0, NULL, 3, 218, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (955, 'Difficult', 1, NULL, 3, 218, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (956, 'A little difficult', 2, NULL, 3, 218, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (957, 'Easy', 3, NULL, 3, 218, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (958, 'Very difficult', 0, NULL, 3, 219, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (959, 'Difficult', 1, NULL, 3, 219, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (960, 'A little difficult', 2, NULL, 3, 219, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (961, 'Easy', 3, NULL, 3, 219, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (965, 'None', 3, 'none', 3, 220, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (969, 'None', 3, 'none', 3, 221, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (970, 'Very difficult', 0, NULL, 3, 222, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (971, 'Difficult', 1, NULL, 3, 222, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (972, 'A little difficult', 2, NULL, 3, 222, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (973, 'Easy', 3, NULL, 3, 222, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (977, 'None', 3, 'none', 3, 223, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (978, 'Very difficult', 0, NULL, 3, 224, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (979, 'Difficult', 1, NULL, 3, 224, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (980, 'A little difficult', 2, NULL, 3, 224, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (981, 'Easy', 3, NULL, 3, 224, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (985, 'None', 3, 'none', 3, 225, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (986, 'Very difficult', 0, NULL, 3, 226, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (987, 'Difficult', 1, NULL, 3, 226, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (988, 'A little difficult', 2, NULL, 3, 226, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (989, 'Easy', 3, NULL, 3, 226, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (990, 'Very difficult', 0, NULL, 3, 227, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (991, 'Difficult', 1, NULL, 3, 227, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (992, 'A little difficult', 2, NULL, 3, 227, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (993, 'Easy', 3, NULL, 3, 227, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (890, 'Reading the text in the video', 0, NULL, 3, 202, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (898, 'Reading the words', 0, NULL, 3, 204, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (900, 'Choosing the correct advert by clicking on it', 2, NULL, 3, 204, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (906, 'Reading the information', 0, NULL, 3, 206, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (907, 'Using numbers and symbols for a secure password', 1, NULL, 3, 206, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (908, 'Typing the information', 2, NULL, 3, 206, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (914, 'Reading the text', 0, NULL, 3, 208, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (915, 'Calculating the monthly salary', 1, NULL, 3, 208, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (916, 'Finding bus driver jobs online', 2, NULL, 3, 208, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (922, 'Reading the question', 0, NULL, 3, 210, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (923, 'Analysing the graph', 1, NULL, 3, 210, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (924, 'Preparing a PowerPoint presentation', 2, NULL, 3, 210, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (930, 'Reading the words in the weather forecast', 0, NULL, 3, 212, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (931, 'Recognising the numbers', 1, NULL, 3, 212, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (932, 'Finding the weather information on my phone', 2, NULL, 3, 212, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (934, 'Typing the message', 0, NULL, 3, 213, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (935, 'Writing the date, start time and end time', 1, NULL, 3, 213, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (936, 'Using applications like Whatsapp or Facebook to send and receive messages', 2, NULL, 3, 213, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (942, 'Reading the information needed', 0, NULL, 3, 215, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (943, 'Selecting a suitable monthly payment option', 1, NULL, 3, 215, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (944, 'Finding and using the loan calculator', 2, NULL, 3, 215, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (950, 'Reading the text in the video', 0, NULL, 3, 217, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (951, 'Calculating the interest charged', 1, NULL, 3, 217, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (952, 'Using the calculator on my phone', 2, NULL, 3, 217, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (962, 'Reading the text', 0, NULL, 3, 220, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (963, 'Recognising the numbers', 1, NULL, 3, 220, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (964, 'Choosing the correct advert by clicking on it', 2, NULL, 3, 220, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (966, 'Reading the information', 0, NULL, 3, 221, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (967, 'Using numbers and symbols for a secure password', 1, NULL, 3, 221, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (974, 'Reading the text', 0, NULL, 3, 223, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (975, 'Calculating the monthly salary', 1, NULL, 3, 223, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (976, 'Finding bus driver jobs online', 2, NULL, 3, 223, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (982, 'Reading the question', 0, NULL, 3, 225, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (983, 'Analysing the graph', 1, NULL, 3, 225, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (984, 'Preparing a PowerPoint presentation', 2, NULL, 3, 225, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (994, 'Recognising the words', 0, NULL, 3, 228, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (995, 'Writing numbers', 1, NULL, 3, 228, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (996, 'Typing and choosing the words and numbers', 2, NULL, 3, 228, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (997, 'None', 3, 'none', 3, 228, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1001, 'None', 3, 'none', 3, 229, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1002, 'Very difficult', 0, NULL, 3, 230, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1003, 'Difficult', 1, NULL, 3, 230, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1004, 'A little difficult', 2, NULL, 3, 230, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1005, 'Easy', 3, NULL, 3, 230, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1009, 'None', 3, 'none', 3, 231, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1010, 'Very difficult', 0, NULL, 3, 232, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1011, 'Difficult', 1, NULL, 3, 232, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1012, 'A little difficult', 2, NULL, 3, 232, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1013, 'Easy', 3, NULL, 3, 232, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1014, 'Very difficult', 0, NULL, 3, 233, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1015, 'Difficult', 1, NULL, 3, 233, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1016, 'A little difficult', 2, NULL, 3, 233, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1017, 'Easy', 3, NULL, 3, 233, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1021, 'None', 3, 'none', 3, 234, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1025, 'None', 3, 'none', 3, 235, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1026, 'Very difficult', 0, NULL, 3, 236, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1027, 'Difficult', 1, NULL, 3, 236, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1028, 'A little difficult', 2, NULL, 3, 236, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1029, 'Easy', 3, NULL, 3, 236, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1033, 'None', 3, 'none', 3, 237, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1034, 'Very difficult', 0, NULL, 3, 238, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1035, 'Difficult', 1, NULL, 3, 238, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1036, 'A little difficult', 2, NULL, 3, 238, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1037, 'Easy', 3, NULL, 3, 238, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1041, 'None', 3, 'none', 3, 239, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1042, 'Very difficult', 0, NULL, 3, 240, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1043, 'Difficult', 1, NULL, 3, 240, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1044, 'A little difficult', 2, NULL, 3, 240, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1045, 'Easy', 3, NULL, 3, 240, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1049, 'None', 3, 'none', 3, 241, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1050, 'Very difficult', 0, NULL, 3, 242, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1051, 'Difficult', 1, NULL, 3, 242, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1052, 'A little difficult', 2, NULL, 3, 242, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1053, 'Easy', 3, NULL, 3, 242, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1054, 'Very difficult', 0, NULL, 3, 243, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1055, 'Difficult', 1, NULL, 3, 243, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1056, 'A little difficult', 2, NULL, 3, 243, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1057, 'Easy', 3, NULL, 3, 243, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1058, 'Reading the words', 0, NULL, 3, 244, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1059, 'Recognising the numbers', 1, NULL, 3, 244, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1060, 'Finding the bus schedule on my phone', 2, NULL, 3, 244, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1061, 'None', 3, 'none', 3, 244, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1062, 'Very difficult', 0, NULL, 3, 245, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1063, 'Difficult', 1, NULL, 3, 245, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1064, 'A little difficult', 2, NULL, 3, 245, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1065, 'Easy', 3, NULL, 3, 245, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1067, 'Analysing the graph', 1, NULL, 3, 246, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1068, 'Finding weather information for Rome online', 2, NULL, 3, 246, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1069, 'None', 3, 'none', 3, 246, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1070, 'Very difficult', 0, NULL, 3, 247, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1071, 'Difficult', 1, NULL, 3, 247, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1072, 'A little difficult', 2, NULL, 3, 247, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1073, 'Easy', 3, NULL, 3, 247, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1074, 'Reading the recipe', 0, NULL, 3, 248, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1075, 'Changing the quantities ', 1, NULL, 3, 248, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1076, 'Messaging the ingredients to my friends', 2, NULL, 3, 248, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1077, 'None', 3, 'none', 3, 248, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1079, 'Working out the calculations needed', 1, NULL, 3, 249, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1080, 'Uploading and sharing your photos online', 2, NULL, 3, 249, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1081, 'None', 3, 'none', 3, 249, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1082, 'Very difficult', 0, NULL, 3, 250, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1083, 'Difficult', 1, NULL, 3, 250, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1084, 'A little difficult', 2, NULL, 3, 250, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1085, 'Easy', 3, NULL, 3, 250, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1086, 'Reading the words', 0, NULL, 3, 251, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1087, 'Recognising the numbers', 1, NULL, 3, 251, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1088, 'Finding the bus schedule on my phone', 2, NULL, 3, 251, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1089, 'None', 3, 'none', 3, 251, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1090, 'Very difficult', 0, NULL, 3, 252, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1091, 'Difficult', 1, NULL, 3, 252, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1092, 'A little difficult', 2, NULL, 3, 252, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1093, 'Easy', 3, NULL, 3, 252, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1094, 'Very difficult', 0, NULL, 3, 253, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1095, 'Difficult', 1, NULL, 3, 253, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1096, 'A little difficult', 2, NULL, 3, 253, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1097, 'Easy', 3, NULL, 3, 253, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1099, 'Analysing the graph', 1, NULL, 3, 254, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1100, 'Finding weather information for Rome online', 2, NULL, 3, 254, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1101, 'None', 3, 'none', 3, 254, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1102, 'Reading the recipe', 0, NULL, 3, 255, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1103, 'Changing the quantities ', 1, NULL, 3, 255, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1104, 'Messaging the ingredients to my friends', 2, NULL, 3, 255, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1105, 'None', 3, 'none', 3, 255, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1106, 'Very difficult', 0, NULL, 3, 256, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1107, 'Difficult', 1, NULL, 3, 256, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1006, 'Reading the text', 0, NULL, 3, 231, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1007, 'Paying the fees', 1, NULL, 3, 231, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1008, 'Using the online booking system', 2, NULL, 3, 231, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1018, 'Reading the text', 0, NULL, 3, 234, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1019, 'Working out the best deal', 1, NULL, 3, 234, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1020, 'Finding the textbook online', 2, NULL, 3, 234, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1022, 'Recognising the words', 0, NULL, 3, 235, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1023, 'Writing numbers', 1, NULL, 3, 235, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1024, 'Typing and choosing the words and numbers', 2, NULL, 3, 235, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1030, 'Reading the text', 0, NULL, 3, 237, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1031, 'Searching the training provider website', 1, NULL, 3, 237, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1032, 'Finding courses within 5 kilometres of your locality', 2, NULL, 3, 237, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1038, 'Reading the text', 0, NULL, 3, 239, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1039, 'Paying the fees', 1, NULL, 3, 239, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1040, 'Using the online booking system', 2, NULL, 3, 239, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1046, 'Reading the text', 0, NULL, 3, 241, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1047, 'Working out the best deal', 1, NULL, 3, 241, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1048, 'Finding the textbook online', 2, NULL, 3, 241, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1066, 'Reading the text', 0, NULL, 3, 246, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1078, 'Reading the text', 0, NULL, 3, 249, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1098, 'Reading the text', 0, NULL, 3, 254, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1108, 'A little difficult', 2, NULL, 3, 256, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1109, 'Easy', 3, NULL, 3, 256, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1111, 'Working out the calculations needed', 1, NULL, 3, 257, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1112, 'Uploading and sharing your photos online', 2, NULL, 3, 257, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1113, 'None', 3, 'none', 3, 257, -1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1114, 'Very difficult', 0, NULL, 3, 258, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1115, 'Difficult', 1, NULL, 3, 258, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1116, 'A little difficult', 2, NULL, 3, 258, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1117, 'Easy', 3, NULL, 3, 258, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1118, 'Ja', 0, NULL, 2, 121, 0, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1119, 'Nei', 1, NULL, 2, 121, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1120, 'Ja', 0, NULL, 2, 122, 0, 'dimension_fluency_1');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1121, 'Nei', 1, NULL, 2, 122, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1122, 'Ja', 0, NULL, 2, 123, 0, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1123, 'Nei', 1, NULL, 2, 123, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1124, 'Ja', 0, NULL, 2, 124, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1125, 'Nei', 1, NULL, 2, 124, 1, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1126, 'Ja', 0, NULL, 2, 125, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1127, 'Nei', 1, NULL, 2, 125, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1128, 'Yes', 0, NULL, 3, 126, 0, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1129, 'No', 1, NULL, 3, 126, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1130, 'Yes', 0, NULL, 3, 127, 0, 'dimension_fluency_1');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1131, 'No', 1, NULL, 3, 127, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1132, 'Yes', 0, NULL, 3, 128, 0, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1133, 'No', 1, NULL, 3, 128, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1134, 'Yes', 0, NULL, 3, 129, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1135, 'No', 1, NULL, 3, 129, 1, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1136, 'Yes', 0, NULL, 3, 130, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1137, 'No', 1, NULL, 3, 130, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (616, 'Litt vanskelig', 2, NULL, 2, 133, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (617, 'Lett', 3, NULL, 2, 133, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (876, 'Using applications like Whatsapp or Facebook to send and receive messages', 2, NULL, 3, 198, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (620, 'Bruke applikasjoner som Messenger til å sende og motta meldinger', 2, NULL, 2, 134, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (888, 'A little difficult', 2, NULL, 3, 201, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (889, 'Easy', 3, NULL, 3, 201, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (891, 'Calculating the interest charged', 1, NULL, 3, 202, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (892, 'Using the calculator on my phone', 2, NULL, 3, 202, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (660, 'Finne bussjåfør stillinger på nettet', 2, NULL, 2, 144, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (666, 'Lese kravene', 0, NULL, 2, 146, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (680, 'Bruke applikasjoner som Messenger til å sende og motta meldinger', 2, NULL, 2, 149, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (968, 'Typing the information', 2, NULL, 3, 221, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (738, 'Forstå teksten', 0, NULL, 2, 164, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (739, 'Skrive tall', 1, NULL, 2, 164, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (740, 'Skrive og velge ord og tall', 2, NULL, 2, 164, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (998, 'Reading the text', 0, NULL, 3, 229, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (999, 'Searching the training provider website', 1, NULL, 3, 229, 1, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1000, 'Finding courses within 5 kilometres of your locality ', 2, NULL, 3, 229, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (744, 'Identifisere kurs innen 10 kilometer fra sentrum av byen', 2, NULL, 2, 165, 2, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1110, 'Reading the text', 0, NULL, 3, 257, 0, NULL);
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1149, 'Naqra l-kliem fit-tbassir tat-temp', 0, 'NULL', 4, 288, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1152, 'L-ebda', 3, 'none', 4, 288, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1160, 'L-ebda', 3, 'none', 4, 290, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1168, 'L-ebda', 3, 'none', 4, 292, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1173, 'Naqra t-test fil-vidjo', 0, 'NULL', 4, 294, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1145, 'Diffiċli ħafna', 0, 'NULL', 4, 287, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1146, 'Diffiċli', 1, 'NULL', 4, 287, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1147, 'Kemxejn diffiċli', 2, 'NULL', 4, 287, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1148, 'Faċli', 3, 'NULL', 4, 287, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1153, 'Diffiċli ħafna', 0, 'NULL', 4, 289, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1154, 'Diffiċli', 1, 'NULL', 4, 289, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1155, 'Kemxejn diffiċli', 2, 'NULL', 4, 289, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1156, 'Faċli', 3, 'NULL', 4, 289, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1161, 'Diffiċli ħafna', 0, 'NULL', 4, 291, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1162, 'Diffiċli', 1, 'NULL', 4, 291, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1163, 'Kemxejn diffiċli', 2, 'NULL', 4, 291, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1164, 'Faċli', 3, 'NULL', 4, 291, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1169, 'Diffiċli ħafna', 0, 'NULL', 4, 293, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1170, 'Diffiċli', 1, 'NULL', 4, 293, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1171, 'Kemxejn diffiċli', 2, 'NULL', 4, 293, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1172, 'Faċli', 3, 'NULL', 4, 293, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1150, 'Nagħraf in-numri', 1, 'NULL', 4, 288, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1151, 'Insib l-informazzjoni dwar it-temp fuq il-mowbajl tiegħi', 2, 'NULL', 4, 288, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1158, 'Nikteb id-data, il-ħin tal-bidu u l-ħin tat-tmiem', 1, 'NULL', 4, 290, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1159, 'Nuża applikazzjonijiet bħal Whatsapp jew Facebook biex nibgħat u nirċievi messaġġi', 2, 'NULL', 4, 290, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1165, 'Naqra l-informazzjoni meħtieġa', 0, 'NULL', 4, 292, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1166, 'Nagħżel għażla ta'' pagament fix-xahar xierqa', 1, 'NULL', 4, 292, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1167, 'Insib u nuża l-kalkolatur tas-self', 2, 'NULL', 4, 292, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1174, 'Nikkalkula l-interess li jrid jitħallas', 1, 'NULL', 4, 294, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1175, 'Nuża l-kalkolatur fuq il-mowbajl tiegħi', 2, 'NULL', 4, 294, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1176, 'L-ebda', 3, 'none', 4, 294, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1157, 'Nikteb il-messaġġ', 0, 'NULL', 4, 290, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1181, 'Naqra l-kliem', 0, 'NULL', 4, 296, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1184, 'L-ebda', 3, 'none', 4, 296, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1189, 'Naqra l-informazzjoni', 0, 'NULL', 4, 298, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1191, 'Nikteb l-informazzjoni', 2, 'NULL', 4, 298, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1192, 'L-ebda', 3, 'none', 4, 298, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1197, 'Naqra t-test', 0, 'NULL', 4, 300, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1198, 'Nikkalkula l-paga fix-xahar', 1, 'NULL', 4, 300, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1199, 'Insib impjiegi ta'' xufier tal-karozzi tal-linja online', 2, 'NULL', 4, 300, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1200, 'L-ebda', 3, 'none', 4, 300, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1205, 'Naqra l-mistoqsija', 0, 'NULL', 4, 302, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1206, 'Nanalizza l-grafika', 1, 'NULL', 4, 302, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1208, 'L-ebda', 3, 'none', 4, 302, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1177, 'Diffiċli ħafna', 0, 'NULL', 4, 295, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1178, 'Diffiċli', 1, 'NULL', 4, 295, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1179, 'Kemxejn diffiċli', 2, 'NULL', 4, 295, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1180, 'Faċli', 3, 'NULL', 4, 295, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1185, 'Diffiċli ħafna', 0, 'NULL', 4, 297, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1186, 'Diffiċli', 1, 'NULL', 4, 297, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1187, 'Kemxejn diffiċli', 2, 'NULL', 4, 297, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1188, 'Faċli', 3, 'NULL', 4, 297, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1193, 'Diffiċli ħafna', 0, 'NULL', 4, 299, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1194, 'Diffiċli', 1, 'NULL', 4, 299, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1195, 'Kemxejn diffiċli', 2, 'NULL', 4, 299, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1196, 'Faċli', 3, 'NULL', 4, 299, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1201, 'Diffiċli ħafna', 0, 'NULL', 4, 301, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1202, 'Diffiċli', 1, 'NULL', 4, 301, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1203, 'Kemxejn diffiċli', 2, 'NULL', 4, 301, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1204, 'Faċli', 3, 'NULL', 4, 301, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1209, 'Diffiċli ħafna', 0, 'NULL', 4, 303, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1210, 'Diffiċli', 1, 'NULL', 4, 303, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1211, 'Kemxejn diffiċli', 2, 'NULL', 4, 303, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1212, 'Faċli', 3, 'NULL', 4, 303, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1213, '﻿Iva', 0, 'NULL', 4, 282, 0, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1214, 'Le', 1, 'NULL', 4, 282, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1215, 'Iva', 0, 'NULL', 4, 283, 0, 'dimension_fluency_1');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1216, 'Le', 1, 'NULL', 4, 283, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1217, 'Iva', 0, 'NULL', 4, 284, 0, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1218, 'Le', 1, 'NULL', 4, 284, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1219, 'Iva', 0, 'NULL', 4, 285, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1220, 'Le', 1, 'NULL', 4, 285, 1, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1221, 'Iva', 0, 'NULL', 4, 286, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1222, 'Le', 1, 'NULL', 4, 286, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1182, 'Nagħraf in-numri', 1, 'NULL', 4, 296, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1183, 'Nagħżel l-avviż it-tajjeb billi nikklikkja fuqu', 2, 'NULL', 4, 296, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1190, 'Nuża numri u simboli għal password sigura', 1, 'NULL', 4, 298, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1207, 'Nipprepara preżentazzjoni PowerPoint', 2, 'NULL', 4, 302, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1223, 'Diffiċli ħafna', 0, 'NULL', 4, 311, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1224, 'Diffiċli', 1, 'NULL', 4, 311, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1225, 'Kemxejn diffiċli', 2, 'NULL', 4, 311, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1226, 'Faċli', 3, 'NULL', 4, 311, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1227, 'Diffiċli ħafna', 0, 'NULL', 4, 313, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1228, 'Diffiċli', 1, 'NULL', 4, 313, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1229, 'Kemxejn diffiċli', 2, 'NULL', 4, 313, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1230, 'Faċli', 3, 'NULL', 4, 313, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1231, 'Diffiċli ħafna', 0, 'NULL', 4, 315, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1232, 'Diffiċli', 1, 'NULL', 4, 315, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1233, 'Kemxejn diffiċli', 2, 'NULL', 4, 315, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1234, 'Faċli', 3, 'NULL', 4, 315, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1235, 'Diffiċli ħafna', 0, 'NULL', 4, 317, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1236, 'Diffiċli', 1, 'NULL', 4, 317, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1237, 'Kemxejn diffiċli', 2, 'NULL', 4, 317, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1238, 'Faċli', 3, 'NULL', 4, 317, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1239, 'Diffiċli ħafna', 0, 'NULL', 4, 305, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1240, 'Diffiċli', 1, 'NULL', 4, 305, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1241, 'Kemxejn diffiċli', 2, 'NULL', 4, 305, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1242, 'Faċli', 3, 'NULL', 4, 305, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1243, 'Diffiċli ħafna', 0, 'NULL', 4, 307, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1244, 'Diffiċli', 1, 'NULL', 4, 307, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1245, 'Kemxejn diffiċli', 2, 'NULL', 4, 307, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1246, 'Faċli', 3, 'NULL', 4, 307, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1247, 'Diffiċli ħafna', 0, 'NULL', 4, 309, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1248, 'Diffiċli', 1, 'NULL', 4, 309, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1249, 'Kemxejn diffiċli', 2, 'NULL', 4, 309, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1250, 'Faċli', 3, 'NULL', 4, 309, 3, 'nextScenario');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1258, 'Nikteb in-numri', 1, 'NULL', 4, 304, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1260, 'L-ebda', 3, 'none', 4, 304, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1261, 'Naqra t-test', 0, 'NULL', 4, 306, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1264, 'L-ebda', 3, 'none', 4, 306, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1265, 'Naqra t-test', 0, 'NULL', 4, 308, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1268, 'L-ebda', 3, 'none', 4, 308, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1269, 'Naqra t-test', 0, 'NULL', 4, 310, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1271, 'Insib il-ktieb online', 2, 'NULL', 4, 310, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1272, 'L-ebda', 3, 'none', 4, 310, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1273, 'Naqra l-kliem', 0, 'NULL', 4, 312, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1276, 'L-ebda', 3, 'none', 4, 312, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1277, 'Naqra t-test', 0, 'NULL', 4, 314, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1278, 'Nanalizza l-grafika', 1, 'NULL', 4, 314, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1280, 'L-ebda', 3, 'none', 4, 314, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1282, 'Inbiddel il-kwantitajiet', 1, 'NULL', 4, 316, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1284, 'L-ebda', 3, 'none', 4, 316, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1285, 'Naqra t-test', 0, 'NULL', 4, 318, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1288, 'L-ebda', 3, 'none', 4, 318, -1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1257, 'Nagħraf il-kliem', 0, 'NULL', 4, 304, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1259, 'Nikteb u nagħżel il-kliem u n-numri', 2, 'NULL', 4, 304, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1262, 'Infittex sit web ta'' fornitur ta'' taħriġ', 1, 'NULL', 4, 306, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1267, 'Nuża sistema ta'' bbukkjar online', 2, 'NULL', 4, 308, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1270, 'Nikkalkula l-aħjar offerta', 1, 'NULL', 4, 310, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1274, 'Nagħraf in-numri', 1, 'NULL', 4, 312, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1275, 'Insib l-iskeda tal-karozzi tal-linja fuq il-mowbajl tiegħi', 2, 'NULL', 4, 312, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1279, 'Insib l-informazzjoni dwar it-temp għal Ruma online', 2, 'NULL', 4, 314, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1281, 'Naqra r-riċetta', 0, 'NULL', 4, 316, 0, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1283, 'Nibgħat l-ingredjenti lil sħabi', 2, 'NULL', 4, 316, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1286, 'Naħdem il-kalkoli meħtieġa', 1, 'NULL', 4, 318, 1, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1287, 'Intella'' u nikkondividi r-ritratti tiegħi online', 2, 'NULL', 4, 318, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1263, 'Insib korsijiet f''distanza ta'' 5 kilometri mil-lokalità tiegħi', 2, 'NULL', 4, 306, 2, 'NULL');
INSERT INTO public.answer (id, text, "order", special, product, question, value, skipto) VALUES (1266, 'Inħallas il-miżata', 1, 'NULL', 4, 308, 1, 'NULL');


--
-- TOC entry 3878 (class 0 OID 16413)
-- Dependencies: 198
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: skillschecker
--

INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (1, 'personal', 'Personal goal', 'person-laptop.svg', NULL, 1, 'green');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (2, 'education', 'Education goal', 'graduate.svg', NULL, 1, 'blue');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (3, 'economic', 'Career goal', 'money.svg', NULL, 1, 'yellow');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (4, 'social', 'Social goal', 'meeting.svg', NULL, 1, 'red');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (6, 'education', 'Udanningsmål', 'graduate.svg', NULL, 2, 'blue');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (7, 'economic', 'Karrieremål', 'money.svg', NULL, 2, 'yellow');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (9, 'personal', 'Personal goal', 'person-laptop.svg', NULL, 3, 'green');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (10, 'education', 'Education goal', 'graduate.svg', NULL, 3, 'blue');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (11, 'economic', 'Career goal', 'money.svg', NULL, 3, 'yellow');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (12, 'social', 'Social goal', 'meeting.svg', NULL, 3, 'red');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (13, 'personal', 'Mira personali', 'person-laptop.svg', NULL, 4, 'green');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (14, 'education', 'Mira edukattiva', 'graduate.svg', NULL, 4, 'blue');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (15, 'economic', 'Mira professjonali', 'money.svg', NULL, 4, 'yellow');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (16, 'social', 'Mira soċjali', 'meeting.svg', NULL, 4, 'red');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (5, 'personal', 'Personlige mål', 'person-laptop.svg', NULL, 2, 'green');
INSERT INTO public.category (id, name, text, resource, description, product, colour) VALUES (8, 'social', 'Sosiale mål', 'meeting.svg', NULL, 2, 'red');


--
-- TOC entry 3880 (class 0 OID 16421)
-- Dependencies: 200
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: skillschecker
--

INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1203, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 3, 'numeracy', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1204, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 4, 'numeracy', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1205, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 1, 'digital_skills', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1198, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 2, 'literacy', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1201, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 1, 'numeracy', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1202, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 2, 'numeracy', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1292, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 4, 'digital_skills', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1282, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 2, 'literacy', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2464, 'General Education Award in English Literacy 1 (MQF 1)', 'This course will help you gain the necessary literacy skills to improve your English writing, reading and speaking in order to use the English language effectively both at work and in everday life. This course is taught through discussions and tasks. You will be assessed throughout the course through questions and practical tasks, and through a final exam. Upon successfully completing this course, you will be able to further your studies to English at MQF 2. Course Location: Ħal-Far', 1, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22968', 3, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3467, 'Level 1 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Carlow Adult Learning Centre: 059-913 5544 ', 1, 'literacy', 'Carlow', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, 'Carlow Adult Learning Centre', NULL, NULL, 'Tara Kelly', '059-9135544', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3468, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Carlow Adult Learning Centre: 059-913 5544 ', 1, 'numeracy', 'Carlow', 'https://www.fetchcourses.ie/course/finder?search=1&view=1', 1, 'Carlow Adult Learning Centre', NULL, NULL, 'Tara Kelly', '059-9135545', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2465, 'General Education Award in English Literacy 2 (MQF 2)', 'By the end of this course you will be able to read, write, speak, listen and communicate using good English. This course is taught through discussions and tasks. You will be assessed throughout the course through questions and practical tasks, and through a final exam. Upon successfully completing this course, you will be able to further your studies to English at MQF 3 (SEC O''Level). Course Location: Ħal-Far', 2, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22972', 3, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2466, 'Elementary Award in Maltese Language as a Foreign Language (MQF 1)', 'This course is aimed for foreigners who are residing in Malta and would like to learn basic communication in Maltese for work, academic purposes and personal development. This course is taught through presentations, discussions and tasks. You will be assessed throughout the course and through a final exam. Upon completing this course successfully, you will be able to further your studies in Maltese as a Foreign Language at MQF 2. Course Location: Ħal-Far', 1, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22979', 3, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1206, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 2, 'digital_skills', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1207, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 3, 'digital_skills', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1208, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 4, 'digital_skills', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1283, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 3, 'literacy', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1284, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 4, 'literacy', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1285, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 1, 'numeracy', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1215, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 3, 'numeracy', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1216, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 4, 'numeracy', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3469, 'Computer & Information Skills', 'The aim of this programme is to enable the learner to develop the relevant knowledge, skill and competence to use a range of information and communication technologies, under direction and with limited autonomy, in familiar situations. It enables the learner to pursue a range of employment opportunities or to progress to further education or training.', 1, 'digital_skills', 'Carlow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=322081', 1, 'VTOS Carlow', NULL, '2021-09-20 00:00:00+00', 'Una Hayes', '059 9140311', NULL, '322081', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3470, 'Level 2 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Carlow Adult Learning Centre: 059-913 5544 ', 2, 'literacy', 'Carlow', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, 'Carlow Adult Learning Centre', NULL, NULL, 'Tara Kelly', '059-913 5544', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1218, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 2, 'digital_skills', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2467, 'Award in Maltese as a Foreign Language 2 (MQF 2)', 'This course is aimed for foreigners who are residing in Malta and would like to learn basic communication in Maltese for work, academic purposes and personal development. This course is taught through presentations, discussions and tasks. You will be assessed throughout the course and through a final exam. Course Location: Ħal-Far', 2, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22971', 3, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2468, 'General Education Award in Maltese Language 1 (MQF 1)', 'This course is aimed for individuals who would like to start learning the Maltese language for the first time. It covers the alphabet and basic words so that you will be able to read and write basic Maltese. This course is taught through discussions and tasks. You will be assessed throughout the course and through a final exam. Upon completing this course successfully, you will be able to further your studies in Maltese at MQF 2. Course Location: Ħal-Far', 1, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22970', 3, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1220, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 4, 'digital_skills', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1211, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 3, 'literacy', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1212, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 4, 'literacy', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3471, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your numeracy skills.

Carlow Adult Learning Centre: 059-913 5544 ', 2, 'numeracy', 'Carlow', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, 'Carlow Adult Learning Centre', NULL, NULL, 'Tara Kelly', '059-913 5544', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3472, 'Level 2 Computers Skills for Beginners', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your digital skills.

Carlow Adult Learning Centre: 059-913 5544 ', 2, 'digital_skills', 'Carlow', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, 'Carlow Adult Learning Centre', NULL, NULL, 'Tara Kelly', '059-913 5544', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3473, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Carlow Adult Learning Centre: 059-913 5544 ', 3, 'literacy', 'Carlow', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, 'Carlow Adult Learning Centre', NULL, NULL, 'Tara Kelly', '059-913 5544', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1213, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 1, 'numeracy', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1214, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 2, 'numeracy', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3474, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Carlow Adult Learning Centre: 059-913 5544 ', 3, 'numeracy', 'Carlow', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, 'Carlow Adult Learning Centre', NULL, NULL, 'Tara Kelly', '059-913 5544', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1235, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 3, 'literacy', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3475, 'Level 3 Computer Literacy', 'This programme aims to offer you

• The chance to build your skills, abilities, talents, interests and confidence by learning something new or different.
• Obtain certification on the National Qualifications Framework (NQF) or European Qualifications Framework (EQF)by working on new areas or gaps that might have held you back.
• A range of different subjects to try, depending on what is interesting, useful or important to you.
• The opportunity to use what you are learning in your everyday life. To be more confident by using what you are learning in new situations.', 3, 'digital_skills', 'Carlow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=311634', 1, 'Adult Literacy Carlow', NULL, '2021-10-20 00:00:00+00', 'Tara Kelly', '059-913 5544', NULL, '311634', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1084, 'Award in Maltese', 'Basic Skills in Maltese Literacy I', 2, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2469, 'General Education Award in Maltese Language 2 (MQF 2)', 'This course is aimed for individuals who would like to enrich their listening, speaking and writing in the Maltese language to communicate effectively both at work and in everyday life. This course is taught through discussions and practical tasks. You will be assessed throughout the course and through a final exam. Upon completing this course successfully, you will be able to further your studies in Maltese at MQF 3 (SEC O''Level).  Course Location: Ħal-Far', 2, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22974', 3, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1236, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 4, 'literacy', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3476, 'Level 4 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Carlow Adult Learning Centre: 059-913 5544 ', 4, 'literacy', 'Carlow', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, 'Carlow Adult Learning Centre', NULL, NULL, 'Tara Kelly', '059-913 5544', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2470, 'Elementary Award in English for Foreigners 1     (MQF 1)', 'This course aims to provide foreigners with the necessary literacy skills (speaking, listening, reading and writing) and to be exposed to the basics of the language in order to interact and communicate in everyday life and the workplace. This course is taught through discussions and tasks. You will be assessed throughout the course and through a final exam. Upon successfully completing this course, you will be able to further your studies in English for Foreigners at MQF 2. Course Location: Ħal-Far', 1, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22983', 3, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1240, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 4, 'numeracy', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1250, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 2, 'numeracy', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2471, 'Award in English for Foreigners (MQF 2)', 'This course is aimed for foreigners who would like to enrich their listening, speaking and writing in English language. By the end of this course you will be able to communicate with others using the English language in a comfortable and confident manner. This course is taught through presentations, discussions and tasks. You will be assessed throughout the course and through a final exam. Course Location: Ħal-Far', 2, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22981', 3, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1251, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 3, 'numeracy', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2472, 'General Education Award in Numeracy (MQF 1)', 'This course will introduce you to basic mathematics, enabling you to become confident and self-sufficient by improving your ability to reason out numeracy situations commonly encountered in everyday life.
This course will help you to:
•	understand mathematical symbols;
•	interpret measuring units;
•	identify shapes and their symmetry lines;
•	organize data;
•	use fractions;
•	carry out basic mental calculations;
•	use a calculator;
•	calculate area, perimeter and volume; and
•	round up numbers and using decimal numbers.
This course is taught through practical tasks and you will be assessed throughout the course and through a final exam. Upon successfully completing the course, you will be able to continue your studies at Mathematics or Numeracy at MQF 2.

Course Location: Ħal-Far', 1, 'numeracy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22975', 3, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3477, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Carlow Adult Learning Centre: 059-913 5544 ', 4, 'numeracy', 'Carlow', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, 'Carlow Adult Learning Centre', NULL, NULL, 'Tara Kelly', '059-913 5544', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3478, 'Level 4 Internet Skills ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your digital skills.

Carlow Adult Learning Centre: 059-913 5544 ', 4, 'digital_skills', 'Carlow', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, 'Carlow Adult Learning Centre', NULL, NULL, 'Tara Kelly', '059-913 5544', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3479, 'Level 1 Reading and Writing', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading, writing and communication skills.', 1, 'literacy', 'Cavan', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=321594', 1, 'Adult Literacy - Cavan', NULL, NULL, 'Regina Clarke', '087 2855907', NULL, '321594', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (973, 'Learn with NALA - Level 2 Writing', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about our Distance Learning Service. You can study online by yourself or work with a tutor over the phone.

This is a level 2 writing course that will help you build your skills in personally meaningful writing tasks. Once you are finished the course you can take an assessment to achieve a level 2 Minor Award Certificate in Writing from Quality and Qualifications Ireland (QQI).

Call NALA today on 1800 20 20 65 to chat about your options.', 2, 'literacy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 50, NULL, NULL, NULL, 'NALA', '1800 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1110, NULL, 'Lett på nett med @nett

Et kurs i digitale ferdigheter', 2, 'digital_skills', 'Online', 'https://anett.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1117, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 2, 'digital_skills', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1243, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 3, 'digital_skills', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1244, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 4, 'digital_skills', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1252, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 4, 'numeracy', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1255, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 3, 'digital_skills', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3480, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Cavan Adult Learning Centre: 049-4353952
Ballyjamesduff Adult Education Centre: 049-8553528', 1, 'numeracy', 'Cavan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Adult Literacy - Cavan', NULL, NULL, 'Regina Clarke', '087 2855907', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1256, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 4, 'digital_skills', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2473, 'General Education Award in Numeracy (MQF 2)', 'This course aims to improve your numeracy standards. By the end of this course, you will obtain and develop your logical analysis, problem solving and calculation skills. This course is taught through practical tasks and you will be assessed throughout the course and through a final exam. Upon successfully completing the course, you will be able to continue your studies at Mathematics or Numeracy at MQF 3 (SEC O''Level Standard). Course Location: Ħal-Far', 2, 'digital_skills', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22976', 3, NULL, NULL, NULL, NULL, '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3481, 'Level 1 Introduction to Computers ', 'This course will give you the chance to get back into learning and build your skills and confidence in using technology.', 1, 'digital_skills', 'Cavan', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=224054', 1, 'Adult Literacy - Cavan', NULL, NULL, 'Deirdre O’Callaghan', '049-436 1881', NULL, '224054', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2474, 'Vocational Education and Training Award Foundation in Digital Literacy Skills (MQF 1)', 'This course teaches the basics of using an electronic device for personal and academic needs. By the end of this course, you will be able to understand why technology and its uses are important in today''s society and become a more confident user of technological devices. This course is taught through practical tasks and you will be assessed throughout the course and through a final exam. Course Location: Ħal-Far', 1, 'digital_skills', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=23035', 3, NULL, NULL, NULL, 'Jobsplus', '22201626', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2475, 'Award in Basic English for Care Workers (MQF 2)', 'This course aims to help you improve your English, focusing on vocabulary, speaking and writing.

By the end of this course, you will learn to:
•	write sentences using the correct verbs;
•	choose the correct vocabulary to be used in different contexts when dealing with clients, their relatives, colleagues and/or superiors;
•	understand the difference between formal and informal speaking and writing;
•	identify the main points of explanations and instructions; and
•	use respectful and inclusive language when dealing with clients, their relatives and with colleagues.

This course is taught through practical tasks and you will be assessed throughout the course and through a final exam.

Course Location: Ħal-Far', 2, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22982', 3, NULL, NULL, NULL, 'Jobsplus', '22201608', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2476, 'ECDL (MQF 3)', 'ECDL is the world’s largest end-user computer skills certification programme where it aims to increase the level of ICT and computer skills and allows candidates to be more productive at home and at work. ECDL also improves job prospects by providing an internationally recognised qualification. It consists of seven separate modules covering computer theory and practice. The ECDL Standard Certificate (MQF 3) is awarded to candidates who successfully complete all 4 Base modules and any 3 Intermediate modules.
Course Location: Ħal-Far', 3, 'digital_skills', 'Malta', 'https://jobsplus.gov.mt/courses/all-course-list', 3, NULL, NULL, NULL, 'Jobsplus', '22201626', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2477, 'Elementary Award in English as a Second or Other Language (MQF 1)', 'This course will help you develop your speaking, listening, reading and writing skills in the English Language so that you can interact and communicate in everyday social and work situations. Upon successfully completing this course, you will be able to study English further. Course Location: Mosta', 1, 'literacy', 'Malta', 'http://www.esatmalta.org/index.php/sections/courses', 3, NULL, NULL, NULL, 'Educational Services and Testing (ESaT) LTD', '79385856', 'info@esatmalta.org', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2478, 'Pre-Intermediate Award in English as a Second or Other Language (MQF 2)', 'This course will help you develop your reading, writing, listening, and speaking skills in the English language. It will also allow you to build confidence and encourages you to make further progress. Upon successfully completing this course, you will be able to study English further. Course Location: Mosta', 2, 'literacy', 'Malta', 'http://www.esatmalta.org/index.php/sections/courses', 3, NULL, NULL, NULL, 'Educational Services and Testing (ESaT) LTD', '79385856', 'info@esatmalta.org', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2479, 'Intermediate Award in English as a Second or Other Language (MQF 3) ', 'This course will help you further improve your reading, writing, listening, and speaking skills in the English language. It will also allow you to build confidence and encourages you to make further progress. Upon successfully completing this course, you will be able to study English further. Course Location: Mosta', 3, 'literacy', 'Malta', 'http://www.esatmalta.org/index.php/sections/courses', 3, NULL, NULL, NULL, 'Educational Services and Testing (ESaT) LTD', '79385856', 'info@esatmalta.org', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2480, 'Award in Basic Literacy, Numeracy, Digital and Life Skills (MQF 2) (Available on request only)', 'This course will help you develop and improve your literacy, numeracy and digital skills, making you better prepared for work, training or further study. The course will give examples from daily life, helping you to effectively handle situations and problems commonly encountered. Course Location: Valletta', 2, 'literacy', 'Malta', 'https://novaric.co/', 3, NULL, NULL, NULL, 'NOVARIC® Academy', '+356 2711 2206', 'NOVARIC® Academy contact@novaric.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2481, 'Award in Basic Literacy, Numeracy, Digital and Life Skills (MQF 2) (Available on request only)', 'This course will help you develop and improve your literacy, numeracy and digital skills, making you better prepared for work, training or further study. The course will give examples from daily life, helping you to effectively handle situations and problems commonly encountered. Course Location: Valletta', 2, 'numeracy', 'Malta', 'https://novaric.co/', 3, NULL, NULL, NULL, 'NOVARIC® Academy', '+356 2711 2206', 'NOVARIC® Academy contact@novaric.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2482, 'Award in Basic Literacy, Numeracy, Digital and Life Skills (MQF 2) (Available on request only)', 'This course will help you develop and improve your literacy, numeracy and digital skills, making you better prepared for work, training or further study. The course will give examples from daily life, helping you to effectively handle situations and problems commonly encountered. Course Location: Valletta', 2, 'digital_skills', 'Malta', 'https://novaric.co/', 3, NULL, NULL, NULL, 'NOVARIC® Academy', '+356 2711 2206', 'NOVARIC® Academy contact@novaric.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2483, 'ECDL Standard (MQF 3)', 'ECDL Standard is a test of practical skills and competencies, consisting of seven separate modules covering computer theory and practice. All module exams are done at our approved test centre. After successfully passing all seven modules, you will be awarded an ECDL Standard Certificate referenced to Level 3 of the Malta Qualifications Framework (MQF) and the European Qualifications Framework (EQF) for Lifelong Learning. Course Location: Żebbuġ', 3, 'digital_skills', 'Malta', 'https://www.horizon2000computers.com/courses', 3, NULL, NULL, NULL, 'Horizon 2000 Computer Training Centre', '21462236/79462236', 'horizon2000computers@gmail.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3482, 'Level 2 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Cavan Adult Learning Centre: 049-4353952
Ballyjamesduff Adult Education Centre: 049-8553528', 2, 'literacy', 'Cavan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Adult Literacy - Cavan', NULL, NULL, 'Regina Clarke', '087 2855907', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3483, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Cavan Adult Learning Centre: 049-4353952
Ballyjamesduff Adult Education Centre: 049-8553528', 2, 'numeracy', 'Cavan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Adult Literacy - Cavan', NULL, NULL, 'Regina Clarke', '087 2855907', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3484, 'Level 2 Computer Skills', 'The purpose of this award is to enable the learner to develop the relevant knowledge skill and competence to use a range of computer applications.', 2, 'digital_skills', 'Cavan', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=310188', 1, 'Adult Literacy - Cavan', NULL, NULL, 'Michelle Baker', '049 4353924', NULL, '310188', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2484, 'English Literacy (MQF 2)', 'This course will help you improve your speaking, listening, reading and writing in the English language and your ability to use English effectively both at work and in everyday life situations. Course Location: Floriana', 2, 'literacy', 'Malta', 'https://kpmglearningmalta.com/', 3, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2485, 'Awar in Maltese Literacy (MQF 1)', 'This course will help you learn the basics of the Maltese language, improve your ability to read and write simple sentences and paragraphs and to communicate and exchange information in a very simple way. Course Location: Floriana', 1, 'literacy', 'Malta', 'https://kpmglearningmalta.com/', 3, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1267, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 3, 'digital_skills', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1268, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 4, 'digital_skills', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1272, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 4, 'literacy', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1273, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 1, 'numeracy', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1286, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 2, 'numeracy', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1287, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 3, 'numeracy', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1067, NULL, 'Les og skriv er et digitalt læremiddel som gir lese- og skrivetrening for voksne. Det inneholder tekster og språkoppgaver hentet fra voksnes hverdag og arbeidsliv.', 1, 'literacy', 'Online', 'https://elearning.kompetansenorge.no/lesogskriv1/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2486, 'Award in Maltese Literacy (MQF 2)', 'This course will help you improve your Maltese through speaking, listening, reading and writing. At the end of the course you will be able to use the Maltese language effectively both at work and in everyday life situations. Course Location: Floriana', 2, 'literacy', 'Malta', 'https://kpmglearningmalta.com/', 3, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2487, 'Numeracy Skills (MQF 1)', 'This course will introduce you to basic mathematics, enabling you to become confident in applying mathematical knowledge and analysing numeracy situations. At the end of the course, you will achieve a certificate at MQF level 1. Course Location: Floriana', 1, 'numeracy', 'Malta', 'https://kpmglearningmalta.com/', 3, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1068, NULL, 'Regnehjelpen er et digitalt læremiddel med regneoppgaver hentet fra voksnes hverdag. Det inneholder også hjelpemidler for å lære grunnregler i matematikk.

Regnehjelpen er et nettsted for voksne som ønsker å bli bedre i regning.

Regnehjelpen er gratis og enkel å bruke. Det kan brukes til å øve på egenhånd.', 1, 'numeracy', 'Online', 'http://www.regnehjelpen.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1069, NULL, 'Dette er e-læring som trener dine regneferdigheter.

Velg tema, eller klikk på "start e-læring" for å starte med første leksjon.
Leksjonene har ulikt nivå og økende vanskelighetsgrad:
Grønn - nivå 1-2
Blå - nivå 2-3
Rød - nivå 3', 1, 'numeracy', 'Online', 'https://elearning.kompetansenorge.no/regning/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1071, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 1, 'literacy', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2488, 'Numeracy Skills (MQF 2)', 'The course will help you obtain and develop your logical analysis, problem solving and calculation skills, at the general mathematical standard. At the end of the course, you will achieve a certificate at MQF level 2. Course Location: Floriana', 2, 'numeracy', 'Malta', 'https://kpmglearningmalta.com/', 3, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2489, 'Basic IT Skills (MQF 2)', 'This course will help you improve your skills in technology and ICT and your ability to apply these skills at your place of work and everyday situations. At the end of the course, you will achieve a certificate at MQF level 2. Course Location: Floriana', 2, 'digital_skills', 'Malta', 'https://kpmglearningmalta.com/', 3, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2490, 'ECDL Standard (MQF 3)', 'ECDL Standard (MQF 3) is a test of practical skills and competencies and consists of seven separate modules covering computer theory and practice. The 7 modules are Computer Essentials, Online Essentials, Word processing, Spreadsheets, Presentations, Using Databases and IT Security. While there are no formal entry requirements, a good knowledge of English is mandatory. After successfully passing all exams (7 modules), you will be awarded an ECDL Standard Certificate, pegged at MQF 3. Course Location: Birkirkara', 3, 'digital_skills', 'Malta', 'https://www.learnkey.com.mt/course/ecdlicdl-fast-track', 3, NULL, NULL, NULL, 'Learnkey Training Institute', '21443140', 'info@learnkey.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1070, NULL, 'Lett på nett med @nett

Et kurs i digitale ferdigheter', 1, 'digital_skills', 'Online', 'https://anett.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1275, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 3, 'numeracy', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2491, 'City and Guilds Level 1 Certificate in English Skills (MQF 2) (ofqual no: 600/7595/8)', 'The Level 1 (MQF 2) Certificate in English Skills is part of a series of qualifications offered by City & Guilds which will help you improve your reading, writing, speaking and listening skills. The qualification allows you to build confidence and further progress. After successfully completing this course, you will be able to further your studies to MQF 3 in English, such as the SEC O''Level or the City&Guilds Certificate in English Skills Level 2. Course Location: Birkirkara', 2, 'literacy', 'Malta', 'https://promotion.learnkey.com.mt/english-programme/', 3, NULL, NULL, NULL, 'Learnkey Training Institute', '21443140', 'info@learnkey.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2492, 'City and Guilds Level 2 Certificate in English Skills (MQF 3) (ofqual no: 600/7594/6)', 'The Level 2 (MQF 3) Certificate in English Skills is part of a series of qualifications offered by City & Guilds which helps you improve your reading, writing, speaking and listening skills. This qualification enables you to progress to further English qualifications at a higher level, or to qualifications in other subject areas where English skills are required. Course Location: Birkirkara', 3, 'literacy', 'Malta', 'https://promotion.learnkey.com.mt/english-programme/', 3, NULL, NULL, NULL, 'Learnkey Training Institute', '21443140', 'info@learnkey.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2493, 'City & Guilds Entry Level Certificate In English Skills (Entry 3) (Ofqual no: 600/7591/0) (MQF 1)', 'The Entry Level Certificate in English Skills is part of a series of qualifications offered by City & Guilds which covers reading, writing, speaking and listening skills. This qualification is especially suitable for those who struggle with English reading and writing. Course Location: Birkirkara', 1, 'literacy', 'Malta', 'https://promotion.learnkey.com.mt/english-programme/', 3, NULL, NULL, NULL, 'Learnkey Training Institute', '21443140', 'info@learnkey.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2494, 'Award in Basic Literacy, Numeracy and Employability Skills (MQF 2)', 'This course will help you develop and improve your literacy in both Maltese and English and your numeracy skills, with the aim to prepare you for employment, training or further study. Furthermore, you will gain employability skills by increasing your awareness of employer expectations and the working environment. Course Location: Floriana', 2, 'literacy', 'Malta', 'https://www.sgi.edu.mt/', 3, NULL, NULL, NULL, 'FSS Ltd.', '25905226', 'info@fss.com.mt ', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2495, 'Award in Basic Literacy, Numeracy and Employability Skills (MQF 2)', 'This course will help you develop and improve your literacy in both Maltese and English and your numeracy skills, with the aim to prepare you for employment, training or further study. Furthermore, you will gain employability skills by increasing your awareness of employer expectations and the working environment. Course Location: Floriana', 2, 'numeracy ', 'Malta', 'https://www.sgi.edu.mt/', 3, NULL, NULL, NULL, 'FSS Ltd.', '25905226', 'info@fss.com.mt ', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2496, 'Applied Basic Numeracy (MQF 2)', 'The course will help you improve your numeracy skills to be able to carry out the maths needed for everyday life, by developing your logical analysis, problem solving and calculation skills. Course Location: Floriana', 2, 'numeracy', 'Malta', 'https://www.sgi.edu.mt/', 3, NULL, NULL, NULL, 'FSS Ltd.', '25905226', 'info@fss.com.mt ', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2497, 'Applied Basic English (MQF 2)', 'This course will provide you with the necessary skills (speaking, listening, reading and writing), to gain the confidence and ability to use English effectively, both at work and in everyday life situations. Course Location: Floriana', 2, 'literacy', 'Malta', 'https://www.sgi.edu.mt/', 3, NULL, NULL, NULL, 'FSS Ltd.', '25905226', 'info@fss.com.mt ', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2498, 'Applied Basic Maltese (MQF 2)', 'This course will help you improve your Maltese speaking, listening, reading and writing. At the end of the course, you will be able to use the Maltese language effectively both at work and in everyday life situations. Course Location: Floriana', 2, 'literacy', 'Malta', 'https://www.sgi.edu.mt/', 3, NULL, NULL, NULL, 'FSS Ltd.', '25905226', 'info@fss.com.mt ', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2499, 'Award in English Language for Foreigners (MQF 1)', 'This course is for individuals who have never studied English before or have very limited knowledge of English and would like to learn basic communication in English for work, personal development and academic purposes. This course is delivered over two months, and there are no entry requirments. Course Location: Qormi', 1, 'literacy', 'Malta', 'https://www.learningworks.edu.mt/courses/language-courses/mqflevel-1-award-in-english-language-for-foreigners/', 3, NULL, NULL, NULL, NULL, '22107219', 'Ms Christabelle Tabone ctabone@learningworks.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2500, 'Award in Maltese as a Foreign Language and Cultural Orientation (MQF 1)', 'This course is for individuals who have never studied Maltese before or have very limited knowledge of Maltese, and would like to learn basic communication in Maltese for work, personal development and academic purposes. This course is also for individuals who intend to apply for the residency permit. It is delivered over two months and there are no entry requirments. At the end of the course you will get a certificate at MQF level 1. Course Location: Qormi', 1, 'literacy', 'Malta', 'https://www.learningworks.edu.mt/courses/language-courses/mqf-level-1-award-in-maltese-as-a-foreign-language/', 3, NULL, NULL, NULL, NULL, '22107219', 'Ms Christabelle Tabone ctabone@learningworks.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1288, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 4, 'numeracy', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1289, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 1, 'digital_skills', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1107, NULL, 'Les og skriv er et digitalt læremiddel som gir lese- og skrivetrening for voksne. Det inneholder tekster og språkoppgaver hentet fra voksnes hverdag og arbeidsliv.', 2, 'literacy', 'Online', 'https://elearning.kompetansenorge.no/lesogskriv1/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1108, NULL, 'Regnehjelpen er et digitalt læremiddel med regneoppgaver hentet fra voksnes hverdag. Det inneholder også hjelpemidler for å lære grunnregler i matematikk.

Regnehjelpen er et nettsted for voksne som ønsker å bli bedre i regning.

Regnehjelpen er gratis og enkel å bruke. Det kan brukes til å øve på egenhånd.', 2, 'numeracy', 'Online', 'http://www.regnehjelpen.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2501, 'Award in Maltese as a Foreign Language and Cultural Orientation (MQF 2)', 'This course is aimed at individuals who have limited knowledge in the Maltese language or who would like to consolidate and further their basic skills in Maltese for work, personal development and academic purposes. To enrol for this course, students must have obtained a Maltese MQF Level 1 Certificate. Course Location: Qormi', 2, 'literacy', 'Malta', 'https://www.learningworks.edu.mt/courses/language-courses/mqf-level-2-award-in-maltese-as-a-foreign-language-and-cultural-orientation/', 3, NULL, NULL, NULL, NULL, '22107219', 'Ms Christabelle Tabone ctabone@learningworks.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1226, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 2, 'numeracy', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (974, 'Learn with NALA - Level 2 Using Technology', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about our Distance Learning Service. You can study online by yourself or work with a tutor over the phone.

This is a level 2 course that will help you to recognise how technology is used in every day life. Once you are finished the course you can take an assessment to achieve a level 2 Minor Award Certificate in Using Technology from Quality and Qualifications Ireland (QQI).

Call NALA today on 1800 20 20 65 to chat about your options.', 2, 'digital_skills', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 50, NULL, NULL, NULL, 'NALA', '1800 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (977, 'Learn with NALA - Level 3 Using Technology', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.

We will help you improve your old skills but you will also gain the confidence to learn new ones.

Call us today on 1800 20 20 65 to chat about your options.', 3, 'digital_skills', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 50, NULL, NULL, NULL, 'NALA', '1803 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (980, 'Learn with NALA - Level 4 Using Technology', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.

We will help you improve your old skills but you will also gain the confidence to learn new ones.

Call us today on 1800 20 20 65 to chat about your options.', 4, 'digital_skills', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 50, NULL, NULL, NULL, 'NALA', '1806 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2502, 'Hiliet Bazici fil-Malti Komunikattiv: L-ewwel Livell (MQF 1)', 'Through this course, you will learn how to write simple messages and/or short paragraphs about different topics in Maltese. You will also be able to practice Maltese speaking to be able to express yourself in situations in your daily life situations. On successfully completing this course, you will be able to continue your studies in Maltese at MQF 2. Course Location: Valletta', 1, 'literacy', 'Malta', 'https://www.melitamanagement.com/courses', 3, NULL, NULL, NULL, 'Melita Training and Resource Management Limited ', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2503, 'Award in Basic English - MQF 1', 'This course is aimed at students with little knowledge of English, focusing on the basic of the English language. At the end of the course you will be able to communicate and exchange information in simple English. On successfully completing this course, you will be able to continue your studies in English at MQF 2. Course Location: Valletta', 1, 'literacy', 'Malta', 'https://www.melitamanagement.com/courses', 3, NULL, NULL, NULL, 'Melita Training and Resource Management Limited ', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2504, 'Award in Basic Numeracy - MQF 1', 'This course will introduce you to basic mathematics, which enables you in becoming confident and hence more self-sufficient by being able to reason out numeracy situations commonly encountered in everyday life. On successfully completing this course, you will be able to continue your studies in Mathematics at MQF 2. Course Location: Valletta', 1, 'numeracy', 'Malta', 'https://www.melitamanagement.com/courses', 3, NULL, NULL, NULL, 'Melita Training and Resource Management Limited ', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2505, 'Award in Basic Numeracy - MQF 2', 'This course is a continuation on the Basic Numeracy Level 1 course, taking the students into more aspects and delving deeper into some of the topics treated in level 1. Students will obtain and develop their logical analysis, deduction and calculation skills. Course Location: Valletta', 2, 'numeracy', 'Malta', 'https://www.melitamanagement.com/courses', 3, NULL, NULL, NULL, 'Melita Training and Resource Management Limited ', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3485, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Cavan Adult Learning Centre: 049-4353952
Ballyjamesduff Adult Education Centre: 049-8553528', 3, 'literacy', 'Cavan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Adult Literacy - Cavan', NULL, NULL, 'Michelle Baker', '049 4353924', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3486, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Cavan Adult Learning Centre: 049-4353952
Ballyjamesduff Adult Education Centre: 049-8553528', 3, 'numeracy', 'Cavan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Adult Literacy - Cavan', NULL, NULL, 'Michelle Baker', '049 4353924', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2506, 'Hiliet Bazici fil-Malti Komunikattiv: It-Tieni Livell (MQF 2)', 'This course is intended to aid students gain confidence in using the Maltese language in specific workplace situations. Students will learn how to write messages and paragraphs, about different topics in Maltese. Course Location: Valletta', 2, 'literacy', 'Malta', 'https://www.melitamanagement.com/courses', 3, NULL, NULL, NULL, 'Melita Training and Resource Management Limited ', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2507, 'Award in Basic English - MQF 2', 'This course will focus on language acquisition through the four language skills: speaking, reading, listening and writing and is targeted at students who would like to improve their English language skills to become more employable candidates. Course Location: Valletta', 2, 'literacy', 'Malta', 'https://www.melitamanagement.com/courses', 3, NULL, NULL, NULL, 'Melita Training and Resource Management Limited ', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3487, 'Level 3 Using Technology', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your  skills so that you can use technology in your everyday life.

Cavan Adult Learning Centre: 049-4353952
Ballyjamesduff Adult Education Centre: 049-8553528', 3, 'digital_skills', 'Cavan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Adult Literacy - Cavan', NULL, NULL, 'Michelle Baker', '049 4353924', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3488, 'Level 4 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Cavan Adult Learning Centre: 049-4353952
Ballyjamesduff Adult Education Centre: 049-8553528', 4, 'literacy', 'Cavan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Adult Literacy - Cavan', NULL, NULL, 'Michelle Baker', '049 4353924', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3489, 'Level 4 Maths ', 'The aim of this programme is to enable the learner to develop the relevant knowledge, skills and competence in a broad range of maths skills and competencies.', 4, 'numeracy', 'Cavan', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=321255', 1, 'BTEI -Cavan', NULL, '2021-09-28 00:00:00+00', 'Deirdre O’Callaghan', '049-436 1881', NULL, '321255', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1290, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 2, 'digital_skills', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1291, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 3, 'digital_skills', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1109, NULL, 'Dette er e-læring som trener dine regneferdigheter.

Velg tema, eller klikk på "start e-læring" for å starte med første leksjon.
Leksjonene har ulikt nivå og økende vanskelighetsgrad:
Grønn - nivå 1-2
Blå - nivå 2-3
Rød - nivå 3', 2, 'numeracy', 'Online', 'https://elearning.kompetansenorge.no/regning/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3836, 'Level 3 Maths  ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills. Adult Literacy Waterford county, 051 393794
', 3, 'numeracy', 'Waterford County', 'http://waterfordwexford.etb.ie/adult-education-services/adult-literacy-2/waterford-county-adult-learning-scheme/', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Mary Upton', '051 393794', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1111, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 2, 'literacy', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1112, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 1, 'numeracy', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1113, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 2, 'numeracy', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1115, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 4, 'numeracy', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1150, NULL, 'Les og skriv er et digitalt læremiddel som gir lese- og skrivetrening for voksne. Det inneholder tekster og språkoppgaver hentet fra voksnes hverdag og arbeidsliv.', 3, 'literacy', 'Online', 'https://elearning.kompetansenorge.no/lesogskriv2/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3490, 'Level 4 Word Processing ', 'This programme is suitable for learners who have good basic computer skills and want to develop skills in Spreadsheets, Database and PowerPoint

The aim of this programme is to enable the learner to develop the relevant knowledge, skill and competence in a broad range of personal skills which enable personal development and active citizenship, and/or to progress to employment and/or further education or training.', 4, 'digital_skills', 'Cavan', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=305904', 1, 'BTEI -Cavan', NULL, NULL, 'Deirdre O’Callaghan', '049-855 3539', NULL, '305904', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3491, 'Level 1 Reading and Writing', 'At the end of this course, you will be able to use new skills in in one or more areas of:

reading, writing, spelling and handwriting', 1, 'literacy', 'Clare', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=308144', 1, 'FET Centre, Kilrush Campus', NULL, NULL, 'Pauline O''Mahoney', '065-682 4819', NULL, '308144', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1151, NULL, 'Regnehjelpen er et digitalt læremiddel med regneoppgaver hentet fra voksnes hverdag. Det inneholder også hjelpemidler for å lære grunnregler i matematikk.

Regnehjelpen er et nettsted for voksne som ønsker å bli bedre i regning.

Regnehjelpen er gratis og enkel å bruke. Det kan brukes til å øve på egenhånd.', 3, 'numeracy', 'Online', 'http://www.regnehjelpen.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1152, NULL, 'Dette er e-læring som trener dine regneferdigheter.

Velg tema, eller klikk på "start e-læring" for å starte med første leksjon.
Leksjonene har ulikt nivå og økende vanskelighetsgrad:
Grønn - nivå 1-2
Blå - nivå 2-3
Rød - nivå 3', 3, 'numeracy', 'Online', 'https://elearning.kompetansenorge.no/regning/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1154, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 3, 'literacy', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1157, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 3, 'numeracy', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3492, 'Level 1 Everyday Maths - Core Skills', 'You use Maths every day when shopping, budgeting,paying bills, cooking, etc. This 8 week maths course will help you; Reduce anxiety about maths, solve everyday maths problems, use a calculator properly, and work out if you are getting a bargain in a sale.', 1, 'numeracy', 'Clare', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=307671', 1, 'Clare Adult Basic Education Service', NULL, NULL, 'Colette O''Brien', '065 6897646', NULL, '307671', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3493, 'Level 1 Introduction to IT - Core Skill', 'This is a basic computer class for adults who need to learn how to use a computer, using software packages like Access, Word Processing, Excel and Internet and Email', 1, 'digital_skills', 'Clare', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=307805', 1, 'Clare Adult Basic Education Service', NULL, NULL, 'Colette O''Brien', '065 6897646', NULL, '307805', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2508, 'Award in Fundamental IT Skills at the Workplace - MQF 2', 'This course is particularly aimed at students who are presently unemployed or looking for a job, and who are interested in acquiring a basic knowledge of computing and office software applications. At the end of the course, students will earn a certificate in IT skills at MQF level 2. Course Location: Valletta', 2, 'digital_skills', 'Malta', 'https://www.melitamanagement.com/courses', 3, NULL, NULL, NULL, 'Melita Training and Resource Management Limited ', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3494, 'Level 2 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Clare Adult Basic Education Service:  065-682 4827', 2, 'literacy', 'Clare', 'http://www.clarelearningnetwork.org/clln/www/index.asp?magpage=5&tid=3857', 1, 'Clare Adult Basic Education Service', NULL, NULL, 'Margot Walsh', '065-682 4822', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1153, NULL, 'Lett på nett med @nett

Et kurs i digitale ferdigheter', 3, 'digital_skills', 'Online', 'https://anett.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3495, 'Level 2 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Clare Adult Basic Education Service:  065-682 4827', 2, 'numeracy', 'Clare', 'http://www.clarelearningnetwork.org/clln/www/index.asp?magpage=5&tid=3857', 1, 'Clare Adult Basic Education Service', NULL, NULL, 'Margot Walsh', '065-682 4823', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1299, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 3, 'numeracy', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3496, 'Level 2 Computer Skills ', 'This programme will enable learners to: develop knowledge and skills in using computing devices safely and develop basic skills of editing, printing, saving documents, accessing websites and printing information from the web.', 2, 'digital_skills', 'Clare', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=307664', 1, 'Clare Adult Basic Education Service', NULL, NULL, 'Colette O''Brien', '065 6897646', NULL, '307664', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3497, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Clare Adult Basic Education Service:  065-682 4827', 3, 'literacy', 'Clare', 'http://www.clarelearningnetwork.org/clln/www/index.asp?magpage=5&tid=3857', 1, 'Clare Adult Basic Education Service', NULL, NULL, 'Margot Walsh', '065-682 4825', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1300, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 4, 'numeracy', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1304, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 4, 'digital_skills', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1085, 'Maltese as a Foreign Language', 'Maltese as a foreign language I', 2, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3498, 'Level 3 Maths', 'The aim of this course is to reduce anxiety and develop learner confidence in their ability to learn mathematical skills and apply them to solve everyday problems .', 3, 'numeracy', 'Clare', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=279100', 1, 'Clare Adult Basic Education Service', NULL, NULL, 'Margaret Lynch', '061 640760', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3499, 'Level 3 Using Technology', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Clare Adult Basic Education Service:  065-682 4827', 3, 'digital_skills', 'Clare', 'http://www.clarelearningnetwork.org/clln/www/index.asp?magpage=5&tid=3857', 1, 'Clare Adult Basic Education Service', NULL, NULL, 'Margot Walsh', '065-682 4827', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3500, 'Level 4 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Clare Adult Basic Education Service:  065-682 4827', 4, 'literacy', 'Clare', 'http://www.clarelearningnetwork.org/clln/www/index.asp?magpage=5&tid=3857', 1, 'Clare Adult Basic Education Service', NULL, NULL, 'Margot Walsh', '065-682 4828', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3501, 'Level 4 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Clare Adult Basic Education Service:  065-682 4827', 4, 'numeracy', 'Clare', 'http://www.clarelearningnetwork.org/clln/www/index.asp?magpage=5&tid=3857', 1, 'Clare Adult Basic Education Service', NULL, NULL, 'Margot Walsh', '065-682 4829', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3502, 'Level 4 Using Technology', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your digital skills.

Clare Adult Basic Education Service:  065-682 4827', 4, 'digital_skills', 'Clare', 'http://www.clarelearningnetwork.org/clln/www/index.asp?magpage=5&tid=3857', 1, 'Clare Adult Basic Education Service', NULL, NULL, 'Margot Walsh', '065-682 4830', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1184, NULL, 'Les og skriv er et digitalt læremiddel som gir lese- og skrivetrening for voksne. Det inneholder tekster og språkoppgaver hentet fra voksnes hverdag og arbeidsliv.', 4, 'literacy', 'Online', 'https://elearning.kompetansenorge.no/lesogskriv3/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1185, NULL, 'Regnehjelpen er et digitalt læremiddel med regneoppgaver hentet fra voksnes hverdag. Det inneholder også hjelpemidler for å lære grunnregler i matematikk.

Regnehjelpen er et nettsted for voksne som ønsker å bli bedre i regning.

Regnehjelpen er gratis og enkel å bruke. Det kan brukes til å øve på egenhånd.', 4, 'numeracy', 'Online', 'http://www.regnehjelpen.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3503, 'Level 1 Reading and Writing', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing.
', 1, 'literacy', 'Cork City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323847', 1, 'Adult Literacy Service Cork City North', NULL, NULL, 'Fiona Long', '021-455 3180', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3504, 'Level 1 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Altrusa Adult Literacy Scheme: 021-425 5542', 1, 'numeracy', 'Cork City', 'https://www.corketb.ie/about-cork-etb/further-education-training-f-e-t/adult-basic-education-service/', 1, 'Altrusa Adult Literacy Scheme', NULL, NULL, 'Mary Ryder', '021-425 5542', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3505, 'Level 1 Using Technology ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Altrusa Adult Literacy Scheme: 021-425 5542', 1, 'digital_skills', 'Cork City', 'https://www.corketb.ie/about-cork-etb/further-education-training-f-e-t/adult-basic-education-service/', 1, 'Altrusa Adult Literacy Scheme', NULL, NULL, 'Mary Ryder', '021-425 5542', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3506, 'Level 2 Reading and Writing ', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing.', 2, 'literacy', 'Cork City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323804', 1, 'Adult Literacy Service City North', NULL, NULL, 'Fiona Long', '021-455 3180', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1197, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 1, 'literacy', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1186, NULL, 'Dette er e-læring som trener dine regneferdigheter.

Velg tema, eller klikk på "start e-læring" for å starte med første leksjon.
Leksjonene har ulikt nivå og økende vanskelighetsgrad:
Grønn - nivå 1-2
Blå - nivå 2-3
Rød - nivå 3', 4, 'numeracy', 'Online', 'https://elearning.kompetansenorge.no/regning/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1188, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 4, 'literacy', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1227, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 3, 'numeracy', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1232, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 4, 'digital_skills', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1309, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 1, 'numeracy', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1324, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 4, 'numeracy', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1045, 'Maltese as a Foreign Language', 'Maltese as a foreign language I', 1, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1171, 'ECDL Base Module: Online Essentials', 'ECDL: Online Essentional', 4, 'digital_skills', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3169', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201612', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2509, 'Award in Essential IT Skills at the Workplace - MQF 3', 'This course is particularly aimed at adults who are interested in acquiring an essential knowledge of computing and office software applications. At the end of the course, you will earn a certificate in IT skills at MQF level 3, which will help you become more confident when using computers in daily life. Course Location: Valletta', 3, 'digital_skills', 'Malta', 'https://www.melitamanagement.com/courses', 3, NULL, NULL, NULL, 'Melita Training and Resource Management Limited ', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2510, 'Award in Practical ICT Skills - MQF 2 (On request)', 'This course will help you develop your skills in technology and ICT (Information and Communication Technology) . You will be given the opportunity to try out various programmes introduced and gain the skills and tools to incorporate ICT in your everyday teaching. Course Location: Mosta', 2, 'digital_skills', 'Malta', 'https://domainacademy.edu.mt/', 3, NULL, NULL, NULL, 'Domain Academy', '21433688', 'info@domaingroup.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1199, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 3, 'literacy', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1200, NULL, 'Karrieresentrene i Agder gir gratis veiledning om utdanning og arbeid for innbyggere over 19 år som ikke går på skole.
På karrieresenteret kan du sammen med en veileder:

 - reflektere over dine ønsker, behov, interesser og forutsetninger
 - kartlegge dine interesser og din kompetanse
utforske muligheter som finnes i utdanningsløp og arbeidsliv jobbe med CV, søknad og intervju', 4, 'literacy', 'Agder', 'https://agderfk.no/vare-tjenester/skole-og-opplaring/karriereveiledning-og-opplaring-for-voksne/karriereveiledning/', 2, 'Agder fylkeskommune
Tordenskjolds gate 65
4605 Kristiansand', NULL, NULL, NULL, '38 05 00 00', 'postmottak@agderfk.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1209, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 1, 'literacy', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1210, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 2, 'literacy', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1274, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 2, 'numeracy', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1271, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 3, 'literacy', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1331, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 3, 'literacy', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1332, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 4, 'literacy', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1121, 'Maltese as a Foreign Language', 'Maltese as a foreign language II', 3, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1040, 'English MQF 1', 'English MQF 1', 1, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1041, 'English as a Foreign Language', 'English as a Foregin Language 1', 1, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3507, 'Level 2 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Altrusa Adult Literacy Scheme: 021-425 5542', 2, 'numeracy', 'Cork City', 'https://www.corketb.ie/about-cork-etb/further-education-training-f-e-t/adult-basic-education-service/', 1, 'Altrusa Adult Literacy Scheme', NULL, NULL, 'Mary Ryder', '021-425 5542', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1221, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 1, 'literacy', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1279, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 3, 'digital_skills', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1293, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 1, 'literacy', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1294, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 2, 'literacy', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1295, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 3, 'literacy', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1344, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 4, 'literacy', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1319, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 3, 'literacy', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1334, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 2, 'numeracy', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2511, 'ECDL Standard (MQF 3)', 'ECDL Standard (MQF 3) tests practical skills and competencies and consists of seven separate modules covering computer theory and practice. ECDL Standard consists of Computer Essentials, Online Essentials, Wordprocessing, Spreadsheets, Intermediate modules, IT Security, Presentation and Using Database. All ECDL tests are undertaken on automated testing software at an accredited ECDL test centre. You will take a test on a computer, which then automatically assesses the candidates’ performance, and provides immediate pass/fail feedback to both the centre and the candidates. The tests may be taken in any sequence and at any time, so you can do them at your own pace. You can either take the tests at the Domain Academy itself or at another Test Centre. Each test lasts 45 minutes and the pass mark for each module is 75%. The ECDL Standard Certificate (MQF 3) is awarded to candidates who successfully complete all modules. Course Location: Mosta', 3, 'digital_skills', 'Malta', 'https://domainacademy.edu.mt/courses/ict-computing/ecdl-standard/', 3, NULL, NULL, NULL, 'Domain Academy', '21433688', 'info@domaingroup.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2512, 'MG2I-C0106 Computer Technician Course (MQF 3)', 'The computer technician course delivers basic understanding of computer hardware operating systems, software, basic networking, security, operational procedures and customer service. You will gain hands-on experience on assembly and disassembly of a computer system together with the installation and customization of an Operating System.  This is a 90 hour guided learning course, and you will be expected to study privately and through assignments carried out at home. Course Location: Paola', 3, 'digital_skills', 'Malta', 'https://shortcourses.mcast.edu.mt/files/PT_coursesMarch_2021_new.pdf', 3, NULL, NULL, NULL, NULL, '23987777 or 23987116', 'shortcourses@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2513, 'MG2I-C0376 - Basic English as a Foreign Language (MQF 1)', 'English is widely spoken on a global scale. Proficiency in the English language is therefore an important asset to function independently in a foreign country and for socialising. The course will help you obtain basic knowledge and the skills required to communicate effectively in everyday situations. This course is for individuals who have never studied English or who have very limited knowledge of English. There are no entry requirements for this course. Course Location: Paola', 1, 'literacy', 'Malta', 'https://shortcourses.mcast.edu.mt/files/PT_coursesMarch_2021_new.pdf', 3, NULL, NULL, NULL, NULL, '23987777 or 23987116', 'shortcourses@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2514, 'IT1-01-21 - Introductory Certificate in ICT (MQF 1)', 'The Introductory Certificate in ICT offers knowledge in basic skills as well as knowledge in the fundamentals of computer systems and programming skills. The programme offers learners the necessary knowledge about the basic components that make up a computer system, and will learn about the software design phases and how to install hardware. Skills will be developed in how to design simple algorithms and simple computer programmes. Course Location: Paola', 1, 'digital_skills', 'Malta', 'https://www.mcast.edu.mt/mcast-prospectus-2021-2022/', 3, NULL, '2021-08-16 00:00:00+00', '2021-09-20 00:00:00+00', NULL, '2398 7100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3508, 'Level 2 Computer Skills', 'Introduction to computers/ipads/smartphones. No formal education or qualifications are required although applicants may have participated in primary and secondary education. ', 2, 'digital_skills', 'Cork City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323813', 1, 'Adult Literacy Service City North', NULL, NULL, 'Fiona Long', '021-455 3180', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1233, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 1, 'literacy', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1234, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 2, 'literacy', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1222, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 2, 'literacy', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1223, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 3, 'literacy', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1260, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 4, 'literacy', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1359, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 3, 'numeracy', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1360, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 4, 'numeracy', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1296, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 4, 'literacy', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1297, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 1, 'numeracy', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2515, 'IT2-01-21 - Foundation Certificate in ICT (MQF 2)', 'The Foundation Certificate in ICT is an initial learning experience for a future career in the computer industry. It is practice-oriented to help learners acquire the basics of ICT. The course is meant as a stepping stone for successive courses that will prepare you for work in the computer industry. At the end of the course, you will be able to identify the main hardware components of a computer, conduct simple programming tasks, use multimedia applications and provide solutions for IT projects. Course Location: Paola', 2, 'digital_skills', 'Malta', 'https://www.mcast.edu.mt/mcast-prospectus-2021-2022/', 3, NULL, '2021-08-16 00:00:00+00', '2021-09-20 00:00:00+00', NULL, '2398 7100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2516, 'IT2-01-21G - Foundation Certificate in ICT (MQF 2)', 'The Foundation Certificate in ICT is an initial learning experience for a future career in the computer industry. It is practice-oriented to help learners acquire the basics of ICT. The course is meant as a stepping stone for successive courses that will prepare you for work in the computer industry. At the end of the course, you will be able to identify the main hardware components of a computer, conduct simple programming tasks, use multimedia applications and provide solutions for IT projects. Course Location: Għajnsielem', 2, 'digital_skills', 'Gozo', 'https://www.mcast.edu.mt/mcast-prospectus-2021-2022/', 3, NULL, '2021-08-16 00:00:00+00', '2021-09-20 00:00:00+00', NULL, '2398 7100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1346, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 2, 'numeracy', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1347, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 3, 'numeracy', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2517, 'IT3-01-21 - Diploma in ICT (MQF 3)', 'The Diploma in ICT is the first step in a three-year training programme, designed to provide the necessary skills to work in the computing industry. The course will introduce you to fundamental subjects in the networking, software development, web development and multimedia areas. At the end of the course, you will be able to use modern computer and multimedia systems and networks in the workplace. Course Location: Paola', 3, 'digital_skills', 'Malta ', 'https://www.mcast.edu.mt/mcast-prospectus-2021-2022/', 3, NULL, '2021-08-16 00:00:00+00', '2021-09-20 00:00:00+00', NULL, '2398 7100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2518, 'IT3-01-21G - Diploma in ICT (MQF 3)', 'The Diploma in ICT is the first step in a three-year training programme, designed to provide the necessary skills to work in the computing industry. The course will introduce you to fundamental subjects in the networking, software development, web development and multimedia areas. At the end of the course, you will be able to use modern computer and multimedia systems and networks in the workplace. Course Location: Għajnsielem', 3, 'digital_skills', 'Gozo', 'https://www.mcast.edu.mt/mcast-prospectus-2021-2022/', 3, NULL, '2021-08-16 00:00:00+00', '2021-09-20 00:00:00+00', NULL, '2398 7100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1245, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 1, 'literacy', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1246, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 2, 'literacy', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1247, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 3, 'literacy', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1364, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 4, 'digital_skills', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2519, 'Maltese - MQF 1', 'This course is aimed for students who would like to start learning the Maltese language.
During this course, you will:
•	learn the alphabet and basic words to be able to read and write basic Maltese;
•	learn to develop simple sentences through pictures, words and phrases and other basic personal details; and
•	understand and talk about personal opinions.
This course is taught through discussions and tasks and you will be assessed throughout the course and a final exam.
Course Location: Żejtun Local Council', 1, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2520, 'Maltese - MQF 1', 'This course is delivered online and is aimed for students who would like to start learning the Maltese language.
During this course, you will:
•	learn the alphabet and basic words to be able to read and write basic Maltese;
•	learn to develop simple sentences through pictures, words and phrases and other basic personal details; and
•	understand and talk about personal opinions.
This course is taught through discussions and tasks and you will be assessed throughout the course and a final exam.', 1, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2521, 'Maltese - MQF 2', 'This course is delivered online and is aimed for students who would like to enrich their listening, speaking and writing in the Maltese language to communicate effectively both at the workplace and everyday life. During this course, you will learn to develop simple sentences through pictures, words and phrases and other basic personal details and understand and talk about personal opinions. This course is taught through discussions and practical tasks and you will be assessed through out the course and a final exam.', 2, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3852, 'Level 4 Computer Skills', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your confidence using technology in your everyday life.

Athlone: 090-649 2188
Mullingar: 044-934 2111
 ', 4, 'digital_skills', 'Westmeath', 'https://www.lwetb.ie/adult-learning/', 1, 'North Westmeath Adult Literacy Centre', NULL, NULL, 'Tricia Egginton', '086 8320649', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1237, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 1, 'numeracy', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1238, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 2, 'numeracy', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1239, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 3, 'numeracy', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2522, ' Maltese - SEC (MQF 3)', 'This course is delivered online and promotes competence in the four skills of listening, speaking, reading and writing, reflecting native fluency, grammar, syntax and knowledge of Maltese culture and literature. This will enable you to be a fluent user of Maltese, as is needed for further study, work and leisure. It also serves as a revision course for the Maltese SEC O''Level. Students need to have a school leaving certificate or MQF level 2 of Maltese before applying for this course. ', 3, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1219, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 3, 'digital_skills', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1257, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 1, 'literacy', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1258, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 2, 'literacy', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1259, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 3, 'literacy', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1298, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 2, 'numeracy', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1248, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 4, 'literacy', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1249, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 1, 'numeracy', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1310, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 2, 'numeracy', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1305, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 1, 'literacy', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1306, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 2, 'literacy', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1311, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 3, 'numeracy', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1312, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 4, 'numeracy', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1317, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 1, 'literacy', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2523, ' Maltese as a Foreign Language - MQF 1', 'This course focuses on understanding and using Maltese expressions and sentences used in everyday life situations like home, work, social and public settings and will introduce the learner to Maltese culture and customs
.
The course will help you to:
• read and understand simple texts in Maltese;
• listen and understand the gist of slower spoken conversations; and
• build simple sentences in Maltese.

When finishing this course successfully, you will be able to enrol in a course in Maltese as a Foreign Language at MQF 2.

Course Locations: National Council for Women, Blata l-Bajda, Birżebbuġa/Safi/Siġġiewi or Bormla Local Council', 1, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3509, 'Level 3 English and Communications', 'Effective reading, writing , and communication skills are key and necessary for all aspects of work, personal life and our social lives. Employers highly value training in this area.

This module is ideal if you are returning to work or hoping to progress or change career direction. If you simply want to improve your communication skills-then join us.', 3, 'literacy', 'Cork City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=314102', 1, 'North Presentation Sec. School, Farranree', NULL, NULL, 'Joanne Twomey', '021 4303330', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3510, 'Level 3 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Altrusa Adult Literacy Scheme: 021-425 5542', 3, 'numeracy', 'Cork City', 'https://www.corketb.ie/about-cork-etb/further-education-training-f-e-t/adult-basic-education-service/', 1, 'Altrusa Adult Literacy Scheme', NULL, NULL, 'Mary Ryder', '021-425 5542', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3511, 'Level 3 Computer Skills', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.', 3, 'digital_skills', 'Cork City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323504', 1, 'Adult Literacy Service City South', NULL, NULL, 'Bernadette DeCourcey', '021 431 9085', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1228, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 4, 'numeracy', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1261, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 1, 'numeracy', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1262, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 2, 'numeracy', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1263, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 3, 'numeracy', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3512, 'Level 4 English and Communications', 'Effective reading, writing, and  communication skills are key and necessary for all aspects of work, personal life and our social lives. Employers highly value training in this area.

This module is ideal if you are returning to work or hoping to progress or change career direction. If you simply want to improve your communication skills-then join us.', 4, 'literacy', 'Cork City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=314118', 1, 'North Presentation Sec. School, Farranree', NULL, NULL, 'Joanne Twomey', '021 4303330', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3513, 'Level 3 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Altrusa Adult Literacy Scheme: 021-425 5542', 4, 'numeracy', 'Cork City', 'https://www.corketb.ie/about-cork-etb/further-education-training-f-e-t/adult-basic-education-service/', 1, 'Altrusa Adult Literacy Scheme', NULL, NULL, 'Mary Ryder', '021-425 5542', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3514, 'Level 4 Information Technology', 'The programme aims to provide learners with the skill, knowledge and competence to work under supervision providing assistance and support within an Information and Communications Technology (ICT) setting.

Programme content includes the use of a range of digital media technologies, and use of ICT applications and packages. The programme is also suited to those seeking to progress to higher levels of training and education in ICT.', 4, 'digital_skills', 'Cork City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323201', 1, 'Carrigaline Further Education & Training Centre', NULL, NULL, 'Patrick Callinan', '086-8532143', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1264, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 4, 'numeracy', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1269, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 1, 'literacy', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1270, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 2, 'literacy', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1318, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 2, 'literacy', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1224, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 4, 'literacy', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1225, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 1, 'numeracy', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1276, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 4, 'numeracy', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3515, 'Level 1 Communications ', 'This programme aims to provide learners with the opportunity to develop their basic skills in reading, writing, and communications to prepare for progression to level 2. ', 1, 'literacy', 'Cork County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=322787', 1, 'Adult Literacy Service North Cork', NULL, NULL, 'Ruth Doherty', '086 8238758', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3516, 'Everyday Maths', 'This course aims to give you the chance to get back into learning and build your confidence in using your maths skills in everyday situations.', 1, 'numeracy', 'Cork County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323606', 1, 'Adult Literacy Service West Cork', NULL, NULL, 'Dorothy Beamish', '086 8239149', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3517, 'Computers for beginners', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.', 1, 'digital_skills', 'Cork County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323688', 1, 'Adult Literacy Service West Cork', NULL, NULL, 'Jane Gill', '086 1909694', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3518, 'Level 2 Reading and Writing ', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing.', 2, 'literacy', 'Cork County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323848', 1, 'Adult Literacy Service West Cork', NULL, NULL, 'Deirdre Fitzgerald', '086 823 9147', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1281, NULL, 'Karriereveiledning – noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle voksne i Finnmark fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?', 1, 'literacy', 'Finnmark', 'http://karrierefinnmark.no', 2, NULL, NULL, NULL, NULL, '78 96 30 40', NULL, NULL, 'Mandag.-fredag. kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3519, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Cork Education Training Centre: (021) 4907100', 2, 'numeracy', 'Cork County', 'https://www.corketb.ie/about-cork-etb/further-education-training-f-e-t/adult-basic-education-service/', 1, NULL, NULL, NULL, NULL, '(021) 4907100', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2524, ' Maltese as a Foreign Language - MQF 1', 'This course focuses on understanding and using Maltese expressions and sentences used in everyday life situations like home, work, social and public settings and will introduce you to Maltese culture and customs.
The course will help you to:
•	read and understand simple texts in Maltese;
•	listen and understand the gist of slower spoken conversations, and build simple sentences in Maltese.
When finishing this course successfully, you will be able to enrol in a course in Maltese as a Foreign Language at MQF 2.
Course Locations: Rabat Gozo Secondary School or Għarb Local Council', 1, 'literacy', 'Gozo', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1307, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 3, 'literacy', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1308, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 4, 'literacy', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3520, 'Level 2 Using Technology IT', 'Introduction to computers/ipads/smartphones. No formal education or qualifications are required although applicants may have participated in primary and secondary education. Applicants will be expected to demonstrate a standard of knowledge, skill and competence equivalent to NFQ Level 1 when accessing a Level 2 programme.', 2, 'digital_skills', 'Cork County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323912', 1, 'Adult Literacy Service West Cork', NULL, NULL, 'Noreen Murnane', '086 823 9147', NULL, '323912', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3521, 'Level 3 Communications for Work and Everyday Life ', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading, writing and communication skills.', 3, 'literacy', 'Cork County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=322790', 1, 'Adult Literacy Service North Cork', NULL, NULL, 'Nuala White', '022-42322', NULL, '322790', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3522, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Cork Education Training Centre: (021) 4907100', 3, 'numeracy', 'Cork County', 'https://www.corketb.ie/about-cork-etb/further-education-training-f-e-t/adult-basic-education-service/', 1, NULL, NULL, NULL, NULL, '(021) 4907100', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3523, 'Level 4 Reading and Writing ', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.', 3, 'digital_skills', 'Cork County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323703', 1, NULL, NULL, NULL, 'Noreen Murnane', '086 823 9147', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3524, 'Level 4 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Cork Education Training Centre: (021) 4907100', 4, 'literacy', 'Cork County', 'https://www.corketb.ie/about-cork-etb/further-education-training-f-e-t/adult-basic-education-service/', 1, NULL, NULL, NULL, NULL, '(021) 4907100', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3525, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Cork Education Training Centre: (021) 4907100', 4, 'numeracy', 'Cork County', 'https://www.corketb.ie/about-cork-etb/further-education-training-f-e-t/adult-basic-education-service/', 1, NULL, NULL, NULL, NULL, '(021) 4907100', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3526, 'Level 4 Computer Applications', 'Participants will need basic computer skills and must have access to a computer and relevant software outside of class time.

This is an ideal course for anyone who wants to up skill or for those who have very basic skills and want to gain knowledge in other computer applications with a recognised qualification. It includes theory, file management, spreadsheets, database, word processing, graphics and internet & email. It also introduces the learner to Desktop Publishing & design', 4, 'digital_skills', 'Cork County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323314', 1, 'Midleton Further Education & Training Centre', NULL, NULL, 'Patrick Callinan', '086-8532143', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3527, 'Level 1 Reading and Writing', 'This programme aims to provide you with the opportunity to develop their basic skills in reading, writing, and communications to prepare for progression to level 2. ', 1, 'literacy', 'Donegal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=328217', 1, 'FET Centre Letterkenny', NULL, '2021-09-28 00:00:00+00', 'Emilia Puszczynska', '074-916 1561', NULL, '328217', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3528, 'Level 1 Maths and Working with Numbers', 'This course aims to give you the chance to get back into learning and build your confidence in using your maths skills in everyday situations.', 1, 'numeracy', 'Donegal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=328220', 1, 'FET Centre Letterkenny', NULL, '2021-10-01 00:00:00+00', 'Emilia Puszczynska', '074-916 1561', NULL, '328220', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3529, 'Level 1 Computers and Technology', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.', 1, 'digital_skills', 'Donegal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=328216', 1, 'FET Centre Letterkenny', NULL, '2021-09-27 00:00:00+00', 'Teresa McGinley', '074-916 1561', NULL, '328216', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3530, 'Level 2 English', 'The knowledge, skill and competence acquired on this programme are relevant to personal development and participation in society, community and employment and provides a basis for further progression. The programme covers the acquirement of basic knowledge, skills and competencies in a narrow range of fields of learning including key outcomes in literacy and numeracy.', 2, 'literacy', 'Donegal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=298943', 1, 'FET Centre Stranorlar', NULL, '2021-09-29 00:00:00+00', 'Georgina Thompson', '074-9190610', NULL, '298943', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2525, ' Maltese as a Foreign Language - MQF 1', 'This course is delivered online and focuses on understanding and using Maltese expressions and sentences used in everyday life situations like home, work, social and public settings and will introduce you to Maltese culture and customs.
The course will help you to:
•	read and understand simple texts in Maltese;
•	listen and understand the gist of slower spoken conversations; and
•	build simple sentences in Maltese.
When finishing this course successfully, you will be able to enrol in a course in Maltese as a Foreign Language at MQF 2.', 1, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3531, 'Level 2 Maths and Working with Numbers', 'This course is ideal for adults who would like to brush up on their skills in Maths. If you have had difficulties in the past, we are here to help.', 2, 'numeracy', 'Donegal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=298972', 1, 'FET Centre Buncrana', NULL, '2021-09-17 00:00:00+00', 'Caroline McCabe', '074-932 9744', NULL, '298972', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3532, 'Level 2 Using Technology', 'This course is for those who want to learn how to use their smartphone and familiarise themselves with the most common social media apps.', 2, 'digital_skills', 'Donegal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=298927', 1, 'FET Centre Stranorlar', NULL, NULL, 'Georgina Thompson', '074-9190610', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3533, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

FET Centre Letterkenny: 074-916 1561', 3, 'literacy', 'Donegal', 'https://www.donegaletb.ie/further-education-training/course-types-and-levels/', 1, 'FET Centre Letterkenny', NULL, NULL, 'Teresa McGinley', '074-916 1561', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3534, 'Level 3 Mathematics ', 'The purpose of this course is to help you to develop the relevant knowledge and skills to use maths in your everyday life.

It will enable you to participate in and contribute to modern society, to pursue a range of employment opportunities or to progress to further education or training.', 3, 'numeracy', 'Donegal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=298986', 1, 'FET Centre Letterkenny', NULL, '2022-06-09 00:00:00+00', 'Emilia Puszczynska', '074-916 1561', NULL, '298986', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3535, 'Level 3 Internet Skills', 'The aim of this programme is to enable the learner to develop the relevant knowledge, skill and competence to use a range of information and communication technologies, under direction and with limited autonomy, in familiar situations. It enables the learner to pursue a range of employment opportunities or to progress to further education or training.', 3, 'digital_skills', 'Donegal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=298990', 1, 'FET Centre Letterkenny', NULL, '2021-09-29 00:00:00+00', 'Teresa McGinley', '074-916 1561', NULL, '298990', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3536, 'Level 4 English & Communications', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

FET Centre Letterkenny: 074-916 1561', 4, 'literacy', 'Donegal', 'https://www.donegaletb.ie/further-education-training/course-types-and-levels/', 1, 'FET Centre Buncrana', NULL, '2021-09-13 00:00:00+00', 'Teresa McGinley', '074-916 1561', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3537, 'Level 4 Mathematics ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

FET Centre Letterkenny: 074-916 1561', 4, 'numeracy', 'Donegal', 'https://www.donegaletb.ie/further-education-training/course-types-and-levels/', 1, 'FET Centre Letterkenny', NULL, NULL, 'Teresa McGinley', '074-916 1561', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3538, 'Level 4 Computer Skills', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your digital skills.

FET Centre Letterkenny: 074-916 1561', 4, 'digital_skills', 'Donegal', 'https://www.donegaletb.ie/further-education-training/course-types-and-levels/', 1, 'FET Centre Letterkenny', NULL, NULL, 'Teresa McGinley', '074-916 1561', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3853, 'Level 1 Improve your Reading and Writing', 'This programme aims to provide learners with the opportunity to develop their elementary skills in numeracy, ICT and communications to prepare for progression to level 2.', 1, 'literacy', 'Wexford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=304321', 1, 'South Wexford Adult Literacy', NULL, '2021-11-01 00:00:00+00', 'Siobhan Crotty', '051 425118', NULL, '304321', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2526, ' Maltese as a Foreign Language - MQF 2', 'This course will help you to:
•	communicate using vocabulary and phrases in Maltese, both those relating to everyday life, like home, work, social and public settings;
•	understand texts written in the Maltese language;
•	identify grammatical topics and idiomatic expressions from a text;
•	understand the gist of spoken Maltese; and
•	how to write grammatically and sequentially correct texts.
Course Location: Cottonera Resource Centre', 2, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2527, ' Maltese as a Foreign Language - MQF 2', 'This course is delivered online and will help you to:
•	communicate using vocabulary and phrases in Maltese, both those relating to everyday life, like home, work, social and public settings;
•	understand texts written in the Maltese language;
•	identify grammatical topics and idiomatic expressions from a text;
•	understand the gist of spoken Maltese; and
•	how to write grammatically and sequentially correct texts. ', 2, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2528, ' English - MQF 1', 'By the end of this course, you will be able to:
•	understand basic English vocabulary, expressions and grammar;
•	understand and communicate in English on everyday situations, like home, work or meeting friends;
•	read and understand newspaper articles, magazine articles, invitations and manuals; and
•	write basic personal details.

After completing this course, you will be able to study English further to improve the vocabulary, fluency and accuracy.

Course Locations: Qormi, Żabbar or Żejtun Local Council', 1, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2529, ' English - MQF 1', 'This course is delivered online and by the end of this course, you will be able to:
•	understand basic English vocabulary, expressions and grammar;
•	understand and communicate in English on everyday situations, like home, work or meeting friends;
•	read and understand newspaper articles, magazine articles, invitations and manuals; and
•	write basic personal details.
After completing this course, you will be able to study English further to improve the vocabulary, fluency and accuracy.', 1, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2530, 'English - MQF 2', 'This course is delivered online and by the end of this course, you will be able to:
•	understand and use English effectively for practical communication;
•	respond adequately in a direct interview;
•	understand short, concrete texts in standard speech;
•	read and write simple narratives in the English language; and
•	select and use adequate grammatical expressions. ', 2, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2531, 'English - MQF 3', 'This course focuses on listening, speaking, reading and writing, enabling you to be a fluent, independent user of English, and to be able to use English in personal and work situations. This course serves as revision for students wishing to sit for their SEC English O’Level exam (MQF 3). Passing the SEC O’Level provides opportunities for further studies and may open up work opportunities. Course Location: National Council for Women, Blata l-Bajda', 3, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2532, 'English - MQF 3', 'This course is delivered online and focuses on listening, speaking, reading and writing, enabling you to be a fluent, independent user of English, and to be able to use English in personal and work situations. This course serves as revision for students wishing to sit for their SEC English O’Level exam (MQF3). Passing the SEC O’Level provides opportunities for further studies and may open up work opportunities. ', 3, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2533, 'English as a Foreign Language - MQF 1', 'Proficiency in the English language is an important asset to function independently in a foreign country and for socialising. This course will:
• enable you with basics to facilitate communication using very basic vocabulary and phrases in English related to everyday life and representative of the home, work, social and public settings;
• help you to read and understand basic texts.

Course Locations: Birżebbuġa/Safi/Santa Luċija/Attard/Siġġiewi or Santa Venera Local Council', 1, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2534, 'English as a Foreign Language - MQF 1', 'Proficiency in the English language is an important asset to function independently in a foreign country and for socialising. This course will:
• enable you with basics to facilitate communication using very basic vocabulary and phrases in English related to everyday life and representative of the home, work, social and public settings;
• help you to read and understand basic texts.
Course Location: Rabat Gozo Secondary School', 1, 'literacy', 'Gozo', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2535, 'English as a Foreign Language - MQF 1', 'Proficiency in the English language is an important asset to function independently in a foreign country and for socialising. This course is delivered online and will:
•	enable you with basics to facilitate communication using very basic vocabulary and phrases in English related to everyday life and representative of the home, work, social and public settings; and
•	help you to read and understand basic texts.', 1, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2536, 'English as a Foreign Language - MQF 2', 'This course is delivered online and by the end of this course, you will be able to understand and use authentic English expressions, master English grammar and structure and communicate appropriately through speaking and writing. To apply for this course, students need to have successfully completed MQF Level 1 in English or English as a Foreign Language. ', 2, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2537, 'Maths - MQF 1', 'This course will help you to:
•	understand and apply mathematical knowledge in a wider context;
•	understand and analyse a problem;
•	verify and interpret results; and
•	understand, interpret and evaluate mathematical ideas that are presented in oral, written and visual forms.
Course Location: National Council for Women, Blata l-Bajda ', 1, 'numeracy', 'Malta', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2538, 'Maths - MQF 1', 'This course is delivered online and will help you to:
•	understand and apply mathematical knowledge in a wider context;
•	understand and analyse a problem;
•	verify and interpret results; and
•	understand, interpret and evaluate mathematical ideas that are presented in oral, written and visual forms.', 1, 'numeracy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1316, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 4, 'digital_skills', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1329, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 1, 'literacy', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1330, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 2, 'literacy', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2539, 'Maths - MQF 2', 'This course is delivered online and will help you to analyse and solve mathematical problems and to understand, interpret and evaluate mathematical ideas that are presented in oral, written and visual forms. To apply for this course students must have obtained a Maths MQF Level 1 Certificate with Grade B or higher or a School Leaving Certificate in Maths with 75% or higher. ', 2, 'numeracy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2540, 'Maths (SEC Paper A) - MQF 3', 'This is a revision course delivered online, aimed for students sitting for the SEC O''Level examination in Mathematics (Paper A). Good knowledge of basic mathematics is essential since the educator is not required to deliver the entire syllabus. This course will enable you to acquire basic mathematical understanding in order to use maths in everyday situations by focusing on order, precision, conciseness and logic. At the end of this course, you will be able to sit for the SEC O''Level examination at MQF 3. ', 3, 'numeracy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1345, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 1, 'numeracy', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1320, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 4, 'literacy', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1321, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 1, 'numeracy', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1322, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 2, 'numeracy', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2541, 'Maths (SEC Paper B) - MQF 3', 'This is a revision course delivered online, aimed for students sitting for the SEC O''Level examination in Mathematics (Paper B). Good knowledge of basic mathematics is essential since the educator is not required to deliver the entire syllabus. This course will enable you to acquire basic mathematical understanding in order to use maths in everyday situations by focusing on order, precision, conciseness and logic. At the end of this course, you will be able to sit for the SEC O''Level examination at MQF 3. ', 3, 'numeracy', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2542, 'ECDL - MQF 3', 'The ECDL course covers 7 modules: Computer essentials, Online essentials, Word processing, Spreadsheets, Presentation, Database and IT Security. Successfully completing this course, you will be more familiar with computer programmes needed for personal use or work. To apply for this course, you must have basic ICT skills
Course Locations: Blata l-Bajda Learning Centre, Mrieħel Adult Learning Centre, Bormla Local Council or Cottonera Resource Centre', 3, 'digital_skills', 'Malta', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2543, 'ECDL - MQF 3', 'The ECDL course is delivered online and covers 7 modules: Computer essentials, Online essentials, Word processing, Spreadsheets, Presentation, Database and IT Security. Successfully completing this course, you will be more familiar with computer programmes needed for personal use or work. To apply for this course, you must have basic ICT skills. ', 3, 'digital_skills', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2544, 'Computing - SEC (MQF 3)', 'This course is delivered online and offer students a wide range of opportunities to learn and experience different aspects of the IT industry. It will introduce you to concepts of computer science and the fundamentals of computer systems, programming, security and networking. This course serves as a revision for the SEC O''Level examination. Passing the SEC O''Level exam in Computing will open opportunities for further study and work. ', 3, 'digital_skills', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', NULL, '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1323, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 3, 'numeracy', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2545, 'Maths (MQF 3)', 'Call the Lifelong Learning Unit on 2598 1101/2/3/4 to ask for information on relevant courses in your area or send us an e-mail on lifelonglearning@gov.mt.

Or check out the online learning opportunities that are available! ', 3, 'numeracy', 'Malta', 'https://lifelonglearning.gov.mt/', 3, NULL, NULL, NULL, 'Lifelong Learning Unit', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2546, 'English (MQF 2)', 'Call the Lifelong Learning Unit on 2598 1101/2/3/4 to ask for information on relevant courses in your area or send us an e-mail on lifelonglearning@gov.mt.

Or check out the online and face-to-face learning opportunities in Malta that are available! ', 2, 'literacy', 'Gozo', 'https://lifelonglearning.gov.mt/', 3, NULL, NULL, NULL, 'Lifelong Learning Unit', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1335, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 3, 'numeracy', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1336, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 4, 'numeracy', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1341, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 1, 'literacy', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1342, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 2, 'literacy', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1343, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 3, 'literacy', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1333, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 1, 'numeracy', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2547, 'English (MQF 3)', 'Call the Lifelong Learning Unit on 2598 1101/2/3/4 to ask for information on relevant courses in your area or send us an e-mail on lifelonglearning@gov.mt.

Or check out the online and face-to-face learning opportunities in Malta that are available! ', 3, 'literacy', 'Gozo', 'https://lifelonglearning.gov.mt/', 3, NULL, NULL, NULL, 'Lifelong Learning Unit', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1338, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 2, 'digital_skills', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1339, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 3, 'digital_skills', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1340, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 4, 'digital_skills', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2548, 'Maths (MQF 1)', 'Call the Lifelong Learning Unit on 2598 1101/2/3/4 to ask for information on relevant courses in your area or send us an e-mail on lifelonglearning@gov.mt.

Or check out the online and face-to-face learning opportunities in Malta that are available! ', 1, 'numeracy', 'Gozo', 'https://lifelonglearning.gov.mt/', 3, NULL, NULL, NULL, 'Lifelong Learning Unit', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2549, 'Maths (MQF 2)', 'Call the Lifelong Learning Unit on 2598 1101/2/3/4 to ask for information on relevant courses in your area or send us an e-mail on lifelonglearning@gov.mt.

Or check out the online and face-to-face learning opportunities in Malta that are available! ', 2, 'numeracy', 'Gozo', 'https://lifelonglearning.gov.mt/', 3, NULL, NULL, NULL, 'Lifelong Learning Unit', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2550, 'Maths (MQF 3)', 'Call the Lifelong Learning Unit on 2598 1101/2/3/4 to ask for information on relevant courses in your area or send us an e-mail on lifelonglearning@gov.mt.

Or check out the online and face-to-face learning opportunities in Malta that are available! ', 3, 'numeracy', 'Gozo', 'https://lifelonglearning.gov.mt/', 3, NULL, NULL, NULL, 'Lifelong Learning Unit', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2551, 'Computing (MQF 1)', 'Call the Lifelong Learning Unit on 2598 1101/2/3/4 to ask for information on relevant courses in your area or send us an e-mail on lifelonglearning@gov.mt.

Or check out the online and face-to-face learning opportunities in Malta that are available! ', 1, 'digital_skills', 'Gozo', 'https://lifelonglearning.gov.mt/', 3, NULL, NULL, NULL, 'Lifelong Learning Unit', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2552, 'Computing (MQF 1)', 'Call the Lifelong Learning Unit on 2598 1101/2/3/4 to ask for information on relevant courses in your area or send us an e-mail on lifelonglearning@gov.mt.

Or check out the face-to-face learning opportunities in Malta that are available! ', 1, 'digital_skills', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, NULL, NULL, 'Lifelong Learning Unit', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1353, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 1, 'literacy', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1354, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 2, 'literacy', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2553, 'Computing (MQF 2)', 'Call the Lifelong Learning Unit on 2598 1101/2/3/4 to ask for information on relevant courses in your area or send us an e-mail on lifelonglearning@gov.mt.

Or check out the face-to-face learning opportunities in Malta that are available! ', 2, 'digital_skills', 'Online', 'https://lifelonglearning.gov.mt/', 3, NULL, NULL, NULL, 'Lifelong Learning Unit', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3539, 'Reading and Writing ', 'Is reading writing or technology a problem?
Would you like to improve your skills?
The aim of this course is to help you become confident with reading, writing and computers.
The course will take the most basic reader and give them strategies to help cope:
 - Form filling
 - Spelling
 - Letter writing.
 - Reading for pleasure and for work.
 - Reading from a computer screen or tablet.
 - Smart technology

All classes are for adult learners with professional teachers to help you achieve your goal.
There will be a meeting to discuss your needs and set goals a brief assessment and then the rest is up to you.

This is a fun practical course that puts you in charge of your learning!', 1, 'literacy', 'Galway City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=328791', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, '328791', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3540, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

FET Centre Galway City: 091-567 660', 1, 'numeracy', 'Galway City', 'http://www.gabes.ie/literacy--numeracy', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1355, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 3, 'literacy', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1356, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 4, 'literacy', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1357, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 1, 'numeracy', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1358, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 2, 'numeracy', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1348, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 4, 'numeracy', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1328, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 4, 'digital_skills', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1046, 'City & Guilds Entry Level Certificate In English Skills (Entry 3) (Ofqual no: 600/7591/0)', 'Certificate in English Skills Leve1 1', 1, 'literacy', 'central', 'https://promotion.learnkey.com.mt/', 40, 'Birkirkara', NULL, NULL, 'Learnkey Training Institute', '21443140', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1049, 'General Education Award in English Literacy 1', 'Englilish Literacy I', 1, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3149', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', 'jeanpierre.meilaq@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1050, 'Elementary Award in Maltese Language as a Foreign Language', 'Maltese as a Foreign language I', 1, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=4270', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (2554, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3854, 'Level 1 Improve your Maths', 'This programme aims to provide learners with the opportunity to develop their elementary skills in numeracy, ICT and communications to prepare for progression.', 1, 'numeracy', 'Wexford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=326761', 1, 'South Wexford Adult Literacy', NULL, '2021-09-20 00:00:00+00', 'Siobhan Crotty', '051 425118', NULL, '326761', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1051, 'General Education Award in Maltese Language 1', 'Maltese Language I', 1, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3142', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1052, 'General Education Award in English for Foreigners 1', 'English for Foreigners I', 1, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3150', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1053, 'General Education Award in Numeracy Level 1', 'Numeracy I', 1, 'numeracy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3144', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1062, 'Award in English Language for Foreigners', 'English language for foreigners', 1, 'literacy', 'southern', 'https://www.learningworks.edu.mt/courses/language-courses/', 40, 'Qormi', NULL, NULL, 'Ms Christabelle Tabone', '21432333', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1063, 'Award in Maltese Language and Culture for Foreigners', 'Maltese Language and culture for foreigners', 1, 'literacy', 'southern', 'https://www.learningworks.edu.mt/courses/language-courses/', 40, 'Qormi', NULL, NULL, 'Ms Christabelle Tabone', '21432333', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1080, 'English MQF 1', 'English MQF 1', 2, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1081, 'English as a Foreign Language', 'English as a Foregin Language 1', 2, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1082, 'Maths MQF 1', 'MAthematics MQF 1', 2, 'numeracy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1089, 'General Education Award in English Literacy 1', 'Englilish Literacy I', 2, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3149', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', 'jeanpierre.meilaq@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1090, 'Elementary Award in Maltese Language as a Foreign Language', 'Maltese as a Foreign language I', 2, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=4270', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1091, 'General Education Award in Maltese Language 1', 'Maltese Language I', 2, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3142', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1092, 'General Education Award in English for Foreigners 1', 'English for Foreigners I', 2, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3150', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1093, 'General Education Award in Numeracy Level 1', 'Numeracy I', 2, 'numeracy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3144', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1095, 'Elementary Award in English as a Second or Other Language (ESOL)', 'Elementary Award in English as a Second or Other Language', 2, 'literacy', 'northern', 'https://promotion.learnkey.com.mt/', 40, 'Mosta', NULL, NULL, 'ESaT LTD', '79385856', 'info@esatmalta.org', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1102, 'Award in English Language for Foreigners', 'English language for foreigners', 2, 'literacy', 'southern', 'https://www.learningworks.edu.mt/courses/language-courses/', 40, 'Qormi', NULL, NULL, 'Ms Christabelle Tabone', '21432333', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1103, 'Award in Maltese Language and Culture for Foreigners', 'Maltese Language and culture for foreigners', 2, 'literacy', 'southern', 'https://www.learningworks.edu.mt/courses/language-courses/', 40, 'Qormi', NULL, NULL, 'Ms Christabelle Tabone', '21432333', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1126, 'Applied Basic English', 'Applied basic English', 3, 'literacy', 'south eastern', 'http://www.sgi.edu.mt/?page_id=530', 40, 'Floriana', NULL, NULL, 'FSS Ltd. or Jessica Micallef', '25905226', 'info@fssmalta.com or jmicallef@fss.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1125, 'City and Guilds Level 1 Certificate in English Skills (ofqual no: 600/7595/8)', 'Certificate in English Skills Level 2', 3, 'literacy', 'central', 'https://promotion.learnkey.com.mt/', 40, 'Birkirkara', NULL, NULL, 'Learnkey Training Institute', '21443140', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1132, 'General Education Award in English Literacy 2', 'English Literacy II', 3, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3147', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1133, 'General Education Award in Maltese Language for Foreigners 2', 'Maltese as a Foreign Language II', 3, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3141', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1134, 'General Education Award in Maltese Language 2', 'Maltese Language II', 3, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3143', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1135, 'General Education Award in Numeracy Level 2', 'Numeracy II', 3, 'numeracy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3145', 40, 'Hal far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1136, 'Award in Basic English for Care Workers', 'Basic english for careworkers', 3, 'literacy', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3140', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201608', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1137, 'General Education Award in English for Foreigners 2', 'English for Foreigners II', 3, 'literacy', 'southern', 'https://promotion.learnkey.com.mt/', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1139, 'Pre-Intermediate Award in English as a Second or Other Language (ESOL)', 'Pre-Intermediate Award in English as a Second or Other Language', 3, 'literacy', 'northern', 'http://www.esatmalta.org/index.php/sections/courses', 40, 'Mosta', NULL, NULL, 'ESaT LTD', '79385856', 'info@esatmalta.org', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1130, 'IT2-01-19G - Foundation Certificate in ICT', 'The Foundation Certificate in ICT offers knowledge in basic skills as well as knowledge in the fundamentals of computer systems, programming skills, computer graphics, and the creating of an ICT project.', 3, 'digital_skills', 'gozo', 'https://www.mcast.edu.mt/courses/it2-01-19g/', 40, 'Gozo Campus (Ghajnsielem)', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'MCAST', '23987665', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1120, 'Award in Maltese', 'Basic Skills in Maltese Literacy II', 3, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1142, 'Award in Maltese Language for Foreigners', 'Maltese language for foreigners', 3, 'literacy', 'southern', 'https://www.learningworks.edu.mt/courses/upcoming-language-courses/level-2-award-in-maltese-for-foreigners/', 40, 'Qormi', NULL, NULL, 'Ms Christabelle Tabone', '21432333', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1163, 'Award in Maltese', 'Basic Skills in Maltese Literacy III', 4, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3541, 'Computer class', 'Nervous of computers. Do you feel technology is leaving you behind? Do not allow that to happen let us show you what you need to know!

This course is for:

• Parents who need to catch up on technology to keep up with their children
• Older people who want to get to grips with new technology because it is great.
• Young people who would like to use new technology better

Why should you take this course?

• Learn for fun or for career
• Is new technology at work intimidating you? Do not let it. This course and we will show you that you can
• Learn to use a word processor create an excel file
• Book that flight,
• Write that email
• Use web sites and know if the website secure or not. If the information is fact or fiction.

On this course, we will answer those questions you wanted to ask ', 1, 'digital_skills', 'Galway City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=309146', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, '309362', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3855, 'Level 1 Computer Skills ', 'The aim of this programme is multi purpose. The knowledge, skill and competence acquired on this programme are relevant to personal development and participation in society, community and employment and provides a basis for further progression. The programme covers the acquirement of basic knowledge, skills and competencies in a narrow range of fields of learning including key outcomes in literacy and numeracy.', 1, 'digital_skills', 'Wexford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=304442', 1, 'South Wexford Adult Literacy.', NULL, '2021-11-01 00:00:00+00', 'Siobhan Crotty', '051 425118', NULL, '304442', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1165, 'English MQF 3', 'English MQF 3', 4, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1166, 'Maths MQF 3', 'Mathematics MQF 3', 4, 'numeracy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1180, 'Intermediate Award in English as a Second or Other Language (ESOL)', 'Intermediate Award in English as a Second or Other Languag', 4, 'literacy', 'northern', 'http://www.esatmalta.org/index.php/sections/courses', 40, 'Mosta', NULL, NULL, 'ESaT LTD', '79385856', 'info@esatmalta.org', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1172, 'ECDL Base Module: Word Processing', 'ECDL: Word Processing', 4, 'digital_skills', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3161', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201612', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1173, 'ECDL Base Module: Spreadsheets', 'ECDL: Spreadsheets', 4, 'digital_skills', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3160', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201612', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1174, 'ECDL Standard Module: Presentation', 'ECDL: Presentation', 4, 'digital_skills', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3164', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201612', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1175, 'ECDL Standard Module: Using Databases', 'ECDL: Using Databases', 4, 'digital_skills', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3165', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201612', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1054, 'VET Award Foundation in Digital Literacy Skills', 'VET award in digital literacy', 1, 'digital_skills', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3167', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201612', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1048, 'Award in Introduction to Maltese for Foreigners (Institute not sure whether the course will run again.)', 'Introduction to Maltese for Foreigners', 1, 'literacy', 'south eastern', 'Facebook page', 40, 'Floriana', NULL, NULL, 'St Thomas institute', '21227799', 'info@stthomasmalta.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1056, 'MG2I-C0456- Maltese for Foreigners', 'Maltese for Foreigners (A1/A2)', 1, 'literacy', 'south eastern', 'https://www.mcast.edu.mt/wp-content/uploads/Part-time-prospectus-2020-low-res-for-email.pdf', 40, 'Paola', NULL, '2020-03-31 00:00:00+00', 'MCAST', '23987777', 'shortcourses@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1057, 'MG2I-C0376 - Basic English as a Foreign Language', 'Basic English as a Foreign Language', 1, 'literacy', 'south eastern', 'https://www.mcast.edu.mt/wp-content/uploads/Part-time-prospectus-2020-low-res-for-email.pdf', 40, 'Paola', NULL, '2020-03-31 00:00:00+00', 'MCAST', '23987777', 'shortcourses@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1061, 'FC1-01-19 - Skills Kits', 'This course of studies gives the learners the opportunity to study at their own pace and explore different vocational areas. It is made up of a number of bite-sized courses ranging from vocational areas to personal skills and employability skills. Learners can choose the number and combination of Skills Kits they would like to study creating their own programme of studies. The Skills Kits include topics such as Hairdressing, Beauty and Developing Mobile Apps. Learners who successfully complete a Skills Kit are awarded a certificate. Learners who successfully complete 30 Skills Kits are awarded the MCAST Introductory Skills Certificate.', 1, 'literacy', 'south eastern', 'https://www.mcast.edu.mt/courses/fc1-01-19/', 40, 'Paola', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Learning Support Unit', '25987514', 'lsu@saidfamily.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1064, 'Award in Basic English - Level 1', 'Award in basic English I', 1, 'literacy', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Valletta', NULL, NULL, 'Melita Training and Resource Management Limited or Reggie Miller Foundation', '21497220 or 25679001', 'info@melitamanagement.com or pfenech@gwu.org.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1065, 'Award in Basic Numeracy - Level 1', 'Basic Numeracy I', 1, 'numeracy', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Valletta', NULL, NULL, 'Melita Training and Resource Management Limited or Reggie Miller Foundation', '21497220 or 25679002', 'info@melitamanagement.com or pfenech@gwu.org.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1066, 'Hiliet Bazici fil-Malti Komunikattiv: L-ewwel Livell', 'Basic skills in maltese I', 1, 'literacy', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Valletts', NULL, NULL, 'Melita Training and Resource Management Limited or Reggie Miller Foundation', '21497220 or 25679000', 'info@melitamanagement.com or pfenech@gwu.org.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1096, 'MG2I-C0456- Maltese for Foreigners', 'Maltese for Foreigners (A1/A2)', 2, 'literacy', 'south eastern', 'https://www.mcast.edu.mt/wp-content/uploads/Part-time-prospectus-2020-low-res-for-email.pdf', 40, 'Paola', NULL, '2020-03-31 00:00:00+00', 'MCAST', '23987777', 'shortcourses@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1097, 'MG2I-C0376 - Basic English as a Foreign Language', 'Basic English as a Foreign Language', 2, 'literacy', 'south eastern', 'https://www.mcast.edu.mt/wp-content/uploads/Part-time-prospectus-2020-low-res-for-email.pdf', 40, 'Paola', NULL, '2020-03-31 00:00:00+00', 'MCAST', '23987777', 'shortcourses@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1099, 'PWA-01-18 - Award in Vocational Skills (Introductory A)', 'The Award in Vocational Skills supports students with learning disabilities / learning difficulties to acquire the skills required to gain and maintain employment or to further their education.

Students are trained in one of the following vocational areas: Hospitality, Office Skills, Production and Retail. They are also assessed in Key Skills which include Maltese, English, Mathematics, PSHE, IT, and Daily Living and Community Skills. A work placement experience within the College is also provided according to the vocational area being studied.', 2, 'literacy', 'south eastern', 'https://www.mcast.edu.mt/courses/pwa-01-18/', 40, 'Paola', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Learning Support Unit', '25987514', 'lsu@saidfamily.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1043, 'ICT for beginners', 'ICT for beginners', 1, 'digital_skills', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3542, 'Level 2 Communications for living and working ', 'Is reading writing or technology a problem?
Would you like to improve your skills?
The aim of this course is to help you become confident with reading, writing and computers.
The course will take the most basic reader and give them strategies to help cope:
 - Form filling
 - Spelling
 - Letter writing.
 - Reading for pleasure and for work.
 - Reading from a computer screen or tablet.
 - Smart technology

All classes are for adult learners with professional teachers to help you achieve your goal.
There will be a meeting to discuss your needs and set goals a brief assessment and then the rest is up to you.

This is a fun practical course that puts you in charge of your learning!', 2, 'literacy', 'Galway City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=309146', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, '328792', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3543, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

FET Centre Galway City: 091-567 660', 2, 'numeracy', 'Galway City', 'http://www.gabes.ie/literacy--numeracy', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3544, 'Level 2 Internet Skills', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your digital skills.

FET Centre Galway City: 091-567 660', 2, 'digital_skills', 'Galway City', 'http://www.gabes.ie/literacy--numeracy', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1187, NULL, 'Lett på nett med @nett

Et kurs i digitale ferdigheter', 4, 'digital_skills', 'Online', 'https://anett.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3545, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

FET Centre Galway City: 091-567 660', 3, 'literacy', 'Galway City', 'http://www.gabes.ie/literacy--numeracy', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3546, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

FET Centre Galway City: 091-567 660', 3, 'numeracy', 'Galway City', 'http://www.gabes.ie/literacy--numeracy', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3547, 'Level 3 Internet Skills', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your digital skills.

FET Centre Galway City: 091-567 660', 3, 'digital_skills', 'Galway City', 'http://www.gabes.ie/literacy--numeracy', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3548, 'Level 4 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

FET Centre Galway City: 091-567 660', 4, 'literacy', 'Galway City', 'http://www.gabes.ie/literacy--numeracy', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3549, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

FET Centre Galway City: 091-567 660', 4, 'numeracy', 'Galway City', 'http://www.gabes.ie/literacy--numeracy', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3550, 'Level 4 Internet Skills', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your digital skills.

FET Centre Galway City: 091-567 660', 4, 'digital_skills', 'Galway City', 'http://www.gabes.ie/literacy--numeracy', 1, 'Galway Adult Basic Education Service', NULL, NULL, 'Brendan Moriarty', '091-567660', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3551, 'Level 1 Reading, Writing and Spelling ', 'This programme aims to offer you: The chance to get back into learning and build your skills and confidence in key skills, including your reading and writing.

You will also be offered an initial assessment of your key skills in any or all the areas of:
o reading
o writing and spelling
o maths
o computers and other technology.', 1, 'literacy', 'Galway County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318595', 1, 'East Galway Adult Learning Centre.', NULL, NULL, 'Sheila Donnellan', '091 847850', NULL, '318595', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3887, 'Level 3 Maths', 'This is a level 3 Maths course. Once you are finished the course you can take an assessment to achieve a level 3 Minor Award Certificate in Mathematics from Quality and Qualifications Ireland (QQI).', 3, 'numeracy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1193, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 1, 'digital_skills', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1195, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 3, 'digital_skills', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1196, NULL, 'Øv på alle de grunnleggende ferdighetene gjennom læringsspillet KOMPIS.

Et spill fra Kompetanse Norge.', 4, 'digital_skills', 'Online', 'https://kompis.kompetansenorge.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1101, 'FC1-01-19 - Skills Kits', 'This course of studies gives the learners the opportunity to study at their own pace and explore different vocational areas. It is made up of a number of bite-sized courses ranging from vocational areas to personal skills and employability skills. Learners can choose the number and combination of Skills Kits they would like to study creating their own programme of studies. The Skills Kits include topics such as Hairdressing, Beauty and Developing Mobile Apps. Learners who successfully complete a Skills Kit are awarded a certificate. Learners who successfully complete 30 Skills Kits are awarded the MCAST Introductory Skills Certificate.', 2, 'literacy', 'south eastern', 'https://www.mcast.edu.mt/courses/fc1-01-19/', 40, 'Paola', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Learning Support Unit', '25987514', 'lsu@saidfamily.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1104, 'Award in Basic English - Level 1', 'Award in basic English I', 2, 'literacy', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Valletta', NULL, NULL, 'Melita Training and Resource Management Limited or Reggie Miller Foundation', '21497220 or 25679001', 'info@melitamanagement.com or pfenech@gwu.org.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1105, 'Award in Basic Numeracy - Level 1', 'Basic Numeracy I', 2, 'numeracy', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Valletta', NULL, NULL, 'Melita Training and Resource Management Limited or Reggie Miller Foundation', '21497220 or 25679002', 'info@melitamanagement.com or pfenech@gwu.org.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1106, 'Hiliet Bazici fil-Malti Komunikattiv: L-ewwel Livell', 'Basic skills in maltese I', 2, 'literacy', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Valletts', NULL, NULL, 'Melita Training and Resource Management Limited or Reggie Miller Foundation', '21497220 or 25679000', 'info@melitamanagement.com or pfenech@gwu.org.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1127, 'Award in Basic Literacy, Numeracy and Employability Skills', 'Basic Literacy in Maltese and English, Numeracy and Employability Skills', 3, 'literacy', 'south eastern', 'http://www.sgi.edu.mt/?page_id=530', 40, 'Floriana', NULL, NULL, 'FSS Ltd. or Jessica Micallef', '25905226', 'info@fssmalta.com or jmicallef@fss.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1128, 'Applied Basic Numeracy', 'Applied basic numeracy', 3, 'numeracy', 'south eastern', 'http://www.sgi.edu.mt/?page_id=530', 40, 'Floriana', NULL, NULL, 'FSS Ltd. or Jessica Micallef', '25905226', 'info@fssmalta.com or jmicallef@fss.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1217, NULL, 'Hva er karriereveiledning?

En karriereveiledningssamtale skal bidra til å gjøre deg bevisst på din kompetanse og dine muligheter. Vi fokuserer på å hjelpe deg til å bli klar over hvilke evner og interesser du har og hvilken kompetanse du har, eller kan utvikle, for å nå dine mål i arbeidslivet. Vi ønsker å bistå deg med å ta reflekterte jobb- og utdanningsvalg og kan være en nyttig sparringspartner for deg i denne prosessen.', 1, 'digital_skills', 'Hedmark', 'https://www.karrierehedmark.no/', 2, 'Torggata 72, 4. plan,
2317 Hamar.
Inngang fra Torggata
og én trapp opp.
Tilrettelagt for rullestolbrukere.', NULL, NULL, NULL, '62 54 40 40', 'veiledning@karrierehedmark.no', NULL, 'Mandag-fredag: kl. 08:00–15:30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1241, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 1, 'digital_skills', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1242, NULL, 'Ønsker du å skifte karriere, eller treng du bare ei kursendring? Er du ferdig med vidaregåande utdanning og er usikker på kva du skal gjere vidare? Vurderer du å bytte jobb, men er usikker på kva moglegheiter du har?

Ta kontakt med Karriere Møre og Romsdal. Vi tilbyr gratis karriererettleiing til alle vaksne i fylket.
Rettleiarane våre held til i Kristiansund, Surnadal, Sunndal, Molde, Åndalsnes, Stranda, Sykkylven, Ørskog, Ålesund og Volda.', 2, 'digital_skills', 'Møre og Romsdal', 'https://mrfylke.no/for-deg-som-er-innbyggar/karriere-moere-og-romsdal', 2, 'Fylkeshuset
Julsundvegen 9
6412 Molde', NULL, NULL, NULL, '71 28 03 75 or 957 53 645', 'hilde.meringdal@mrfylke.no', NULL, 'Måndag-fredag kl. 08.00 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1229, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 1, 'digital_skills', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1230, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 2, 'digital_skills', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3552, 'Level 1 Maths', 'This course aims to show you that you can learn and make progress with key skills, including your everyday maths.

You will work on any one or a combination of the following key skills;
Reading
Writing
Communications
ICT
Maths
Numeracy', 1, 'numeracy', 'Galway County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=208573', 1, 'Headford Adult Learners Centre.', NULL, NULL, 'Bridget Thompson', '093 34746', NULL, '208573', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1231, NULL, 'Karriere Oppland er Oppland fylkeskommunes tilbud om karriereveiledning og opplæring for voksne. Vi skal øke kompetansenivået til befolkningen i Oppland.

Ta utdanning der du bor
Vi har fem karrieresentre i Oppland. Her kan du ta videregående utdanning, fagskole og høgere utdanning, og få studie- og karriereveiledning.', 3, 'digital_skills', 'Oppland', 'http://www.karriereoppland.no', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1280, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 4, 'digital_skills', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3553, 'Level 1 Computers for Beginners ', 'This course is for anyone who wants to learn basic skills and would like to get familiar with using everyday technology e.g, smartphones, tablets, computers', 1, 'digital_skills', 'Galway County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=317870', 1, 'East Galway Adult Learning Centre.', NULL, NULL, 'Sheila Donnellan', '091 847850', NULL, '317870', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1129, 'Applied Basic Maltese', 'Applied basic Maltese', 3, 'literacy', 'south eastern', 'http://www.sgi.edu.mt/?page_id=530', 40, 'Floriana', NULL, NULL, 'FSS Ltd. or Jessica Micallef', '25905226', 'info@fssmalta.com or jmicallef@fss.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1047, 'Basic Digital Skills', 'Basic digital skills', 1, 'digital_skills', 'south eastern', 'http://www.sgi.edu.mt/?page_id=530', 40, 'Floriana', NULL, NULL, 'FSS Ltd. or Jessica Micallef', '25905226', 'info@fssmalta.com or jmicallef@fss.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1098, 'IT1-01-19 - Introductory Certificate in ICT', 'Introductory certificate in ICT: The Introductory Certificate in ICT offers knowledge in basic skills as well as knowledge in the fundamentals of computer systems and programming skills. The programme offers learners the necessary knowledge about the basic components that make up a computer system by being able to distinguish the different parts of a computer system, as well as learn about the software design phases and how to install hardware. Skills will be developed in how to design simple algorithms and simple computer programs.', 2, 'digital_skills', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Paola', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'MCAST', '23987100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1182, 'IT3-01-19 - Diploma in ICT', 'The Diploma in ICT is the first step in a block of a three-year training programme, designed to provide the necessary skills to work in the computing industry. At this level of study, learners will be introduced to fundamental subjects in the networking, software development, web development and multimedia areas. At the end of the course, learners will be able to use modern computer and multimedia systems and networks in the workplace.', 4, 'digital_skills', 'south eastern', 'https://www.mcast.edu.mt/courses/it3-01-19/', 40, 'Paola', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'MCAST', '23987100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1083, 'ICT for beginners', 'ICT for beginners', 2, 'digital_skills', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1094, 'VET Award Foundation in Digital Literacy Skills', 'VET award in digital literacy', 2, 'digital_skills', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3167', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201612', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1138, 'Award in Practical ICT Skills (This course is no longer in the syllabus but is mentioned to some companies)', 'Practical ICT Skills', 3, 'digital_skills', 'northern', NULL, 40, 'Mosta', NULL, NULL, 'Daniela Callus', '21433688', 'daniela.callus@domaingroup.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1167, 'ECDL Standard', 'ECDL Standard', 4, 'digital_skills', 'southern', 'Facebook page', 40, '94, Triq De Rohan,
Zebbug', NULL, NULL, NULL, '21462236 or 79462236', 'horizon2000computers@gmail.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1122, 'English MQF 2', 'English MQF 2', 3, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1253, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 1, 'digital_skills', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1254, NULL, 'Karrieresentrene tilbyr alle over 19 år veiledning i forhold til jobb og karriere, eksempelvis:

- Veiledning om valg av utdanning, yrke eller jobbskifte.
- Informasjon om rettigheter og muligheter i utdanningssystemet.
- Kartlegging og dokumentasjon av kompetanse.

Typiske kunder hos karrieresentrene er personer som enten står utenfor arbeidslivet, og ønsker hjelp til å finne ut hva de vil og hvordan de kan nå sitt yrkesmål, eller personer som ønsker å skifte retning eller innhold i yrkeslivet sitt.

Det er 9 Karrieresentre i Nordland. Kontaktinformasjon om de 9 sentrene finner du i linke.', 2, 'digital_skills', 'Nordland', 'http://www.karrierenordland.no/', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1265, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 1, 'digital_skills', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1266, NULL, 'Gratis veiledning om utdanning og arbeid
Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre jobbsituasjonen din?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi tilbyr gratis karriereveiledning til deg som er over 19 år og bor i Oslo.​', 2, 'digital_skills', 'Oslo', 'https://karriere.oslo.no/', 2, 'Karoline Kristiansens vei 8
0661 Oslo', NULL, NULL, NULL, '23 47 00 00', 'postmottak@ude.oslo.kommune.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1277, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 1, 'digital_skills', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1278, NULL, 'Karriereveiledning kan hjelpe deg å finne ut hvilken muligheter du har for å få jobb eller utdanning. Det finnes mange forskjellige karriereveiledningstilbud.

Våre tilbud om karriereveiledning gjelder alle innbyggerne i Rogaland og er gratis.', 2, 'digital_skills', 'Rogaland', 'https://www.rogfk.no/vare-tjenester/skole-og-opplaring/voksenopplaring-og-karriereveiledning/karrieresenter-rogaland/', 2, 'Fylkeshuset
Arkitekt Eckhoffsgate 1
4010 Stavanger', NULL, NULL, NULL, '51 51 66 00', 'carrieresenter-rogaland@rogfk.no', NULL, 'Mandag - fredag kl. 07.45 - 15.30');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1086, 'City & Guilds Entry Level Certificate In English Skills (Entry 3) (Ofqual no: 600/7591/0)', 'Certificate in English Skills Leve1 1', 2, 'literacy', 'central', 'https://promotion.learnkey.com.mt/', 40, 'Birkirkara', NULL, NULL, 'Learnkey Training Institute', '21443140', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1123, 'English as a Foreign Language', 'English as a Foregin Language 2', 3, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1124, 'Maths MQF 2', 'Mathematics MQF 2', 3, 'numeracy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1055, 'Elementary Award in English as a Second or Other Language (ESOL)', 'Elementary Award in English as a Second or Other Language', 1, 'literacy', 'northern', 'https://promotion.learnkey.com.mt/', 40, 'Mosta', NULL, NULL, 'ESaT LTD', '79385856', 'info@esatmalta.org', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1042, 'Maths MQF 1', 'MAthematics MQF 1', 1, 'numeracy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1044, 'Award in Maltese', 'Basic Skills in Maltese Literacy I', 1, 'literacy', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1141, 'MG2I-C0457 - Maltese for Foreigners', 'Maltese for Foreigners (B1/B2)', 3, 'literacy', 'south eastern', 'https://www.mcast.edu.mt/wp-content/uploads/Part-time-prospectus-2020-low-res-for-email.pdf', 40, 'Paola', NULL, '2020-03-31 00:00:00+00', 'MCAST', '23987777', 'shortcourses@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1164, 'ECDL', 'ECDL', 4, 'digital_skills', 'Online', 'http://lifelonglearning.gov.mt/wp-content/uploads/2019/07/FINAL-Lifelong-Learning-2019_2020_web-1.pdf', 40, NULL, '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Life long learning', '153', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1169, 'City and Guilds Level 2 Certificate in English Skills (ofqual no: 600/7594/6)', 'Certificate in English Skills Level 3', 4, 'literacy', 'central', 'https://promotion.learnkey.com.mt/', 40, 'Birkirkara', NULL, NULL, 'Learnkey Training Institute', '21443140', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1088, 'Award in Introduction to Maltese for Foreigners (Institute not sure whether the course will run again.)', 'Introduction to Maltese for Foreigners', 2, 'literacy', 'south eastern', 'Facebook page', 40, 'Floriana', NULL, NULL, 'St Thomas institute', '21227799', 'info@stthomasmalta.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1059, 'PWA-01-18 - Award in Vocational Skills (Introductory A)', 'The Award in Vocational Skills supports students with learning disabilities / learning difficulties to acquire the skills required to gain and maintain employment or to further their education.

Students are trained in one of the following vocational areas: Hospitality, Office Skills, Production and Retail. They are also assessed in Key Skills which include Maltese, English, Mathematics, PSHE, IT, and Daily Living and Community Skills. A work placement experience within the College is also provided according to the vocational area being studied.', 1, 'literacy', 'south eastern', 'https://www.mcast.edu.mt/courses/pwa-01-18/', 40, 'Paola', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Learning Support Unit', '25987514', 'lsu@saidfamily.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1060, 'PWB-01-18 - Award in Vocational Skills (Introductory B)', 'The Award in Vocational Skills is a programme of study following the MCAST Award in Vocational Skills – Introductory A that helps students with learning disabilities / learning difficulties consolidate the skills necessary to gain and maintain employment or to further their education. Students will have the opportunity to further their studies in the vocational area chosen in the MCAST Award in Vocational Skills – Introductory A, which are Hospitality, Office Skills, and Production and Retail. They will also focus on Key Skills which include Maltese, English, Mathematics, PSHE, IT, and Daily Living and Community Skills. A work placement experience in industry is also provided according to the vocational area being studied.', 1, 'literacy', 'south eastern', 'https://www.mcast.edu.mt/courses/pwb-01-18/', 40, 'Paola', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Learning Support Unit', '25987514', 'lsu@saidfamily.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1301, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 1, 'digital_skills', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1302, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 2, 'digital_skills', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1303, NULL, 'Karriere- eller gründerveiledning
– noe for deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. Alle over 19 år i Troms fylke kan benytte våre tilbud.

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva du passer til?
Tenker du å starte egen bedrift?', 3, 'digital_skills', 'Troms', 'http://www.karrieretroms.no', 2, 'Grønnegata 122
9010 Tromsø', NULL, NULL, NULL, '77 68 70 50', NULL, NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1313, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 1, 'digital_skills', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1314, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 2, 'digital_skills', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3554, 'Reading and Writing: One to One Support', 'This course aims to show you that you can learn and make progress with key skills.
You will work on any one or a combination of the following key skills;
Reading
Writing
Communications
ICT
Maths
Numeracy', 2, 'literacy', 'Galway County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=208573', 1, 'Headford Adult Learners Centre.', NULL, NULL, 'Bridget Thompson', '093 34746', NULL, '208573', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1315, NULL, 'Karriereveiledning – noe for deg?

Vurderer du å ta utdanning eller søke jobb?
Ønsker du å endre din jobbsituasjon?
Er du usikker på hvilke muligheter du har?
Lurer du på hva som passer deg?
Vi er et offentlig karrieresenter som gir gratis veiledning knyttet til utdanning og arbeid. I tillegg til individuell karriereveiledning tilbyr vi Gratis kurs.

Alle over 19 år kan benytte våre tilbud. Vi er også et ressurs- og kompetansesenter for deg som jobber med veiledning.', 3, 'digital_skills', 'Trøndelag', 'https://karrieretrondelag.no/', 2, NULL, NULL, NULL, NULL, '74 17 40 00', 'postmottak.karrieresenteret@trondelagfylke.no', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1325, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 1, 'digital_skills', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1326, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 2, 'digital_skills', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1327, NULL, 'Karriererettleiing for vaksne

Ønskjer du nokon å snakke med om jobb eller utdanning? Karriere Vestland tilbyr gratis karriererettleiing til alle vaksne over 19 år.', 3, 'digital_skills', 'Vestland', 'https://www.vestlandfylke.no/utdanning-og-karriere/karriere-vestland/', 2, NULL, NULL, NULL, NULL, '+47 05557', 'post@vlfk.no', NULL, 'Mandag-fredag kl. 08.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3555, 'Level 2 Maths', 'This course aims to show you that you can learn and make progress with key skills.
You will work on any one or a combination of the following key skills;
Reading
Writing
Communications
ICT
Maths
Numeracy', 2, 'numeracy', 'Galway County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=208573', 1, 'Headford Adult Learners Centre.', NULL, NULL, 'Bridget Thompson', '093 34746', NULL, '208573', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3556, 'Level 2 Computer Skills', 'This course aims to show you that you can learn and make progress with key skills.
You will work on any one or a combination of the following key skills;
Reading
Writing
Communications
ICT
Maths
Numeracy', 2, 'digital_skills', 'Galway County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=208573', 1, 'Headford Adult Learners Centre.', NULL, NULL, 'Bridget Thompson', '093 34746', NULL, '208573', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1100, 'PWB-01-18 - Award in Vocational Skills (Introductory B)', 'The Award in Vocational Skills is a programme of study following the MCAST Award in Vocational Skills – Introductory A that helps students with learning disabilities / learning difficulties consolidate the skills necessary to gain and maintain employment or to further their education. Students will have the opportunity to further their studies in the vocational area chosen in the MCAST Award in Vocational Skills – Introductory A, which are Hospitality, Office Skills, and Production and Retail. They will also focus on Key Skills which include Maltese, English, Mathematics, PSHE, IT, and Daily Living and Community Skills. A work placement experience in industry is also provided according to the vocational area being studied.', 2, 'literacy', 'south eastern', 'https://www.mcast.edu.mt/courses/pwb-01-18/', 40, 'Paola', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'Learning Support Unit', '25987514', 'lsu@saidfamily.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1143, 'Award in Basic Numeracy - Level 2', 'Basic Numeracy II', 3, 'numeracy', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Valletta', NULL, NULL, 'Melita Training and Resource Management Limited or Reggie Miller Foundation', '21497220 or 25679003', 'info@melitamanagement.com or pfenech@gwu.org.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1144, 'Hiliet Bazici fil-Malti Komunikattiv:It-Tieni Livell', 'Basic skills in maltese II', 3, 'literacy', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Valletta', NULL, NULL, 'Melita Training and Resource Management Limited or Reggie Miller Foundation', '21497220 or 25679004', 'info@melitamanagement.com or pfenech@gwu.org.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1361, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 1, 'digital_skills', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1362, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 2, 'digital_skills', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1363, NULL, 'Karrieresenter Telemark tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan', 3, 'digital_skills', 'Telemark', 'http://www.karrieresentertelemark.no/', 2, 'Telemarksgata 10, ved Handelstorget i Skien
3724 Skien', NULL, NULL, NULL, '35 91 71 70', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1349, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 1, 'digital_skills', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3557, 'Level 3 Communications', 'On this course, you will learn a broad range of communication skills relevant to vocational and personal development. Topics covered include communication technology, various types of professional and personal writing, effective reading and non-verbal communication', 3, 'literacy', 'Galway County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=309146', 1, 'Adult Learner Centre, Moycullen.', NULL, NULL, 'Siobhan Phinney', '091 555877', NULL, '316220', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1337, NULL, 'Karriereveiledning
Ønsker du en samtale om dine utdanningsmuligheter og karriere?

Du kan få gratis karriereveiledning hvis du

- er bosatt i Viken
- er over 19 år og ikke tilknyttet en skole
- er usikker på hva du passer til og vil trives med
- er usikker på hvilke muligheter som finnes i utdanningsløp og arbeidsliv
- ønsker å endre din jobbsituasjon

Hva kan du få hjelp med?

- Reflektere over dine ønsker, behov, interesser og forutsetninger
- Kartlegge dine interesser og din kompetanse
CV, søknad og intervju
- Veiledning og informasjon om utdanningsmuligheter', 1, 'digital_skills', 'Viken', 'https://viken.no/tjenester/skole-og-opplaring/opplaring-som-voksen/karriereveiledning/', 2, NULL, NULL, NULL, NULL, '32 30 00 00', 'post@viken.no', NULL, 'Mandag - fredag kl. 07.00 - 15.45');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3558, 'Level 3 Maths', 'Rang tacaíochta Mata.
Mata a bhíonn in úsáid sa gnáthshaol. Tá an chúrsa seo úsáideach do dhaoine atá ag iarraidh cúnamh a thabhairt do phaistí scoile le obair scoile.

Small group support which builds skills and confidence in everyday maths, people will find it very useful in helping children with maths school work.', 3, 'numeracy', 'Galway County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306849', 1, 'Ionad Foghlama Casla', NULL, NULL, 'Neasa de Bhailis', '091 506060', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3559, 'Level 3 Computer Skills', 'The aim of this two year part-time programme is to introduce the Learner to the world of Information and Communication Technologies in a classroom based setting. Learners will use some of the most commonly available software applications to complete personally relevant tasks.

Learners will also be given the opportunity to improve their reading, writing and numeracy skills, under the umbrella theme of learning about information and communication technologies', 3, 'digital_skills', 'Galway County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320877', 1, 'Ballinasloe College of Further Education', NULL, NULL, 'Bridie Dolan', '090 9643479', NULL, '208573', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1145, 'Applied Basic English - Level 2', 'Applied basic english II', 3, 'literacy', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Valletta', NULL, NULL, 'Melita Training and Resource Management Limited or Reggie Miller Foundation', '21497220 or 25679005', 'info@melitamanagement.com or pfenech@gwu.org.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1350, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 2, 'digital_skills', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1351, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 3, 'digital_skills', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1352, NULL, 'Karriereveiledning – noe for deg?
Karrieresenteret Vestfold tilbyr gratis, individuell karriereveiledning til voksne og ungdom over 19 år. I løpet av yrkeslivet vil mange stå overfor flere karrierevalg som kan være utfordrende. Vi kan bevisstgjøre deg på hva du vil, hvem du er og hva du kan.', 4, 'digital_skills', 'Vestfold', 'http://www.karrierevestfold.no/', 2, NULL, NULL, NULL, NULL, '33 38 08 83', 'post@karrierevestfold.no', NULL, 'Mandag-fredag
kl. 09.00-15.00');
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1147, 'Award in Basic Literacy, Numeracy, Digital and Life Skills (Available on request only)', 'Basic Literacy, Numeracy, Digital and Life Skills', 3, 'literacy', 'south eastern', NULL, 40, 'Valletta', NULL, NULL, 'NOVARIC Academy', '27112206', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1148, 'Award in Basic Literacy, Numeracy, Digital and Life Skills (Available on request only)', 'Basic Literacy, Numeracy, Digital and Life Skills', 3, 'numeracy', 'south eastern', NULL, 40, 'Valletta', NULL, NULL, 'NOVARIC Academy', '27112206', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1140, 'IT2-01-19 - Foundation Certificate in ICT', 'The Foundation Certificate in ICT offers knowledge in basic skills as well as knowledge in the fundamentals of computer systems, programming skills, computer graphics, and the creating of an ICT project.', 3, 'digital_skills', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Paola', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'MCAST', '23987100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1146, 'ICT - Fundamental IT skills at the work place', 'ICT - Fundamental IT skills at the work place (level 2)', 3, 'digital_skills', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Valletta', NULL, NULL, 'Melita Training and Resource Management Limited or Reggie Miller Foundation', '21497220 or 25679006', 'info@melitamanagement.com or pfenech@gwu.org.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1149, 'Award in Basic Literacy, Numeracy, Digital and Life Skills (Available on request only)', 'Basic Literacy, Numeracy, Digital and Life Skills', 3, 'digital_skills', 'south eastern', NULL, 40, 'Valletta', NULL, NULL, 'NOVARIC Academy', '27112206', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1183, 'ICT - Fundamental IT skills at the work place', 'ICT - Fundamental IT skills at the work place (level 3)', 4, 'digital_skills', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Valletta', NULL, NULL, 'Melita Training and Resource Management Limited or Reggie Miller Foundation', '21497220 or 25679007', 'info@melitamanagement.com or pfenech@gwu.org.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1131, 'IT3-01-19G - Diploma in ICT', 'The Diploma in ICT is the first step in a block of a three-year training programme, designed to provide the necessary skills to work in the computing industry. At this level of study, learners will be introduced to fundamental subjects in the networking, software development, web development and multimedia areas. At the end of the course, learners will be able to use modern computer and multimedia systems and networks in the workplace.', 3, 'digital_skills', 'gozo', 'https://www.mcast.edu.mt/courses/it3-01-19g/', 40, 'Gozo Campus (Ghajnsielem)', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'MCAST', '23987665', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1168, '***ECDL Core', 'ECDL Core', 4, 'digital_skills', 'central', 'https://learnkey.com.mt/learnkey-courses/information-technology/ecdl/', 40, 'Birkirkara', NULL, NULL, 'Learnkey Training Institute', '21443140', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1170, 'ECDL Base Module: Computer Essentials', 'ECDL: Computer Essentional', 4, 'digital_skills', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3171', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201612', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1176, 'ECDL Standard Module: Web Editing', 'ECDL: Web Editing', 4, 'digital_skills', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3166', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201612', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1177, 'ECDL Standard Module: Image Editing', 'ECDL: Image Editing', 4, 'digital_skills', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3162', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201612', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1178, 'ECDL Standard Module: IT Security', 'ECDL: IT Security', 4, 'digital_skills', 'southern', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=3163', 40, 'Hal Far', NULL, NULL, 'Jobs plus', '22201612', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1179, '***ECDL Core ( 7 Core Modules)', 'Ecdl Stardard', 4, 'digital_skills', 'northern', 'http://domainacademy.edu.mt/courses/ict-computing/ecdl-standard/', 40, 'Mosta', NULL, NULL, 'Daniela Callus', '21433688', 'daniela.callus@domaingroup.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1058, 'IT1-01-19 - Introductory Certificate in ICT', 'Introductory certificate in ICT: The Introductory Certificate in ICT offers knowledge in basic skills as well as knowledge in the fundamentals of computer systems and programming skills. The programme offers learners the necessary knowledge about the basic components that make up a computer system by being able to distinguish the different parts of a computer system, as well as learn about the software design phases and how to install hardware. Skills will be developed in how to design simple algorithms and simple computer programs.', 1, 'digital_skills', 'south eastern', 'https://www.melitamanagement.com/courses', 40, 'Paola', '2020-07-31 00:00:00+00', '2020-08-31 00:00:00+00', 'MCAST', '23987100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1087, 'Basic Digital Skills', 'Basic digital skills', 2, 'digital_skills', 'south eastern', 'http://www.sgi.edu.mt/?page_id=530', 40, 'Floriana', NULL, NULL, 'FSS Ltd. or Jessica Micallef', '25905226', 'info@fssmalta.com or jmicallef@fss.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1181, 'MG2I-C0106 - Computer Technician Course', 'Computer Technician Course', 4, 'digital_skills', 'south eastern', 'https://www.mcast.edu.mt/wp-content/uploads/Part-time-prospectus-2020-low-res-for-email.pdf', 40, 'Paola', NULL, '2020-03-31 00:00:00+00', 'MCAST', '23987777', 'shortcourses@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (975, 'Learn with NALA - Level 3 Maths', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.

We will help you improve your old skills but you will also gain the confidence to learn new ones.

Call us today on 1800 20 20 65 to chat about your options.', 3, 'numeracy', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 50, NULL, NULL, NULL, NULL, '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (976, 'Learn with NALA - Level 3 Reading and Writing', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.

We will help you improve your old skills but you will also gain the confidence to learn new ones.

Call us today on 1800 20 20 65 to chat about your options.', 3, 'literacy', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 50, NULL, NULL, NULL, 'NALA', '1802 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (978, 'Learn with NALA - Level 4 Maths', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.

We will help you improve your old skills but you will also gain the confidence to learn new ones.

Call us today on 1800 20 20 65 to chat about your options.', 4, 'numeracy', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 50, NULL, NULL, NULL, 'NALA', '1804 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (979, 'Learn with NALA - Level 4 Reading and Writing', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.

We will help you improve your old skills but you will also gain the confidence to learn new ones.

Call us today on 1800 20 20 65 to chat about your options.', 4, 'literacy', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 50, NULL, NULL, NULL, 'NALA', '1805 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (967, 'Learn with NALA - Level 1 Maths', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.

We will help you improve your old skills but you will also gain the confidence to learn new ones.

Call us today on 1800 20 20 65 to chat about your options.', 1, 'numeracy', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 50, NULL, NULL, NULL, 'NALA', '1800 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (969, 'Learn with NALA - Level 1 Using Technology', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.

We will help you improve your old skills but you will also gain the confidence to learn new ones.

Call us today on 1800 20 20 65 to chat about your options.', 1, 'digital_skills', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 50, NULL, NULL, NULL, 'NALA', '1802 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1002, 'Level 2 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Ballyfermot Adult Literacy Centre: 01-623 9716
Crumlin Adult Literacy Centre: 01-4547054
Ringsend Adult Education Service: 01-6684571
Liberties Adult Education Service: 01-4540759', 2, 'literacy', 'dublin', NULL, 50, 'Dublin South', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1004, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Ballyfermot Adult Literacy Centre: 01-623 9716
Crumlin Adult Literacy Centre: 01-4547054
Ringend Adult Education Service: 01-6684571
Liberties Adult Education Service: 01-4540759', 3, 'numeracy', 'dublin', NULL, 50, 'Dublin South', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1005, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Ballyfermot Adult Literacy Centre: 01-623 9716
Crumlin Adult Literacy Centre: 01-4547054
Ringsend Adult Education Service: 01-6684571
Liberties Adult Education Service: 01-4540759', 3, 'literacy', 'dublin', NULL, 50, 'Dublin South', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1007, 'Level 4 - Return to Learning', 'This is a part time course for adults who have left school early or who are out of the education system for a long time and who would like to improve their basic skills. The course provides a strong foundation for learners who would like to progress to further study at QQI Level 5. The course takes place two days per week and leads to a QQI Level 4 Component Award.', 4, 'numeracy', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=290432', 50, 'Dublin South', NULL, '2020-09-20 00:00:00+00', 'Kathleen Campbell', '01-4572300', NULL, '290432', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (989, 'Level 3 Reading and Writing', 'This programme aims to offer you:

• The chance to get back into learning and build your skills and confidence in key skills.

• An initial assessment of your key skills in any or all the areas of:

o reading
o writing and spelling
o maths
o computers and other technology.

This assessment is to give you more information on:

• what you can already do, but perhaps aren’t confident in

• what you need to work on to be more confident in everyday or new situations
for work, family or other settings.

• An opportunity to use or practise key skills in everyday life.
• The chance to get ready to start working towards a qualification by working on the gaps or blocks you might have that hold you back.

• Teaching that is interesting, adult-friendly and that encourages you to learn by thinking about and discussing your own ideas and opinions.', 3, 'literacy', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=291008', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Beti Marinescu', '01-8212829', NULL, '291008', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1008, 'Level 4 - Return to Learning', 'This is a part time course for adults who have left school early or who are out of the education system for a long time and who would like to improve their basic skills. The course provides a strong foundation for learners who would like to progress to further study at QQI Level 5. The course takes place two days per week and leads to a QQI Level 4 Component Award.', 4, 'literacy', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=290432', 50, 'Dublin South', NULL, '2020-09-20 00:00:00+00', 'Kathleen Campbell', '01-4572300', NULL, '290432', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1011, 'Level 1 Maths', 'This programme aims to offer you:

• The chance to get back into learning and build your skills and confidence in key skills.

• An initial assessment of your key skills in any or all the areas of:

o reading
o writing and spelling
o maths
o computers and other technology.

This assessment is to give you more information on:

• what you can already do, but perhaps aren’t confident in

• what you need to work on to be more confident in everyday or new situations
for work, family or other settings.

• An opportunity to use or practise key skills in everyday life.

• Opportunities to be more confident by using key skills in new or different situations.

• The chance to get ready to start working towards a qualification by working on
the gaps or blocks you might have that hold you back.

• Teaching that is interesting, adult-friendly and that encourages you to learn by
thinking about and discussing your own ideas and opinions.

• Teaching that focusses on what you need for your everyday life.', 1, 'numeracy', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=292310', 50, 'Limerick City', NULL, '2020-12-20 00:00:00+00', 'Mary Dunne', '061-445725', NULL, '292310', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1012, 'Level 1 Reading', 'This course will help you to develop your skills in reading, writing, listening, speaking and numbers.', 1, 'literacy', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=276481', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Geraldine O''Reilly', '061-445740', NULL, '276481', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1014, 'Level 2 Cooking and baking to develop your Maths skills', 'This course is for those who would like to develop their maths skills through cooking and baking. There is a practical aspect to the course that will aim to develop your cooking and baking skills while giving you the opportunity to improve your maths skills.', 2, 'numeracy', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=276423', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Geraldine O''Reilly', '061-445740', NULL, '276423', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1015, 'Level 2 Maths', 'This programme is for those who would like to improve their basic maths skills.

You’ll also be able to:

• Decide what you need to work on in the next course or class you go on to.

• Judge what kind of teaching helps you the most. This might help you decide what you want to do next.

• Work in a group with other adults who are there for the same reasons as you.

• Put into practice what you have learned so that you can be more confident in everyday new situations.', 2, 'numeracy', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=276487', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Geraldine O''Reilly', '061-445740', NULL, '276487', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1016, 'Level 2 Reading', 'This programme is for those who would like to improve their reading skills.

You’ll also be able to:

• Decide what you need to work on in the next course or class you go on to.

• Judge what kind of teaching helps you the most. This might help you decide what you want to do next.

• Work in a group with other adults who are there for the same reasons as you.

• Put into practice what you have learned so that you can be more confident in everyday new situations.', 2, 'literacy', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=277282', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Lorraine Markham', '061-445746', NULL, '277282', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1018, 'Level 3 Maths', 'This part time course will help you to develop the relevant knowledge and skill to use a range of skills and tools, under direction and with limited autonomy, in familiar situations.

For more information get in touch today.', 3, 'numeracy', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=276322', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Geraldine O''Reilly', '061-445740', NULL, '276322', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1019, 'Level 3 Communications', 'This course is for you if you would like to learn a range of communication skills for use in formal and informal situations and if you would like to increase your level of competence and confidence in everyday/work life.

The course will focus on improving reading, writing and spelling skills, as well as developing the necessary knowledge to go on-line to find information and use an email account confidently. This course will build learner confidence and encourage personal development and goal setting. This course also provides a basis for further progression. It involves a mix of classroom learning and practical activities in an engaging and interactive learning environment.

Courses at Level 3 are focused on building your literacy skills, and your confidence and developing your essential skills for life.', 3, 'literacy', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=277544', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Geraldine O''Reilly', '061-445740', NULL, '277544', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1022, 'Level 4 Maths', 'This course is for you if you would like to improve your mathematical knowledge and skills and learn how to apply these in a variety of contexts. It involves a mix of classroom learning and practical activities in an engaging and interactive learning environment.

At Level 4 the focus is on work, employability or preparing you to progress into further learning.', 4, 'numeracy', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=276339', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Geraldine O''Reilly', '061-1445740', NULL, '276339', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1023, 'Level 4 Communications', 'This course is for you if you have a keen interest in learning the skills needed for effective communication including written, oral, and interpersonal skills, in the context of everyday work and personal life. It involves a mix of classroom learning and practical activities in an engaging and interactive learning environment.

At Level 4 the focus is on work, employability or preparing you to progress into further learning.', 4, 'literacy', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=276340', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Geraldine O''Reilly', '061-1445740', NULL, '276340', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1027, 'Level 1 Reading', 'This course will give you the opportunity to develop your reading and writing skills. No experience or education required.', 1, 'literacy', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=296671', 50, 'Cork City', NULL, '2020-09-20 00:00:00+00', 'Fiona Long', '021-455 3180', NULL, '296671', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1028, 'Level 1 Maths', 'This programme will help you to gain a solid understanding of the basic concepts and language of maths and how to apply this to everyday life. How to budget and manage your money.', 1, 'numeracy', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=292116', 50, 'Cork City', NULL, '2020-10-20 00:00:00+00', 'Frances McInerney', '086-8238757', NULL, '292116', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1030, 'Level 2 Reading and Writing', 'The aim of this programme is multi purpose. The knowledge, skill and competence acquired on this programme are relevant to personal development and participation in society, community and employment and provides a basis for further progression. The programme will hellp you develop your basic knowledge, skills and competencies in maths, reading and writing.', 2, 'literacy', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=296668', 50, 'Cork City', NULL, '2020-09-20 00:00:00+00', 'Margie O''Riordan', '021-455 3180', NULL, '296668', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (983, 'Level 1 Computer Skills Basics', 'This course is designed for beginners and you will learn about the following 4 areas of IT:
- Computer Basics
- Introduction to the Desktop
- The World Wide Web
- Email

For more information call us today on 01-8140200.', 1, 'digital_skills', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=297008', 50, 'Dublin North', NULL, '2020-10-20 00:00:00+00', NULL, '01-8140200', NULL, '297008', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (984, 'Level 1 An Introduction to Computers', 'This is a part time course in Ballymun which will help you to improve your basic skills.

For further information please call Christine Carroll on 01 8622402.', 1, 'digital_skills', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=280445', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Christine Carroll', '01-8622402', NULL, '280445', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (987, 'Level 2 Communications and Computers', 'This course aims to equip you with a range of skills for use in social, personal and work life and to encourage you to have the confidence to use these skills in your daily life.

Please contact us for further information at 01-5585199.', 2, 'digital_skills', 'dublin', NULL, 50, 'Dublin North', NULL, NULL, 'Jacqui Crowther', '01-5585199', NULL, '286799', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (990, 'Level 3 Computer and Internet Skills', 'Develop the relevant computer and internet skills, using a range of skills and tools. Use these new skills to participate in and contribute to modern society, to pursue a range of employment opportunities or to progress to further education or training.

For more information please get in touch with us today.', 3, 'digital_skills', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=281171', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Christine Carroll', '01-8622402', NULL, '281171', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (991, 'Level 3 Word Processing and Internet Skills', 'This is a part time course in Ballymun. You will be able to develop the
relevant knowledge and skill to use a range of skills and tools, under direction and with limited autonomy, in familiar situations.

This course will help you to participate in and contribute to modern society, to pursue a range of employment opportunities or to progress to further
education or training.

For further information please call Christine Carroll on 01 8622402.', 3, 'digital_skills', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=280452', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Christine Carroll', '01-8622402', NULL, '280452', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (995, 'Level 4 Back to Education', 'This programme welcomes back learners who may have taken a break from education for some time. It will equip you with basic computer skills and build your confidence to participate in a College environment.', 4, 'digital_skills', 'dublin', 'https://www.grangecc.com/bteiback-to-education-1', 50, 'Dublin North', NULL, '2020-10-20 00:00:00+00', 'Sheelah Biggs', '01-8471422', NULL, '294600', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (996, 'Level 4 Information Technology', 'This is a part time course in Ballymun. The aim of this programme is to enable you to develop the relevant knowledge, skill and competence in a broad range of personal skills which enable personal development and active citizenship, and/or to progress to employment and/or further education or training.', 4, 'digital_skills', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=281719', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Christine Carroll', '01-8622402', NULL, '281719', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (997, 'Level 4 Information and Communications Technology', 'The aim of this programme is to help you to develop the knowledge, skills and competence in a broad range of information and communication technology which enable employment, under direct supervision, in a variety of information and communications technology sectors, or progression to further education or training.', 4, 'digital_skills', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=284429', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Beti Marinescu', '01-8212829', NULL, '284429', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1000, 'Level 1 Computer Skills Basics', 'This evening course is in Ballyfermot and is designed for beginners and you will learn about the following 4 areas of IT:
- Computer Basics
- Introduction to the Desktop
- The World Wide Web
- Email

For more information call us today on 01-8140200.', 1, 'digital_skills', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=297112', 50, 'Dublin South', NULL, '2020-11-20 00:00:00+00', NULL, '01-6055900', NULL, '297112', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1003, 'Level 2 Computer Skills', 'Get in touch with your local Adult Literacy Centre and find a computer course that will help improve your skills.

Ballyfermot Adult Literacy Centre: 01-623 9716
Crumlin Adult Literacy Centre: 01-4547054
Ringend Adult Education Service: 01-6684571
Liberties Adult Education Service: 01-4540759', 2, 'digital_skills', 'dublin', NULL, 50, 'Dublin South', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1006, 'Level 3 Computer Skills', 'Get in touch with your local Adult Literacy Centre and find a computer course that will help improve your skills.

Ballyfermot Adult Literacy Centre: 01-623 9716
Crumlin Adult Literacy Centre: 01-4547054
Ringend Adult Education Service: 01-6684571
Liberties Adult Education Service: 01-4540759', 3, 'digital_skills', 'dublin', NULL, 50, 'Dublin South', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1009, 'Level 4 - Return to Learning', 'This is a part time course for adults who have left school early or who are out of the education system for a long time and who would like to improve their basic skills. The course provides a strong foundation for learners who would like to progress to further study at QQI Level 5. The course takes place two days per week and leads to a QQI Level 4 Component Award.', 4, 'digital_skills', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=290432', 50, 'Dublin South', NULL, '2020-09-20 00:00:00+00', 'Kathleen Campbell', '01-4572300', NULL, '290432', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1010, 'Level 4 Computer Applications', 'This course takes place in Pearse College, Crumlin, D12. This part-time course offers you a real opportunity to re-skill and up-skill.', 4, 'digital_skills', 'dublin', 'https://pearsecollege.ie/flexi-fours/#1535034225248-d52fff17-7381', 50, 'Dublin South', NULL, '2020-01-21 00:00:00+00', NULL, '01-4536661', NULL, '291211', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1013, 'Level 1 Reading and Writing through Computers', 'The aim of this programme is multi purpose. The knowledge, skill and competence acquired on this programme are relevant to personal development and participation in society, community and employment and provides a basis for further progression. The programme covers the acquirement of basic knowledge, skills and competencies in a narrow range of fields of learning including key outcomes in literacy and computers.', 1, 'digital_skills', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=277292', 50, 'Limerick City', NULL, '2020-10-20 00:00:00+00', 'Lorraine Markham', '061-445746', NULL, '277292', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1017, 'Level 2 Using Technology', 'The aim of this programme is to develop your basic skills and knowledge to access and operate a computer with confidence.

The knowledge, skill and competence acquired on this programme are relevant to personal development and participation in society, community and employment and provides a basis for further progression.', 2, 'digital_skills', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=276375', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Geraldine O''Reilly', '061-445740', NULL, '276375', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1020, 'Level 3 Internet and Email Skills', 'This course will help you develop the skills, knowledge and competencies in a broad range of information and communication technology which will enable employment, under direct supervision, in a variety of information and communications technology sectors, or progression to further education or training.', 3, 'digital_skills', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=276420', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Geraldine O''Reilly', '061-1445740', NULL, '276420', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1021, 'Level 3 Digital Media', 'This course is for adults who want to improve their digital media skills. It will help you to develop the skills, knowledge and competencies in a broad range of information and communication technology which will enable employment, under direct supervision, in a variety of information and communications technology sectors, or progression to further education or training.', 3, 'digital_skills', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=276321', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Geraldine O''Reilly', '061-1445740', NULL, '276321', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1024, 'Level 4 Information Technology Skills', 'This course will help you develop the skills, knowledge and competencies in a broad range of information and communication technology which will enable employment, under direct supervision, in a variety of information and communications technology sectors, or progression to further education or training.', 4, 'digital_skills', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=278646', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Máire Kerrane', '061-445794', NULL, '278646', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1025, 'Level 4 Information Technology Skills', 'This course will help you develop the skills, knowledge and competencies in a broad range of information and communication technology which will enable employment, under direct supervision, in a variety of information and communications technology sectors, or progression to further education or training.', 4, 'digital_skills', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=276326', 50, 'Limerick City', NULL, '2020-10-20 00:00:00+00', 'Geraldine O''Reilly', '061-1445740', NULL, '276326', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1026, 'Level 4 Word Processing', 'This course will help you to develop the knowledge, skills and competence in a broad range of information and communication technology which enable employment, under direct supervision, in a variety of information and communications technology sectors, or progression to further education or training.', 4, 'digital_skills', 'limerick', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=276320', 50, 'Limerick City', NULL, '2020-09-20 00:00:00+00', 'Geraldine O''Reilly', '061-1445740', NULL, '276320', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1029, 'Level 1 Computers', 'Learn how to use the keyboard and mouse. Use word for typing and creating documents and how to use Internet & Email. This programme is for anyone who is new to computers or wants to gain more confidence in using a computer.', 1, 'digital_skills', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=292017', 50, 'Cork City', NULL, '2020-09-20 00:00:00+00', 'Frances McInerney', '086-8238757', NULL, '292017', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1035, 'Level 3 Computers', 'On completion of this programme you will have the skills, knowledge and competencies to use a range of information and communication technologies, under direction and with limited autonomy, in familiar situations. It enables the learner to pursue a range of employment opportunities or to progress to further education or training.', 3, 'digital_skills', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=280749', 50, 'Cork City', NULL, '2020-09-20 00:00:00+00', 'Susan Shannon', '021-4856257', NULL, '280749', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1036, 'Level 3 Computers', 'On completion of this programme you will have the skills, knowledge and competencies to use a range of information and communication technologies, under direction and with limited autonomy, in familiar situations. It enables the learner to pursue a range of employment opportunities or to progress to further education or training.', 3, 'digital_skills', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=279617', 50, 'Cork City', NULL, '2020-09-20 00:00:00+00', 'Alan Craughwell', '021-4643421', NULL, '279617', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1039, 'Level 4 Computer Applications', 'The aim of this programme is to help you develop the knowledge, skills and competence in a broad range of information and communication technology which enable employment, under direct supervision, in a variety of information and communications technology sectors, or progression to further education or training.', 4, 'digital_skills', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=279322', 50, 'Cork City', NULL, '2020-09-20 00:00:00+00', 'Ger Brennan', '021 4255500', NULL, '279322', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3560, 'Level 4 Communications', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading, writing and communication skills.

Galway City Adult Learning Centre: 091-567 660
Ionad Foghlama: 091-506 060
East Galway Adult Learning Centre: 091-847 850
North Galway Adult Learning Centre: 093 347 46
Tuam Adult Learning Centre: 093-266 09
West Galway Adult Learning Centre: 091-555877', 4, 'literacy', 'Galway County', 'https://gretb.ie/further-education-training/adult-basic-education-service/', 1, NULL, NULL, NULL, NULL, '091 874500', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3561, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Galway City Adult Learning Centre: 091-567 660
Ionad Foghlama: 091-506 060
East Galway Adult Learning Centre: 091-847 850
North Galway Adult Learning Centre: 093 347 46
Tuam Adult Learning Centre: 093-266 09
West Galway Adult Learning Centre: 091-555877', 4, 'numeracy', 'Galway County', 'https://gretb.ie/further-education-training/adult-basic-education-service/', 1, NULL, NULL, NULL, NULL, '091 874500', NULL, '208573', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3562, 'Level 4 Information Technology & Communications Skills ', 'The programme aims to provide learners with the skill, knowledge and competence to work under supervision providing assistance and support within an Information and Communications Technology (ICT) setting.

Programme content includes the use of a range of digital media technologies, use of ICT applications and packages, as well as communication skills, work experience and application of mathematical skills. The programme is also suited to those seeking to progress to higher levels of training and education in ICT.
', 4, 'digital_skills', 'Galway County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=319101', 1, 'GRETB Training Centre', NULL, NULL, 'Kevin Kelly', '091-706200', NULL, '319101', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3563, 'Level 1 Read Write Spell', 'This course aims to enhance the learner’s reading skills and apply those skills to familiar tasks and contexts. It also recognises basic knowledge, skill and competence in writing and approaching personally meaningful simple writing tasks, under direction, within a variety of familiar and well supported texts', 1, 'literacy', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=305891', 1, 'KLEAR', NULL, '2021-10-01 00:00:00+00', 'Sian Crowley', '01 8036238', NULL, '305891', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3564, 'Level 1 Maths 1-1', 'This part time course takes place in KLEAR Adult Education Centre in Kilbarrack.
You will learn with your tutor on a one to one basis. You will work at your own pace at the basic skills you need.', 1, 'numeracy', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=305578', 1, 'KLEAR', NULL, NULL, 'Sian Crowley', '01 8036238', NULL, '305578', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3565, 'Level 1 Introduction to Computers', 'This is a part time course in Ballymun.

This programme aims to improve your computer skills.', 1, 'digital_skills', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=20091', 1, 'Adult Ed Serv Reg Office (Ballymun Rd)', NULL, NULL, 'Clare Campbell', '01 8622402', NULL, '20091', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3566, 'Level 2 Reading', 'The aim of this programme is multi purpose. The knowledge, skill and competence acquired on this programme are relevant to personal development and participation in society, community and employment and provides a basis for further progression. The programme covers the acquirement of basic knowledge, skills and competencies in a narrow range of fields of learning including key outcomes in literacy and numeracy.', 2, 'literacy', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=331544', 1, 'Adult Ed Serv Reg Office (Ballymun Rd)', NULL, NULL, 'Clare Campbell', '01 8622402', NULL, '331544', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3567, 'Level 2 Maths 1-1', 'This part time course takes place in KLEAR Adult Education Centre in Kilbarrack.

You will learn with your tutor on a one to one basis. You will work at your own pace at the basic skills you need.

Contact Sian in the Literacy Service on 01 803 6238 for more information.', 2, 'numeracy', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=305578', 1, 'KLEAR', NULL, NULL, 'Sian Crowley', '01 8036238', NULL, '305578', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3568, 'Level 2 Computer Skills', 'This is a part time course in Parnell Square

This module aims to equip you with a range of computer skills for use in social, personal and work life and to encourage you to have the confidence to use these skills in your daily life.

Please contact Anne or Joyce at 01 8147900 for further information ', 2, 'digital_skills', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=305306', 1, 'DDLETB North East', NULL, NULL, 'Joyce Gough', '01 8147900', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3569, 'Level 3 Communications ', 'This part time course takes place in KLEAR Adult Education Centre Kilbarrack

This programme module aims to equip the learner with a range of communications skills for use in social, personal and work life and to encourage the learner to have the confidence to use these skills in their daily lives.', 3, 'literacy', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=305537', 1, 'KLEAR', NULL, NULL, 'Sian Crowley', '01 8036238', NULL, '305537', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3570, 'Level 3 Read Write Spell Maths 1-1', 'This part time course takes place in KLEAR Adult Education Centre in Kilbarrack.
You will learn with your tutor on a one to one basis. You will work at your own pace at the basic skills you need.', 3, 'numeracy', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=305578', 1, 'KLEAR', NULL, NULL, 'Sian Crowley', '01 8036238', NULL, '305578', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3571, 'Level 3 Computer Literacy and Internet Skills', 'The purpose of this award is to enable the learner to develop the
relevant knowledge skill and competence to use a range of skills and
tools, under direction and with limited autonomy, in familiar situations. It
enables the learner to participate in and contribute to modern society, to
pursue a range of employment opportunities or to progress to further
education or training.', 3, 'digital_skills', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=303762', 1, 'Adult Ed Serv Reg Office (Ballymun Rd)', NULL, NULL, 'Clare Campbell', '01 8622402', NULL, '303762', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3572, 'Level 4 English and Communications', 'This part time course takes place in KLEAR Adult Education Centre in Kilbarrack.

The aim of this programme is to enable the learner to develop the relevant knowledge, skill and competence in a broad range of personal skills which enable personal development and active citizenship, and/or to progress to employment and/or further education or training.

Contact Sian on 01-8036238 for more information', 4, 'literacy', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=305886', 1, 'KLEAR', NULL, NULL, 'Sian Crowley', '01 8036238', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3573, 'Level 4 Maths', 'This part-time course will introduce you to the main areas of maths with everyday examples. You will learn to complete tasks and calculations and how to use a scientific calculator.

Who is this course for?
This course will suit you if you have a basic understanding of numbers, geometry, algebra and data. It is not suitable if you are starting out with maths. It will give you more skills and may help you with future study or work.

What do I need to do this course?
You will need to be very comfortable with maths or have completed a level 3 in a maths subject. We may assess your maths skills to see if the course is right for you.', 4, 'numeracy', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306037', 1, 'Adult Education Service Finglas', NULL, '2021-09-24 00:00:00+00', 'Nicola Callaghan ', '087 1948468', NULL, '306037', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3574, 'Level 4 Information Technology ', 'This part time course takes place in KLEAR Adult Education Centre Kilbarrack

This programme module aims to provide the learner with the knowledge, skills and competence to operate a computer and become proficient in Information Technology skills.

Contact Sian on 01 803 6238 for further information', 4, 'digital_skills', 'Dublin North ', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=305527', 1, 'KLEAR', NULL, '2021-09-29 00:00:00+00', 'Sian Crowley', '01 8036238', NULL, '305527', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3575, 'Level 1 Language and Literacy', 'This part time Literacy and Language course will take place in Mercy Family Centre, Weaver Square, Dublin 8. This course will help you improve your reading and writing skills in English.', 1, 'literacy', 'Dublin South', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306438', 1, 'South Inner City Adult Education Service', NULL, '2021-09-20 00:00:00+00', 'Caoimhe Kerins', '01 6684571', NULL, '306438', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3576, 'Level 1 Everyday Maths Skills', 'The chance to get back into learning and build your skills and confidence in key skills. An initial assessment of your key skills in any or all the areas of:

o reading
o writing and spelling
o maths
o computers and other IT skills ', 1, 'numeracy', 'Dublin South', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320210', 1, 'DDLETB South East', NULL, NULL, 'Lorna Patterson', '01 296 4321
', NULL, '320210', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3577, 'level 1 Introduction to Computers', 'This Introduction to computers course will be in Liberties College. This course will help you to improve your basic understanding of computers.', 1, 'digital_skills', 'Dublin South', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306706', 1, 'South Inner City Adult Education Service', NULL, '2021-09-20 00:00:00+00', 'Caoimhe Kerins', '01 6684571', NULL, '306706', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3578, 'Level 2 Reading and Writing', 'This part-time course is in Liberties College. This course aims to improve your reading and writing skills and help you to spell personal and familiar words correctly.

Please contact Bobby Borwick on 0872262146 or bobby.borwick@aes.cdetb.ie for further information.', 2, 'literacy', 'Dublin South', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=307098', 1, 'South Inner City Adult Education Service', NULL, '2021-09-20 00:00:00+00', 'Bobby Borwick', '01 6684488', 'bobby.borwick@aes.cdetb.ie', '307098', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3579, 'Level 2 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Dublin South 01 6684571', 2, 'numeracy', 'Dublin South', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'South Inner City Adult Education Service', NULL, NULL, 'Caoimhe Kerins', '01 6684571', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3580, 'Level 2 Information Technology ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your digital skills.

Dublin South 01 6684571', 2, 'digital_skills', 'Dublin South', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'South Inner City Adult Education Service', NULL, NULL, 'Caoimhe Kerins', '01 6684571', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3581, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Dublin South 01 6684571', 3, 'literacy', 'Dublin South', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'South Inner City Adult Education Service', NULL, NULL, 'Caoimhe Kerins', '01 6684571', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3582, 'Level 3 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Dublin South 01 6684571', 3, 'numeracy', 'Dublin South', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'South Inner City Adult Education Service', NULL, NULL, 'Caoimhe Kerins', '01 6684571', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3583, 'Level 3 Working with Computer Applications ', 'This programme leads to a QQI Level 3 Major Award in Information and Communications Technology for learners who meet the award requirements', 3, 'digital_skills', 'Dublin South', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=317199', 1, 'CDETB Ballyfermot Training Centre', NULL, '2021-09-20 00:00:00+00', 'Tom O''Reilly ', '01-623 9716', NULL, '317199', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3584, 'Level 4 English and Communications ', 'This is a part time course for adults who have left school early or who are out of the education system for a long time and who would like to improve their basic skills. The course provides a strong foundation for learners who would like to progress to further study at QQI Level 5. The course takes place two days per week and leads to a QQI Level 4 Component Award.', 4, 'literacy', 'Dublin South', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=321176', 1, 'Collinstown Park Community College', NULL, NULL, 'Kathleen Campbell ', '(01) 4572300', NULL, '321176', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3585, 'Level 4 Mathematics ', 'This Pathways to Apprenticeship takes place in Liberties College, Dublin 8. This course aims to give you understanding of the maths necessary to access apprenticeship programmes. This QQI Level 4 Mathematics qualification is equivalent to Ordinary Level Leaving Certificate Maths.', 4, 'numeracy', 'Dublin South', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=305934', 1, 'South Inner City Adult Education Service', NULL, NULL, 'Caoimhe Kerins', '01 6684571', NULL, '305934', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3586, 'Level 4 Word Processing ', 'The aim of the programme is to provide learners with the skill, knowledge and competencies to provide administrative support to include, use of office equipment, use of computer applications, document production, managing filing systems and diaries in a variety of office settings.', 4, 'Digital ', 'Dublin South', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306090', 1, 'South Inner City Adult Education Service', NULL, '2021-09-20 00:00:00+00', 'Bobby Borwick', '01 6684488', NULL, '306090', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3587, 'Level 1 Reading and Writing', 'Improve your reading and writing!

This programme aims to offer you the chance to get back into learning and build your skills and confidence in key skills.

You will also get an initial assessment of your key skills in reading and writing. ', 1, 'literacy', 'Dublin North County - Fingal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=315854', 1, 'DDLETB North East', NULL, '2021-09-15 00:00:00+00', 'Zara Rogers', '01 8417763', NULL, '315854', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3588, 'Level 1 Intensive Literacy, Numeracy and IT Skills ', 'This programme aims to offer you: The chance to get back into learning and build your skills and confidence in key skills.
• An initial assessment of your key skills in any or all the areas of:
o reading
o writing and spelling
o maths
o computers and other technology.', 1, 'numeracy', 'Dublin North County - Fingal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=315862', 1, 'Balbriggan', NULL, '2021-09-20 00:00:00+00', 'Zara Rogers', '01 8417763', NULL, '315862', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3589, 'Level 1 Beginners Computers', 'This class is designed for adults with basic reading and writing skills who want to learn to use computers. It will focus on all aspects of computer literacy.', 1, 'digital_skills', 'Dublin North County - Fingal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=315855', 1, 'DDLETB North East', NULL, '2021-09-16 00:00:00+00', 'Zara Rogers', '01 8417763', NULL, '317790', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3590, 'Level 2 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your literacy skills.

 North County - Fingal, 01 8417763', 2, 'literacy', 'Dublin North County - Fingal', 'https://adulteducationnorthcountydublin.ie/the-course/basic-reading-writing-and-numeracy/', 1, 'DDLETB North East', NULL, NULL, 'Zara Rogers', '01 8417763', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3591, 'Level  2 Maths  ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Dublin North County - Fingal: 01 8417763', 2, 'numeracy', 'Dublin North County - Fingal', 'https://adulteducationnorthcountydublin.ie/the-course/basic-reading-writing-and-numeracy/', 1, 'DDLETB North East', NULL, NULL, 'Zara Rogers', '01 8417763', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3592, 'Level 2 Digital   ', 'This programme will enable learners to: develop knowledge and skills in using computing devices safely and develop basic skills of editing, printing, saving documents, accessing websites and printing information from the web.', 2, 'digital_skills', 'Dublin North County - Fingal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=317675', 1, 'DDLETB North East', NULL, NULL, 'Zara Rogers', '01 8417763', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3593, 'Level 3 Communications', 'This course focuses on building reading, writing and verbal communication skills.', 3, 'literacy', 'Dublin North County - Fingal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=317782', 1, 'Swords - Dublin North County', NULL, NULL, 'Helena Browner', '01 8408946', NULL, '317782', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3594, 'Level  3 Maths  ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Dublin North County - Fingal: 01 8417763', 3, 'numeracy', 'Dublin North County - Fingal', 'https://adulteducationnorthcountydublin.ie/the-course/basic-reading-writing-and-numeracy/', 1, 'DDLETB North East', NULL, NULL, 'Zara Rogers', '01 8417763', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3595, 'Level  3  Digital  ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your digital skills.

Dublin North County - Fingal: 01 8417763', 3, 'digital_skills', 'Dublin North County - Fingal', 'https://adulteducationnorthcountydublin.ie/the-course/basic-computer-skills/', 1, 'DDLETB North East', NULL, NULL, 'Zara Rogers', '01 8417763', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3596, 'Level  4 Reading and writing    ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Dublin North County - Fingal: 01 8417763', 4, 'literacy', 'Dublin North County - Fingal', 'https://www.fetchcourses.ie/course/finder?search=1&view=0', 1, 'DDLETB North East', NULL, NULL, 'Zara Rogers', '01 8417763', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3597, 'Level  4  Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Dublin North County - Fingal: 01 8417763', 4, 'numeracy', 'Dublin North County - Fingal', 'https://www.fetchcourses.ie/course/finder?search=1&view=0', 1, 'DDLETB North East', NULL, NULL, 'Zara Rogers', '01 8417763', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3598, 'Level 4 information Technology', 'The programme aims to provide learners with a broad range of general office skills that will enable them to obtain entry level employment or progress to further education and training. The programme will provide learners with opportunities to develop effective verbal and written communication skills appropriate for a business environment. Competence in information technology skills is also included and an ability to interact effectively with customers or clients in an office environment.', 4, 'digital_skills', 'Dublin North County - Fingal', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=326434', 1, 'Baldoyle Training Centre', NULL, '2021-09-20 00:00:00+00', 'Baldoyle Recruitment', '01 87167400', NULL, '326434', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3599, 'Level  1 Reading and writing    ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Dublin West County: 01-6283557', 1, 'literacy', 'Dublin West County', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'DDLETB South West', NULL, NULL, 'Ali McCann', '01-6283557', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3600, 'Level  1  Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Dublin West County: 01-6283557', 1, 'numeracy', 'Dublin West County', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'DDLETB South West', NULL, NULL, 'Ali McCann', '01-6283557', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3601, 'Level  1  Digital    ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your digital skills.

Dublin West County: 01-6283557', 1, 'digital_skills', 'Dublin West County', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'DDLETB South West', NULL, NULL, 'Ali McCann', '01-6283557', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3602, 'Level  2 Reading and writing    ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your literacy skills.

Dublin West County: 01-6283557', 2, 'literacy', 'Dublin West County', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'DDLETB South West', NULL, NULL, 'Ali McCann', '01-6283558', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3603, 'Level  2  Maths  ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your numeracy skills.

Dublin West County: 01-6283557', 2, 'numeracy', 'Dublin West County', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'DDLETB South West', NULL, NULL, 'Ali McCann', '01-6283559', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3604, 'Level  2  Digital    ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your digital skills.

Dublin West County: 01-6283557', 2, 'digital_skills', 'Dublin West County', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'DDLETB South West', NULL, NULL, 'Ali McCann', '01-6283560', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3605, 'Level 3 Return to Education: Communications and English Skills', 'The aim of this programme is to enable the learner to develop the relevant knowledge, skill and competence to use a range of information and communication technologies, under direction and with limited autonomy, in familiar situations. It enables the learner to pursue a range of employment opportunities or to progress to further education or training.', 3, 'literacy', 'Dublin West County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=309213', 1, 'DDLETB South West', NULL, NULL, 'Ali McCann', '01-6283557', NULL, '309213', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3606, 'Level  3  Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Dublin West County, 01-6283557', 3, 'numeracy', 'Dublin West County', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'DDLETB South West', NULL, NULL, 'Ali McCann', '01-6283557', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3607, 'Level 3 Computer Skills ', 'The aim of this programme is to enable the learner to develop the relevant knowledge, skill and competence to use a range of information and communication technologies, under direction and with limited autonomy, in familiar situations. It enables the learner to pursue a range of employment opportunities or to progress to further education or training.', 3, 'digital_skills', 'Dublin West County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=309212', 1, 'DDLETB South West', NULL, '2021-09-15 00:00:00+00', 'Ali McCann', '01-6283557', NULL, '309212', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3608, 'Level 4 Communication & English Skills ', 'The purpose of this award is to enable the learner to develop the
relevant knowledge, skill and competence in a broad range of personal
skills which enable personal development and active citizenship, and
progression to employment, or further education or training.', 4, 'literacy', 'Dublin West County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=309135', 1, 'DDLETB South West', NULL, NULL, 'Ali McCann', '01-6283557', NULL, '309135', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3609, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Dublin West County, 01-6283557', 4, 'numeracy', 'Dublin West County', 'https://www.ddletb.ie/further-education-training/locations/adult-education-service/', 1, 'DDLETB South West', NULL, NULL, 'Ali McCann', '01-6283557', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3610, 'Level 4 Computer Skills ', 'The aim of this programme is to enable the learner to develop the knowledge, skills and competence in a broad range of information and communication technology which enable employment, under direct supervision, in a variety of information and communications technology
sectors, or progression to further education or training.', 4, 'digital_skills', 'Dublin West County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=309205', 1, 'DDLETB South West', NULL, '2021-09-16 00:00:00+00', 'Ali McCann', '01-6283557', NULL, '309205', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3611, 'Level 1 Reading, Writing and Spelling Course', 'At the end of this course, you will be able to:

Use new skills in in one or more areas of:

• Reading
• Writing
• Spelling and handwriting
• Maths
• Computers and other technology', 1, 'literacy', 'Dun Laoghaire - Rathdown', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318078', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, '318078', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3612, 'Level 1 Maths for Everyday Life ', 'This course is aimed at people who would like to practice their number skills (using + -x = ÷ percentages, fractions, estimation and measurement and how to check with a calculator). These skills will benefit the student for everday calculations such a budgeting, time, and measurements.', 1, 'numeracy', 'Dun Laoghaire - Rathdown', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318081', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, '318081', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3613, 'Level 1 Computers Skills', 'This programme offers support in using computers and other technology. The aim of this programme is to enable the learner to develop the knowledge, skills and competence in a broad range of information and communication technology which enable employment, under direct supervision, in a variety of information and communications technology
sectors, or progression to further education or training.', 1, 'digital_skills', 'Dun Laoghaire - Rathdown', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318129', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, '318129', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3614, 'Level 1 & 2 Reading, Writing & Spelling', 'At the end of this course, you will be able to:

Use new skills in in one or more areas of:

• Reading
• Writing
• Spelling and handwriting
• Maths
• Computers and other technology', 2, 'literacy', 'Dun Laoghaire - Rathdown', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318078', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, '318078', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3615, 'Level 2 Maths ', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Dun Laoghaire - Rathdown: 01 204 3605', 2, 'numeracy', 'Dun Laoghaire - Rathdown', 'https://www.adulteducationsoutheast.com/about/key-skill-service/', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3616, 'Level 2 Computer Skills ', 'Get in touch with your local Adult Literacy Centre and find a computer course that will work for you.

Dun Laoghaire - Rathdown: 01 204 3605', 2, 'digital_skills', 'Dun Laoghaire - Rathdown', 'https://www.adulteducationsoutheast.com/about/key-skill-service/', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3617, 'Level 3 Communications and Personal Effectiveness ', 'Learners will work on a range of communications skills and also develop planning learning plans. Teamworking will be developed using a group project.
Specific skills
Reading
Writing
Interpersonal Communications
Awareness of self', 3, 'literacy', 'Dun Laoghaire - Rathdown', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=319352', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, '319352', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3618, 'Level 3 Functional Maths ', 'After you have ataken this course you will be able to:

- Explain the concepts of natural numbers , integers and real numbers.
- Demonstrate equivalence between common simple fractions, decimals and percentages by conversion.
- Use a calculator to perform operations.
- Give approximations by using strategies including significant figures and rounding off large natural numbers
- Calculate solutions to real life quantitative problems and everyday situations such as budgets and costings.', 3, 'numeracy', 'Dun Laoghaire - Rathdown', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=319345', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, '319345', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3619, 'Level 3 Computer Skills ', 'Get in touch with your local Adult Literacy Centre and find a computer course that will work for you.

Dun Laoghaire - Rathdown, 01 204 3605', 3, 'digital_skills', 'Dun Laoghaire - Rathdown', 'https://www.adulteducationsoutheast.com/about/key-skill-service/', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3620, 'Level 4 Communications ', 'In this course you will get the opportunity to:

• Appreciate the role of communications in everyday life
• Take responsibility for your own learning
• Understand mass media and its impact on everyday life
• Develop effective writing skills
• Interpret written and aural materials across a range of vocational, social and everyday tasks
• Develop effective interpersonal skills
• Develop the language, literacy and numeracy skills related to communications through the medium of the module themes and content.', 4, 'literacy', 'Dun Laoghaire - Rathdown', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318116', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, '318116', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3621, 'Level 4 Functional Maths ', 'The purpose of this award is to enable the learner to develop the
relevant knowledge, skill and competence in a range of maths
skills which enable personal development and active citizenship, and progression to employment, or further education or training.', 4, 'numeracy', 'Dun Laoghaire - Rathdown', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318149', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, '318149', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3622, 'Level 4 Information Technology Skills ', 'After you have taken this course you will be able to: Explain a range of information technology concepts and terminology to include computer, computer hardware, components, system and application, software, input devices, output devices, data storage devices, bytes, files, folder/directory, drives, memory LAN, WAN, and the Internet!', 4, 'digital_skills', 'Dun Laoghaire - Rathdown', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318124', 1, 'DDLETB South East', NULL, NULL, 'Barbara Hammond', '01 204 3605', NULL, '318124', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3623, 'Reading Skills', 'In this course you will become familiar with different types of reading - books, instructions, directions and so on.
Spelling and grammar is covered and learners are given ways to help them to remember spelling and grammar rules.

Reading for enjoyment is built into this course through a Reading Challenge!!', 1, 'literacy', 'Kerry', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320480', 1, 'Tralee Adult Literacy and Basic Education', NULL, NULL, 'Edward O''Connor', '086 0749786', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3624, 'Everyday Maths', 'The Maths Trail from the O Connell FET Centre to the Daniel O'' Connell Park. You will actively engage in investigation, observation, estimation, measuring and problem-solving during this maths trial.', 1, 'numeracy', 'Kerry', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=329096', 1, 'Cahersiveen Adult Literacy and Basic Education', NULL, NULL, 'Deirdre Fitzgerald', '066 9473166', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3625, 'Basic Computers', 'Students will learn basic ICT skills and the relevant basic literacy and numeracy skills to use the computer.

Computer basics such as PC tower, monitor, keyboard, mouse will be introduced.

Students will learn to start up and shut down the PC safely. They will learn to move and click the mouse and to navigate the keyboard. Basic typing skills and editing text, saving and printing are covered. Searching and navigating the internet using a search engine is also covered.', 1, 'digital_skills', 'Kerry', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320422', 1, 'Listowel Adult Literacy and Basic Education', NULL, NULL, 'Mary Swaine', '068 23866', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3626, 'Level 2 Literacy Skills', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing.', 2, 'literacy', 'Kerry', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318065', 1, 'Killarney Adult Literacy and Basic Education Centre', NULL, NULL, 'Mary Concannon', '064 6636990', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3627, 'Level 2 Everyday Maths', 'This course aims to give you the chance to get back into learning and build your skills and confidence in key skills.

You will develop your maths skills and learn to solve quantitative problems and evaluate solutions, as well as developing your understanding of the language of mathematics.', 2, 'numeracy', 'Kerry', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320482', 1, 'Tralee Adult Literacy and Basic Education', NULL, NULL, 'Edward O''Connor', '086 0749786', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3628, 'Level 2 Computer Skills', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.', 2, 'digital_skills', 'Kerry', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=328381', 1, 'Killarney Adult Literacy and Basic Education Centre', NULL, NULL, 'Mary Concannon', '064 6636990', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3629, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your communication, reading and writing skills.

Tralee: 066-712 4114
An Daingean: 066-915 2361
Kenmare: 064-664 2728
Killarney: 064-663 6990
Killorglin: 066-979 0765
Listowel: 068-238 66
Caherciveen: 066-947 3166 ', 3, 'literacy', 'Kerry', 'https://www.kerryetb.ie/further-education-training/further-education-training-programmes/adult-literacy-and-basic-education/', 1, NULL, NULL, NULL, NULL, '066 7121488', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3630, 'Level 3 Everyday Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Tralee: 066-712 4114
An Daingean: 066-915 2361
Kenmare: 064-664 2728
Killarney: 064-663 6990
Killorglin: 066-979 0765
Listowel: 068-238 66
Caherciveen: 066-947 3166 ', 3, 'numeracy', 'Kerry', 'https://www.kerryetb.ie/further-education-training/further-education-training-programmes/adult-literacy-and-basic-education/', 1, NULL, NULL, NULL, NULL, '066 7121488', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3631, 'Level 3 Computers', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.', 3, 'digital_skills', 'Kerry', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=322277', 1, 'Dingle Adult Literacy and Basic Education', NULL, NULL, 'Eithne Boland', '066 9152361', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3632, 'Level 4 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your communication, reading and writing skills.

Tralee: 066-712 4114
An Daingean: 066-915 2361
Kenmare: 064-664 2728
Killarney: 064-663 6990
Killorglin: 066-979 0765
Listowel: 068-238 66
Caherciveen: 066-947 3166 ', 4, 'literacy', 'Kerry', 'https://www.kerryetb.ie/further-education-training/further-education-training-programmes/adult-literacy-and-basic-education/', 1, NULL, NULL, NULL, NULL, '066 7121488', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3633, 'Level 4 Everyday Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Tralee: 066-712 4114
An Daingean: 066-915 2361
Kenmare: 064-664 2728
Killarney: 064-663 6990
Killorglin: 066-979 0765
Listowel: 068-238 66
Caherciveen: 066-947 3166 ', 4, 'numeracy', 'Kerry', 'https://www.kerryetb.ie/further-education-training/further-education-training-programmes/adult-literacy-and-basic-education/', 1, NULL, NULL, NULL, NULL, '066 7121488', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3634, 'Level 4 Information Technology Skills', 'This course will include word processing, file management, data entry, internet & email.

The aim of this programme is to enable the learner to develop the relevant knowledge, skills and competence in a broad range of office skills which enable employment, under direct supervision, in a general office, or progression to further education or training.', 4, 'digital_skills', 'Kerry', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=331831', 1, 'Kenmare Adult Education Centre', NULL, NULL, 'Michael Broderick', '064 6641157', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3635, 'Level 4 Information and Communication Technologies', 'This course will equip you with the knowledge, skill and competence to produce a range of documents containing text and graphic images using desktop publishing. It is designed to enable progression to further education, training or employment.', 4, 'digital_skills', 'Kerry', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=329091 ', 1, 'Kerry College Listowel Campus', NULL, NULL, 'Deirdre O''Shea', '066 9472414', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3636, 'Literacy Support', 'This programme aims to offer you:

• The chance to get back into learning and build your skills and confidence in key skills.

You will get an initial assessment of your key skills in any or all the areas of:

o reading
o writing and spelling
o maths
o computers and other technology.

This assessment is to give you more information on:

• what you can already do, but perhaps aren''t confident in

• what you need to work on to be more confident in everyday or new situations
for work, family or other settings.

• An opportunity to use or practise key skills in everyday life.

• Opportunities to be more confident by using key skills in new or different situations.

• The chance to get ready to start working towards a qualification by working on
the gaps or blocks you might have that hold you back.', 1, 'literacy', 'Kildare', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320977', 1, 'Further Education and Training Centre Kildare', NULL, NULL, 'Imelda Carroll', '045 522003', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3637, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Athy: 059-863 3270
Kildare: 045-522 003
Maynooth: 01-6292602
Naas/Newbridge: 045-866 314 ', 1, 'numeracy', 'Kildare', 'http://kildarewicklow.etb.ie/further-education/part-time-programmes/adult-basic-education/', 1, NULL, NULL, NULL, NULL, '045 988 000', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3638, 'Computers for beginners', 'This course provides an opportunity to get started on the computer / laptop. Learners work in small groups to learn computer skills for use in everyday life and build confidence in a relaxed and supportive environment. The course supports progression to further study and / or to certification.

This course is for absolute beginners with little or no knowledge of the computer and is delivered on a part-time basis.', 1, 'digital_skills', 'Kildare', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=314974', 1, 'Further Education and Training Centre Carlow', NULL, NULL, 'Susanne Kelly', '087 3527407', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3639, 'Level 2 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your communication, reading and writing skills.

Athy: 059-863 3270
Kildare: 045-522 003
Maynooth: 01-6292602
Naas/Newbridge: 045-866 314 ', 2, 'literacy', 'Kildare', 'http://kildarewicklow.etb.ie/further-education/part-time-programmes/adult-basic-education/', 1, NULL, NULL, NULL, NULL, '045 988 000', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3640, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Athy: 059-863 3270
Kildare: 045-522 003
Maynooth: 01-6292602
Naas/Newbridge: 045-866 314 ', 2, 'numeracy', 'Kildare', 'http://kildarewicklow.etb.ie/further-education/part-time-programmes/adult-basic-education/', 1, NULL, NULL, NULL, NULL, '045 988 000', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3641, 'Level 2 Using Technology', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Athy: 059-863 3270
Kildare: 045-522 003
Maynooth: 01-6292602
Naas/Newbridge: 045-866 314 ', 2, 'digital_skills', 'Kildare', 'http://kildarewicklow.etb.ie/further-education/part-time-programmes/adult-basic-education/', 1, NULL, NULL, NULL, NULL, '045 988 000', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3642, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your communication, reading and writing skills.

Athy: 059-863 3270
Kildare: 045-522 003
Maynooth: 01-6292602
Naas/Newbridge: 045-866 314 ', 3, 'literacy', 'Kildare', 'http://kildarewicklow.etb.ie/further-education/part-time-programmes/adult-basic-education/', 1, NULL, NULL, NULL, NULL, '045 988 000', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3643, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Athy: 059-863 3270
Kildare: 045-522 003
Maynooth: 01-6292602
Naas/Newbridge: 045-866 314 ', 3, 'numeracy', 'Kildare', 'http://kildarewicklow.etb.ie/further-education/part-time-programmes/adult-basic-education/', 1, NULL, NULL, NULL, NULL, '045 988 000', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3644, 'Level 3 Using Technology in Everyday Life', 'This course will involve learning how to use the internet to send emails, pay online bills,make bookings and understand security concerns.', 3, 'digital_skills', 'Kildare', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=308655', 1, 'Further Education & Training Centre Maynooth', NULL, NULL, 'Stefanie Larkin', '01 6292602', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3645, 'Level 4 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your communication, reading and writing skills.

Athy: 059-863 3270
Kildare: 045-522 003
Maynooth: 01-6292602
Naas/Newbridge: 045-866 314 ', 4, 'literacy', 'Kildare', 'http://kildarewicklow.etb.ie/further-education/part-time-programmes/adult-basic-education/', 1, NULL, NULL, NULL, NULL, '045 988 000', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3646, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Athy: 059-863 3270
Kildare: 045-522 003
Maynooth: 01-6292602
Naas/Newbridge: 045-866 314 ', 4, 'numeracy', 'Kildare', 'http://kildarewicklow.etb.ie/further-education/part-time-programmes/adult-basic-education/', 1, NULL, NULL, NULL, NULL, '045 988 000', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3647, 'Level 4 Information Technology Skills', 'This course will include word processing, file management, data entry, internet & email.

The aim of this programme is to enable the learner to develop the relevant knowledge, skills and competence in a broad range of office skills which enable employment, under direct supervision, in a general office, or progression to further education or training.', 4, 'digital_skills', 'Kildare', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=308665', 1, 'Further Education & Training Centre Maynooth', NULL, NULL, 'Stefanie Larkin', '01 6292602', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3648, 'Level 1 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Kilkenny Adult Learning Centre: 056-776 3149 ', 1, 'literacy', 'Kilkenny', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, NULL, NULL, NULL, NULL, '056 7763149', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3649, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Kilkenny Adult Learning Centre: 056-776 3149 ', 1, 'numeracy', 'Kilkenny', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, NULL, NULL, NULL, NULL, '056-776 3149', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3650, 'Level 1 Computers', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Kilkenny Adult Learning Centre: 056-776 3149 ', 1, 'digital_skills', 'Kilkenny', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, NULL, NULL, NULL, NULL, '056-776 3149', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3651, 'Level 2 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Kilkenny Adult Learning Centre: 056-776 3149 ', 2, 'literacy', 'Kilkenny', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, NULL, NULL, NULL, NULL, '056-776 3149', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3652, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Kilkenny Adult Learning Centre: 056-776 3149 ', 2, 'numeracy', 'Kilkenny', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, NULL, NULL, NULL, NULL, '056-776 3149', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3653, 'Level 2 Computers', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Kilkenny Adult Learning Centre: 056-776 3149 ', 2, 'digital_skills', 'Kilkenny', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, NULL, NULL, NULL, NULL, '056-776 3149', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3654, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Kilkenny Adult Learning Centre: 056-776 3149 ', 3, 'literacy', 'Kilkenny', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, NULL, NULL, NULL, NULL, '056-776 3149', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3655, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Kilkenny Adult Learning Centre: 056-776 3149 ', 3, 'numeracy', 'Kilkenny', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, NULL, NULL, NULL, NULL, '056-776 3149', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3656, 'Level 3 Computer Skills', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.

At the end of this course, you will be able to:

• Use new skills in one or more areas of
• Study skills and key skills such as writing assignments, projects or essays
• Computers and other technology
• Practical or vocational skills for further education or training (FET) or work.', 3, 'digital_skills', 'Kilkenny', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=313426', 1, 'Adult Literacy Kilkenny', NULL, NULL, 'Carmel Bryan', '056 7763149', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3657, 'Level 4 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Kilkenny Adult Learning Centre: 056-776 3149 ', 4, 'literacy', 'Kilkenny', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, NULL, NULL, NULL, NULL, '056-776 3149', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3658, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Kilkenny Adult Learning Centre: 056-776 3149 ', 4, 'numeracy', 'Kilkenny', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, NULL, NULL, NULL, NULL, '056-776 3150', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3659, 'Level 4 Computers', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Kilkenny Adult Learning Centre: 056-776 3149 ', 4, 'digital_skills', 'Kilkenny', 'http://kilkennycarlow.etb.ie/further-education-and-training/adult-learning-service/', 1, NULL, NULL, NULL, NULL, '056-776 3151', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3660, 'Level 1 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Further Education Centre Laois & Offaly: 057-866 1338 ', 1, 'literacy', 'Laois', 'https://www.loetb.ie/adult-literacy', 1, NULL, NULL, NULL, NULL, '057-866 1338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3661, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Further Education Centre Laois & Offaly: 057-866 1338  ', 1, 'numeracy', 'Laois', 'https://www.loetb.ie/adult-literacy', 1, NULL, NULL, NULL, NULL, '057-866 1338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3662, 'Level 1 Computers', 'This programme aims to show students:

How to access the internet, send emails and use MS Word. Students will learn how to book a flight, bank online and type a letter.', 1, 'digital_skills', 'Laois', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=313677', 1, 'Portlaoise FET Centre – Adult Literacy', NULL, NULL, 'Debbie Looby', '057-866 1338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3663, 'Level 2 Reading and Writing', 'This course enables learners to develop key literacy, numeracy and digital skills.

This evening course is ideal for anyone who is not available during the day or may be working.', 2, 'literacy', 'Laois', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=313516', 1, 'Portlaoise FET Centre – Adult Literacy', NULL, NULL, 'Catherine Lisa Tynan', '057-866 1338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3664, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Further Education Centre Laois & Offaly: 057-866 1338  ', 2, 'numeracy', 'Laois', 'https://www.loetb.ie/adult-literacy', 1, NULL, NULL, NULL, NULL, '057-866 1338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3665, 'Level 2 Computers', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Further Education Centre Laois & Offaly: 057-866 1338 ', 2, 'digital_skills', 'Laois', 'https://www.loetb.ie/adult-literacy', 1, NULL, NULL, NULL, NULL, '057-866 1338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3666, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Further Education Centre Laois & Offaly: 057-866 1338 ', 3, 'literacy', 'Laois', 'https://www.loetb.ie/adult-literacy', 1, NULL, NULL, NULL, NULL, '057-866 1338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3667, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Further Education Centre Laois & Offaly: 057-866 1338  ', 3, 'numeracy', 'Laois', 'https://www.loetb.ie/adult-literacy', 1, NULL, NULL, NULL, NULL, '057-866 1338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3668, 'Level 3 Using Technology', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Further Education Centre Laois & Offaly: 057-866 1338 ', 3, 'digital_skills', 'Laois', 'https://www.loetb.ie/adult-literacy', 1, NULL, NULL, NULL, NULL, '057-866 1338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3669, 'Level 4 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Further Education Centre Laois & Offaly: 057-866 1338 ', 4, 'literacy', 'Laois', 'https://www.loetb.ie/adult-literacy', 1, NULL, NULL, NULL, NULL, '057-866 1338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3670, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Further Education Centre Laois & Offaly: 057-866 1338  ', 4, 'numeracy', 'Laois', 'https://www.loetb.ie/adult-literacy', 1, NULL, NULL, NULL, NULL, '057-866 1338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3671, 'Level 4 Computer Applications', 'This course is for you if you would like to expand your knowledge and skills in the use of common computer applications such as databases, spreadsheets and computer graphics. As part of this course, you will learn terminology associated with computer applications and how to create and modify databases, spreadsheets and drawings.', 4, 'digital_skills', 'Laois', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320820', 1, 'Portlaoise FET Centre', NULL, NULL, 'Lisa McEvoy', '057 8661338', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3672, 'Level 1 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Leitrim Education for Adults: 071-962 1366  ', 1, 'literacy', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3673, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Leitrim Education for Adults: 071-962 1366  ', 1, 'numeracy', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3674, 'Level 1 Using Technology', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Leitrim Education for Adults: 071-962 1366 ', 1, 'digital_skills', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3675, 'Level 2 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Leitrim Education for Adults: 071-962 1366  ', 2, 'literacy', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3676, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Leitrim Education for Adults: 071-962 1366  ', 2, 'numeracy', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3677, 'Level 2 Using Technology', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Leitrim Education for Adults: 071-962 1366 ', 2, 'digital_skills', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3678, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Leitrim Education for Adults: 071-962 1366  ', 3, 'literacy', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3679, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Leitrim Education for Adults: 071-962 1366  ', 3, 'numeracy', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3680, 'Level 3 Using Technology', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Leitrim Education for Adults: 071-962 1366 ', 3, 'digital_skills', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3681, 'Level 4 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Leitrim Education for Adults: 071-962 1366  ', 4, 'literacy', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3682, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Leitrim Education for Adults: 071-962 1366  ', 4, 'numeracy', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3683, 'Level 4 Using Technology', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Leitrim Education for Adults: 071-962 1366 ', 4, 'digital_skills', 'Leitrim', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '071-962 1366', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3684, 'Level 1 Reading and Writing', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing.', 1, 'literacy', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=309747', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Mary Dunne

', '061-445725', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3685, 'Build your maths skills', 'This course is for you need to brush-up or revisit your practical maths skills. The course will build your confidence and capacity whether the skills development is needed for work, learning or home based application purposes.', 1, 'numeracy', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=309060', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Máire Kerrane', '061-445794', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3686, 'Level 1 Computer Skills', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.

At the end of this course, you may be able to:

- access and use a computer and applications', 1, 'digital_skills', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=328369', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Geraldine O''Reilly', '061-1445740', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3687, 'Level 2 Reading and Writing ', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing.', 2, 'literacy', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=277282', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Lorraine Markham

', '061-445746', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3688, 'Level 2 Maths Skills', 'This course is for those who would like to develop their maths skills through cooking and baking.

There is a practical aspect to the course that will aim to develop your cooking and baking skills while giving you the opportunity to improve your maths skills.', 2, 'numeracy', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306766', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Geraldine O''Reilly', '061-1445740', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3689, 'Level 2 Using Technology', 'The aim of this course is for learners to acquire the basic skills and knowledge to access and operate a computer with confidence.

After this course you will be able to:

- Turn a personal computer on and off safely
- Use frequently-used keys appropriately e.g. enter, space bar,upper and lower case, delete
- Use a software package, involving opening a package, entering and manipulating text/image/data, save to file, print and exit safely
- Access websites on the internet', 2, 'digital_skills', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306666', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Geraldine O''Reilly', '061-1445740', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3690, 'Level 3 Communications', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing, as well as developing your communications skills.

After this course you will be able to understand and be able to use the internet and email to carry out personal tasks. You will also improve your reading, writing and spellings skills!', 3, 'literacy', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306636', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Geraldine O''Reilly', '061-1445740', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3691, 'Level 3 Maths', 'This course is for you if you would like to improve your mathematical knowledge and skills and learn how to apply these in a variety of contexts. It involves a mix of classroom learning and practical activities in an engaging and interactive learning environment.', 3, 'numeracy', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306137', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Geraldine O''Reilly', '061-1445740', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3692, 'Level 3 Using Technology', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers. At the end of this course you will be able to:

- Use digital devices (such as smart phone and tablets/computers)
- Communicate by text, sound, and images and understand the implications in for business and social and daily life.', 3, 'digital_skills', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306628', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Lorraine Markham

', '061-445746', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3693, 'Level 4 Literacy and Word Processing', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing, as well as developing your communications and word processing skills.
', 4, 'literacy', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=305952', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Lorraine Markham

', '061-445746', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3694, 'Level 4 Maths', 'This course is for you if you would like to improve your mathematical knowledge and skills and learn how to apply these in a variety of contexts. It involves a mix of classroom learning and practical activities in an engaging and interactive learning environment.

At Level 4 the focus is on work, employability or preparing you to progress into further learning!', 4, 'numeracy', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306629', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Geraldine O''Reilly', '061-1445740', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3695, 'Level 4 Computer Applications', 'This course is for you if you would like to expand your knowledge and skills in the use of common computer applications such as databases, spreadsheets and computer graphics. As part of this course, learners will learn terminology associated with computer applications and how to create and modify databases, spreadsheets and drawings.

At level 4 the focus is on work, employability or preparing you to progress into further learning.

Skills to Compete courses are open to all learners who are interested in upskilling professionally or personally.', 4, 'digital_skills', 'Limerick City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=306632', 1, 'FET Centre, O''Connell Avenue Campus', NULL, NULL, 'Máire Kerrane', '061-445794', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3696, 'LIteracy Support', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing. It will give you the chance to build your skills, abilities, talents, interests and confidence by learning something new or different.', 1, 'literacy', 'Limerick County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=331362', 1, 'FET Centre, Kilmallock Town Campus', NULL, NULL, 'Robbie Hammond', '063 20246', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3697, 'Build your maths skills', 'This course is for you need to brush-up or revisit your everyday maths skills. It will give you the chance to build your skills, abilities, talents, interests and confidence by learning something new or different.', 1, 'numeracy', 'Limerick County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=331370', 1, 'FET Centre, Kilmallock Town Campus', NULL, NULL, 'Robbie Hammond', '063 20246', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3698, 'Computers for Beginners', 'This programme aims to offer you the chance to build your computer skills, abilities, talents, interests and confidence by learning
something new or different!

You will get the opportunity to use what you are learning in your everyday life and build your confidence by using what you are learning in new situations.', 1, 'digital_skills', 'Limerick County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=329509', 1, 'College of FET, Cappamore Campus', NULL, NULL, 'Sean O''Carroll', '063 20246', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3699, 'Level 2 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Limerick Adult Education Centre: 061-445746  ', 2, 'literacy', 'Limerick County', 'https://learningandskills.ie/core-skills/', 1, NULL, NULL, NULL, NULL, '061-445746', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3700, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Limerick Adult Education Centre: 061-445746', 2, 'numeracy', 'Limerick County', 'https://learningandskills.ie/core-skills/', 1, NULL, NULL, NULL, NULL, '061-445746', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3701, 'Level 2 Computers for Beginners', 'This programme offers you the chance to gain skills and knowledge in the use of computers and associated technology for everyday life and the work environment.

This is a basic computer class for adults who need to learn how to use a computer, send emails, and use the internet safely.', 2, 'digital_skills', 'Limerick County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=316356', 1, 'FET Centre, Newcastle West Campus', NULL, NULL, 'Enda O Callaghan', '069 78216', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3702, 'Level 3 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Limerick Adult Education Centre: 061-445746  ', 3, 'literacy', 'Limerick County', 'https://learningandskills.ie/core-skills/', 1, NULL, NULL, NULL, NULL, '061-445746', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3703, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Limerick Adult Education Centre: 061-445746', 3, 'numeracy', 'Limerick County', 'https://learningandskills.ie/core-skills/', 1, NULL, NULL, NULL, NULL, '061-445746', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3704, 'Level 3 Information Technologies', 'This programme has been designed to enable you to develop and improve word processing skills, online skills, and general computer literacy.

The overall aim of the programme is to provide you with the opportunity to improve your communication and ICT skills.', 3, 'digital_skills', 'Limerick County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=316361', 1, 'FET Centre, Newcastle West Campus', NULL, NULL, 'Enda O Callaghan', '069 78216', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3705, 'Level 4 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Limerick Adult Education Centre: 061-445746  ', 4, 'literacy', 'Limerick County', 'https://learningandskills.ie/core-skills/', 1, NULL, NULL, NULL, NULL, '061-445746', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3706, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Limerick Adult Education Centre: 061-445746', 4, 'numeracy', 'Limerick County', 'https://learningandskills.ie/core-skills/', 1, NULL, NULL, NULL, NULL, '061-445746', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3707, 'Level 4 Information Technology', 'This course is for you if you would like to expand your knowledge and skills in the use of common computer applications such as databases, spreadsheets and computer graphics.

As part of this course, learners will learn terminology associated with computer applications and how to create and modify databases, spreadsheets and drawings.', 4, 'digital_skills', 'Limerick County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=307278', 1, 'FET Centre, Hospital Campus', NULL, NULL, 'Sean O''Carroll', '063 20246', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3708, 'Level 1 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Longford Adult Learning Centre: 043-334 5609 ', 1, 'literacy', 'Longford', 'https://www.lwetb.ie/adult-learning/', 1, 'Adult Literacy Longford', NULL, NULL, 'Frances Stephenson', '043-334 5609 ', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3709, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Longford Adult Learning Centre: 043-334 5609 ', 1, 'numeracy', 'Longford', 'https://www.lwetb.ie/adult-learning/', 1, 'Adult Literacy Longford', NULL, NULL, 'Frances Stephenson', '043-334 5609 ', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3710, 'Level 1 Using Technology', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Longford Adult Learning Centre: 043-334 5609 ', 1, 'digital_skills', 'Longford', 'https://www.lwetb.ie/adult-learning/', 1, 'Adult Literacy Longford', NULL, NULL, 'Frances Stephenson', '043-334 5609 ', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3711, 'Level 2 Reading and Writing', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing.', 2, 'literacy', 'Longford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=304244', 1, 'Adult Literacy Longford', NULL, NULL, 'Frances Stephenson', '043-334 5609 ', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3712, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Longford Adult Learning Centre: 043-334 5609 ', 2, 'numeracy', 'Longford', 'https://www.lwetb.ie/adult-learning/', 1, 'Adult Literacy Longford', NULL, NULL, 'Frances Stephenson', '043-334 5609 ', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3713, 'Level 2 Basic Computer Skills', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.', 2, 'digital_skills', 'Longford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=331318', 1, 'Adult Literacy Longford', NULL, NULL, 'Frances Stephenson', '043-334 5609 ', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3714, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Longford Adult Learning Centre: 043-334 5609 ', 3, 'literacy', 'Longford', 'https://www.lwetb.ie/adult-learning/', 1, 'Adult Literacy Longford', NULL, NULL, 'Frances Stephenson', '043-334 5609 ', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3715, 'Level 3 Maths Skills', 'Understanding and performing common Maths calculations is a key skill, when seeking working, looking for promotion or to support family members at home.

This core module is part of the QQI Level 3 Award in Employment Skills and/or ICT Skills. It''s aim is to help you understand common calculations that may have seemed difficult, first time around. It is delivered at a relaxed pace with clear examples to ensure understanding of this enjoyable module.', 3, 'numeracy', 'Longford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=328501', 1, 'Longford Further Education & Training Centre', NULL, NULL, 'Eileen Donnelly', '087 137 6486', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3716, 'Level 3 Managing your finances', 'This course is aimed at adults who wish to learn more about managing personal finances- borrowing, saving, budgeting, income and expenditure, bills, tax, banking, etc', 3, 'numeracy', 'Longford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=304510', 1, 'Adult Literacy Longford', NULL, NULL, 'Frances Stephenson', '043-334 5609 ', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3717, 'Level 3 Computer Skills', 'This course is aimed at adults who have basic computer skills but want to learn more about using the internet.', 3, 'digital_skills', 'Longford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=304191', 1, 'Adult Literacy Longford', NULL, NULL, 'Frances Stephenson', '043-334 5609 ', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3718, 'Level 4 English and Communications', 'Effective communication skills are key and necessary for all aspects of work, personal life and our social lives. Employers highly value training in this area.

This module is ideal if you are returning to work or hoping to progress or change career direction. If you simply want to improve your communication skills-then join us.', 4, 'literacy', 'Longford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=324878', 1, 'Adult Literacy Longford', NULL, NULL, 'Eileen Donnelly', '087 137 6486', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3719, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Longford Adult Learning Centre: 043-334 5609 ', 4, 'numeracy', 'Longford', 'https://www.lwetb.ie/adult-learning/', 1, 'Adult Literacy Longford', NULL, NULL, 'Frances Stephenson', '043-334 5609 ', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3720, 'Level 4 Computer Skills', 'This course is for you if you would like to expand your knowledge and skills in the use of common computer applications such as databases, spreadsheets and computer graphics. As part of this course, learners will learn terminology associated with computer applications and how to create and modify databases, spreadsheets and drawings.', 4, 'digital_skills', 'Longford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=324981', 1, 'Longford Further Education & Training Centre', NULL, NULL, 'Eileen Donnelly', '087 137 6486', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3721, 'Level 1 Reading and Writing', 'Get in touch with your Adult Educational Guidance Service. They will support you in making educational, career and life choices. The service is free, confidential and impartial. The Guidance Counsellor will give space to reflect on skills, talents and aptitudes and to explore educational and work/career goals.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Ann Fallon on 087-2300195 to make an appointment today!', 1, 'literacy', 'Louth', 'https://www.lmetb.ie/adult-education/', 1, NULL, NULL, NULL, 'Ann Fallon', '087-2300195', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3722, 'Level 1 Maths', 'Get in touch with your Adult Educational Guidance Service. They will support you in making educational, career and life choices. The service is free, confidential and impartial. The Guidance Counsellor will give space to reflect on skills, talents and aptitudes and to explore educational and work/career goals.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Ann Fallon on 087-2300195 to make an appointment today!', 1, 'numeracy', 'Louth', 'https://www.lmetb.ie/adult-education/', 1, NULL, NULL, NULL, 'Ann Fallon', '087-2300195', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3723, 'Level 1 Using Technology', 'Get in touch with your Adult Educational Guidance Service. They will support you in making educational, career and life choices. The service is free, confidential and impartial. The Guidance Counsellor will give space to reflect on skills, talents and aptitudes and to explore educational and work/career goals.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Ann Fallon on 087-2300195 to make an appointment today!', 1, 'digital_skills', 'Louth', 'https://www.lmetb.ie/adult-education/', 1, NULL, NULL, NULL, 'Ann Fallon', '087-2300195', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3724, 'Level 2 Reading and Writing', 'Get in touch with your Adult Educational Guidance Service. They will support you in making educational, career and life choices. The service is free, confidential and impartial. The Guidance Counsellor will give space to reflect on skills, talents and aptitudes and to explore educational and work/career goals.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Ann Fallon on 087-2300195 to make an appointment today!', 2, 'literacy', 'Louth', 'https://www.lmetb.ie/adult-education/', 1, NULL, NULL, NULL, 'Ann Fallon', '087-2300195', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3725, 'Level 2 Maths', 'Get in touch with your Adult Educational Guidance Service. They will support you in making educational, career and life choices. The service is free, confidential and impartial. The Guidance Counsellor will give space to reflect on skills, talents and aptitudes and to explore educational and work/career goals.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Ann Fallon on 087-2300195 to make an appointment today!', 2, 'numeracy', 'Louth', 'https://www.lmetb.ie/adult-education/', 1, NULL, NULL, NULL, 'Ann Fallon', '087-2300195', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3726, 'Level 2 Using Technology', 'Get in touch your Adult Educational Guidance Service. They will support you in making educational, career and life choices. The service is free, confidential and impartial. The Guidance Counsellor will give space to reflect on skills, talents and aptitudes and to explore educational and work/career goals.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Ann Fallon on 087-2300195 to make an appointment today!', 2, 'digital_skills', 'Louth', 'https://www.lmetb.ie/adult-education/', 1, NULL, NULL, NULL, 'Ann Fallon', '087-2300195', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3727, 'Level 3 Reading and Writing', 'Get in touch with your Adult Educational Guidance Service. They will support you in making educational, career and life choices. The service is free, confidential and impartial. The Guidance Counsellor will give space to reflect on skills, talents and aptitudes and to explore educational and work/career goals.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Ann Fallon on 087-2300195 to make an appointment today!', 3, 'literacy', 'Louth', 'https://www.lmetb.ie/adult-education/', 1, NULL, NULL, NULL, 'Ann Fallon', '087-2300195', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3728, 'Level 3 Brush Up on Your Maths Skills', 'This programme module aims to provide the Learner with the confidence to use mathematical concepts and relationships to solve real life mathematical problems that can be experienced in their personal life, educational life and work life.', 3, 'numeracy', 'Louth', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=317203', 1, 'Adult Further Education Centre Dundalk', NULL, NULL, NULL, '(042) 9364623', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3729, 'Level 3 Using Technology', 'This course aims to inform you about computers so that you have the confidence to access and operate a computer on your own. ', 3, 'digital_skills', 'Louth', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=328518', 1, 'BTEI Programme Ardee', NULL, NULL, 'Vivien Lynch', '042 9364623', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3730, 'Level 4 Business English', 'Would you like to be able to communicate better in work situations, well this is the course for you. You will learn the vocabulary needed for a business environment, practice making and taking phone calls with the appropriate greeting and language. Improve your written communication between colleagues using emails and message boards such as teams. You will get the experience of a formal meeting, the vocabulary used and how to take minutes of the meeting.

Lastly you will become more confident in dealing with various business documents, such as brochures, invoices, forms and financial statements. Throughout, your focus will be on the correct use of punctuation and grammar and proofreading your work.', 4, 'literacy', 'Louth', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=329040', 1, 'Centre for Continuing Education Drogheda', NULL, NULL, NULL, '(042) 9364623', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3731, 'Level 4 Maths', 'Get in touch with your Adult Educational Guidance Service. They will support you in making educational, career and life choices. The service is free, confidential and impartial. The Guidance Counsellor will give space to reflect on skills, talents and aptitudes and to explore educational and work/career goals.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Ann Fallon on 087-2300195 to make an appointment today!', 4, 'numeracy', 'Louth', 'https://www.lmetb.ie/adult-education/', 1, NULL, NULL, NULL, 'Ann Fallon', '087-2300195', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3732, 'Level 4 Information Technology Skills', 'This course is for you if you would like to expand your knowledge and skills in the use of common computer applications such as databases, spreadsheets and computer graphics.

As part of this course, learners will learn terminology associated with computer applications and how to create and modify databases, spreadsheets and drawings.', 4, 'digital_skills', 'Louth', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=329060', 1, 'Centre for Continuing Education Drogheda', NULL, NULL, 'Vivien Lynch', '042 9364623', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3733, 'Reading and Writing One to One Support', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing.', 1, 'literacy', 'Mayo', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320355', 1, 'Further Education and Training Centre Castlebar', NULL, NULL, 'Rosario Cooney', '094 90 38038', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3734, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Ballina: 096-71652
Belmullet: 097-82981
Castlebar: 094-9038038
Westport: 098-56342
Achill: 098-56342
Ballinrobe: 094-9542288 ', 1, 'numeracy', 'Mayo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '094 90 24188', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3735, 'Introduction to Computers', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.', 1, 'digital_skills', 'Mayo', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=313143', 1, 'Further Education Centre Ballina', NULL, NULL, 'Mary Morrissey', '096 71652', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3736, 'Level 2 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Ballina: 096-71652
Belmullet: 097-82981
Castlebar: 094-9038038
Westport: 098-56342
Achill: 098-56342
Ballinrobe: 094-9542288 ', 2, 'literacy', 'Mayo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '094 90 24188', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3737, 'Level 2 Maths', 'This course will focus on basic everyday Maths - you will learn useful skills for you own use, or learn ways to support your child with their Maths homework.

If you would like more information, please email sorchamoran@msletb.ie or phone 0949038038/ 094 90 35119 if you would like us to post an application form to you. ', 2, 'numeracy', 'Mayo', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320884', 1, 'Further Education and Training Centre Castlebar', NULL, NULL, 'Sorcha Moran', '094 90 38038', 'sorchamoran@msletb.ie', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3738, 'Level 2 Using Technology', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.', 2, 'digital_skills', 'Mayo', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=315879', 1, 'Further Education Centre Ballina', NULL, NULL, 'Mary Morrissey', '096 71652', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3739, 'Level 3 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Ballina: 096-71652
Belmullet: 097-82981
Castlebar: 094-9038038
Westport: 098-56342
Achill: 098-56342
Ballinrobe: 094-9542288 ', 3, 'literacy', 'Mayo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '094 90 24188', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3740, 'Level 3 Maths - Let''s work together! ', 'If you feel you would like to give Maths a try again then this course is for you. With your tutor you can make sense of those areas of Maths that puzzled you.

If you would like more information, please email sorchamoran@msletb.ie or phone 0949038038/ 094 90 35119 if you would like us to post an application form to you.', 3, 'numeracy', 'Mayo', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320878', 1, 'Further Education and Training Centre Castlebar', NULL, NULL, 'Sorcha Moran', '094 90 38038', 'sorchamoran@msletb.ie', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3741, 'Level 3 Computers and Digital Media', 'This course will -
* Introduce the learner to the terms which define digital media
* To be aware of the laws governing copyright, data protection, personal security and
workplace policy
* To use and manage digital media devices
To introduce the Learner to the key terms and considerations associated with using the
internet
* To learn about taking responsibility for one’s own personal security and privacy when using
the internet and email
* To develop skills to search the internet quickly and competently to find information of
interest to the Learner
* To facilitate the Learner to develop the skills to use the internet and e-mail as an effective
communication tool', 3, 'digital_skills', 'Mayo', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320921', 1, 'Further Education and Training Centre Castlebar', NULL, NULL, 'Rosario Cooney', '094 90 38038', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3742, 'Level 4 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Ballina: 096-71652
Belmullet: 097-82981
Castlebar: 094-9038038
Westport: 098-56342
Achill: 098-56342
Ballinrobe: 094-9542288 ', 4, 'literacy', 'Mayo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, NULL, NULL, NULL, NULL, '094 90 24188', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3743, 'Level 4 Maths for Progression', 'Build on what you already know - Maths is so useful for many situations:

* For work
* For further learning
* Progression onto a College Course
* Thinking of applying for an Apprenticeship
* Supporting your children with their Maths homework
* Out of interest
* Giving Maths a second chance

Please contact sorchamoran@msletb.ie for more information about the course', 4, 'numeracy', 'Mayo', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320866', 1, 'Further Education and Training Centre Castlebar', NULL, NULL, 'Sorcha Moran', '094 90 38038', 'sorchamoran@msletb.ie', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3744, 'Level 4 Information Technology', 'The aim of this programme is:

To create an awareness of I.T. concepts and technology and the impact of Information
Technology on everyday life.
To facilitate the learner to organise their files, folders and computer workspace.
To enable the learner to develop skills in data entry.
To enable the learner to develop word processing skills to perform common tasks.
To facilitate the learner to develop the skills to use the Internet and email as an effective
communication tool.
To assist the learner to develop the language, literacy and numeracy skills related to
Information Technology Skills through the medium of the module themes and content
To enable the learner to take responsibility for his/her own learning.', 4, 'digital_skills', 'Mayo', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320906', 1, 'Further Education and Training Centre Castlebar', NULL, NULL, 'Rosario Cooney', '094 90 38038', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3745, 'Level 1 Reading and Writing ', 'This free 12-week course aims to help adults improve their basic reading and writing skills.

We can help you to:
 - Read instructions, signs, letters or bills
 - Fill in forms, write simple letters or notes
 - Use your smartphone, iPad or laptop to send messages/email', 1, 'literacy', 'Meath', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=277343', 1, 'Trim Adult Learning Centre', NULL, NULL, 'Martin, Eilís or Aisling', '1800 991 898', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3746, 'Level 1 Maths', 'Learn how to manage your money budget and a household budget.
Basic maths, percentages and calculations.
How to save for a car, a holiday, a wedding or even communion costs.', 1, 'numeracy', 'Meath', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=298191', 1, 'Navan FET Centre', NULL, NULL, 'Martin, Eilís or Aisling', '1800 991 898', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3747, 'Basic Computer Skills', 'FREE Laptop and iPad Classes for Adults!

Learn to use a computer/iPad/smartphone and understand software and hardware and applications (Apps).
Create documents, photos and videos.
Improve reading, writing and spelling using the computer/iPad/smartphone
Learn to save, find, change and print your documents.
Use Technology - Zoom, Teams, Onedrive and whatsapp.', 1, 'digital_skills', 'Meath', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=278042', 1, 'Navan FET Centre', NULL, NULL, 'Martin, Eilís or Aisling', '1800 991 898', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3748, 'Level 2 Reading and Writing ', 'Get in touch your Adult Educational Guidance Service and find a course that will help you develop your reading and writing skills. They will support you in making educational, career and life choices. The service is free, confidential and impartial.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Martin, Eilís or Aisling on 1800 991 898 for more information.', 2, 'literacy', 'Meath', 'https://www.lmetb.ie/adult-education/adult-learning-services/adult-learning-services-navan/', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3749, 'Level 2 Maths for Fun', 'This class covers Level 2 Maths, Quantity and Number. It will give you more confidence in Maths.

Maths for shopping; adding, subtracting, prices and receipts

How to save money; if you put money aside each week how much you will have in a month, 6 months, 1 year

Costing a holiday, a wedding or buying new items

How to use numbers in everyday life: (percentages, decimal and fractions)', 2, 'numeracy', 'Meath', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=277341', 1, 'Trim Adult Learning Centre', NULL, NULL, 'Martin, Eilís or Aisling', '1800 991 898', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3750, 'Level 2 Computers', 'Get in touch your Adult Educational Guidance Service and find a course that will help you develop your computer skills. They will support you in making educational, career and life choices. The service is free, confidential and impartial.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Martin, Eilís or Aisling on 1800 991 898 for more information.', 2, 'digital_skills', 'Meath', 'https://www.lmetb.ie/adult-education/adult-learning-services/adult-learning-services-navan/', 1, NULL, NULL, NULL, 'Martin, Eilís or Aisling', '1800 991 898', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3751, 'Level 3 Reading and Writing ', 'Get in touch your Adult Educational Guidance Service and find a course that will help you develop your reading and writing skills. They will support you in making educational, career and life choices. The service is free, confidential and impartial.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Martin, Eilís or Aisling on 1800 991 898 for more information.', 3, 'literacy', 'Meath', 'https://www.lmetb.ie/adult-education/adult-learning-services/adult-learning-services-navan/', 1, NULL, NULL, NULL, 'Martin, Eilís or Aisling', '1800 991 898', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3752, 'Level 3 Maths', 'Get in touch your Adult Educational Guidance Service and find a course that will help you develop your maths skills. They will support you in making educational, career and life choices. The service is free, confidential and impartial.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Martin, Eilís or Aisling on 1800 991 898 for more information.', 3, 'numeracy', 'Meath', 'https://www.lmetb.ie/adult-education/adult-learning-services/adult-learning-services-navan/', 1, NULL, NULL, NULL, 'Martin, Eilís or Aisling', '1800 991 898', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3753, 'Level 3 Computers', 'Get in touch your Adult Educational Guidance Service and find a course that will help you develop your computer skills. They will support you in making educational, career and life choices. The service is free, confidential and impartial.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Martin, Eilís or Aisling on 1800 991 898 for more information.', 3, 'digital_skills', 'Meath', 'https://www.lmetb.ie/adult-education/adult-learning-services/adult-learning-services-navan/', 1, NULL, NULL, NULL, 'Martin, Eilís or Aisling', '1800 991 898', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3754, 'Level 4 Reading and Writing ', 'Get in touch your Adult Educational Guidance Service and find a course that will help you develop your reading and writing skills. They will support you in making educational, career and life choices. The service is free, confidential and impartial.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Martin, Eilís or Aisling on 1800 991 898 for more information.', 4, 'literacy', 'Meath', 'https://www.lmetb.ie/adult-education/adult-learning-services/adult-learning-services-navan/', 1, NULL, NULL, NULL, 'Martin, Eilís or Aisling', '1800 991 898', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3755, 'Level 4 Maths', 'Get in touch your Adult Educational Guidance Service and find a course that will help you develop your maths skills. They will support you in making educational, career and life choices. The service is free, confidential and impartial.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Martin, Eilís or Aisling on 1800 991 898 for more information.', 4, 'numeracy', 'Meath', 'https://www.lmetb.ie/adult-education/adult-learning-services/adult-learning-services-navan/', 1, NULL, NULL, NULL, 'Martin, Eilís or Aisling', '1800 991 898', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3756, 'Level 4 Computers', 'Get in touch your Adult Educational Guidance Service and find a course that will help you develop your computer skills. They will support you in making educational, career and life choices. The service is free, confidential and impartial.

The Adult Guidance Information Officer can give up to date accurate and impartial information on education and training opportunities locally and nationally. They offer help in making course applications, funding supports, labour market information, qualification recognition and signposting to appropriate supports.

Contact Martin, Eilís or Aisling on 1800 991 898 for more information.', 4, 'digital_skills', 'Meath', 'https://www.lmetb.ie/adult-education/adult-learning-services/adult-learning-services-navan/', 1, NULL, NULL, NULL, 'Martin, Eilís or Aisling', '1800 991 898', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3757, 'Level 1 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Monaghan Adult Learning Centre: 047-30888 ', 1, 'literacy', 'Monaghan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Monaghan Adult Learning Centre', NULL, NULL, NULL, '047-30888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3758, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Monaghan Adult Learning Centre: 047-30888 ', 1, 'numeracy', 'Monaghan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Monaghan Adult Learning Centre', NULL, NULL, NULL, '047-30888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3759, 'Level 1 Computers', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Monaghan Adult Learning Centre: 047-30888 ', 1, 'digital_skills', 'Monaghan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Monaghan Adult Learning Centre', NULL, NULL, NULL, '047-30888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3760, 'Level 2 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Monaghan Adult Learning Centre: 047-30888 ', 2, 'literacy', 'Monaghan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Monaghan Adult Learning Centre', NULL, NULL, NULL, '047-30888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3761, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Monaghan Adult Learning Centre: 047-30888 ', 2, 'numeracy', 'Monaghan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Monaghan Adult Learning Centre', NULL, NULL, NULL, '047-30888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3762, 'Level 2 Using Technology', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.', 2, 'digital_skills', 'Monaghan', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=308699', 1, 'Monaghan Adult Learning Centre', NULL, NULL, 'Ceinwen Fergus', '087 1967888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3763, 'Level 3 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Monaghan Adult Learning Centre: 047-30888 ', 3, 'literacy', 'Monaghan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Monaghan Adult Learning Centre', NULL, NULL, NULL, '047-30888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3764, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Monaghan Adult Learning Centre: 047-30888 ', 3, 'numeracy', 'Monaghan', 'http://cavanmonaghan.etb.ie/adult-education-services/adult-literacy/', 1, 'Monaghan Adult Learning Centre', NULL, NULL, NULL, '047-30888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3765, 'Level 3 Digital Media: Information and Communication Technologies ', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology, the internet and computers.', 3, 'digital_skills', 'Monaghan', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=331678', 1, 'Monaghan Adult Learning Centre', NULL, NULL, 'Ceinwen Fergus', '087 1967888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3766, 'Level 4 Pathways to Success: English and Communications', 'Effective communication skills are key and necessary for all aspects of work, personal life and our social lives. Employers highly value training in this area.

This module is ideal if you are returning to work or hoping to progress or change career direction. If you simply want to improve your communication skills-then join us.', 4, 'literacy', 'Monaghan', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=329746', 1, 'Monaghan Adult Learning Centre', NULL, NULL, 'Ceinwen Fergus', '087 1967888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3767, 'Level 4 Pathways to Success: Maths', 'Build on what you already know - Maths is so useful for many situations:

* For work
* For further learning
* Progression on to a College Course
* Thinking of applying for an Apprenticeship
* Supporting your children with their Maths homework
* Out of interest
* Giving Maths a second chance', 4, 'numeracy', 'Monaghan', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=331997', 1, 'Monaghan Adult Learning Centre', NULL, NULL, 'Ceinwen Fergus', '087 1967888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3768, 'Level 4 Computer Applications', 'This course is for you if you would like to expand your knowledge and skills in the use of common computer applications such as databases, spreadsheets and computer graphics.

As part of this course, learners will learn terminology associated with computer applications and how to create and modify databases, spreadsheets and drawings.', 4, 'digital_skills', 'Monaghan', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=308939', 1, 'Monaghan Adult Learning Centre', NULL, NULL, 'Ceinwen Fergus', '087 1967888', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (992, 'Level 4 Maths', 'This course will help you develop the relevant knowledge, skill and competence in a broad range of employment and personal skills which enable employment, under direct supervision, in a variety of sectors, or progression to further education or training.', 4, 'numeracy', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=294878', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Michelle Kelly', '01-8560088', NULL, '294878', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (993, 'Level 4 Office Skills', 'The aim of this course is to help you to develop the relevant knowledge, skills and competence in a broad range of office skills which enable employment, under direct supervision, in a general office, or progression to further education or training.

You will develop knowledge related to office skills, organisation, personal and interpersonal skills and work experience in a relevant office environment. The course includes business English, business calculations and maths to also develop your core skills in these areas.', 4, 'numeracy', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=284421', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Beti Marinescu', '01-8212829', NULL, '284421', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (994, 'Level 4 English and Communications', 'This programme offers a chance to enhance your knowledge and skills in a broad range of subjects in a friendly and supportive environment. Candidates who haven’t completed Leaving Certificate take up this course to complete their schooling, to try new subjects at an accessible level, as a stepping stone to further education, to improve employment prospects and to gain confidence.', 4, 'literacy', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=297046', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Patty Brown', '01-8314677', NULL, '297046', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (998, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Ballyfermot Adult Literacy Centre: 01-623 9716
Crumlin Adult Literacy Centre: 01-4547054
Ringend Adult Education Service: 01-6684571
Liberties Adult Education Service: 01-4540759', 1, 'numeracy', 'dublin', NULL, 50, 'Dublin South', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (999, 'Level 1 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Ballyfermot Adult Literacy Centre: 01-623 9716
Crumlin Adult Literacy Centre: 01-4547054
Ringsend Adult Education Service: 01-6684571
Liberties Adult Education Service: 01-4540759', 1, 'literacy', 'dublin', NULL, 50, 'Dublin South', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1001, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

Ballyfermot Adult Literacy Centre: 01-623 9716
Crumlin Adult Literacy Centre: 01-4547054
Ringend Adult Education Service: 01-6684571
Liberties Adult Education Service: 01-4540759', 2, 'numeracy', 'dublin', NULL, 50, 'Dublin South', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3769, 'Getting started: Reading and Writing', 'These sessions are for those who feel they are struggling a little with their reading, writing, and spelling. It starts out on a one to one basis and then the student moves on to a group situation.

The student chooses where to start from and the pace to work at. Confidentiality is assured!!', 1, 'literacy', 'Offaly', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=312888', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3770, 'Everyday Maths', 'This course is for anyone who struggles with Maths in their everyday lives, and who wants to improve their skills in a small group setting.', 1, 'numeracy', 'Offaly', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=312883', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3771, 'Computers for Beginners', 'Get in touch with your local Adult Literacy Centre and find a course that will give you the chance to get back into learning and build your skills and confidence in using technology and computers.

Offaly Adult Education Centre: 057-934 9424  ', 1, 'digital_skills', 'Offaly', 'https://www.loetb.ie/adult-literacy', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3772, 'Level 2 Reading', 'Reading & Writing are important life skills. Reading keeps our brain active and it helps with focus and memory. Reading is knowledge and gives us confidence.

If you make a habit of reading it becomes very enjoyable. Why not join our reading class and see for yourself! You will have the option to achieve a QQI Reading Component Award at Level 2.', 2, 'literacy', 'Offaly', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=312843', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3773, 'Level 2 Maths', 'This course is suitable for learners who struggle with some of the basic mathematical concepts. Time and some effort is all that’s needed to improve the basic skills of adding, subtracting, multiplying and dividing. You will discover the role of mathematics in our everyday lives.

This class offers a comfortable maths learning experience and on completion of this Module, you may progress on to QQI Level 3.', 2, 'numeracy', 'Offaly', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=313555', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3774, 'Level 2 Computer Skills', 'Digital devices are very much part of our daily lives and we need to get to know how to utilise them to the best. This course, Level 1 & 2 is for anyone who would like to build up confidence in the use of computers/iPads/ phones/Apps. Learn the very basics and with this knowledge, you can progress to writing, editing, saving, printing and filing documents.

Computer language will become more familiar, and this is a very good starting point on your digital journey with progression on to QQI Level 3 Skills in Word Processing, Internet Skills, Spreadsheets and more.', 2, 'digital_skills', 'Offaly', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=308283', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3775, 'Level 3 Communications', 'Communication skills enable us to express ourselves in a positive and clear way, both verbally and in written form. It is a two-way situation, so we need to develop the skills of listening also.

This course helps to develop skills in reading, writing, listening, speaking, using the Internet and sending emails. These set of skills are very important in the Workplace and in our everyday lives.', 3, 'literacy', 'Offaly', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=312660', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3776, 'Level 3 Maths', 'This course offers a vital second chance if you left school early and now want to continue where you left off!

The course is all about developing and understanding mathematical skills. You will work with different kinds of numbers such as – fractions, percentages, decimals and natural and apply them to real life situations. The functions of the calculator will also be developed as will algebra and how we use it in everyday life.

You will get to study in a small group where you can set your own goals and take advantage of the supports available to you.', 3, 'numeracy', 'Offaly', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=315102', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3777, 'Level 3 Computer Skills', 'This course is for anyone who has completed Level 2 Computer Skills or who has good basic computer skills, and who wishes to move to the next level, improving internet and email skills.', 3, 'digital_skills', 'Offaly', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=312909', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3778, 'Level 4 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing skills.

Offaly Adult Education Centre: 057-934 9424  ', 4, 'literacy', 'Offaly', 'https://www.loetb.ie/adult-literacy', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3779, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Offaly Adult Education Centre: 057-934 9424  ', 4, 'numeracy', 'Offaly', 'https://www.loetb.ie/adult-literacy', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3780, 'Level 4 Computer Skills', 'Get in touch with your local Adult Literacy Centre and find a course that will give you the chance to get back into learning and build your skills and confidence in using technology and computers.

Offaly Adult Education Centre: 057-934 9424  ', 4, 'digital_skills', 'Offaly', 'https://www.loetb.ie/adult-literacy', 1, 'Tullamore FET Centre – Adult Literacy', NULL, NULL, 'Marina O''Malley', '057-9349429', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3781, 'Level 1 Reading and Writing ', 'At the end of this course, you will be able to:

• Spelling common everyday words
• Basic Reading Skills
• Basic Writing Skills

You''ll also be able to:

• Decide what you need to work on in the next course or class you go on to.
• Judge what kind of teaching helps you the most. This might help you decide what
you want to do next.
• Work in a group with other adults who are there for the same reasons as you.', 1, 'literacy', 'Roscommon', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=329840', 1, 'Adult Basic Education Centre Boyle', NULL, NULL, 'Jean Feeney', '071 966 3246', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3782, 'Level 1 Everyday Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

County Roscommon Adult Education Services: 090 66 26151 ', 1, 'numeracy', 'Roscommon', 'https://gretb.ie/further-education-training/adult-basic-education-service/', 1, 'Roscommon FET Centre', NULL, NULL, 'Irene Greene', '086 0451427', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3783, 'Level 1 Introduction to Computers', 'This course is aimed for the learner who wants to understand the role of computers in everyday life and operate a personal computer safely in a friendly supervised environment.

Computer skills are abilities and knowledge which allow you to use computers and related technology. They let you use word processing software, access the Internet and manage your files.', 1, 'digital_skills', 'Roscommon', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=329842', 1, 'Adult Basic Education Centre Boyle', NULL, NULL, 'Jean Feeney', '071 966 3246', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3784, 'Level 2 Reading and Writing ', 'This course aims to give you the chance to get back into learning and build your skills and confidence in reading and writing.
', 2, 'literacy', 'Roscommon', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=330123', 1, 'Roscommon FET Centre', NULL, NULL, 'Irene Greene', '086 0451427', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3785, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

County Roscommon Adult Education Services: 090 66 26151 ', 2, 'numeracy', 'Roscommon', 'https://gretb.ie/further-education-training/adult-basic-education-service/', 1, 'Roscommon FET Centre', NULL, NULL, 'Irene Greene', '086 0451427', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3786, 'Level 2 Introduction to Computers', 'This course aims to help you understand the role of computers in everyday life and operate a personal computer safely in a friendly supervised environment.

It is designed to help you improve and develop their basic computer skills. The course will introduce you to keyboard skills and understanding the screen layout.

Learn about basic terms and phrases that we hear in everyday life associated with computers but we may not be familiar with! Learn how to create/access email and explore internet skills.', 2, 'digital_skills', 'Roscommon', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=307795', 1, 'Roscommon FET Centre', NULL, NULL, 'Irene Greene', '086 0451427', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3787, 'Level 3 English and Communications', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading, writing and communication skills.

County Roscommon Adult Education Services: 090 66 26151 ', 3, 'literacy', 'Roscommon', 'https://gretb.ie/further-education-training/adult-basic-education-service/', 1, 'Roscommon FET Centre', NULL, NULL, 'Irene Greene', '086 0451427', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3788, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

County Roscommon Adult Education Services: 090 66 26151 ', 3, 'numeracy', 'Roscommon', 'https://gretb.ie/further-education-training/adult-basic-education-service/', 1, 'Roscommon FET Centre', NULL, NULL, 'Irene Greene', '086 0451427', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3789, 'Level 3 Computer Skills', 'The aim of the program is to:

• Develop skills using word processing applications; the terminology associated with WP and functions and features of Word processing.
• Create documents
• Save and Print and retrieve documents
• To explore a range of functions in the word processing application and use these to enhance and format documents.
• Create a range of functions using Microsoft Excel i.e. Work books, worksheets, formula, data and formatting', 3, 'digital_skills', 'Roscommon', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=309070', 1, 'Roscommon FET Centre', NULL, NULL, 'Irene Greene', '086 0451427', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3790, 'Level 4 English and Communications', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading, writing and communication skills.

County Roscommon Adult Education Services: 090 66 26151 ', 4, 'literacy', 'Roscommon', 'https://gretb.ie/further-education-training/adult-basic-education-service/', 1, 'Roscommon FET Centre', NULL, NULL, 'Irene Greene', '086 0451427', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3791, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a maths course that will work for you.

County Roscommon Adult Education Services: 090 66 26151 ', 4, 'numeracy', 'Roscommon', 'https://gretb.ie/further-education-training/adult-basic-education-service/', 1, 'Roscommon FET Centre', NULL, NULL, 'Irene Greene', '086 0451427', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3792, 'Level 4 Information Technology with Digital Skills', 'Do you want to develop a broad range of knowledge, skills and competence in Information Technology, which will give you many options for employment, or progression to the next level of education; then this is the course for you. Whether you are a school leaver, someone who have been out of employment for some time, or just want to learn about IT, then this course will suit you.

The programme will help those with a little knowledge of IT to broaden their skills as they explore techniques currently in use and given the opportunity to develop practical skills in digital media and social networking tools.

The course also provides an opportunity to explore the workplace with a four week placement, which gives practical experience and can often lead to employment opportunities.', 4, 'digital_skills', 'Roscommon', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=317618', 1, 'Strokestown Further Education Centre', NULL, NULL, NULL, '091-706200', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (968, 'Learn with NALA - Level 1 Reading and Writing', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.
<br/>
We will help you improve your old skills but you will also gain the confidence to learn new ones.
<br/>
Call us today on 1800 20 20 65 to chat about your options.', 1, 'literacy', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 50, NULL, NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3793, 'Reading, Writing and Spelling Support', 'This programme aims to offer you the chance to get back into learning and build your skills and confidence in key skills.

An initial assessment of your key skills in any or all the areas of:

o reading
o writing and spelling
o maths
o computers and other technology.

This assessment is to give you more information on:

• what you can already do, but perhaps aren''t confident in

• what you need to work on to be more confident in everyday or new situations
for work, family or other settings.

• An opportunity to use or practise key skills in everyday life.

• Opportunities to be more confident by using key skills in new or different situations.

• The chance to get ready to start working towards a qualification by working on
the gaps or blocks you might have that hold you back.

• Teaching that is interesting, adult-friendly and that encourages you to learn by
thinking about and discussing your own ideas and opinions.

• Teaching that focuses on what you need for your everyday life.', 1, 'literacy', 'Sligo', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=315073', 1, 'Adult Literacy Service Sligo', NULL, NULL, 'Dolores McLoughlin', '071 9138415', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3794, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Sligo Adult Learning and Education Centre: 071-913 8416 ', 1, 'numeracy', 'Sligo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, 'Sligo Adult Learning and Education Centre', NULL, NULL, NULL, '071-913 8416', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3795, 'Computers for Beginners', 'This course aims to give you the chance to get back into learning and build your skills and confidence in using technology and computers.', 1, 'digital_skills', 'Sligo', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=313142', 1, 'Further Education Centre Ballina', NULL, NULL, 'Mary Morrissey', '096 71652', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3796, 'Level 2 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing.

Sligo Adult Learning and Education Centre: 071-913 8416 ', 2, 'literacy', 'Sligo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, 'Sligo Adult Learning and Education Centre', NULL, NULL, NULL, '071-913 8416', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (970, 'Learn with NALA - Level 2 Pattern and Relationship', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about our Distance Learning Service. You can study online by yourself or work with a tutor over the phone.

This is a level 2 maths course focusing on patterns and relationships. Once you are finished the course you can take an assessment to achieve a level 2 Minor Award Certificate from Quality and Qualifications Ireland (QQI).

Call NALA today on 1800 20 20 65 to chat about your options.', 2, 'numeracy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 50, NULL, NULL, NULL, 'NALA', '1800 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (971, 'Learn with NALA - Level 2 Quantity and Number', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about our Distance Learning Service. You can study online by yourself or work with a tutor over the phone.

This is a level 2 maths course that will help you develop skills in quantities and key maths operations. Once you are finished the course you can take an assessment to achieve a level 2 Minor Award Certificate in Quantity and Number from Quality and Qualifications Ireland (QQI).

Call NALA today on 1800 20 20 65 to chat about your options.', 2, 'numeracy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 50, NULL, NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (972, 'Learn with NALA - Level 2 Reading', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about our Distance Learning Service. You can study online by yourself or work with a tutor over the phone.

This is a level 2 reading course that will help you develop your skills in reading everyday material. Once you are finished the course you can take an assessment to achieve a level 2 Minor Award Certificate in Reading from Quality and Qualifications Ireland (QQI).

Call NALA today on 1800 20 20 65 to chat about your options.', 2, 'literacy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 50, NULL, NULL, NULL, 'NALA', '1800 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1032, 'Level 2 Computers for Beginners', 'This course will help you develop the skills and competency to complete tasks and processes, to deal with choices and decision making and to recognise personal talents, abilities and interests.', 2, 'digital_skills', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=296653', 50, 'Cork City', NULL, '2020-09-20 00:00:00+00', 'Fiona Long', '021-455 3180', NULL, '296653', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3797, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Sligo Adult Learning and Education Centre: 071-913 8416 ', 2, 'numeracy', 'Sligo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, 'Sligo Adult Learning and Education Centre', NULL, NULL, NULL, '071-913 8416', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3798, 'Level 2 Computer Skills', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Sligo Adult Learning and Education Centre: 071-913 8416 ', 2, 'digital_skills', 'Sligo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, 'Sligo Adult Learning and Education Centre', NULL, NULL, NULL, '071-913 8416', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3799, 'Level 3 English and Communications', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing.

Sligo Adult Learning and Education Centre: 071-913 8416 ', 3, 'literacy', 'Sligo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, 'Sligo Adult Learning and Education Centre', NULL, NULL, NULL, '071-913 8416', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3800, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Sligo Adult Learning and Education Centre: 071-913 8416 ', 3, 'numeracy', 'Sligo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, 'Sligo Adult Learning and Education Centre', NULL, NULL, NULL, '071-913 8416', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3801, 'Level 3 Digital Media', 'The purpose of this course is to enable the learner to develop the relevant knowledge skill and competence to use a range of skills and tools, under direction and with limited autonomy, in familiar situations. It enables the learner to participate in everyday situations where a knowledge of digital media apps are used.', 3, 'digital_skills', 'Sligo', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318632', 1, 'Further Education Centre Ballina', NULL, NULL, 'Mary Morrissey', '096 71652', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (981, 'Level 1 Maths', 'This is a part time course in Ballymun which will help you to improve your maths skills.

At the end of this course, you will be able to use your new skills and be able to:

• Decide what you need to work on in the next course or class you go on to.

• Judge what kind of teaching helps you the most. This might help you decide what you want to do next.

• Work in a group with other adults who are there for the same reasons as you.

• Put into practice what you have learned so that you can be more confident in everyday new situations.', 1, 'numeracy', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=281775', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Christine Carroll', '01-8622402', NULL, '281775', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (982, 'Level 1 Reading and Writing', 'This is a part time course in Ballymun which will help you to improve your reading and writing.

At the end of this course, you will be able to use your new skills and be able to:

• Decide what you need to work on in the next course or class you go on to.

• Judge what kind of teaching helps you the most. This might help you decide what you want to do next.

• Work in a group with other adults who are there for the same reasons as you.

• Put into practice what you have learned so that you can be more confident in everyday new situations.', 1, 'literacy', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=281769', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Christine Carroll', '01-8622402', NULL, '281769', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (985, 'Level 2 Maths', 'This is a part time programme in Finglas. This course aims to equip you with a range of maths skills for use in social, personal and work life and to encourage you to have the confidence to use these skills in your daily life.

Please contact us for further information at 01-8348018.', 2, 'numeracy', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=286799', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Jacqui Crowther', '01-5585199', NULL, '286799', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (986, 'Level 2 Reading and Writing', 'This is a part time course in Parnell Square.

This module aims to equip you with a range of communication skills for use in social, personal and work life and to encourage you to have the confidence to use these skills in your daily life.

Please contact Anne or Joyce at 01 8147900 for further information', 2, 'literacy', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=236227', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Joyce Gough', '01-8147900', NULL, '236227', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (988, 'Level 3 Maths', 'This is a part time course in Ballymun. You will be able to develop the
relevant knowledge and skill to use a range of skills and tools, under direction and with limited autonomy, in familiar situations.

This course will help you to participate in and contribute to modern society, to pursue a range of employment opportunities or to progress to further
education or training.

For further information please call Christine Carroll on 01 8622402.', 3, 'numeracy', 'dublin', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=280523', 50, 'Dublin North', NULL, '2020-09-20 00:00:00+00', 'Christine Carroll', '01 8622402', NULL, '280523', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3802, 'Level 4 English and Communications', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing.

Sligo Adult Learning and Education Centre: 071-913 8416 ', 4, 'literacy', 'Sligo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, 'Sligo Adult Learning and Education Centre', NULL, NULL, NULL, '071-913 8416', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3803, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Sligo Adult Learning and Education Centre: 071-913 8416 ', 4, 'numeracy', 'Sligo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, 'Sligo Adult Learning and Education Centre', NULL, NULL, NULL, '071-913 8416', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3804, 'Level 4 Computer Skills', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Sligo Adult Learning and Education Centre: 071-913 8416 ', 4, 'digital_skills', 'Sligo', 'https://msletb.ie/further-education-and-training-fet/information-on-our-courses/adult-literacy/', 1, 'Sligo Adult Learning and Education Centre', NULL, NULL, NULL, '071-913 8416', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3805, 'Level 1 Reading and Writing Support', 'Contacting the Adult Learning Scheme is the first step towards getting help - whether it''s help with reading, writing or basic maths and computers.

Our classes take place in relaxed settings, at the person''s own pace. Our adult education tutors are trained to teach reading in a step-by-step way that will also boost the person''s self-confidence.   Apply today!', 1, 'literacy', 'Tipperary', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=294993', 1, 'North Tipperary Adult Education Centre', NULL, NULL, 'Ester Mackey', '067 31845', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3806, 'Level 1 Maths Support', 'This programme will give you the chance to get back into learning and build your maths skills and confidence in key skills.', 1, 'numeracy', 'Tipperary', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=294993', 1, 'North Tipperary Adult Education Centre', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3807, 'Level 1 Computers for Beginners', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

North Tipperary: 067 318 45
South Tipperary: 052-612 7543 ', 1, 'digital_skills', 'Tipperary', 'http://tipperary.etb.ie/further-education/adult-learning-scheme-2/', 1, NULL, NULL, NULL, 'Ester Mackey', '067 31845', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3808, 'Level 2 Reading and Writing Support', 'Every day activities and tasks can be very difficult for an adult who struggles with reading, writing, maths or digital (computer/smartphone) skills. Nearly everything we do involves these skills - whether at home or at work, reading instructions, or signs, letters or bills, phone texts, emails or posters. It is a big part of communication in the world around us.

Contacting the Adult Learning Scheme is the first step towards getting help - whether it''s help with reading, writing or basic maths and computers.
Our classes take place in relaxed settings, at the person''s own pace. Our adult education tutors are trained to teach reading in a step-by-step way that will also boost the person''s self-confidence.

There are thousands of Irish adults who struggle with literacy and/or numeracy but more and more are asking for help and getting it from services like this one.

Take the first step by telephoning 052-6127543 and a staff member will arrange to meet you. Our service is free and is confidential.', 2, 'literacy', 'Tipperary', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=326912', 1, NULL, NULL, NULL, 'Peter Cleary', '052 6127543', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3809, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

North Tipperary: 067 318 45
South Tipperary: 052-612 7543 ', 2, 'numeracy', 'Tipperary', 'http://tipperary.etb.ie/further-education/adult-learning-scheme-2/', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3810, 'Level 2 Getting Connected Using Technology', 'This course aims to help you understand the role of computers in everyday life and operate a personal computer safely in a friendly supervised environment.

It is designed to help you improve and develop their basic computer skills. The course will introduce you to keyboard skills and understanding the screen layout.

Learn about basic terms and phrases that we hear in everyday life associated with computers but we may not be familiar with! Learn how to create/access email and explore internet skills.', 2, 'digital_skills', 'Tipperary', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=315164', 1, 'North Tipperary Adult Education Centre', NULL, NULL, 'Ester Mackey', '067 31845', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3811, 'Level 3 Communications', 'Communication skills enable us to express ourselves in a positive and clear way, both verbally and in written form. It is a two-way situation, so we need to develop the skills of listening also.

This course helps to develop skills in reading, writing, listening, speaking, using the Internet and sending emails. These set of skills are very important in the Workplace and in our everyday lives.', 3, 'literacy', 'Tipperary', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=315167', 1, 'Adult Learning Scheme (Thurles)', NULL, NULL, 'Ester Mackey', '067 31845', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3812, 'Level 3 Maths and Computers', 'This programme provides learners with the opportunity to improve their literacy, numeracy and computer skills.

Learners can work at their own pace and complete the programme in a shorter or longer time than the recommended length. Learners can start whenever they are ready and tuition is available in the morning, afternoon or evening. ', 3, 'numeracy', 'Tipperary', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=294637', 1, 'North Tipperary Adult Education Centre', NULL, NULL, 'Ester Mackey', '067 31845', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3813, 'Level 3 Computer Skills', 'This courses uses a blended approach to improve your computer skills and build your confidence. It includes classroom teaching as well as on-line learning through the NALA online platform.', 3, 'digital_skills', 'Tipperary', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=313681', 1, 'North Tipperary Adult Education Centre', NULL, NULL, 'Ester Mackey', '067 31845', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3814, 'Level 4 Communications', 'Communication skills enable us to express ourselves in a positive and clear way, both verbally and in written form. It is a two-way situation, so we need to develop the skills of listening also.

This course helps to develop skills in reading, writing, listening, speaking, using the Internet and sending emails. These set of skills are very important in the Workplace and in our everyday lives.', 4, 'literacy', 'Tipperary', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=307468', 1, 'BTEI Nenagh', NULL, NULL, 'Maeve Maher', '052 6176755', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3815, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

North Tipperary: 067 318 45
South Tipperary: 052-612 7543 ', 4, 'numeracy', 'Tipperary', 'http://tipperary.etb.ie/further-education/adult-learning-scheme-2/', 1, NULL, NULL, NULL, 'Ester Mackey', '067 31845', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3816, 'Level 4 Computer Skills', 'The purpose of this course is to help you develop your computer skills so that you can design and construct a basic
website.

You will be able to:
1 Describe the structure of a webpage
2 Discuss the features of a good website
3 Design a basic website to a maximum of two pages
4 Insert basic HTML tags
5 Format text to include bold, italics, font size, font colour
6 Format page layout to include centre, background colour and background
7 Apply RGB colour system
8 Create ordered and unordered lists
9 Insert hyperlinks, and images or graphics
10 Use a paper based system and a computer system to enter and retrieve data
11 Save webpage as HTML file
12 Preview webpage in internet browser
13 Print finished website.

Get in touch with the Evening Training Services team today!

eveningtraining@tipperaryetb.ie', 4, 'digital_skills', 'Tipperary', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=332212', 1, NULL, NULL, NULL, 'Ester Mackey', '067 31845', 'eveningtraining@tipperaryetb.ie', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3817, 'Level 1 Reading and Writing', '• The chance to get back into learning and build your skills and confidence in key skills.

• An initial assessment of your key skills in any or all the areas of:

o reading
o writing and spelling
o maths
o computers and other technology', 1, 'literacy', 'Waterford City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318632', 1, 'Adult Literacy Waterford City', NULL, '2021-09-20 00:00:00+00', 'Jackie Browne', '051-854444', NULL, '322952', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3818, 'Level 1 Maths', 'The purpose of this award is to enable the learner to develop the
relevant knowledge skill and competence to use a range of maths skills and
tools, under direction and with limited autonomy, in familiar situations. It
enables the learner to participate in and contribute to modern society, to
pursue a range of employment opportunities or to progress to further
education or training.

', 1, 'numeracy', 'Waterford City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=322998', 1, 'Adult Literacy Waterford City', NULL, '2021-09-20 00:00:00+00', 'Jackie Browne', '051-854444', NULL, '322998', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3819, 'Level 1 Computers', 'The purpose of this award is to enable the learner to develop the
relevant knowledge skill and competence to use a range of skills and
tools, under direction and with limited autonomy, in familiar situations. It
enables the learner to participate in and contribute to modern society, to
pursue a range of employment opportunities or to progress to further
education or training.

', 1, 'digital_skills', 'Waterford City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318634', 1, 'Adult Literacy Waterford City', NULL, '2021-09-20 00:00:00+00', 'Jackie Browne', '051-854445', NULL, '331654', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3820, 'Level 2 Reading', 'The aim of this programme is multi purpose. The knowledge, skill and competence acquired on this programme are relevant to personal development and participation in society, community and employment and provides a basis for further progression. The programme covers the acquirement of basic knowledge, skills and competencies in a narrow range of fields of learning including key outcomes in literacy and numer', 2, 'literacy', 'Waterford City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=321817', 1, 'Adult Literacy Waterford City', NULL, '2021-09-20 00:00:00+00', 'Jackie Browne', '051-854446', NULL, '321817', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3821, 'Level 2 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills. Adult Literacy Waterford City: 051-854447
', 2, 'numeracy', 'Waterford City', 'http://waterfordwexford.etb.ie/adult-education-services/adult-literacy-2/waterford-adult-learning-scheme/', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Jackie Browne', '051-854447', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3822, 'Level 2 Computer Skills', 'The aim of this programme is multi purpose. The knowledge, skill and competence acquired on this programme are relevant to personal development and participation in society, community and employment and provides a basis for further progression. The programme covers the acquirement of basic knowledge, skills and competencies in a narrow range of fields of learning including key outcomes in literacy and numeracy.', 2, 'digital_skills', 'Waterford City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323000', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Jackie Browne', '051-854448', NULL, '323000', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3823, 'Level 3 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing.

Waterford Adult Education Centre: 051-854444', 3, 'literacy', 'Waterford City', 'http://waterfordwexford.etb.ie/adult-education-services/adult-literacy-2/waterford-adult-learning-scheme/', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Jackie Browne', '051-854449', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3824, 'Level 3 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills. Adult Literacy Waterford City: 051-854447
', 3, 'numeracy', 'Waterford City', 'http://waterfordwexford.etb.ie/adult-education-services/adult-literacy-2/waterford-adult-learning-scheme/', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Jackie Browne', '051-854450', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1031, 'Level 2 Maths', 'The aim of this programme is multi purpose. The knowledge, skill and competence acquired on this programme are relevant to personal development and participation in society, community and employment and provides a basis for further progression. The programme will hellp you develop your basic knowledge, skills and competencies in maths, reading and writing.', 2, 'numeracy', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=296668', 50, 'Cork City', NULL, '2020-09-20 00:00:00+00', 'Margie O''Riordan', '021-455 3180', NULL, '296668', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1033, 'Level 3 Communications', 'This course will help you develop is to enable the develop the relevant knowledge skill and competence to use a range of skills and tools, under direction and with limited autonomy, in familiar situations.

It will help you to participate in and contribute to modern society, to pursue a range of employment opportunities or to progress to further
education or training.', 3, 'literacy', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=279608', 50, 'Cork City', NULL, '2020-09-20 00:00:00+00', 'Alan Craughwell', '021-4643421', NULL, '279608', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1034, 'Level 3 Maths', 'In this course you will get the chance to learn and develop multiple skills as well as improving your maths skills.', 3, 'numeracy', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=283623', 50, 'Cork City', NULL, NULL, NULL, '021-4504822', NULL, '283623', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1037, 'Level 4 English and Communications', 'This course covers a number of skills, including english and communications. On completion of this programme you will have the skills, knowledge and competencies in a broad range of skills which will enable employment, under direct supervision, in a variety of information and communications technology sectors, or progression to further education or training.', 4, 'literacy', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=279322', 50, 'Cork City', NULL, '2020-09-20 00:00:00+00', 'Ger Brennan', '021 4255500', NULL, '279322', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3825, 'Level 3 Information Technology Applications ', 'This full time programme has been designed to enable learners to develop their ICT skills in Computer Literacy, Word Processing, Spreadsheets and Database Software.

If you successfully complete the course you will gain QQI Level 3 Component Awards in Computer Literacy, Word Processing, Spreadsheets and Database.', 3, 'digital_skills', 'Waterford City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=303089', 1, 'Adult Literacy Waterford City', NULL, '2021-09-20 00:00:00+00', 'Jackie Browne', '051-854451', NULL, '303089', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3826, 'Level 4 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading and writing.

Waterford Adult Education Centre: 051-854444', 4, 'literacy', 'Waterford City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=321780', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Jackie Browne', '051-854452', NULL, '321780', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3827, 'Level 4 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills. Adult Literacy Waterford City: 051-854447
', 4, 'numeracy', 'Waterford City', 'http://waterfordwexford.etb.ie/adult-education-services/adult-literacy-2/waterford-adult-learning-scheme/', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Jackie Browne', '051-854453', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3828, 'Level 4  Computers ', 'This course will give you the chance to get back into learning and build your skills and confidence in using technology and computers.

The aim of this programme is to enable you to develop the relevant knowledge, skill and competence to use a range of information and communication technologies, under direction and with limited autonomy, in familiar situations. It will enable you to pursue a range of employment opportunities or to progress to further education or training.', 4, 'digital_skills', 'Waterford City', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323022', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Jackie Browne', '051-854454', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3829, 'Level 1 Reading and Writing', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your literacy skills. Adult Literacy Waterford county: 051 393794
', 1, 'literacy', 'Waterford County', 'http://waterfordwexford.etb.ie/adult-education-services/adult-literacy-2/waterford-county-adult-learning-scheme/', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Mary Upton', '051 393794', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3830, 'Level 1 Maths ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills. Adult Literacy Waterford county: 051 393794
', 1, 'numeracy', 'Waterford County', 'http://waterfordwexford.etb.ie/adult-education-services/adult-literacy-2/waterford-county-adult-learning-scheme/', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Mary Upton', '051 393794', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (1038, 'Level 4 Maths', 'This course covers a number of skills, including maths. On completion of this programme you will have the skills, knowledge and competencies in a broad range of skills which will enable employment, under direct supervision, in a variety of information and communications technology sectors, or progression to further education or training.', 4, 'numeracy', 'cork', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=279322', 50, 'Cork City', NULL, '2020-09-20 00:00:00+00', 'Ger Brennan', '021 4255500', NULL, '279322', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3831, 'level 1 Intro to technology ', '• The chance to get back into learning and build your skills and confidence in key skills.

• An initial assessment of your key skills in any or all the areas of:

o reading
o writing and spelling
o maths
o computers and other technology.', 1, 'digital_skills', 'Waterford County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=323906', 1, 'Adult Literacy, Dungarvan, Co Waterford', NULL, '2022-01-03 00:00:00+00', 'Nicola Mc Carthy', '058-42774', NULL, '323906', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3832, 'Level 2 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your literacy skills. Adult Literacy Waterford county, 051 393794
', 2, 'literacy', 'Waterford County', 'http://waterfordwexford.etb.ie/adult-education-services/adult-literacy-2/waterford-county-adult-learning-scheme/', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Mary Upton', '051 393794', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3833, 'Level 2 Maths  ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills. Adult Literacy Waterford county, 051 393794
', 2, 'numeracy', 'Waterford County', 'http://waterfordwexford.etb.ie/adult-education-services/adult-literacy-2/waterford-county-adult-learning-scheme/', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Mary Upton', '051 393794', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3834, 'Level 2 Introduction to Computers', 'The purpose of this award is to equip the learner with the knowledge, skill and competence to use a word processing application to create a limited range of appropriately structured and accurate documents in a supervised environment this component also looks the hardware and software of a personal computer.', 2, 'digital_skills', 'Waterford County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320127', 1, 'Adult Literacy Waterford City', NULL, '2021-09-20 00:00:00+00', 'Nicola Mc Carthy', '058-42774', NULL, '320127', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3835, 'Level 3 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your literacy skills. Adult Literacy Waterford county, 051 393794
', 3, 'literacy', 'Waterford County', 'http://waterfordwexford.etb.ie/adult-education-services/adult-literacy-2/waterford-county-adult-learning-scheme/', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Mary Upton', '051 393794', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3837, 'Level 3  Computers ', 'Learners will be able to:

- Outline the application of digital media devices in daily life including the digital
communication of text, sound and images.
- Describe the key security considerations for digital communication including copyright law,
workplace policies and other applicable regulations
- Explain the concept of online social networking and its benefits
- Demonstrate the use of digital media devices to access and manipulate digital media and
information from the internet
- Operate a mobile phone using functions and settings to access and exchange voice, text and
photographic data
- Create music playlists on a digital music device
- Record photographic images using a digital camera and download to a computer
- Record video images using a digital video camera to shoot simple clips and import to a
computer retrieval or processing
- Use an online social network to create and share digital media content and information', 3, 'digital_skills', 'Waterford County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320071', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Mary Upton', '051 393794', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3838, 'Level 4 Communications', 'The aim of this programme is to enable the learner to develop the relevant knowledge, skill and competence to use a range of information and communication technologies, under direction and with limited autonomy, in familiar situations. It enables the learner to pursue a range of employment opportunities or to progress to further education or training.', 4, 'literacy', 'Waterford County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320858', 1, 'Adult Literacy Waterford City', NULL, '2021-09-20 00:00:00+00', 'Mary Upton', '051 393794', NULL, '320858', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3839, 'Level 4 Maths  ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills. Adult Literacy Waterford county, 051 393794
', 4, 'numeracy', 'Waterford County', 'http://waterfordwexford.etb.ie/adult-education-services/adult-literacy-2/waterford-county-adult-learning-scheme/', 1, 'Adult Literacy Waterford City', NULL, NULL, 'Mary Upton', '051 393794', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3840, 'Level 4 Skills to Compete - Word Processing ', 'The aim of this programme is to enable the learner to develop the relevant knowledge, skills and competence to use a word processing application. Learners on this course will be provided with 0365 WWETB Account with access to TEAMS.

The learner can also meet with the Guidance Service. A major award that is the equivalent of a Level 4 Leaving Certificate can be achieved by completing additional components, The Bridging Skills Programme. Contact the coordinators for further information.', 4, 'digital_skills', 'Waterford County', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=320892', 1, 'Adult Literacy Waterford City', NULL, '2021-09-20 00:00:00+00', 'Mary Upton', '051 393794', NULL, '320892', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3841, 'Level 1 Reading, Writing and Spelling', 'A mix of classroom and home learning will be provided on this programme to facilitate social distancing guidelines laid down by the government.

Students will be supported to develop online learning skills to facilitate learning from home where required. Work may be posted out if online learning is not an option for the student', 1, 'literacy', 'Westmeath', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=328578', 1, 'North Westmeath Adult Literacy Centre', NULL, NULL, 'Tricia Egginton', '086 8320649', NULL, '328578', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3842, 'Level 1 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Athlone: 090-649 2188
Mullingar: 044-934 2111
 ', 1, 'numeracy', 'Westmeath', 'https://www.lwetb.ie/adult-learning/', 1, 'North Westmeath Adult Literacy Centre', NULL, NULL, 'Tricia Egginton', '086 8320649', NULL, '331818', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3843, 'Computers for beginners', 'It is hoped to provide a mix of classroom and home learning on this programme to facilitate social distancing guidelines laid down by the government. Students will be supported to develop online learning skills to facilitate learning from home where required.

This course provides a chance to get started or improve on the computer. Learners will work in small groups to learn computer skills for use in everyday life and build confidence in a relaxed and supportive environment. No knowledge of computers is required!', 1, 'digital_skills', 'Westmeath', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=328584', 1, 'North Westmeath Adult Literacy Centre', NULL, NULL, 'Tricia Egginton', '086 8320649', NULL, '328584', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3844, 'Level 2 Reading and Writing ', 'A mix of classroom and blended learning will be provided on this programme to facilitate social distancing guidelines laid down by the government. Blended learning could include online work, receiving work through the post and/or telephone support.

Literacy Support classes aim to help improve the reading, writing, speaking and listening skills of all students.', 2, 'literacy', 'Westmeath', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=328584', 1, 'South Westmeath Adult Learning Programmes', NULL, NULL, 'Tricia Egginton', '090 6500272', NULL, '328150', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3845, 'Level 2 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Athlone: 090-649 2188
Mullingar: 044-934 2111
 ', 2, 'numeracy', 'Westmeath', 'https://www.lwetb.ie/adult-learning/', 1, 'North Westmeath Adult Literacy Centre', NULL, NULL, 'Tricia Egginton', '086 8320649', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3846, 'Level 2 Computer Skills', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Athlone: 090-649 2188
Mullingar: 044-934 2111
 ', 2, 'digital_skills', 'Westmeath', 'https://www.lwetb.ie/adult-learning/', 1, 'BTEI Mullingar Marlinstown', NULL, NULL, 'Tricia Egginton', '086 8320649', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3847, 'Level 3 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading, writing and communication skills.

Athlone: 090-649 2188
Mullingar: 044-934 2111
 ', 3, 'literacy', 'Westmeath', 'https://www.lwetb.ie/adult-learning/', 1, 'North Westmeath Adult Literacy Centre', NULL, NULL, 'Tricia Egginton', '086 8320649', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3848, 'Level 3 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Athlone: 090-649 2188
Mullingar: 044-934 2111
 ', 3, 'numeracy', 'Westmeath', 'https://www.lwetb.ie/adult-learning/', 1, 'North Westmeath Adult Literacy Centre', NULL, NULL, 'Tricia Egginton', '086 8320649', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3849, 'Level 3 Computer Skills', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your computer skills.

Athlone: 090-649 2188
Mullingar: 044-934 2111
 ', 3, 'digital_skills', 'Westmeath', 'https://www.lwetb.ie/adult-learning/', 1, 'North Westmeath Adult Literacy Centre', NULL, NULL, 'Tricia Egginton', '086 8320649', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3850, 'Level 4 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your reading, writing and communication skills.

Athlone: 090-649 2188
Mullingar: 044-934 2111
 ', 4, 'literacy', 'Westmeath', 'https://www.lwetb.ie/adult-learning/', 1, 'North Westmeath Adult Literacy Centre', NULL, NULL, 'Tricia Egginton', '086 8320649', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3851, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your maths skills.

Athlone: 090-649 2188
Mullingar: 044-934 2111
 ', 4, 'numeracy', 'Westmeath', 'https://www.lwetb.ie/adult-learning/', 1, 'North Westmeath Adult Literacy Centre', NULL, NULL, 'Tricia Egginton', '086 8320649', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3856, 'Level 2 EY - Key Skills', 'This programme aims to offer you: • The chance to get back into learning and build your skills and confidence in key skills.
• An initial assessment of your key skills in any or all the areas of:
o reading
o writing and spelling
o maths
o computers and other technology.', 2, 'literacy', 'Wexford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=314896', 1, 'North Wexford Adult Literacy', NULL, '2021-09-20 00:00:00+00', 'Rory Sweeney', '087 6442027', NULL, '314896', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3857, 'Level 2 EY - Key Skills', 'This programme aims to offer you: • The chance to get back into learning and build your skills and confidence in key skills.
• An initial assessment of your key skills in any or all the areas of:
o reading
o writing and spelling
o maths
o computers and other technology.', 2, 'numeracy', 'Wexford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=314896', 1, 'North Wexford Adult Literacy', NULL, '2021-09-20 00:00:00+00', 'Rory Sweeney', '087 6442027', NULL, '314896', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3858, 'Level 2 Computer Skills', 'This course will help you:

- Identify areas of everyday life where he/she interacts with technology including at home, at work, for learning and in the community.
- Consider some benefits and risks of using technology
- Use technology requiring not more than three functions, for personal, home and
educational/workplace use; e.g., assistive technologies, electronic information retrieval/communications devices, mobile phone, photocopier, computer, cameras, personal technologies ', 2, 'digital_skills', 'Wexford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=304324', 1, 'South Wexford Adult Literacy', NULL, '2021-09-20 00:00:00+00', 'Rory Sweeney', '087 6442027', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3859, 'Level 3 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your confidence reading and writing in your everyday life. Wexford: 087 6442027

 ', 3, 'literacy', 'Wexford', 'http://waterfordwexford.etb.ie/adult-education-centres/wexford-adult-education-centre/', 1, 'North Wexford Adult Literacy & South Wexford Adult Literacy.', NULL, NULL, 'Rory Sweeney', '087 6442027', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3860, 'Level 3 Maths  ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your confidence using maths in your everyday life.Wexford: 087 6442027

 ', 3, 'numeracy', 'Wexford', 'http://waterfordwexford.etb.ie/adult-education-centres/wexford-adult-education-centre/', 1, 'North Wexford Adult Literacy & South Wexford Adult Literacy.', NULL, NULL, 'Rory Sweeney', '087 6442027', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3861, 'Level 3 - Computer Skills', 'This computer course would suit a learner who has wishes to brush up on computer skills.
The purpose of this award is to enable the learner to develop the
relevant knowledge skill and competence to use a range of skills and
tools, under direction and with limited autonomy, in familiar situations. It
enables the learner to participate in and contribute to modern society, to
pursue a range of employment opportunities or to progress to further
education or training.', 3, 'digital_skills', 'Wexford', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=315730', 1, 'North Wexford Adult Literacy', NULL, '2021-09-20 00:00:00+00', 'Mary Jordan', '087 6442027', NULL, '315730', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3862, 'Level 4 Reading and Writing ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your confidence reading and writing in your everyday life. Wexford: 087 6442027

 ', 4, 'literacy', 'Wexford', 'http://waterfordwexford.etb.ie/adult-education-centres/wexford-adult-education-centre/', 1, 'North Wexford Adult Literacy & South Wexford Adult Literacy.', NULL, NULL, 'Rory Sweeney', '087 6442027', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3863, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your confidence with maths in your everyday life. Wexford: 087 6442027

 ', 4, 'numeracy', 'Wexford', 'http://waterfordwexford.etb.ie/adult-education-centres/wexford-adult-education-centre/', 1, 'North Wexford Adult Literacy & South Wexford Adult Literacy.', NULL, NULL, 'Rory Sweeney', '087 6442027', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3864, 'Level 4 Maths', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your confidence using technology in your everyday life. Wexford: 087 6442027

 ', 4, 'digital_skills', 'Wexford', 'http://waterfordwexford.etb.ie/adult-education-centres/wexford-adult-education-centre/', 1, 'North Wexford Adult Literacy & South Wexford Adult Literacy.', NULL, NULL, 'Rory Sweeney', '087 6442027', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3865, 'Level 1 Reading and Writing', 'This is to facilitate one to one literacy skills tuition. The aim of this course is to build their skills and confidence to progress to certified group tuition.', 1, 'literacy', 'Wicklow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=311605', 1, 'Arklow FEC', NULL, '2021-09-20 00:00:00+00', 'Mary McCall', '0402 23454', NULL, '311605', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3866, 'Level 1 Maths', 'This programme aims to offer you the chance to get back into learning and build your skills and confidence in key skills, including your everyday maths skills.

You will also be offered an initial assessment of your key skills in any or all the areas of:

o reading
o writing and spelling
o maths
o computers and other technology.', 1, 'numeracy', 'Wicklow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=314936', 1, 'Blessington FEC', NULL, '2021-09-20 00:00:00+00', 'Annette Mangan', '045 851494', NULL, '314936', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3867, 'Level 1 Computers for Beginners', 'An opportunity for beginners and near-beginners to become comfortable using a range of computer skills. Even those who have not used computers before can complete this course successfully. Those who complete the course are confident users of the computer in a wide variety of ways.', 1, 'digital_skills', 'Wicklow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=316398', 1, 'Bray', NULL, '2021-09-20 00:00:00+00', 'Ray Finucane', '087 1666074', NULL, '316398', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3868, 'Level 2 Writing', 'The aim of this programme is multi purpose. The knowledge, skill and competence acquired on this programme are relevant to personal development and participation in society, community and employment and provides a basis for further progression. The programme covers the acquirement of basic knowledge, skills and competencies in a narrow range of fields of learning including key outcomes in literacy and numeracy.', 2, 'literacy', 'Wicklow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=310884', 1, 'Wicklow FEC', NULL, '2021-09-20 00:00:00+00', 'Christine Wray', '01 2761350', NULL, '310884', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3869, 'Level 2 Maths', 'This programme aims to offer you the chance to get back into learning and build your skills and confidence in key skills, including your everyday maths skills.

You will also be offered an initial assessment of your key skills in any or all the areas of:

o reading
o writing and spelling
o maths
o computers and other technology.', 2, 'numeracy', 'Wicklow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=314936', 1, 'Blessington FEC', NULL, '2021-09-20 00:00:00+00', 'Annette Mangan', '045 851494', NULL, '314936', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3870, 'Level 2 Using Technology ', 'The aim of this programme is multi purpose. The knowledge, skill and competence acquired on this programme are relevant to personal development and participation in society, community and employment and provides a basis for further progression. The programme covers the acquirement of basic knowledge, skills and competencies in a narrow range of fields of learning including key outcomes in literacy and numeracy.', 2, 'digital_skills', 'Wicklow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=313833', 1, 'Wicklow FEC', NULL, '2021-09-20 00:00:00+00', 'Christine Wray', '01 2761350', NULL, '313833', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3871, 'Level 3 Communications ', 'This course offers learners an opportunity to develop and extend skills in reading, writing and  communications including IT skills:

• Communication skills –
Reading, writing, spelling, interpersonal and oral communications
• Internet Skills
Using emails and attachments, searching the internet, understanding security and privacy on the internet


The course is part time and free of charge. Learners work in small groups and build confidence in a relaxed and supportive environment. ', 3, 'literacy', 'Wicklow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=313836', 1, 'Wicklow Adult Learning Centre', NULL, '2021-09-20 00:00:00+00', 'Christine Wray', '01 2761350', NULL, '310545', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3872, 'Level 3 Maths  ', 'This course provides the opportunity to improve reading, writing, computer and maths skills necessary for everyday life. This course will focus on managing personal finances, as well as writing skills.

The course is part time and free of charge. Learners work in small groups and build confidence in a relaxed and supportive environment.

 ', 3, 'numeracy', 'Wicklow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=310355', 1, 'Bray Adult Learning Centre', NULL, NULL, 'Christine Wray', '01 2761350', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3873, 'Level 3 Digital   ', 'Get in touch with your local Adult Literacy Centre and find a course that will help you develop your confidence using technology in your everyday life. Wicklow: 087 1666074

 ', 3, 'digital_skills', 'Wicklow', 'http://kildarewicklow.etb.ie/further-education/part-time-programmes/adult-basic-education/', 1, 'Bray Adult Learning Centre', NULL, NULL, 'Ray Finucane', '087 1666074', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3874, 'Level 3 Communications', 'This part-time English language course offers participants a chance to improve their skills for employability. Learners will develop their written and spoken communication skills needed for working life and further study. These will include interview skills and compiling curriculum vitae. This course is broadly at A2-B1 on the Common European Framework of Reference for Languages (CEFRL).
The course will be delivered via blended learning.', 4, 'literacy', 'Wicklow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=310545', 1, 'Bray Adult Learning Centre', NULL, '2021-09-20 00:00:00+00', 'Christine Wray', '01 2761350', NULL, '310545', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3875, 'Level 4 Maths  ', 'This course will help you develop your maths skills and help build your confidence so you can use your new skills in your everyday life!

The aim of this programme is to enable you to develop the relevant knowledge, skill and competence in a broad range of personal skills which enable personal development and active citizenship, and/or to progress to employment and/or further education or training.', 4, 'numeracy', 'Wicklow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=310322', 1, 'Bray Adult Learning Centre', NULL, NULL, 'Christine Wray', '01 2761350', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3876, 'Level 4 VTOS Return to Education; IT & Digital Media Skills', 'The aim of this programme is to provide participants with a range of digital skills to skills required to actively engage with job seeking opportunities, facilitate integration into the workplace or to progress into further education and training. The course will integrate IT; improving overall digital literacy, while working with our teachers and engaging with career planning and personal development.

This level 4 programme provides general and flexible learning, with a base in core subjects including English (Communications) and Computer Skills, along with digital media and graphic design skills.  ', 4, 'digital_skills', 'Wicklow', 'https://www.fetchcourses.ie/course/finder?sfcw-courseId=318904', 1, 'Arklow FEC', NULL, '2021-09-20 00:00:00+00', 'Lynn Armstrong', '0402 39680', NULL, '318904', NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3877, 'Level 1 Reading', 'This is a level 1 reading course that will help you develop your skills in reading everyday material.

Once you are finished the course you will receive a Certificate of completion from NALA.', 1, 'literacy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3878, 'Level 1 Writing ', 'This is a Level 1 writing course that will help you develop your skills in writing everyday words.

Once you are finished the course you will receive a Certificate of completion from NALA.', 1, 'literacy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3879, 'Level 1 Maths', 'This is a level 1 maths course that will help you develop your number skills in recognising numbers, counting things, comparing things and adding numbers.

Once you are finished the course you will receive a Certificate of completion from NALA.', 1, 'numeracy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3880, 'Level 1 Computer Skills', 'This is a level 1 computer skills course that will help you develop your skills in using a personal computer.

Once you are finished the course you can print out a Certificate of completion from NALA.', 1, 'digital_skills', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3881, 'Level 1 Using Technology', 'This is a level 1 course that will help you develop your skills in using technology in everyday life.

Once you are finished the course you can print out a Certificate of completion from NALA.', 1, 'digital_skills', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3882, 'Level 2 Reading', 'This is a level 2 reading course that will help you develop your skills in reading everyday material.

Once you are finished the course you can take an assessment to achieve a level 2 Minor Award Certificate in Reading from Quality and Qualifications Ireland (QQI).', 2, 'literacy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3883, 'Level 2 Writing', 'This is a level 2 writing course that will help you build your skills in personally meaningful writing tasks.

Once you are finished the course you can take an assessment to achieve a level 2 Minor Award Certificate in Writing from Quality and Qualifications Ireland (QQI).', 2, 'literacy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3884, 'Level 2 Maths', 'This is a level 2 maths course that will help you develop skills in quantities and key maths operations.

Once you are finished the course you can take an assessment to achieve a level 2 Minor Award Certificate in Quantity and Number from Quality and Qualifications Ireland (QQI).', 2, 'numeracy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3885, 'Level 2 Using Technology ', 'This is a level 2 course that will help you to recognise how technology is used in every day life.

Once you are finished the course you can take an assessment to achieve a level 2 Minor Award Certificate in Using Technology from Quality and Qualifications Ireland (QQI).', 2, 'digital_skills', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3886, 'Level 3 Communications', 'This is a level 3 course that will help you develop your communications skills for a range of situations including social, public, one-to-one and the workplace.

Once you are finished the course you can take an assessment to achieve a level 3 Minor Award Certificate in Communications from Quality and Qualifications Ireland (QQI).', 3, 'literacy', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3888, 'Level 3 Information and Communication Technologies', 'This is a level 3 course focusing on the key technical, maths, communications and reading and writing skills required in information and communication technologies. There are six subjects in this course, Mathematics, Computer Literacy, Internet Skills, Communications, Personal Effectiveness and Digital Media.

You will receive a Level 3 Minor Award from Quality and Qualifications Ireland (QQI) for each subject you successfully complete. Once you have finished all six subjects successfully, you will receive a Level 3 Major Award in Information and Communication Technologies from QQI. ', 3, 'digital_skills', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3889, 'Level 3 Digital Media', 'This is a level 3 course that will help you improve your knowledge and skills in using digital media devices. Successful completion of this course will give you a level 3 Minor Award Certificate in Digital Media from Quality and Qualifications (QQI) Ireland.', 3, 'digital_skills', 'Online', 'https://courses.nala.ie/catalog?pagename=Courses', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3890, 'Level 4 Communications', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.

We will help you improve your old skills but you will also gain the confidence to learn new ones.

Call us today on 1800 20 20 65 to chat about your options.', 4, 'literacy', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3891, 'Level 4 Maths', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.

We will help you improve your old skills but you will also gain the confidence to learn new ones.

Call us today on 1800 20 20 65 to chat about your options.', 4, 'numeracy', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3892, 'Level 4 Computer Skills', 'We know that sometimes it can be hard to find the time to do a course. That’s the great thing about NALA''s Distance Learning Service. You can study online by yourself or work with a tutor over the phone. We design learning around you, your needs and your skills.

We will help you improve your old skills but you will also gain the confidence to learn new ones.

Call us today on 1800 20 20 65 to chat about your options.', 4, 'digital_skills', 'Online', 'https://www.nala.ie/free-courses/learn-with-nala/', 1, 'NALA', NULL, NULL, 'NALA', '1801 20 20 65', NULL, NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3980, 'Premju tal-Edukazzjoni Ġenerali fil-Litteriżmu bl-Ingliż 1 (MQF 1)', 'Dan il-kors se jgħinek tikseb il-ħiliet ta'' litteriżmu meħtieġa biex ittejjeb il-kitba, il-qari u t-taħdit bl-Ingliż sabiex tuża l-lingwa Ingliża b''mod effettiv kemm fuq ix-xogħol kif ukoll fil-ħajja ta'' kuljum. Dan il-kors jiġi mgħallem permezz ta'' diskussjonijiet u taħriġ. Se tiġi vvalutat matul il-kors permezz ta'' mistoqsijiet u taħriġ prattiku, u permezz ta'' eżami finali. Wara li tlesti b''suċċess dan il-kors, int se tkun tista'' tkompli l-istudji tiegħek fl-Ingliż fil-livell MQF 2.

Post tal-kors: Ħal Far', 1, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22968', 4, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3981, 'Premju tal-Edukazzjoni Ġenerali fil-Litteriżmu bl-Ingliż 2 (MQF 2)', 'Fi tmiem dan il-kors se tkun kapaċi taqra, tikteb, titkellem, tisma’ u tikkomunika billi tuża Ingliż tajjeb. Dan il-kors jiġi mgħallem permezz ta’ diskussjonijiet u taħriġ. Se tiġi vvalutat matul il-kors permezz ta’ mistoqsijiet u taħriġ prattiku, u permezz ta’ eżami finali. Wara li tlesti b''suċċess dan il-kors, int se tkun tista'' tkompli l-istudji tiegħek fl-Ingliż fil-livell MQF 3 (SEC O’Level).

Post tal-kors: Ħal Far', 2, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22972', 4, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3982, 'Premju Elementari fil-Lingwa Maltija bħala Lingwa Barranija (MQF 1)', 'Dan il-kors huwa mmirat għall-barranin li huma residenti hawn Malta u li jixtiequ jitgħallmu komunikazzjoni bażika bil-Malti għax-xogħol, għal skopijiet akkademiċi u għall-iżvilupp personali. Dan il-kors jiġi mgħallem permezz ta’ preżentazzjonijiet, diskussjonijiet u taħriġ. Se tiġi vvalutat matul dan il-kors u permezz ta’ eżami finali. Wara li tlesti b’suċċess dan il-kors, int se tkun tista’ tkompli l-istudji tiegħek fil-Malti bħala Lingwa Barranija fil-livell MQF 2.

Post tal-kors: Ħal Far', 1, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22979', 4, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3983, 'Premju fil-Malti bħala Lingwa Barranija 2 (MQF 2)', 'Dan il-kors huwa mmirat għall-barranin li huma residenti hawn Malta u li jixtiequ jitgħallmu komunikazzjoni bażika bil-Malti għax-xogħol, għal skopijiet akkademiċi u għall-iżvilupp personali. Dan il-kors jiġi mgħallem permezz ta’ preżentazzjonijiet, diskussjonijiet u taħriġ. Se tiġi vvalutat matul il-kors u permezz ta’ eżami finali.

Post tal-kors: Ħal Far', 2, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22971', 4, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3984, 'Premju fl-Edukazzjoni Ġenerali fil-Lingwa Maltija 1 (MQF 1)', 'Dan il-kors huwa mmirat għal individwi li jixtiequ jibdew jitgħallmu l-lingwa Maltija għall-ewwel darba. Dan ikopri l-alfabett u kliem bażiku sabiex int tkun tista’ taqra u tikteb Malti bażiku. Dan il-kors jiġi mgħallem permezz ta’ diskussjonijiet u taħriġ. Se tiġi vvalutat matul il-kors u permezz ta’ eżami finali. Wara li tlesti b''suċċess dan il-kors, int se tkun tista'' tkompli l-istudji tiegħek fil-Malti fil-livell MQF 2.

Post tal-kors: Ħal Far', 1, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22970', 4, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3985, 'Premju fl-Edukazzjoni Ġenerali fil-Lingwa Maltija 2 (MQF 2)', 'Dan il-kors huwa mmirat għal individwi li jixtiequ jtejbu s-smigħ, it-taħdit u l-kitba tagħhom bil-lingwa Maltija biex jikkomunikaw b’mod effettiv kemm fuq ix-xogħol kif ukoll fil-ħajja ta’ kuljum. Dan il-kors jiġi mgħallem permezz ta’ diskussjonijiet u taħriġ prattiku. Se tiġi vvalutat matul il-kors u permezz ta’ eżami finali. Wara li tlesti b''suċċess dan il-kors, int se tkun tista'' tkompli l-istudji tiegħek fil-Malti fil-livell MQF 3 (SEC O’Level).

Post tal-kors: Ħal Far', 2, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22974', 4, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3986, 'Premju Elementari fl-Ingliż għall-Barranin 1 (MQF 1)', 'Dan il-kors jimmira li jipprovdi lill-barranin bil-ħiliet ta’ litteriżmu meħtieġa (taħdit, smigħ, qari u kitba) u biex jiġu esposti għall-kunċetti bażiċi tal-lingwa sabiex jinteraġixxu u jikkomunikaw fil-ħajja ta’ kuljum u fuq il-post tax-xogħol. Dan il-kors jiġi mgħallem permezz ta’ diskussjonijiet u taħriġ. Se tiġi vvalutat matul il-kors u permezz ta’ eżami finali. Wara li tlesti b''suċċess dan il-kors, int se tkun tista'' tkompli l-istudji tiegħek fl-Ingliż għall-Barranin fil-livell MQF 2.

Post tal-kors: Ħal Far', 1, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22983', 4, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3987, 'Premju fl-Ingliż għall-Barranin (MQF 2)', 'Dan il-kors huwa mmirat għall-barranin li jixtiequ jtejbu s-smigħ, it-taħdit u l-kitba tagħhom bil-lingwa Ingliża. Fi tmiem dan il-kors int se tkun tista’ tikkomunika ma’ oħrajn bil-lingwa Ingliża b’mod komdu u kunfidenti. Dan il-kors jiġi mgħallem permezz ta’ preżentazzjonijiet, diskussjonijiet u taħriġ. Se tiġi vvalutat matul il-kors u permezz ta’ eżami finali.

Post tal-kors: Ħal Far', 2, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22981', 4, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3988, 'Premju fl-Edukazzjoni Ġenerali fin-Numeriżmu (MQF 1)', 'Dan il-kors se jintroduċik għal matematika bażika, fejn se jippermettilek issir kunfidenti u awtosuffiċjenti billi ttejjeb il-ħila tiegħek li ssib soluzzjoni għal sitwazzjonijiet ta’ numeriżmu li ta’ spiss tiltaqa’ magħhom fil-ħajja ta’ kuljum.
Dan il-kors se jgħinek:
•        tifhem is-simboli matematiċi;
•        tinterpreta l-unitajiet tal-kejl;
•        tidentifika l-forom u l-linji ta’ simetrija tagħhom;
•        torganizza d-data;
•        tuża l-frazzjonijiet;
•        twettaq kalkoli mentali bażiċi;
•        tuża l-kalkolatriċi;
•        tikkalkula l-erja, il-perimetru u l-volum; u
•        tiġbor in-numri f''numri sħaħ u tuża numri deċimali.
Dan il-kors jiġi mgħallem permezz ta’ taħriġ prattiku u se tiġi vvalutat matul il-kors u permezz ta’ eżami finali. Wara li tlesti b’suċċess il-kors, int se tkun tista’ tkompli l-istudji tiegħek fil-Matematika jew in-Numeriżmu fil-livell MQF 2.

Post tal-kors: Ħal Far
', 1, 'numeracy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22975', 4, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3989, 'Premju fl-Edukazzjoni Ġenerali fin-Numeriżmu (MQF 2)', 'Dan il-kors jimmira li jtejjeb l-istandards ta’ numeriżmu tiegħek. Fi tmiem dan il-kors, int se tikseb u tiżviluppa l-ħiliet tiegħek ta'' analiżi loġika, soluzzjoni għall-problemi u ta’ kalkolu. Dan il-kors jiġi mgħallem permezz ta’ taħriġ prattiku u se tiġi vvalutat matul il-kors u permezz ta’ eżami finali. Wara li tlesti b’suċċess il-kors, int se tkun tista’ tkompli l-istudji tiegħek fil-Matematika jew in-Numeriżmu fil-livell MQF 3 (SEC O’Level Standard).

Post tal-kors: Ħal Far', 2, 'digital_skills', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22976', 4, NULL, NULL, NULL, 'Jobsplus', '22201605', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3990, 'Premju fl-Edukazzjoni u t-Taħriġ Vokazzjonali Bażi fil-Ħiliet tal-Litteriżmu Diġitali (MQF 1)', 'Dan il-kors jgħallem il-kunċetti bażiċi tal-użu ta’ apparat elettroniku għal ħtiġijiet personali u akkademiċi. Fi tmiem dan il-kors, int se tkun tista’ tifhem għalfejn it-teknoloġija u l-użi tagħha huma importanti fis-soċjetà tal-lum u ssir utent ta’ apparat teknoloġiku aktar kunfidenti. Dan il-kors jiġi mgħallem permezz ta’ taħriġ prattiku u se tiġi vvalutat matul il-kors u permezz ta’ eżami finali.

Post tal-kors: Ħal Far', 1, 'digital_skills', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=23035', 4, NULL, NULL, NULL, 'Jobsplus', '22201626', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3991, 'Premju fl-Ingliż Bażiku għal Care Workers (MQF 2)', 'Dan il-kors jimmira li jgħinek ittejjeb l-Ingliż tiegħek, filwaqt li jiffoka fuq il-vokabularju, it-taħdit u l-kitba.

Fi tmiem dan il-kors, int se titgħallem:
• tikteb sentenzi bl-użu tal-verbi korretti;
• tagħżel il-vokabularju korrett li għandu jintuża f’kuntesti differenti meta tkun qed tikkomunika ma’ klijenti, il-qraba tagħhom, kollegi u/jew superjuri;
• tifhem id-differenza bejn it-taħdit u l-kitba formali u informali;
• tidentifika l-punti ewlenin ta’ spjegazzjonijiet u istruzzjonijiet; u
• tuża lingwaġġ rispettuż u inklużiv meta tkun qed tikkomunika ma’ klijenti, mal-qraba tagħhom u mal-kollegi.

Dan il-kors jiġi mgħallem permezz ta’ taħriġ prattiku u se tiġi vvalutat matul il-kors u permezz ta’ eżami finali.
Post tal-kors: Ħal Far
', 2, 'literacy', 'Malta', 'https://jobsplus.gov.mt/courses/fileprovider.aspx?fileId=22982', 4, NULL, NULL, NULL, 'Jobsplus', '22201608', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3992, 'ECDL (MQF 3)', 'L-ECDL huwa l-akbar programm ta’ ċertifikazzjoni ta’ ħiliet tal-kompjuter tal-utent aħħari tad-dinja fejn jimmira li jżid il-livell tal-ħiliet tal-ICT u tal-kompjuter u jippermetti li l-kandidati jkunu aktar produttivi fid-dar u fuq ix-xogħol. L-ECDL itejjeb ukoll il-prospetti ta’ xogħol billi jipprovdi kwalifika rikonoxxuta internazzjonalment. Dan jikkonsisti f’seba’ moduli separati li jkopru t-teorija u l-prattika. L-ECDL Standard Certificate (MQF 3) jingħata lil kandidati li jkunu lestew l-4 moduli Bażiċi kollha u wieħed mit-3 moduli Intermedji.

Post tal-kors: Ħal Far', 3, 'digital_skills', 'Malta', 'https://jobsplus.gov.mt/courses/all-course-list', 4, NULL, NULL, NULL, 'Jobsplus', '22201626', 'qa.jobsplus@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3993, 'Premju Elementari fl-Ingliż bħala t-Tieni Lingwa jew Lingwa Oħra (MQF 1)', 'Dan il-kors se jgħinnek tiżviluppa l-ħiliet ta’ taħdit, smigħ, qari u kitba tiegħek fil-lingwa Ingliża sabiex tkun tista’ tinteraġixxi u tikkomunika f’sitwazzjonijiet soċjali u professjonali ta’ kuljum. Wara li tlesti b’suċċess dan il-kors, int se tkun tista’ tkompli tistudja l-Ingliż.

Post tal-kors: Il-Mosta', 1, 'literacy', 'Malta', 'http://www.esatmalta.org/index.php/sections/courses', 4, NULL, NULL, NULL, 'Educational Services and Testing (ESaT)LTD', '79385856', 'info@esatmalta.org', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3994, 'Premju Preintermedju fl-Ingliż bħala t-Tieni jew Lingwa Oħra (MQF 2)', 'Dan il-kors se jgħinek tiżviluppa l-ħiliet ta’ qari, kitba, smigħ, u taħdit tiegħek fil-lingwa Ingliża. Dan se jgħinek ukoll tibni l-kunfidenza u jħeġġek tagħmel progress ulterjuri. Wara li tlesti b’suċċess dan il-kors, int se tkun tista’ tkompli tistudja l-Ingliż.

Post tal-kors: Il-Mosta
', 2, 'literacy', 'Malta', 'http://www.esatmalta.org/index.php/sections/courses', 4, NULL, NULL, NULL, 'Educational Services and Testing (ESaT)LTD', '79385856', 'info@esatmalta.org', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3995, 'Premju Intermedju fl-Ingliż bħala t-Tieni Lingwa jew Lingwa Oħra (MQF 3)', 'Dan il-kors se jgħinnek tkompli tiżviluppa l-ħiliet ta’ qari, kitba, smigħ, u taħdit tiegħek fil-lingwa Ingliża. Dan se jgħinnek ukoll tibni l-kunfidenza u jħeġġek tagħmel progress ulterjuri. Wara li tlesti b’suċċess dan il-kors, int se tkun tista’ tkompli tistudja l-Ingliż.

Post tal-kors: Il-Mosta
', 3, 'literacy', 'Malta', 'http://www.esatmalta.org/index.php/sections/courses', 4, NULL, NULL, NULL, 'Educational Services and Testing (ESaT)LTD', '79385856', 'info@esatmalta.org', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3996, 'Premju fil-Litteriżmu, in-Numeriżmu, il-Ħiliet Diġitali u tal-Ħajja Bażiċi (MQF 2) (Disponibbli biss fuq talba)', 'Dan il-kors se jgħinek tiżviluppa u ttejjeb il-ħiliet diġitali, ta’ litteriżmu u ta'' numeriżmu tiegħek, filwaqt li jippreparak aħjar għax-xogħol, it-taħriġ jew l-istudju ulterjuri. Il-kors se jagħti eżempji mill-ħajja ta’ kuljum, filwaqt li se jgħinek tittratta sitwazzjonijiet u problemi li tiltaqa’ magħhom ta’ spiss b’mod effettiv.

Post tal-kors: Il-Belt Valletta
', 2, 'literacy', 'Malta', 'https://novaric.co/', 4, NULL, NULL, NULL, 'Akkademja NOVARIC®', '#ERROR!', 'NOVARIC® Academy contact@novaric.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3997, 'Premju fil-Litteriżmu, in-Numeriżmu, il-Ħiliet Diġitali u tal-Ħajja Bażiċi (MQF 2) (Disponibbli biss fuq talba)', 'Dan il-kors se jgħinek tiżviluppa u ttejjeb il-ħiliet diġitali, ta’ litteriżmu u ta'' numeriżmu tiegħek, filwaqt li jippreparak aħjar għax-xogħol, it-taħriġ jew l-istudju ulterjuri. Il-kors se jagħti eżempji mill-ħajja ta’ kuljum, filwaqt li se jgħinek tittratta sitwazzjonijiet u problemi li tiltaqa’ magħhom ta’ spiss b’mod effettiv.

Post tal-kors: Il-Belt Valletta
', 2, 'numeracy', 'Malta', 'https://novaric.co/', 4, NULL, NULL, NULL, 'Akkademja NOVARIC®', '#ERROR!', 'NOVARIC® Academy contact@novaric.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3998, 'Premju fil-Litteriżmu, in-Numeriżmu, il-Ħiliet Diġitali u tal-Ħajja Bażiċi (MQF 2) (Disponibbli biss fuq talba)', 'Dan il-kors se jgħinek tiżviluppa u ttejjeb il-ħiliet diġitali, ta’ litteriżmu u ta'' numeriżmu tiegħek, filwaqt li jippreparak aħjar għax-xogħol, it-taħriġ jew l-istudju ulterjuri. Il-kors se jagħti eżempji mill-ħajja ta’ kuljum, filwaqt li se jgħinek tittratta sitwazzjonijiet u problemi li tiltaqa’ magħhom ta’ spiss b’mod effettiv.

Post tal-kors: Il-Belt Valletta
', 2, 'digital_skills', 'Malta', 'https://novaric.co/', 4, NULL, NULL, NULL, 'Akkademja NOVARIC®', '#ERROR!', 'NOVARIC® Academy contact@novaric.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (3999, 'ECDL Standard (MQF 3)', 'L-ECDL standard huwa eżami ta’ taħriġ prattiku u kompetenzi, li jikkonsisti f’seba’ moduli separati li jkopru t-teorija u l-prattika tal-kompjuter. L-eżamijiet tal-moduli kollha jsiru fiċ-ċentru ta’ eżaminazzjoni approvat tagħna. Wara li tlesti b’suċċess is-seba’ moduli kollha, se tingħata ECDL Standard Certificate referenzjat għal-Livell 3 tal-Malta Qualifications Framework (MQF) u l-European Qualifications Framework (Il-Qafas Ewropew tal-Kwalifiki) (EQF) għat-Tagħlim matul il-Ħajja.

Post tal-kors: Ħaż-Żebbuġ', 3, 'digital_skills', 'Malta', 'https://www.horizon2000computers.com/courses', 4, NULL, NULL, NULL, 'Horizon 2000 Computer Training Centre', '21462236/79462236', 'horizon2000computers@gmail.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4000, 'Litteriżmu fl-Ingliż (MQF 2)', 'Dan il-kors se jgħinek ittejjeb it-taħdit, is-smigħ, il-qari u l-kitba tiegħek fil-lingwa Ingliża u l-ħila tiegħek li tuża l-Ingliż b’mod effettiv kemm fuq ix-xogħol kif ukoll f’sitwazzjonijiet tal-ħajja ta’ kuljum.

Post tal-kors: Il-Furjana', 2, 'literacy', 'Malta', 'https://kpmglearningmalta.com/', 4, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4001, 'Premju fil-Litteriżmu Malti (MQF 1)', 'Dan il-kors se jgħinek titgħallem il-kunċetti bażiċi tal-lingwa Maltija, ittejjeb il-ħila tiegħek li taqra u tikteb sentenzi u paragrafi sempliċi u li tikkomunika u tiskambja informazzjoni b’mod sempliċi ħafna.

Post tal-kors: Il-Furjana', 1, 'literacy', 'Malta', 'https://kpmglearningmalta.com/', 4, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4002, 'Premju fil-Litteriżmu Malti (MQF 2)', 'Dan il-kors se jgħinek ittejjeb il-Malti tiegħek permezz ta’ taħdit, smigħ, qari u kitba. Fi tmiem dan il-kors int se tkun tista’ tuża l-lingwa Maltija b’mod effettiv kemm fuq ix-xogħol kif ukoll f’sitwazzjonijiet tal-ħajja ta’ kuljum.

Post tal-kors: Il-Furjana', 2, 'literacy', 'Malta', 'https://kpmglearningmalta.com/', 4, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4003, 'Ħiliet fin-Numeriżmu (MQF 1)', 'Dan il-kors se jintroduċik għal matematika bażika, filwaqt li jgħinek issir aktar kunfidenti fl-applikazzjoni ta’ għarfien matematiku u fl-analiżi ta’ sitwazzjonijiet ta’ numeriżmu. Fi tmiem dan il-kors int se tikseb ċertifikat fil-livell MQF 1.

Post tal-kors: Il-Furjana', 1, 'numeracy', 'Malta', 'https://kpmglearningmalta.com/', 4, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4004, 'Ħiliet fin-Numeriżmu (MQF 2)', 'Dan il-kors se jgħinek tikseb u tiżviluppa l-ħiliet tiegħek ta'' analiżi loġika, soluzzjoni għall-problemi u ta’ kalkolu, fl-istandard matematiku ġenerali. Fi tmiem dan il-kors int se tikseb ċertifikat fil-livell MQF 2.

Post tal-kors: Il-Furjana', 2, 'numeracy', 'Malta', 'https://kpmglearningmalta.com/', 4, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4005, 'Ħiliet fit-TI Bażiċi (MQF 2)', 'Dan il-kors se jgħinek ittejjeb il-ħiliet tiegħek fit-teknoloġija u l-ICT u l-ħila tiegħek biex tapplika dawn il-ħiliet fuq il-post tax-xogħol tiegħek u f’sitwazzjonijiet ta’ kuljum. Fi tmien dan il-kors int se tikseb ċertifikat fil-livell MQF 2.

Post tal-kors: Il-Furjana', 2, 'digital_skills', 'Malta', 'https://kpmglearningmalta.com/', 4, NULL, NULL, NULL, 'KPMG Learning Academy', '25636363', 'kla@kpmg.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4006, 'ECDL Standard (MQF 3)', 'L-ECDL Standard (MQF 3) huwa eżami ta’ ħiliet prattiċi u kompetenzi, li jikkonsisti f’seba’ moduli separati li jkopru t-teorija u l-prattika tal-kompjuter. Is-seba’ moduli huma Computer Essentials, Online Essentials, Word processing, Spreadsheets, Presentations, Using Databases u IT Security. Filwaqt li m’hemm l-ebda rekwiżiti formali għad-dħul, għarfien tajjeb tal-Ingliż huwa obbligatorju. Wara li tgħaddi mis-seba’ eżamijiet kollha (7 moduli), int se tingħata ECDL Standard Certificate, mogħti fil-livell MQF 3.

Post tal-kors: Birkirkara', 3, 'digital_skills', 'Malta', 'https://www.learnkey.com.mt/course/ecdlicdl-fast-track', 4, NULL, NULL, NULL, 'Learnkey Training Institute', '21443140', 'info@learnkey.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4007, 'Ċertifikat ta'' City and Guilds Livell 1 fil-Ħiliet tal-Ingliż (MQF 2) (ofqual no: 600/7595/8)', 'Iċ-Ċertifikat ta’ Livell 1 (MQF 2) fil-Ħiliet tal-Ingliż huwa parti minn sensiela ta’ kwalifiki offruti mis-City & Guilds li se jgħinek ittejjeb il-ħiliet ta’ qari, kitba, taħdit u smigħ tiegħek. Il-kwalifika tippermettilek tibni l-kunfidenza u timxi ''l quddiem aktar. Wara li tlesti b’suċċess dan il-kors, int se tkun tista’ tkompli l-istudji tiegħek fl-Ingliż fil-livell MQF 3, bħal pereżempju s-SEC O’Level jew iċ-Ċertifikat ta’ City & Guilds fil-Ħiliet tal-Ingliż Livell 2.

Post tal-kors: Birkirkara
', 2, 'literacy', 'Malta', 'https://promotion.learnkey.com.mt/english-programme/', 4, NULL, NULL, NULL, 'Learnkey Training Institute', '21443140', 'info@learnkey.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4008, 'Ċertifikat ta'' City and Guilds Livell 2 fil-Ħiliet tal-Ingliż (MQF 3) (ofqual no: 600/7594/6)', 'Iċ-Ċertifikat ta’ Livell 2 (MQF 3) fil-Ħiliet tal-Ingliż huwa parti minn sensiela ta’ kwalifiki offruti mis-City & Guilds li se jgħinek ittejjeb il-ħiliet ta’ qari, kitba, taħdit u smigħ tiegħek. Din il-kwalifika tippermettilek tkompli ttejjeb il-kwalifiki fl-Ingliż f’livell ogħla, jew tikseb kwalifiki f’oqsma ta’ suġġetti oħrajn fejn il-ħiliet bl-Ingliż huma meħtieġa.

Post tal-kors: Birkirkara', 3, 'literacy', 'Malta', 'https://promotion.learnkey.com.mt/english-programme/', 4, NULL, NULL, NULL, 'Learnkey Training Institute', '21443140', 'info@learnkey.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4009, 'Ċertifikat fil-Livell ta'' Dħul ta'' City & Guilds fil-Ħiliet tal-Ingliż (Entry 3) (ofqual no: 600/7591/0) (MQF 1)', 'Iċ-Ċertifikat f’Livell ta’ Dħul fil-Ħiliet tal-Ingliż huwa parti minn sensiela ta’ kwalifiki offruti mis-City & Guilds li jkopri ħiliet ta’ qari, kitba, taħdit u smigħ. Din il-kwalifika hija speċjalment xierqa għal dawk li jsibu diffikultà fil-qari u l-kitba bl-Ingliż.

Post tal-kors: Birkirkara', 1, 'literacy', 'Malta', 'https://promotion.learnkey.com.mt/english-programme/', 4, NULL, NULL, NULL, 'Learnkey Training Institute', '21443140', 'info@learnkey.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4010, 'Premju f''Ħiliet Bażiċi ta'' Litteriżmu, Numeriżmu u Impjegabbiltà (MQF 2)', 'Dan il-kors se jgħinek tiżviluppa u ttejjeb il-litteriżmu tiegħek kemm fil-Malti kif ukoll fl-Ingliż u l-ħiliet ta’ numeriżmu tiegħek, bil-għan li jippreparak għall-impjieg, it-taħriġ jew studju ulterjuri. Barra minnhekk, int se tikseb ħiliet ta’ impjegabbiltà billi żżid l-għarfien tiegħek dwar l-aspetattivi ta’ min iħaddem u l-ambjent tax-xogħol.

Post tal-kors: Il-Furjana', 2, 'literacy', 'Malta', 'https://www.sgi.edu.mt/', 4, NULL, NULL, NULL, 'FSS Ltd.', '25905226', 'info@fss.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4011, 'Premju f''Ħiliet Bażiċi ta'' Litteriżmu, Numeriżmu u Impjegabbiltà (MQF 2)', 'Dan il-kors se jgħinek tiżviluppa u ttejjeb il-litteriżmu tiegħek kemm fil-Malti kif ukoll fl-Ingliż u l-ħiliet ta’ numeriżmu tiegħek, bil-għan li jippreparak għall-impjieg, it-taħriġ jew studju ulterjuri. Barra minnhekk, int se tikseb ħiliet ta’ impjegabbiltà billi żżid l-għarfien tiegħek dwar l-aspetattivi ta’ min iħaddem u l-ambjent tax-xogħol.

Post tal-kors: Il-Furjana', 2, 'numeracy', 'Malta', 'https://www.sgi.edu.mt/', 4, NULL, NULL, NULL, 'FSS Ltd.', '25905226', 'info@fss.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4012, 'Numeriżmu Bażiku Applikat (MQF 2)', 'Il-kors se jgħinek ittejjeb il-ħiliet ta’ numeriżmu tiegħek biex tkun tista’ twettaq il-matematika meħtieġa għall-ħajja ta’ kuljum, billi tiżviluppa l-ħiliet tiegħek ta'' analiżi loġika,  soluzzjoni għall-problemi u ta’ kalkolu.

Post tal-kors: Il-Furjana', 2, 'numeracy', 'Malta', 'https://www.sgi.edu.mt/', 4, NULL, NULL, NULL, 'FSS Ltd.', '25905226', 'info@fss.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4013, 'Ingliż Bażiku Applikat (MQF 2)', 'Dan il-kors se jagħtik il-ħiliet meħtieġa (taħdit, smigħ, qari u kitba), biex tikseb il-kunfidenza u l-ħila li tuża l-Ingliż b’mod effettiv, kemm fuq ix-xogħol kif ukoll f’sitwazzjonijiet tal-ħajja ta’ kuljum.

Post tal-kors: Il-Furjana', 2, 'literacy', 'Malta', 'https://www.sgi.edu.mt/', 4, NULL, NULL, NULL, 'FSS Ltd.', '25905226', 'info@fss.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4014, 'Malti Bażiku Applikat (MQF 2)', 'Dan il-kors se jgħinek ittejjeb it-taħdit, is-smigħ, il-qari u l-kitba bil-Malti tiegħek. Fi tmiem il-kors int se tkun tista’ tuża l-lingwa Maltija b’mod effettiv kemm fuq ix-xogħol kif ukoll f’sitwazzjonijiet tal-ħajja ta’ kuljum.

Post tal-kors: Il-Furjana', 2, 'literacy', 'Malta', 'https://www.sgi.edu.mt/', 4, NULL, NULL, NULL, 'FSS Ltd.', '25905226', 'info@fss.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4015, 'Premju fil-Lingwa Ingliża għall-Barranin (MQF 1)', 'Dan il-kors huwa għal individwi li qatt ma studjaw l-Ingliż qabel jew li għandhom għarfien limitat ħafna tal-Ingliż u jixtiequ jitgħallmu l-komunikazzjoni bażika bl-Ingliż għal skopijiet professjonali, ta’ żvilupp personali u akkademiċi. Dan il-kors jingħata fuq xahrejn u m’hemm l-ebda rekwiżiti ta’ dħul.

Post tal-kors: Ħal Qormi', 1, 'literacy', 'Malta', 'https://www.learningworks.edu.mt/courses/language-courses/mqflevel-1-award-in-english-language-for-foreigners/', 4, NULL, NULL, NULL, 'Learning Works Ltd', '22107219', 'Ms Christabelle Tabone ctabone@learningworks.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4016, 'Premju fil-Malti bħala Lingwa Barranija u Orjentazzjoni Kulturali (MQF 1)', 'Dan il-kors huwa għal individwi li qatt ma studjaw il-Malti qabel jew għandhom għarfien limitat ħafna tal-Malti, u jixtiequ jitgħallmu l-komunikazzjoni bażika bil-Malti għal skopijiet professjonali, ta’ żvilupp personali u akkademiċi. Dan il-kors huwa għal individwi li beħsiebhom japplikaw għall-permess ta’ residenza. Dan jingħata fuq xahrejn u m’hemm l-ebda rekwiżiti ta’ dħul. Fi tmien il-kors se tikseb ċertifikat fil-livell MQF 1.

Post tal-kors: Ħal Qormi', 1, 'literacy', 'Malta', 'https://www.learningworks.edu.mt/courses/language-courses/mqf-level-1-award-in-maltese-as-a-foreign-language/', 4, NULL, NULL, NULL, 'Learning Works Ltd', '22107219', 'Ms Christabelle Tabone ctabone@learningworks.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4017, 'Premju fil-Malti bħala Lingwa Barranija u Orjentazzjoni Kulturali (MQF 2)', 'Dan il-kors huwa mmirat għal individwi li għandhom għarfien limitat fil-lingwa Maltija jew li jixtiequ jikkonsolidaw u jkomplu jżidu mal-ħiliet bażiċi tagħhom fil-Malti għal skopijiet professjonali, ta’ żvilupp personali u akkademiċi. Biex japplikaw għal dan il-kors, l-istudenti għandhom ikunu kisbu Ċertifikat fil-Malti fil-Livell MQF 1.

Post tal-kors: Ħal Qormi', 2, 'literacy', 'Malta', 'https://www.learningworks.edu.mt/courses/language-courses/mqf-level-2-award-in-maltese-as-a-foreign-language-and-cultural-orientation/', 4, NULL, NULL, NULL, 'Learning Works Ltd', '22107219', 'Ms Christabelle Tabone ctabone@learningworks.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4018, 'Ħiliet Bażiċi fil-Malti Komunikattiv: L-ewwel Livell (MQF 1)', 'Permezz ta’ dan il-kors int se titgħallem kif tikteb messaġġi sempliċi u/jew paragrafi qosra dwar suġġetti differenti bil-Malti. Int se tkun tista’ wkoll tipprattika t-taħdit bil-Malti biex tkun tista’ tesprimi lilek innifsek f’sitwazzjonijiet fil-ħajja ta’ kuljum tiegħek. Wara li tlesti b’suċċess dan il-kors, int se tkun tista’ tkompli l-istudji tiegħek fil-Malti fil-livell MQF 2.

Post tal-kors: Il-Belt Valletta', 1, 'literacy', 'Malta', 'https://www.melitamanagement.com/courses', 4, NULL, NULL, NULL, 'Melita Training and Resource Management Limited', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4019, 'Premju fl-Ingliż Bażiku - MQF 1', 'Dan il-kors huwa mmirat għal studenti bi ftit għarfien tal-Ingliż, fejn se jiffoka fuq il-kunċetti bażiċi tal-lingwa Ingliża. Fi tmien il-kors int se tkun tista’ tikkomunika u tiskambja informazzjoni b’Ingliż sempliċi. Wara li b’suċċess tlesti dan il-kors, int se tkun tista’ tkompli l-istudji tiegħek fl-Ingliż fil-livell MQF 2.

Post tal-kors: Il-Belt Valletta', 1, 'literacy', 'Malta', 'https://www.melitamanagement.com/courses', 4, NULL, NULL, NULL, 'Melita Training and Resource Management Limited', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4020, 'Premju fin-Numeriżmu Bażiku - MQF 1', 'Dan il-kors se jintroduċik għal matematika bażika, li se jagħtik il-kunfidenza u għaldaqstant issir aktar awtosuffiċjenti billi tkun tista’ ssolvi sitwazzjonijiet ta’ numeriżmu li tiltaqa’ magħhom ta’ spiss fil-ħajja ta’ kuljum. Wara li tlesti b''suċċess dan il-kors, int se tkun tista’ tkompli l-istudji tiegħek fil-Matematika fil-livell MQF 2.

Post tal-kors: Il-Belt Valletta', 1, 'numeracy', 'Malta', 'https://www.melitamanagement.com/courses', 4, NULL, NULL, NULL, 'Melita Training and Resource Management Limited', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4021, 'Premju fin-Numeriżmu Bażiku - MQF 2', 'Dan il-kors huwa kontinwazzjoni għall-kors ta’ Numeriżmu Bażiku Livell 1, li se jintroduċi lill-istudenti għal aktar aspetti u li se jitratta aktar fil-fond xi ftit mis-suġġetti ttrattati fil-livell 1. L-istudenti se jiksbu u jiżviluppaw il-ħiliet tagħhom ta'' analiżi loġika, deduzzjoni u ta’ kalkolu.

Post tal-kors: Il-Belt Valletta', 2, 'numeracy', 'Malta', 'https://www.melitamanagement.com/courses', 4, NULL, NULL, NULL, 'Melita Training and Resource Management Limited', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4022, 'Ħiliet Bażiċi fil-Malti Komunikattiv: lt-Tieni Livell (MQF 2)', 'Dan il-kors huwa maħsub li jgħin lill-istudenti jiksbu l-kunfidenza fl-użu tal-lingwa Maltija f’sitwazzjonijiet fuq il-post tax-xogħol speċifiċi. L-istudenti se jitgħallmu kif jiktbu messaġġi u paragrafi dwar suġġetti differenti bil-Malti.

Post tal-kors: Il-Belt Valletta', 2, 'literacy', 'Malta', 'https://www.melitamanagement.com/courses', 4, NULL, NULL, NULL, 'Melita Training and Resource Management Limited', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4023, 'Premju fl-Ingliż Bażiku - MQF 2', 'Dan il-kors se jiffoka fuq il-ksib tal-lingwa permezz tal-erba’ ħiliet tal-lingwa: it-taħdit, il-qari, is-smigħ u l-kitba u huwa maħsub għal studenti li jixtiequ jtejbu l-ħiliet tagħhom fil-lingwa Ingliża biex isiru kandidati aktar impjegabbli.

Post tal-kors: Il-Belt Valletta', 2, 'literacy', 'Malta', 'https://www.melitamanagement.com/courses', 4, NULL, NULL, NULL, 'Melita Training and Resource Management Limited', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4024, 'Premju fil-Ħiliet tat-TI Fundamentali fuq il-Post tax-Xogħol - MQF 2', 'Dan il-kors huwa partikolarment immirat lejn studenti li bħalissa huma mingħajr xogħol jew qegħdin ifittxu xogħol, u li huma interessati li jiksbu għarfien bażiku ta’ applikazzjonijiet tas-software tal-kompjuter u tal-office. Fi tmiem il-kors l-istudenti se jiksbu ċertifikat fil-ħiliet tat-TI fil-livell MQF 2.

Post tal-kors: Il-Belt Valletta', 2, 'digital_skills', 'Malta', 'https://www.melitamanagement.com/courses', 4, NULL, NULL, NULL, 'Melita Training and Resource Management Limited', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4025, 'Premju fil-Ħiliet tat-TI Essenzjali fuq il-Post tax-Xogħol - MQF 3', 'Dan il-kors huwa partikolarment immirat lejn adulti li huma interessati li jiksbu għarfien essenzjali f’applikazzjonijet tas-software tal-kompjuter u tal-office. Fi tmiem il-kors int se tikseb ċertifikat fil-ħiliet tat-TI fil-livell MQF 3, li se jgħinek issir aktar kunfidenti meta tuża l-kompjuters fil-ħajja ta’ kuljum.

Post tal-kors: Il-Belt Valletta', 3, 'digital_skills', 'Malta', 'https://www.melitamanagement.com/courses', 4, NULL, NULL, NULL, 'Melita Training and Resource Management Limited', '21497220', 'info@melitamanagement.com', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4026, 'Premju fil-Ħiliet tal-ICT Prattiċi - MQF 2 (Fuq talba)', 'Dan il-kors se jgħinek tiżviluppa l-ħiliet tiegħek fit-teknoloġija u l-ICT (Teknoloġija tal-Informazzjoni u l-Komunikazzjoni). Int se tingħata l-opportunità li tipprova diversi programmi introdotti u tikseb il-ħiliet u l-għodod biex tinkorpora l-ICT fit-tagħlim ta’ kuljum tiegħek.

Post tal-kors: Il-Mosta', 2, 'digital_skills', 'Malta', 'https://domainacademy.edu.mt/', 4, NULL, NULL, NULL, 'Domain Academy', '21433688', 'info@domaingroup.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4036, 'Malti - MQF 1', 'Dan il-kors jiġi mwassal online u huwa mmirat lejn studenti li jixtiequ jibdew jitgħallmu l-lingwa Maltija.
Waqt dan il-kors int se:
• titgħallem l-alfabett u kliem bażiku biex tkun kapaċi taqra u tikteb Malti bażiku;
• titgħallem tiżviluppa sentenzi sempliċi permezz ta’ stampi, kliem u frażijiet u dettalji personali bażiċi oħrajn, u
• tifhem u titkellem dwar opinjonijiet personali.
Dan il-kors jiġi mgħallem permezz ta’ diskussjonijiet u taħriġ u se tiġi vvalutat matul il-kors u b’eżami finali.', 1, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4027, 'ECDL Standard (MQF 3)', 'L-ECDL Standard (MQF 3) jeżamina ħiliet u kompetenzi prattiċi u jikkonsisti f’seba’ moduli separati li jkopru t-teorija u l-prattika tal-kompjuter. L-ECDL Standard jikkonsisti f’Computer Essentials, Online Essentials, Wordprocessing, Spreadsheets, Intermediate modules, IT Security, Presentation u Using Database. It-testijiet tal-ECDL kollha jsiru fuq software tal-ittestjar awtomatizzat f’ċentru tal-ittestjar tal-ECDL akkreditat. Int se tagħmel it-test fuq kompjuter, li mbagħad se jivvaluta awtomatikament il-prestazzjoni tal-kandidati, u se jipprovdi feedback ta’ pass/fail immedjat kemm liċ-ċentru kif ukoll lill-kandidati. It-testijiet jistgħu jsiru fi kwalunkwe sekwenza u fi kwalunkwe ħin, allura int tista’ tagħmilhom skont il-pass tiegħek. Int tista’ jew tagħmel it-testijiet għand id-Domain Academy stess jew inkella f’Test Centre ieħor. Kull test idum 45 minuta u l-marka biex wieħed jgħaddi mit-test hija ta’ 75%. L-ECDL Standard Certificate (MQF 3) jingħata lil kandidati li jlestu b’suċċess il-moduli kollha.', 3, 'digital_skills', 'Malta', 'https://domainacademy.edu.mt/courses/ict-computing/ecdl-standard/', 4, NULL, NULL, NULL, 'Domain Academy', '21433688', 'info@domaingroup.com.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4028, 'MG2I-C0106 Computer Technician Course (Kors ta'' Teknixin tal-Kompjuter) (MQF 3)', 'Il-kors ta’ teknixin tal-kompjuter jipprovdi fehim bażiku ta’ sistemi operattivi tal-hardware tal-kompjuter, software, networking bażiku, sigurtà, proċeduri operattivi u servizz għall-klijenti. Int se tikseb esperjenza diretta fuq l-armar u ż-żarmar ta’ sistema tal-kompjuter flimkien mal-installazzjoni u l-personalizzazzjoni ta’ Sistema Operattiva. Dan huwa kors ta’ tagħlim iggwidat ta’ 90 siegħa u int mistenni li tistudja privatament u permezz ta’ xogħol għad-dar.

Post tal-kors: Raħal Ġdid', 3, 'digital_skills', 'Malta', 'https://shortcourses.mcast.edu.mt/files/PT_coursesMarch_2021_new.pdf', 4, NULL, NULL, NULL, 'MCAST', '23987777 or 23987116', 'shortcourses@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4029, 'MG2I-C0376 - Ingliż Bażiku bħala Lingwa Barranija (MQF 1)', 'L-Ingliż jiġi mitkellem fuq skala globali. Il-profiċjenza fil-lingwa Ingliża hija għaldaqstant assi importanti biex tiffunzjona b’mod indipendenti f’pajjiż barrani u għas-soċjalizzazzjoni. Il-kors se jgħinek tikseb għarfien bażiku u l-ħiliet meħtieġa biex tikkomunika b’mod effettiv f’sitwazzjonijiet ta’ kuljum. Dan il-kors huwa għal individwi li qatt ma studjaw l-Ingliż jew li għandhom għarfien limitat ħafna tal-Ingliż. M’hemm l-ebda rekwiżiti ta’ dħul għal dan il-kors.

Post tal-kors: Raħal Ġdid', 1, 'literacy', 'Malta', 'https://shortcourses.mcast.edu.mt/files/PT_coursesMarch_2021_new.pdf', 4, NULL, NULL, NULL, 'MCAST', '23987777 or 23987116', 'shortcourses@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4030, 'IT1-01-21 - Ċertifikat Introduttorju fl-ICT (MQF 1)', 'Iċ-Ċertifikat Introduttorju fl-ICT joffri għarfien f’ħiliet bażiċi kif ukoll għarfien fil-prinċipji fundamentali tas-sistemi tal-kompjuter u ħiliet ta’ pprogrammar. Il-programm joffri lill-istudenti l-għarfien meħtieġ dwar il-komponenti bażiċi li jsawru sistema tal-kompjuter, u se jitgħallmu dwar il-fażijiet tad-disinn tas-software u kif jinstallaw hardware. Se jiġu żviluppati ħiliet ta’ disinn ta’ algoritmi sempliċi u programmi tal-kompjuter sempliċi.

Post tal-kors: Raħal Ġdid', 1, 'digital_skills', 'Malta', 'https://www.mcast.edu.mt/mcast-prospectus-2021-2022/', 4, NULL, '2021-08-16 00:00:00+00', '2021-09-20 00:00:00+00', 'MCAST', '2398 7100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4031, 'IT1-01-21 - Ċertifikat Fundamentali fl-ICT (MQF 2)', 'Iċ-Ċertifikat Fundamentali fl-ICT huwa esperjenza ta’ tagħlim inizjali għal karriera futura fl-industrija tal-kompjuter. Dan huwa orjentat lejn il-prattika biex jgħin lill-istudenti jiksbu l-kunċetti bażiċi tal-ICT. Il-kors huwa maħsub bħala pass inizjali għal korsijiet suċċessivi li se jippreparawk għal xogħol fl-industrija tal-kompjuter. Fi tmiem il-kors, int se tkun kapaċi tidentifika l-komponenti ewlenin ta’ hardware, twettaq xogħlijiet sempliċi ta’ pprogrammar, tuża applikazzjonijiet multimedjali u tipprovdi soluzzjonijiet għal proġetti tat-TI.

Post tal-kors: Raħal Ġdid', 2, 'digital_skills', 'Malta', 'https://www.mcast.edu.mt/mcast-prospectus-2021-2022/', 4, NULL, '2021-08-16 00:00:00+00', '2021-09-20 00:00:00+00', 'MCAST', '2398 7100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4033, 'IT3-01-21 - Diploma fl-ICT (MQF 3)', 'Id-Diploma fl-ICT huwa l-ewwel pass fi programm ta’ taħriġ ta’ tliet snin, imfassal biex jipprovdi l-ħiliet meħtieġa biex taħdem fl-industrija tal-kompjuter. Il-kors se jintroduċik għal suġġetti fundamentali fin-networking, l-iżvilupp tas-software, l-iżvilupp tal-web u oqsma multimedjali. Fi tmiem il-kors, int se tkun kapaċi tuża sistemi moderni tal-kompjuter u multimedjali u networks fuq il-post tax-xogħol.
Post tal-kors: Raħal Ġdid', 3, 'digital_skills', 'Malta', 'https://www.mcast.edu.mt/mcast-prospectus-2021-2022/', 4, NULL, '2021-08-16 00:00:00+00', '2021-09-20 00:00:00+00', 'MCAST', '2398 7100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4035, 'Malti - MQF 1', 'Dan il-kors huwa mmirat għal studenti li jixtiequ jibdew jitgħallmu l-lingwa Maltija.
Matual dan il-kors, int se:
• titgħallem l-alfabett u kliem bażiku biex tkun kapaċi taqra u tikteb Malti bażiku;
• titgħallem tiżviluppa sentenzi sempliċi permezz ta’ stampi, kliem u frażijiet u dettalji personali bażiċi oħrajn, u
• tifhem u titkellem dwar opinjonijiet personali.
Dan il-kors jiġi mgħallem permezz ta’ diskussjonijiet u taħriġ u se tiġi vvalutat matul il-kors u b’eżami finali.

Post tal-kors: Il-Kunsill Lokali taż-Żejtun
', 1, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4037, 'Malti - MQF 2', 'Dan il-kors jiġi pprovdut online u huwa mmirat lejn studenti li jixtiequ jtejbu s-smigħ, it-taħdit u l-kitba tagħhom bil-lingwa Maltija biex jikkomunikaw b’mod effettiv kemm fuq il-post tax-xogħol kif ukoll fil-ħajja ta’ kuljum. Matul dan il-kors int se titgħallem tiżviluppa sentenzi sempliċi permezz ta’ stampi, kliem u frażijiet u dettalji personali bażiċi oħrajn u tifhem u titkellem dwar opinjonijiet personali. Dan il-kors jiġi mgħallem permezz ta’ diskussjonijiet u taħriġ prattiku u se tiġi vvalutat matul il-kors u b’eżami finali.', 2, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4038, 'Malti - SEC (MQF 3)', 'Dan il-kors jiġi pprovdut online u jippromwovi l-kompetenza fl-erba’ ħiliet ta’ smigħ, taħdit, qari u kitba, fejn jirrifletti l-għarfien nattiv, il-grammatika, is-sintassi u l-għarfien tal-kultura u l-letteratura Maltija. Dan se jippermettilek issir utent kompetenti tal-Malti, kif inhu meħtieġ biex tkompli tistudja, taħdem u għall-gost. Dan iservi wkoll bħala kors ta’ reviżjoni għas-SEC O’Level tal-Malti. L-istudenti jeħtieġ li jkollhom ċertifikat tat-tluq mill-iskola jew livell MQF 2 tal-Malti qabel ma japplikaw għal dan il-kors.', 3, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4039, 'Il-Malti bħala Lingwa Barranija - MQF 1', 'Dan il-kors jiffoka fuq il-fehim u l-użu ta’ espressjonijiet u sentenzi Maltin li jintużaw f’sitwazzjonijiet tal-ħajja ta’ kuljum bħad-dar, ix-xogħol, sitwazzjonijiet soċjali u pubbliċi u se jintroduċi lill-istudent għall-kultura Maltija u l-użanzi Maltin
Il-kors se jgħinek:
• taqra u tifhem testi sempliċi bil-Malti;
• tisma’ u tifhem il-kontenut ta’ konverżazzjonijiet mitkellma aktar bil-mod; u
• tibni sentenzi sempliċi bil-Malti.
Meta tlesti dan il-kors b’suċċess, int se tkun tista’ tapplika għal kors tal-Malti bħala Lingwa Barranija f’livell MQF 2.

Postijiet tal-kors: Il-Kunsill Nazzjonali għan-Nisa, il-Blata l-Bajda, Birżebbuġa/Ħal Safi/Is-Siġġiewi jew il-Kunsill Lokali ta’ Bormla', 1, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4041, 'Il-Malti bħala Lingwa Barranija - MQF 1', 'Dan il-kors jiġi pprovdut online u jiffoka fuq il-fehim u l-użu ta’ espressjonijiet u sentenzi Maltin li jintużaw f’sitwazzjonijiet tal-ħajja ta’ kuljum bħad-dar, ix-xogħol, sitwazzjonijiet soċjali u pubbliċi u se jintroduċuk għall-kultura Maltija u l-użanzi Maltin
Il-kors se jgħinek:
• taqra u tifhem testi sempliċi bil-Malti;
• tisma’ u tifhem il-kontenut ta’ konverżazzjonijiet mitkellma aktar bil-mod; u
• tibni sentenzi sempliċi bil-Malti.
Meta tlesti dan il-kors b’suċċess, int se tkun tista’ tapplika għal kors tal-Malti bħala Lingwa Barranija f’livell MQF 2.', 1, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4042, 'Il-Malti bħala Lingwa Barranija - MQF 2', 'Dan il-kors se jgħinek:
• tikkomunika b’vokabularju u frażijiet bil-Malti, dawk relatati mal-ħajja ta’ kuljum, bħad-dar, ix-xogħol, sitwazzjonijiet soċjali u pubbliċi;
• tifhem testi miktuba bil-lingwa Maltija;
• tidentifika suġġetti grammatiċi u espressjonijiet idjomatiċi minn test;
• tifhem il-kontenut tal-Malti mitkellem; u
• tikteb testi grammatikalment u sekwenzjalment korretti.

Post tal-Kors: Cottonera Resource Centre', 2, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4043, 'Il-Malti bħala Lingwa Barranija - MQF 2', 'Dan il-kors jiġi pprovdut online u se jgħinek:
• tikkomunika b’vokabularju u frażijiet bil-Malti, dawk relatati mal-ħajja ta’ kuljum, bħad-dar, ix-xogħol, sitwazzjonijiet soċjali u pubbliċi;
• tifhem testi miktuba bil-lingwa Maltija;
• tidentifika suġġetti grammatiċi u espressjonijiet idjomatiċi minn test;
• tifhem il-kontenut tal-Malti mitkellem; u
• tikteb testi grammatikalment u sekwenzjalment korretti.', 2, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4044, 'Ingliż - MQF 1', 'Fi tmiem dan il-kors, int se tkun tista’:
• tifhem vokabularju, espressjonijiet u grammatika Ingliża bażika;
• tifhem u tikkomunika bl-Ingliż f’sitwazzjonijiet ta’ kuljum, bħad-dar, ix-xogħol jew meta tiltaqa’ ma’ sħabek;
• taqra u tifhem artikli tal-gazzetta, artikli ta’ magazins, stediniet u manwali; u
• tikteb dettalji personali bażiċi.
Wara li tlesti dan il-kors, int se tkun tista’ tkompli tistudja aktar l-Ingliż biex ittejjeb il-vokabularju, il-kompetenza u l-preċiżjoni.

Postijiet tal-kors: Ħal Qormi, Ħaż-Żabbar jew il-Kunsill Lokali taż-Żejtun', 1, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4045, 'Ingliż - MQF 1', 'Dan il-kors jiġi pprovdut online u fi tmiem ta'' dan il-kors, int se tkun tista’:
• tifhem vokabularju, espressjonijiet u grammatika Ingliża bażika;
• tifhem u tikkomunika bl-Ingliż f’sitwazzjonijiet ta’ kuljum, bħad-dar, ix-xogħol jew meta tiltaqa’ ma’ sħabek;
• taqra u tifhem artikli tal-gazzetta, artikli ta’ magazins, stediniet u manwali; u
• tikteb dettalji personali bażiċi.
Wara li tlesti dan il-kors, int se tkun tista’ tkompli tistudja aktar l-Ingliż biex ittejjeb il-vokabularju, il-kompetenza u l-preċiżjoni.', 1, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4046, 'Ingliż - MQF 2', 'Dan il-kors jiġi pprovdut online u fi tmiem dan il-kors, int se tkun tista’:
• tifhem u tuża l-Ingliż b’mod effettiv għal komunikazzjoni prattika;
• tirrispondi b’mod adegwat f’intervista diretta;
• tifhem testi qosra u konkreti f’taħdit standard;
• taqra u tikteb narrattivi sempliċi fil-lingwa Ingliża; u
• tagħżel u tuża espressjonijiet grammatiċi adegwati.', 2, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4047, 'Ingliż - MQF 3', 'Dan il-kors jiffoka fuq is-smigħ, it-taħdit, il-qari u l-kitba, li se jippermettilek tkun utent fluwenti u indipendenti tal-Ingliż, u tkun kapaċi tuża l-Ingliż f’sitwazzjonijiet personali u professjonali. Dan il-kors iservi bħala reviżjoni għal studenti li jixtiequ jagħmlu l-eżami tas-SEC O’Level tal-Ingliż (MQF 3). Jekk tgħaddi mis-SEC O’Level dan jipprovdi opportunitajiet għal aktar studju u jista’ joħloq opportunitajiet ta'' xogħol.

Post tal-kors: Kunsill Nazzjonali għan-Nisa, il-Blata l-Bajda', 3, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4048, 'Ingliż - MQF 3', 'Dan il-kors jiġi pprovdut online u jiffoka fuq is-smigħ, it-taħdit, il-qari u l-kitba, u se jippermettilek tkun utent fluwenti u indipendenti tal-Ingliż, u tkun kapaċi tuża l-Ingliż f’sitwazzjonijiet personali u professjonali. Dan il-kors iservi bħala reviżjoni għal studenti li jixtiequ jagħmlu l-eżami tas-SEC O’Level tal-Ingliż (MQF 3). Jekk tgħaddi mis-SEC O’Level dan jipprovdi opportunitajiet għal aktar studju u jista’ joħloq opportunitajiet ta’ xogħol.', 3, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4049, 'L-Ingliż bħala Lingwa Barranija - MQF 1', 'Il-profiċjenza fil-lingwa Ingliża hija assi importanti biex tiffunzjona b’mod indipendenti f’pajjiż barrani u għas-soċjalizzazzjoni. Dan il-kors se:
• jagħtik il-kunċetti bażiċi biex tiffaċilita l-komunikazzjoni bl-użu ta’ vokabularju u frażijiet bl-Ingliż bażiku ħafna relatati mal-ħajja ta’ kuljum u li jirrappreżentaw sitwazzjonijiet domestiċi, professjonali, soċjali u pubbliċi;
• jgħinek taqra u tifhem testi bażiċi.

Postijiet tal-kors: Birżebbuġa/Ħal Safi/Santa Luċija/Ħ''Attard/Siġġiewi jew il-Kunsill Lokali ta’ Santa Venera', 1, 'literacy', 'Malta', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4051, 'L-Ingliż bħala Lingwa Barranija - MQF 1', 'Il-profiċjenza fil-lingwa Ingliża hija assi importanti biex tiffunzjona b’mod indipendenti f’pajjiż barrani u għas-soċjalizzazzjoni. Dan il-kors se:
• jagħtik il-kunċetti bażiċi biex tiffaċilita l-komunikazzjoni bl-użu ta’ vokabularju u frażijiet bl-Ingliż bażiku ħafna relatati mal-ħajja ta’ kuljum u li jirrappreżentaw sitwazzjonijiet domestiċi, professjonali, soċjali u pubbliċi;
• jgħinek taqra u tifhem testi bażiċi.', 1, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4052, 'L-Ingliż bħala Lingwa Barranija - MQF 2', 'Dan il-kors jiġi pprovdut online u fi tmiem dan il-kors, int se tkun tista’ tifhem u tuża espressjonijiet awtentiċi bl-Ingliż, ikollok kmand fuq il-grammatika u l-istruttura Ingliża u tikkomunika b’mod xieraq permezz tat-taħdit u l-kitba. Biex tapplika għal dan il-kors, l-istudenti jeħtieġu li jkunu lestew b’suċċess il-Livell MQF 1 fl-Ingliż jew l-Ingliż bħala Lingwa Barranija.', 2, 'literacy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4053, 'Matematika - MQF 1', 'Dan il-kors se jgħinek:
• tifhem u tapplika għarfien matematiku f’kuntest usa’;
• tifhem u tanalizza problema;
• tivverifika u tinterpreta riżultati; u
• tifhem, tinterpreta u tevalwa ideat matematiċi li jiġu preżentati f’forom orali, miktuba jew viżivi.

Post tal-kors: Il-Kunsill Nazzjonali għan-Nisa, il-Blata l-Bajda', 1, 'numeracy', 'Malta', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4054, 'Matematika - MQF 1', 'Dan il-kors jiġi pprovdut online u se jgħinek:
• tifhem u tapplika għarfien matematiku f’kuntest usa’;
• tifhem u tanalizza problema;
• tivverifika u tinterpreta riżultati; u
• tifhem, tinterpreta u tevalwa ideat matematiċi li jiġu preżentati f’forom orali, miktuba jew viżivi.', 1, 'numeracy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4055, 'Matematika - MQF 2', 'Dan il-kors jiġi pprovdut online u se jgħinek tanalizza u ssolvi problemi matematiċi u tifhem, tinterpreta u tevalwa ideat matematiċi li huma preżentati f’forom orali, miktuba u viżivi. Biex tapplika għal dan il-kors l-istudenti għandhom ikunu kisbu Ċertifikat fil-Matematika fil-livell MQF 1 bi Grad B jew ogħla jew Ċertifikat tat-Tluq mill-Iskola fil-Matematika b’marka ta'' 75% jew aktar.', 2, 'numeracy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4056, 'Matematika (SEC Paper A) - MQF 3', 'Dan huwa kors ta’ reviżjoni pprovdut online, immirat lejn studenti li se jagħmlu l-eżami tas-SEC O’Level fil-Matematika (Paper A). Għarfien tajjeb tal-matematika bażika huwa essenzjali peress li l-edukatur mhuwiex meħtieġ jgħallem is-sillabu kollu. Dan il-kors se jgħinek tikseb il-fehim matematiku bażiku sabiex tuża l-matematika f’sitwazzjonijiet ta’ kuljum billi jiffoka fuq l-ordni, il-preċiżjoni, il-qosor u l-loġika. Fi tmien dan il-kors, int se tkun tista’ tagħmel l-eżami tas-SEC O’Level fil-livell MQF 3.', 3, 'numeracy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4058, 'ECDL - MQF 3', 'Il-kors tal-ECDL ikopri 7 moduli: Computer essentials, Online essentials, Word processing, Spreadsheets, Presentation, Database u IT Security. Wara li tlesti b’suċċess dan il-kors, int se ssir aktar familjari ma’ programmi tal-kompjuter meħtieġa għall-użu personali jew professjonali. Biex tapplika għal dan il-kors, għandu jkollok ħiliet bażiċi fl-ICT.

Postijiet tal-kors: Blata l-Bajda Learning Centre, Mrieħel Adult Learning Centre, il-Kunsill Lokali ta’ Bormla jew il-Cottonera Resource Centre', 3, 'digital_skills', 'Malta', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4059, 'ECDL - MQF 3', 'Il-kors tal-ECDL jiġi pprovdut online u jkopri 7 moduli: Computer essentials, Online essentials, Word processing, Spreadsheets, Presentation, Database u IT Security. Wara li tlesti b’suċċess dan il-kors, int se ssir aktar familjari ma’ programmi tal-kompjuter meħtieġa għall-użu personali jew professjonali. Biex tapplika għal dan il-kors, għandu jkollok ħiliet bażiċi fl-ICT.', 3, 'digital_skills', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4060, 'Computing - SEC (MQF 3)', 'Dan il-kors jiġi pprovdut online u joffri lill-istudenti firxa wiesgħa ta’ opportunitajiet ta’ tagħlim u esperjenza f''aspetti differenti tal-industrija tal-IT. Dan se jintroduċik għal kunċetti tax-xjenza tal-kompjuter u l-prinċipji fundamentali tas-sistemi tal-kompjuter, tal-ipprogrammar, is-sigurtà u n-networking. Dan il-kors iservi bħala reviżjoni għall-eżami tas-SEC O’Level. Jekk tgħaddi mill-eżami tas-SEC O’Level fil-Computing se jinħolqulek opportunitajiet għal aktar studju u xogħol.', 3, 'digital_skills', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4061, 'Matematika (MQF 3)', 'Ċempel lil-Lifelong Learning Unit fuq 2598 1101/2/3/4 biex tistaqsi għal aktar informazzjoni dwar korsijiet rilevanti fiż-żona tiegħek jew ibgħatilna email fuq lifelonglearning@gov.mt.
Jew ara l-opportunitajiet ta’ tagħlim li huma disponibbli online!', 3, 'numeracy', 'Malta', 'https://lifelonglearning.gov.mt/', 4, NULL, NULL, NULL, 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4068, 'Computing (MQF 1)', 'Ċempel lil-Lifelong Learning Unit fuq 2598 1101/2/3/4 biex tistaqsi għal aktar informazzjoni dwar korsijiet rilevanti fiż-żona tiegħek jew ibgħatilna email fuq lifelonglearning@gov.mt.
Jew ara l-opportunitajiet ta’ tagħlim online jew wiċċ imb wiċċ f’Malta li huma disponibbli!', 1, 'digital_skills', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, NULL, NULL, 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4069, 'Computing (MQF 2)', 'Ċempel lil-Lifelong Learning Unit fuq 2598 1101/2/3/4 biex tistaqsi għal aktar informazzjoni dwar korsijiet rilevanti fiż-żona tiegħek jew ibgħatilna email fuq lifelonglearning@gov.mt.
Jew ara l-opportunitajiet ta’ tagħlim online jew wiċċ imb wiċċ f’Malta li huma disponibbli!', 2, 'digital_skills', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, NULL, NULL, 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4057, 'Matematika (SEC Paper B) - MQF 3', 'Dan huwa kors ta’ reviżjoni pprovdut online, immirat lejn studenti li se jagħmlu l-eżami tas-SEC O’Level fil-Matematika (Paper B). Għarfien tajjeb tal-matematika bażika huwa essenzjali peress li l-edukatur mhuwiex meħtieġ jgħallem is-sillabu kollu. Dan il-kors se jgħinek tikseb il-fehim matematiku bażiku sabiex tuża l-matematika f’sitwazzjonijiet ta’ kuljum billi jiffoka fuq l-ordni, il-preċiżjoni, il-qosor u l-loġika. Fi tmien dan il-kors, int se tkun tista’ tagħmel l-eżami tas-SEC O’Level fil-livell MQF 3.', 3, 'numeracy', 'Online', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4032, 'IT1-01-21G - Ċertifikat Fundamentali fl-ICT (MQF 2)', 'Iċ-Ċertifikat Fundamentali fl-ICT huwa esperjenza ta’ tagħlim inizjali għal karriera futura fl-industrija tal-kompjuter. Dan huwa orjentat lejn il-prattika biex jgħin lill-istudenti jiksbu l-kunċetti bażiċi tal-ICT. Il-kors huwa maħsub bħala pass inizjali għal korsijiet suċċessivi li se jippreparawk għal xogħol fl-industrija tal-kompjuter. Fi tmiem il-kors, int se tkun kapaċi tidentifika l-komponenti ewlenin ta’ hardware, twettaq xogħlijiet sempliċi ta’ pprogrammar, tuża applikazzjonijiet multimedjali u tipprovdi soluzzjonijiet għal proġetti tat-TI.

Post tal-kors: Għajnsielem', 2, 'digital_skills', 'Għawdex', 'https://www.mcast.edu.mt/mcast-prospectus-2021-2022/', 4, NULL, '2021-08-16 00:00:00+00', '2021-09-20 00:00:00+00', 'MCAST', '2398 7100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4034, 'IT3-01-21G - Diploma fl-ICT (MQF 3)', 'Id-Diploma fl-ICT huwa l-ewwel pass fi programm ta’ taħriġ ta’ tliet snin, imfassal biex jipprovdi l-ħiliet meħtieġa biex taħdem fl-industrija tal-kompjuter. Il-kors se jintroduċik għal suġġetti fundamentali fin-networking, l-iżvilupp tas-software, l-iżvilupp tal-web u oqsma ta’ multimedia. Fi tmiem il-kors, int se tkun kapaċi tuża sistemi moderni tal-kompjuter u multimedjali u networks fuq il-post tax-xogħol.
Post tal-kors: Għajnsielem', 3, 'digital_skills', 'Għawdex', 'https://www.mcast.edu.mt/mcast-prospectus-2021-2022/', 4, NULL, '2021-08-16 00:00:00+00', '2021-09-20 00:00:00+00', 'MCAST', '2398 7100', 'information@mcast.edu.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4040, 'Il-Malti bħala Lingwa Barranija - MQF 1', 'Dan il-kors jiffoka fuq il-fehim u l-użu ta’ espressjonijiet u sentenzi Maltin li jintużaw f’sitwazzjonijiet tal-ħajja ta’ kuljum bħad-dar, ix-xogħol, sitwazzjonijiet soċjali u pubbliċi u se jintroduċi lill-istudent għall-kultura Maltija u l-użanzi Maltin
Il-kors se jgħinek:
• taqra u tifhem testi sempliċi bil-Malti;
• tisma’ u tifhem il-kontenut ta’ konverżazzjonijiet mitkellma aktar bil-mod; u tibni sentenzi sempliċi bil-Malti.
Meta tlesti dan il-kors b’suċċess, int se tkun tista’ tapplika għal kors tal-Malti bħala Lingwa Barranija fil-livell MQF 2.

Postijiet tal-kors: L-Iskola Sekondarja tar-Rabat Għawdex jew il-Kunsill Lokali tal-Għarb', 1, 'literacy', 'Għawdex', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4050, 'L-Ingliż bħala Lingwa Barranija - MQF 1', 'Il-profiċjenza fil-lingwa Ingliża hija assi importanti biex tiffunzjona b’mod indipendenti f’pajjiż barrani u għas-soċjalizzazzjoni. Dan il-kors se:
• jagħtik il-kunċetti bażiċi biex tiffaċilita l-komunikazzjoni bl-użu ta’ vokabularju u frażijiet bl-Ingliż bażiku ħafna relatati mal-ħajja ta’ kuljum u li jirrappreżentaw sitwazzjonijiet domestiċi, professjonali, soċjali u pubbliċi;
• jgħinek taqra u tifhem testi bażiċi.

Postijiet tal-kors: L-Iskola Sekondarja tar-Rabat, Għawdex', 1, 'literacy', 'Għawdex', 'https://lifelonglearning.gov.mt/', 4, NULL, '2021-07-14 00:00:00+00', '2021-08-13 00:00:00+00', 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4062, 'Ingliż (MQF 2)', 'Ċempel lil-Lifelong Learning Unit fuq 2598 1101/2/3/4 biex tistaqsi għal aktar informazzjoni dwar korsijiet rilevanti fiż-żona tiegħek jew ibgħatilna email fuq lifelonglearning@gov.mt.
Jew ara l-opportunitajiet ta’ tagħlim online jew wiċċ imb wiċċ f’Malta li huma disponibbli!', 2, 'literacy', 'Għawdex', 'https://lifelonglearning.gov.mt/', 4, NULL, NULL, NULL, 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4063, 'Ingliż (MQF 3)', 'Ċempel lil-Lifelong Learning Unit fuq 2598 1101/2/3/4 biex tistaqsi għal aktar informazzjoni dwar korsijiet rilevanti fiż-żona tiegħek jew ibgħatilna email fuq lifelonglearning@gov.mt.
Jew ara l-opportunitajiet ta’ tagħlim online jew wiċċ imb wiċċ f’Malta li huma disponibbli!', 3, 'literacy', 'Għawdex', 'https://lifelonglearning.gov.mt/', 4, NULL, NULL, NULL, 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4064, 'Matematika (MQF 1)', 'Ċempel lil-Lifelong Learning Unit fuq 2598 1101/2/3/4 biex tistaqsi għal aktar informazzjoni dwar korsijiet rilevanti fiż-żona tiegħek jew ibgħatilna email fuq lifelonglearning@gov.mt.
Jew ara l-opportunitajiet ta’ tagħlim online jew wiċċ imb wiċċ f’Malta li huma disponibbli!', 1, 'numeracy', 'Għawdex', 'https://lifelonglearning.gov.mt/', 4, NULL, NULL, NULL, 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4065, 'Matematika (MQF 2)', 'Ċempel lil-Lifelong Learning Unit fuq 2598 1101/2/3/4 biex tistaqsi għal aktar informazzjoni dwar korsijiet rilevanti fiż-żona tiegħek jew ibgħatilna email fuq lifelonglearning@gov.mt.
Jew ara l-opportunitajiet ta’ tagħlim online jew wiċċ imb wiċċ f’Malta li huma disponibbli!', 2, 'numeracy', 'Għawdex', 'https://lifelonglearning.gov.mt/', 4, NULL, NULL, NULL, 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4066, 'Matematika (MQF 3)', 'Ċempel lil-Lifelong Learning Unit fuq 2598 1101/2/3/4 biex tistaqsi għal aktar informazzjoni dwar korsijiet rilevanti fiż-żona tiegħek jew ibgħatilna email fuq lifelonglearning@gov.mt.
Jew ara l-opportunitajiet ta’ tagħlim online jew wiċċ imb wiċċ f’Malta li huma disponibbli!', 3, 'numeracy', 'Għawdex', 'https://lifelonglearning.gov.mt/', 4, NULL, NULL, NULL, 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);
INSERT INTO public.course (id, title, description, level, skill, location, link, product, address, enrolment_start, enrolment_finish, contact_person, contact_telephone, contact_email, external_id, contact_attention) VALUES (4067, 'Computing (MQF 1)', 'Ċempel lil-Lifelong Learning Unit fuq 2598 1101/2/3/4 biex tistaqsi għal aktar informazzjoni dwar korsijiet rilevanti fiż-żona tiegħek jew ibgħatilna email fuq lifelonglearning@gov.mt.
Jew ara l-opportunitajiet ta’ tagħlim online jew wiċċ imb wiċċ f’Malta li huma disponibbli!', 1, 'digital_skills', 'Għawdex', 'https://lifelonglearning.gov.mt/', 4, NULL, NULL, NULL, 'Direttorat għar-Riċerka, it-Tagħlim Tul il-Ħajja u l-Impjegabbiltà', '2598 1101/2/3/4', 'lifelonglearning@gov.mt', NULL, NULL);


--
-- TOC entry 3882 (class 0 OID 16429)
-- Dependencies: 202
-- Data for Name: interest; Type: TABLE DATA; Schema: public; Owner: skillschecker
--

INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (1, 1, 'improve_skills', 'Find out what skills I have and how I could improve them', NULL, 'grade-a-plus.svg', 2);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (3, 1, 'find_skills', 'Be more confident and develop my skills to find work or a better job', NULL, 'person-options.svg', 3);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (4, 1, 'social_skills', 'Be more comfortable meeting people or taking part in activities with family and friends', NULL, 'people-talking.svg', 4);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (24, 2, 'improve_skills', 'Finne ut hvilke ferdigheter jeg har og hvordan jeg kan forbedre dem', NULL, 'grade-a-plus.svg', 6);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (25, 2, 'more_independent', 'Være mer selvstendig, som å hjelpe barna med lekser eller ta ansvar for egen økonomi', NULL, 'laptop-person.svg', 5);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (27, 2, 'find_skills', 'Være selvsikker og utvikle mine ferdigheter slik at jeg kan få en jobb eller en bedre jobb', NULL, 'person-options.svg', 7);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (30, 2, 'social_skills', 'Være mer komfortabel i møte med nye mennesker, eller delta i aktiviteter med familie og venner', NULL, 'people-talking.svg', 8);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (42, 4, 'find_work', 'Tħossok sodisfatt bil-ħiliet li għandek biex issib xogħol', NULL, 'person-options.svg', 15);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (43, 4, 'social_skills', 'Tkun aktar komdu tiltaqa'' man-nies jew tieħu sehem f''attivitajiet mal-familja u l-ħbieb', NULL, 'people-talking.svg', 16);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (40, 4, 'improve_skills', 'Tkun taf liema ħiliet għhandek u kif tista'' itejjibhom', NULL, 'grade-a-plus.svg', 14);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (41, 4, 'help_children', 'Tagħmel xogħlijiet waħdek bħal tgħin fix-xogħol għad-dar tat-tfal tiegħek jew timmaniġġja flusek', NULL, 'laptop-person.svg', 13);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (2, 1, 'more_independent', 'Be more independent to do tasks like helping with my children’s schoolwork or managing my finances', NULL, 'laptop-person.svg', 1);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (32, 3, 'help_children', 'Do tasks on my own like helping with my children’s schoolwork or managing my money', NULL, 'laptop-person.svg', 9);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (34, 3, 'find_work', 'Feel satisfied with the skills I have to find work or a better job', NULL, 'person-options.svg', 11);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (38, 3, 'social_skills', 'Be more comfortable meeting people or taking part in activities with family and friends', NULL, 'people-talking.svg', 12);
INSERT INTO public.interest (id, product, name, text, description, resource, category) VALUES (9, 3, 'improve_skills', 'Find out what skills I have and how I could improve them', NULL, 'grade-a-plus.svg', 10);


--
-- TOC entry 3884 (class 0 OID 16437)
-- Dependencies: 204
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: skillschecker
--

INSERT INTO public.product (id, name, description) VALUES (1, 'nala', 'Version of the Skills Checker tool for Ireland');
INSERT INTO public.product (id, name, description) VALUES (2, 'nala-no', 'Version of the Skills Checker tool for Norway');
INSERT INTO public.product (id, name, description) VALUES (3, 'nala-mt', 'Version of the Skills Checker tool for Malta (English)');
INSERT INTO public.product (id, name, description) VALUES (4, 'nala-mt2', 'Version of the Skills Checker tool for Malta (Maltese)');


--
-- TOC entry 3886 (class 0 OID 16445)
-- Dependencies: 206
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: skillschecker
--

INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (88, 1, 48, 'slider', 'In this task, selecting the ad for the job that is based in Dublin and pays more than €12 an hour is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (4, 1, 0, 'single', 'Would you feel comfortable doing this task in public?', NULL, 'dimension_confidence_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (13, 1, 0, 'single', 'Would you feel more comfortable doing this task in private?', NULL, 'dimension_confidence_2');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (5, 1, 0, 'single', 'Would it take you less than 5 minutes to complete this task?', NULL, 'dimension_fluency_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (63, 1, 36, 'slider', 'In this task, completing the first part of the application form is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (14, 1, 0, 'single', 'Would it take you more than 30 minutes to complete this task?', NULL, 'dimension_fluency_2');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (3, 1, 0, 'single', 'Would you need help with this task?', NULL, 'dimension_independence_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (2, 1, 1, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (7, 1, 2, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (9, 1, 3, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (11, 1, 4, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (32, 1, 20, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (34, 1, 21, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (36, 1, 22, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (38, 1, 23, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (8, 1, 3, 'slider', 'In this task, using the online loan calculator is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (64, 1, 36, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (65, 1, 37, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (67, 1, 38, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (69, 1, 39, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (131, 2, 64, 'slider', 'I denne oppgaven er det å velge klær som passer til været som er meldt', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (31, 1, 20, 'slider', 'In this task, selecting appropriate clothes for my child after looking at the weather forecast on my phone is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (33, 1, 21, 'slider', 'In this task, sending a message on WhatsApp to invite friends to a birthday party is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (35, 1, 22, 'slider', 'In this task, using the online loan calculator is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (37, 1, 23, 'slider', 'In this task, calculating the interest I will be charged on this amount is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (133, 2, 65, 'slider', 'I denne oppgaven er det å sende melding på Messenger for å invitere venner til en bursdagsfest', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (135, 2, 66, 'slider', 'I denne oppgaven er bruken av online lånekalkulator', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (137, 2, 67, 'slider', 'I denne oppgaven er det å kalkulere renten på beløpet jeg blir belastet', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (1, 1, 1, 'slider', 'In this task, selecting appropriate clothes for my child after looking at the weather forecast on my phone is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (6, 1, 2, 'slider', 'In this task, sending a message on WhatsApp to invite friends to a birthday party is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (10, 1, 4, 'slider', 'In this task, calculating the interest I will be charged on this amount is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (68, 1, 38, 'slider', 'In this task, booking and paying for my driver’s theory test online is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (66, 1, 37, 'slider', 'In this task, identifying maths courses on the training course website is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (132, 2, 64, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (134, 2, 65, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (136, 2, 66, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (138, 2, 67, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (140, 2, 68, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (142, 2, 69, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (144, 2, 70, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (146, 2, 71, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (148, 2, 72, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (149, 2, 73, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (139, 2, 68, 'slider', 'I denne oppgaven er det å velge stillingsannonsen som er lokalisert i Oslo og er lønnet over kr.120 per time', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (141, 2, 69, 'slider', 'I denne oppgaven er det å opprette en e-post konto', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (143, 2, 70, 'slider', 'I denne oppgaven er det å kalkulere månedslønn og finne ut når du kan ta ferie', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (145, 2, 71, 'slider', 'I denne oppgaven er det å lage en Power Point presentasjon og finne hvilken måned som genererer minst og hvilke tre måneder på rad som genererer mest overskudd å', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (147, 2, 72, 'slider', 'I denne oppgaven er det å velge klær som passer til været som er meldt', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (39, 1, 5, 'slider', 'In this task, completing the first part of the application form is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (40, 1, 5, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (80, 1, 9, 'slider', 'In this task, selecting the ad for the job that is based in Dublin and pays more than €12 an hour is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (97, 1, 13, 'slider', 'In this task, selecting the bus that will allow me to arrive in Connolly Station just a few minutes before 11:00 is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (98, 1, 13, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (99, 1, 14, 'slider', 'In this task, selecting the month with the least chance of rain by looking at the weather forecast graph is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (73, 1, 10, 'slider', 'In this task, creating an email account by typing the information needed is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (74, 1, 10, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (94, 1, 51, 'slider', 'In this task, preparing a PowerPoint presentation and identifying the month that generates the least amount of profit and the most profitable three consecutive months is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (85, 1, 12, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (82, 1, 45, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (83, 1, 46, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (87, 1, 48, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (81, 1, 45, 'slider', 'In this task, creating an email account by typing the information needed is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (93, 1, 51, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (84, 1, 46, 'slider', 'In this task, calculating the monthly pay and finding out when you can take personal holidays is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (75, 1, 11, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (76, 1, 11, 'slider', 'In this task, calculating the monthly pay and finding out when you can take personal holidays is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (79, 1, 9, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (115, 1, 61, 'slider', 'In this task, selecting the month with the least chance of rain by looking at the weather forecast graph is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (70, 1, 39, 'slider', 'In this task, selecting the best deal is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (118, 1, 62, 'slider', 'In this task, texting the ingredients to my friends and adjusting the quantities in the recipe to serve 8 people is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (113, 1, 60, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (116, 1, 61, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (120, 1, 63, 'slider', 'In this task, calculating the area of the patio, working out how much decking you need and sharing photos on Facebook is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (121, 2, 0, 'single', 'Trenger du hjelp med denne oppgaven?', NULL, 'dimension_independence_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (122, 2, 0, 'single', 'Føler du deg komfortabel med å gjøre denne oppgaven blant andre?', NULL, 'dimension_confidence_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (123, 2, 0, 'single', 'Vil det ta deg mindre enn 5 minutter å fullføre denne oppgaven?', NULL, 'dimension_fluency_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (124, 2, 0, 'single', 'Føler du deg mer komfortabel å gjøre denne oppgaven alene?', NULL, 'dimension_confidence_2');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (125, 2, 0, 'single', 'Vil det ta deg mer enn 30 minutter å fullføre denne oppgaven?', NULL, 'dimension_fluency_2');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (126, 3, 0, 'single', 'Would you need help with this task?', NULL, 'dimension_independence_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (127, 3, 0, 'single', 'Would you feel comfortable doing this task in public?', NULL, 'dimension_confidence_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (128, 3, 0, 'single', 'Would it take you less than 5 minutes to complete this task?', NULL, 'dimension_fluency_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (129, 3, 0, 'single', 'Would you feel more comfortable doing this task in private?', NULL, 'dimension_confidence_2');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (130, 3, 0, 'single', 'Would it take you more than 30 minutes to complete this task?', NULL, 'dimension_fluency_2');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (117, 1, 62, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (119, 1, 63, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (158, 2, 77, 'slider', 'I denne oppgaven er det å opprette en e-post konto', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (150, 2, 73, 'slider', 'I denne oppgaven er det å sende melding på Messenger for å invitere venner til en bursdagsfest', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (152, 2, 74, 'slider', 'I denne oppgaven er bruken av online lånekalkulator', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (154, 2, 75, 'slider', 'I denne oppgaven er det å kalkulere renten på beløpet jeg blir belastet', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (155, 2, 76, 'slider', 'I denne oppgaven er det å velge stillingsannonsen som er lokalisert i Oslo og er lønnet over kr.120 per time', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (160, 2, 78, 'slider', 'I denne oppgaven er det å kalkulere månedslønn og finne ut når du kan ta ferie', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (162, 2, 79, 'slider', 'I denne oppgaven er det å lage en Power Point presentasjon og finne hvilken måned som genererer minst og hvilke tre måneder på rad som genererer mest overskudd å', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (114, 1, 60, 'slider', 'In this task, selecting the bus that will allow me to arrive in Connolly Station just a few minutes before 11:00 is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (41, 1, 6, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (42, 1, 6, 'slider', 'In this task, identifying maths courses on the training course website is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (43, 1, 7, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (100, 1, 14, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (101, 1, 15, 'slider', 'In this task, texting the ingredients to my friends and adjusting the quantities in the recipe to serve 8 people is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (86, 1, 12, 'slider', 'In this task, preparing a PowerPoint presentation and identifying the month that generates the least amount of profit and the most profitable three consecutive months is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (179, 2, 88, 'slider', 'I denne oppgaven er det å finne ut hvilken buss du må ta for å ankomme bussentralen litt før kl.11:00', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (181, 2, 89, 'slider', 'I denne oppgaven er det å finne ut hvilken måned det er minst mulighet for regn ved å se på værvarsel grafen', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (183, 2, 90, 'slider', 'I denne oppgaven er det å sende SMS til vennene mine og justere mengdene i oppskriften til å servere 8 personer', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (186, 2, 91, 'slider', 'I denne oppgaven er det å regne ut arealet på terrassen, finne ut hvor mye materiale du trenger og dele bilder på Facebook', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (188, 2, 92, 'slider', 'I denne oppgaven er det å finne ut hvilken buss du må ta for å ankomme bussentralen litt før kl.11:00', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (189, 2, 93, 'slider', 'I denne oppgaven er det å finne ut hvilken måned det er minst mulighet for regn ved å se på værvarsel grafen', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (192, 2, 94, 'slider', 'I denne oppgaven er det å sende SMS til vennene mine og justere mengdene i oppskriften til å servere 8 personer', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (194, 2, 95, 'slider', 'I denne oppgaven er det å regne ut arealet på terrassen, finne ut hvor mye materiale du trenger og dele bilder på Facebook', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (195, 3, 96, 'slider', 'In this task, choosing appropriate clothes for my child after looking at the weather forecast on my phone is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (196, 3, 96, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (197, 3, 97, 'slider', 'In this task, sending a message  to invite friends to a birthday party is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (198, 3, 97, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (199, 3, 98, 'slider', 'In this task, using the online loan calculator is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (200, 3, 98, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (201, 3, 99, 'slider', 'In this task, calculating the interest on the remaining amount due is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (202, 3, 99, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (204, 3, 100, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (206, 3, 101, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (208, 3, 102, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (210, 3, 103, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (212, 3, 104, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (213, 3, 105, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (215, 3, 106, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (217, 3, 107, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (220, 3, 108, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (221, 3, 109, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (223, 3, 110, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (203, 3, 100, 'slider', 'In this task, choosing the advert for the job that pays more than €5.50 an hour is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (205, 3, 101, 'slider', 'In this task, creating an email account by typing the information needed is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (207, 3, 102, 'slider', 'In this task, calculating the monthly salary and finding out when you can take leave is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (209, 3, 103, 'slider', 'In this task, preparing a PowerPoint presentation and identifying the month that generated the least profit and the 3 consecutive months that generated the most profit is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (211, 3, 104, 'slider', 'In this task, choosing appropriate clothes for my child after looking at the weather forecast on my phone is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (214, 3, 105, 'slider', 'In this task, sending a message  to invite friends to a birthday party is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (216, 3, 106, 'slider', 'In this task, using the online loan calculator is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (218, 3, 107, 'slider', 'In this task, calculating the interest on the remaining amount due is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (219, 3, 108, 'slider', 'In this task, choosing the advert for the job that pays more than €5.50 an hour is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (222, 3, 109, 'slider', 'In this task, creating an email account by typing the information needed is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (163, 2, 80, 'slider', 'I denne oppgaven, er det å fulføre første del av søknadsskjemaet', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (166, 2, 81, 'slider', 'I denne oppgaven er det å finne nettbasert kurs i matematikk ', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (168, 2, 82, 'slider', 'I denne oppgaven er det å bestille og betale for teoriprøven på nett', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (169, 2, 83, 'slider', 'I denne oppgaven er det å velge det billigste alternativet', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (172, 2, 84, 'slider', 'I denne oppgaven, er det å fulføre første del av søknadsskjemaet', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (174, 2, 85, 'slider', 'I denne oppgaven er det å finne nettbasert kurs i matematikk ', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (176, 2, 86, 'slider', 'I denne oppgaven er det å bestille og betale for teoriprøven på nett', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (178, 2, 87, 'slider', 'I denne oppgaven er det å velge det billigste alternativet', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (225, 3, 111, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (228, 3, 112, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (229, 3, 113, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (231, 3, 114, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (234, 3, 115, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (235, 3, 116, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (237, 3, 117, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (239, 3, 118, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (241, 3, 119, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (243, 3, 120, 'slider', 'In this task, choosing the bus that will arrive at the Valletta Bus Terminus at 09:45am is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (244, 3, 120, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (245, 3, 121, 'slider', 'In this task, choosing the month with the least chance of rain by looking at the weather forecast graph is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (246, 3, 121, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (247, 3, 122, 'slider', 'In this task, messaging the ingredients to my friends and changing the quantities in the recipe to serve 8 people is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (248, 3, 122, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (249, 3, 123, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (250, 3, 123, 'slider', 'In this task, calculating the area that will be covered, working out how much wooden planks you need and sharing photos on Facebook is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (251, 3, 124, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (252, 3, 124, 'slider', 'In this task, choosing the bus that will arrive at the Valletta Bus Terminus at 09:45am is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (253, 3, 125, 'slider', 'In this task, choosing the month with the least chance of rain by looking at the weather forecast graph is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (254, 3, 125, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (255, 3, 126, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (256, 3, 126, 'slider', 'In this task, messaging the ingredients to my friends and changing the quantities in the recipe to serve 8 people is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (257, 3, 127, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (258, 3, 127, 'slider', 'In this task, calculating the area that will be covered, working out how much wooden planks you need and sharing photos on Facebook is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (151, 2, 74, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (153, 2, 75, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (156, 2, 76, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (157, 2, 77, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (159, 2, 78, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (161, 2, 79, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (164, 2, 80, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (165, 2, 81, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (167, 2, 82, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (170, 2, 83, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (171, 2, 84, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (173, 2, 85, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (175, 2, 86, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (177, 2, 87, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (180, 2, 88, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (182, 2, 89, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (184, 2, 90, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (185, 2, 91, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (187, 2, 92, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (190, 2, 93, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (191, 2, 94, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (193, 2, 95, 'multiple', 'Hva var vanskelig med denne oppgaven?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (224, 3, 110, 'slider', 'In this task, calculating the monthly salary and finding out when you can take leave is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (226, 3, 111, 'slider', 'In this task, preparing a PowerPoint presentation and identifying the month that generated the least profit and the 3 consecutive months that generated the most profit is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (227, 3, 112, 'slider', 'In this task, filling in the first part of the application form is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (230, 3, 113, 'slider', 'In this task, finding maths couses on the training course website is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (232, 3, 114, 'slider', 'In this task, booking and paying for my driver’s theory test online is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (233, 3, 115, 'slider', 'In this task, choosing the best deal is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (236, 3, 116, 'slider', 'In this task, filling in the first part of the application form is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (238, 3, 117, 'slider', 'In this task, finding maths couses on the training course website is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (240, 3, 118, 'slider', 'In this task, booking and paying for my driver’s theory test online is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (242, 3, 119, 'slider', 'In this task, choosing the best deal is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (44, 1, 7, 'slider', 'In this task, booking and paying for my driver’s theory test online is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (45, 1, 8, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (46, 1, 8, 'slider', 'In this task, selecting the best deal is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (102, 1, 15, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (103, 1, 16, 'multiple', 'What did you find difficult about this task?', NULL, 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (104, 1, 16, 'slider', 'In this task, calculating the area of the patio, working out how much decking you need and sharing photos on Facebook is', NULL, 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (284, 4, 0, 'single', 'Iddum anqas minn 5 minuti biex tlesti dan il-kompitu?', 'NULL', 'dimension_fluency_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (286, 4, 0, 'single', 'Iddum aktar minn 30 minuta biex tlesti dan il-kompitu?', 'NULL', 'dimension_fluency_2');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (307, 4, 144, 'slider', 'F''din is-sitwazzjoni, li nibbukkja u nħallas għat-test tat-teorija tas-sewqan online huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (309, 4, 145, 'slider', 'F''din is-sitwazzjoni, li nagħżel l-aħjar offerta huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (282, 4, 0, 'single', 'Għandek bżonn għajnuna f''din is-sitwazzjoni?', 'NULL', 'dimension_independence_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (288, 4, 130, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (290, 4, 131, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (292, 4, 132, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (294, 4, 133, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (296, 4, 134, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (298, 4, 135, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (300, 4, 136, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (302, 4, 137, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (304, 4, 142, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (306, 4, 143, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (308, 4, 144, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (310, 4, 145, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (312, 4, 138, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (314, 4, 139, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (316, 4, 140, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (318, 4, 141, 'multiple', 'X''sibt diffiċli dwar din is-sitwazzjoni?', 'NULL', 'challenging_skill');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (283, 4, 0, 'single', 'Tħossok komdu tagħmel dan il-kompitu fil-pubbliku?', 'NULL', 'dimension_confidence_1');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (285, 4, 0, 'single', 'Tħossok aktar komdu tagħmel dan il-kompitu fil-privat?', 'NULL', 'dimension_confidence_2');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (291, 4, 132, 'slider', 'F''din is-sitwazzjoni, li nuża l-kalkolatur tas-self online huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (299, 4, 136, 'slider', 'F''din is-sitwazzjoni, li nikkalkula l-paga fix-xahar u li nsir naf meta nista'' nieħu l-leave huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (313, 4, 139, 'slider', 'F''dan il-kompitu, li nagħżel ix-xahar bl-anqas ċans ta'' xita billi nħares lejn il-grafika tat-tbassir tat-temp huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (301, 4, 137, 'slider', 'F''din is-sitwazzjoni, li nipprepara preżentazzjoni PowerPoint u li nidentifika x-xahar li ġġenera l-anqas profitt u t-tliet xhur konsekuttivi li ġġeneraw l-aktar profitt huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (303, 4, 142, 'slider', 'F''din is-sitwazzjoni, li nimla l-ewwel parti tal-formola tal-applikazzjoni huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (287, 4, 130, 'slider', 'F''din is-sitwazzjoni, li nagħżel ħwejjeġ xierqa għat-tifel/tifla tiegħi wara li rajt it-tbassir tat-temp fuq il-mowbajl huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (289, 4, 131, 'slider', 'F''din is-sitwazzjoni, li nibgħat messaġġ biex nistieden lil sħabi għal festin ta'' għeluq is-snin huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (293, 4, 133, 'slider', 'F''din is-sitwazzjoni, li nikkalkula l-interess fuq l-ammont li fadal jitħallas huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (295, 4, 134, 'slider', 'F''din is-sitwazzjoni, li nagħżel avviż għall-impjieg li jħallas aktar minn €5.50 fis-siegħa huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (297, 4, 135, 'slider', 'F''din is-sitwazzjoni, li noħloq kont tal-email billi nikteb l-informazzjoni meħtieġa huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (305, 4, 143, 'slider', 'F''din is-sitwazzjoni, li nsib korsijiet tal-matematika fuq is-sit web tal-korsijiet ta'' taħriġ huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (311, 4, 138, 'slider', 'F''din is-sitwazzjoni, li nagħżel il-karozza tal-linja li tasal fit-Terminus tal-Belt Valletta fl-09:45am huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (315, 4, 140, 'slider', 'F''din is-sitwazzjoni, li nibgħat l-ingredjenti lil sħabi u nibdel il-kwantitajiet fir-riċetta biex inservi 8 persuni huwa', 'NULL', 'task_question');
INSERT INTO public.question (id, product, scenario, type, question, description, pedagogical_type) VALUES (317, 4, 141, 'slider', 'F''din is-sitwazzjoni, li nikkalkula l-arja li se tiġi mgħottija, nikkalkula kemm tavli tal-injam neħtieġ u nikkondividi ritratti fuq Facebook huwa', 'NULL', 'task_question');


--
-- TOC entry 3888 (class 0 OID 16453)
-- Dependencies: 208
-- Data for Name: questionorder; Type: TABLE DATA; Schema: public; Owner: skillschecker
--

INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (1, 1, 'task_question', 1, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (2, 1, 'challenging_skill', 2, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (3, 1, 'dimension_independence_1', 3, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (4, 1, 'dimension_confidence_1', 4, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (5, 1, 'dimension_confidence_2', 5, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (6, 1, 'dimension_fluency_1', 6, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (7, 1, 'dimension_fluency_2', 7, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (8, 2, 'task_question', 1, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (9, 2, 'challenging_skill', 2, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (10, 2, 'dimension_independence_1', 3, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (11, 2, 'dimension_confidence_1', 4, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (12, 2, 'dimension_confidence_2', 5, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (13, 2, 'dimension_fluency_1', 6, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (14, 2, 'dimension_fluency_2', 7, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (15, 3, 'task_question', 1, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (16, 3, 'challenging_skill', 2, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (17, 3, 'dimension_independence_1', 3, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (18, 3, 'dimension_confidence_1', 4, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (19, 3, 'dimension_confidence_2', 5, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (20, 3, 'dimension_fluency_1', 6, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (21, 3, 'dimension_fluency_2', 7, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (23, 4, 'task_question', 1, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (24, 4, 'challenging_skill', 2, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (25, 4, 'dimension_independence_1', 3, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (26, 4, 'dimension_confidence_1', 4, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (27, 4, 'dimension_confidence_2', 5, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (28, 4, 'dimension_fluency_1', 6, NULL);
INSERT INTO public.questionorder (id, product, name, "order", description) VALUES (29, 4, 'dimension_fluency_2', 7, NULL);


--
-- TOC entry 3890 (class 0 OID 16461)
-- Dependencies: 210
-- Data for Name: scenario; Type: TABLE DATA; Schema: public; Owner: skillschecker
--

INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (96, 3, 32, 'school_trip', NULL, 1, 'personal-scenario-01-en-mt.mp4', 'Selecting clothes for my child');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (97, 3, 32, 'birthday_party', NULL, 2, 'personal-scenario-02-en-mt.mp4', 'Sending an invite by WhatsApp');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (4, 1, 2, 'credit_card_interest', 'Your credit card bill is €500. Your credit card monthly interest rate is 4.5%. After you have made a minimum payment of €5, your balance owed is €495. Decide if you can work out the interest charged on this amount using the calculator on your phone.', 4, 'personal-scenario-04-en-ie.mp4', 'Calculating the interest on a credit card');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (9, 1, 3, 'find_job_over_twelve_euros', 'You want to find a job in Dublin that pays more than €12 an hour. Look at the four online job ads and decide if you can select the one that is based in Dublin and pays more than €12 an hour.', 1, 'economic-scenario-01-en-ie.mp4', 'Selecting the correct job ad');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (10, 1, 3, 'create_email_address', 'You want to create an email address in order to be able to register with job sites such aswww.jobs.ie. Look at the information required and decide if you can create an email account.', 2, 'economic-scenario-02-en-ie.mp4', 'Creating an email account');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (11, 1, 3, 'find_bus_drive_job', 'You want to find a job as a bus driver. Decide if you can find bus driver jobs online. Read the online job advert and decide if you can calculate the monthly pay and take personal holidays whenever you want.', 3, 'economic-scenario-03-en-ie.mp4', 'Calculating monthly pay and holidays');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (12, 1, 3, 'prepare_presentation', 'You work for a travel agency and are asked to analyse a graph showing the agency’s profitby month. You are also asked to prepare a PowerPoint presentation of your findings. Look at the graph which represents the agency’s profit by month and decide if you can identify themonth that generates the least amount of profit and the most profitable three consecutive months. Decide ifyou can present your analysis of the graph in a PowerPoint presentation.', 4, 'economic-scenario-04-en-ie.mp4', 'Preparing a PowerPoint presentation');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (98, 3, 32, 'car_loan', NULL, 3, 'personal-scenario-03-en-mt.mp4', 'Using an online loan calculator');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (135, 4, 42, 'create_email_address', NULL, 2, 'economic-scenario-02-mt.mp4', 'Toħloq email');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (136, 4, 42, 'find_bus_drive_job', NULL, 3, 'economic-scenario-03-mt.mp4', 'Tikkalkula l-paga fix-xahar u l-vaganzi');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (137, 4, 42, 'prepare_presentation', NULL, 4, 'economic-scenario-04-mt.mp4', 'Tipprepara preżentazzjoni tal-Powerpoint');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (138, 4, 43, 'look_train_timetable', NULL, 1, 'social-scenario-01-mt.mp4', 'Taqra l-iskeda ta’ tal-linja');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (130, 4, 41, 'school_trip', NULL, 1, 'personal-scenario-01-mt.mp4', 'Tagħżel il-ħwejjeġ għat-tifel.');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (131, 4, 41, 'birthday_party', NULL, 2, 'personal-scenario-02-mt.mp4', 'Tibgħat stedina fuq WhatsApp');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (133, 4, 41, 'credit_card_interest', NULL, 4, 'personal-scenario-04-mt.mp4', 'Tikkalkula l-interessi fuq il-karta ta’ kreditu');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (134, 4, 42, 'find_job_over_twelve_euros', NULL, 1, 'economic-scenario-01-mt.mp4', 'Tagħżel ir-reklam tax-xogħol korrett');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (139, 4, 43, 'check_rain_for_holidays', NULL, 2, 'social-scenario-02-mt.mp4', 'Tiċċekkja t-temp għax-xita');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (140, 4, 43, 'calculate_recipe', NULL, 3, 'social-scenario-03-mt.mp4', 'Issajjar spagetti bolognese');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (141, 4, 43, 'create_fish_pond', NULL, 4, 'social-scenario-04-mt.mp4', 'Tibni arja fuq barra.');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (142, 4, 40, 'enrol_course', NULL, 1, 'education-scenario-01-mt.mp4', 'Timla formola tal-applikazzjoni');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (143, 4, 40, 'find_courses_in_your_area', NULL, 2, 'education-scenario-02-mt.mp4', 'Issib korsijiet tal-matematika online');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (144, 4, 40, 'book_pay_driver_test', NULL, 3, 'education-scenario-03-mt.mp4', 'Tibbukja u tħallas għall-eżami tat-teorija tas-sewqan');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (145, 4, 40, 'buy_book_sale', NULL, 4, 'education-scenario-04-mt.mp4', 'Tagħżel l-aqwa prezz tal-ktieb');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (132, 4, 41, 'car_loan', NULL, 3, 'personal-scenario-03-mt.mp4', 'Tuża kalkolatur online');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (15, 1, 4, 'calculate_recipe', NULL, 3, 'social-scenario-03-en-ie.mp4', 'Making spaghetti Bolognese');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (64, 2, 24, 'school_trip', NULL, 1, 'personal-scenario-01-no.mp4', 'Velge ut klær til mitt barn');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (65, 2, 24, 'birthday_party', NULL, 2, 'personal-scenario-02-no.mp4', 'Sende en invitasjon via WhatsApp');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (66, 2, 24, 'car_loan', NULL, 3, 'personal-scenario-03-no.mp4', 'Bruke en digital lånekalkulator');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (67, 2, 24, 'credit_card_interest', NULL, 4, 'personal-scenario-04-no.mp4', 'Regne ut renter på et kredittkort');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (68, 2, 26, 'find_job_over_twelve_euros', NULL, 1, 'economic-scenario-01-no.mp4', 'Finne en passende jobbannonse');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (69, 2, 26, 'create_email_address', NULL, 2, 'economic-scenario-02-no.mp4', 'Opprette en e-post konto');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (70, 2, 26, 'find_bus_drive_job', NULL, 3, 'economic-scenario-03-no.mp4', 'Regne ut månedslønn, skatt og feriepenger');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (71, 2, 26, 'prepare_presentation', NULL, 4, 'economic-scenario-04-no.mp4', 'Forberede en Power Point presentasjon');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (72, 2, 25, 'school_trip', NULL, 1, 'personal-scenario-01-no.mp4', 'Velge ut klær til mitt barn');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (73, 2, 25, 'birthday_party', NULL, 2, 'personal-scenario-02-no.mp4', 'Sende en invitasjon via WhatsApp');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (74, 2, 25, 'car_loan', NULL, 3, 'personal-scenario-03-no.mp4', 'Bruke en digital lånekalkulator');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (75, 2, 25, 'credit_card_interest', NULL, 4, 'personal-scenario-04-no.mp4', 'Regne ut renter på et kredittkort');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (76, 2, 27, 'find_job_over_twelve_euros', NULL, 1, 'economic-scenario-01-no.mp4', 'Finne en passende jobbannonse');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (77, 2, 27, 'create_email_address', NULL, 2, 'economic-scenario-02-no.mp4', 'Opprette en e-post konto');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (78, 2, 27, 'find_bus_drive_job', NULL, 3, 'economic-scenario-03-no.mp4', 'Regne ut månedslønn, skatt og feriepenger');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (79, 2, 27, 'prepare_presentation', NULL, 4, 'economic-scenario-04-no.mp4', 'Forberede en Power Point presentasjon');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (80, 2, 28, 'enrol_course', NULL, 1, 'education-scenario-01-no.mp4', 'Fylle ut et digitalt søknadsskjema');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (81, 2, 28, 'find_courses_in_your_area', NULL, 2, 'education-scenario-02-no.mp4', 'Gjennomføre et digital matematikkurs');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (82, 2, 28, 'book_pay_driver_test', NULL, 3, 'education-scenario-03-no.mp4', 'Bestille og betale for en teoretisk kjøreeksamen på nett');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (83, 2, 28, 'buy_book_sale', NULL, 4, 'education-scenario-04-no.mp4', 'Velge beste pris for ulike varer på nett');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (84, 2, 29, 'enrol_course', NULL, 1, 'education-scenario-01-no.mp4', 'Fylle ut et digitalt søknadsskjema');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (85, 2, 29, 'find_courses_in_your_area', NULL, 2, 'education-scenario-02-no.mp4', 'Gjennomføre et digital matematikkurs');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (86, 2, 29, 'book_pay_driver_test', NULL, 3, 'education-scenario-03-no.mp4', 'Bestille og betale for en teoretisk kjøreeksamen på nett');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (87, 2, 29, 'buy_book_sale', NULL, 4, 'education-scenario-04-no.mp4', 'Velge beste pris for ulike varer på nett');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (88, 2, 30, 'look_train_timetable', NULL, 1, 'social-scenario-01-no.mp4', 'Finne en rutetabell for bussen');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (89, 2, 30, 'check_rain_for_holidays', NULL, 2, 'social-scenario-02-no.mp4', 'Sjekke værmeldingen');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (90, 2, 30, 'calculate_recipe', NULL, 3, 'social-scenario-03-no.mp4', 'Finne en oppskrift og lage spagetti bolognese');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (91, 2, 30, 'create_fish_pond', NULL, 4, 'social-scenario-04-no.mp4', 'Bygge en ny platting i hagen');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (92, 2, 31, 'look_train_timetable', NULL, 1, 'social-scenario-01-no.mp4', 'Finne en rutetabell for bussen');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (93, 2, 31, 'check_rain_for_holidays', NULL, 2, 'social-scenario-02-no.mp4', 'Sjekke værmeldingen');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (94, 2, 31, 'calculate_recipe', NULL, 3, 'social-scenario-03-no.mp4', 'Finne en oppskrift og lage spagetti bolognese');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (95, 2, 31, 'create_fish_pond', NULL, 4, 'social-scenario-04-no.mp4', 'Bygge en ny platting i hagen');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (99, 3, 32, 'credit_card_interest', NULL, 4, 'personal-scenario-04-en-mt.mp4', 'Calculating the interest on a credit card');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (100, 3, 34, 'find_job_over_twelve_euros', NULL, 1, 'economic-scenario-01-en-mt.mp4', 'Selecting the correct job ad');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (112, 3, 9, 'enrol_course', NULL, 1, 'education-scenario-01-en-mt.mp4', 'Completing an application form');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (113, 3, 9, 'find_courses_in_your_area', NULL, 2, 'education-scenario-02-en-mt.mp4', 'Finding online maths courses');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (3, 1, 2, 'car_loan', 'You are thinking of buying a car and you would like to know how much you could borrow from the bank. Look at the online loan calculator and decide if you can find out how much you can borrow and what monthly repayments would be.', 3, 'personal-scenario-03-en-ie.mp4', 'Using an online loan calculator');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (5, 1, 1, 'enrol_course', 'You want to enrol in a course and have to complete an online application form. Look at the application form and decide if you can complete the first part.', 1, 'education-scenario-01-en-ie.mp4', 'Completing an application form');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (13, 1, 4, 'look_train_timetable', 'You are meeting a friend at the central bus station of your nearest city at 11:00. You have to take the bus from your local station to the central station. You have the bus timetable saved on your phone. Look at the bus timetable on your phone and decide if you can select the bus that will allow you to arrive at the central station a few minutes before 11:00.', 1, 'social-scenario-01-en-ie.mp4', 'Looking at the bus timetable');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (101, 3, 34, 'create_email_address', NULL, 2, 'economic-scenario-02-en-mt.mp4', 'Creating an email account');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (102, 3, 34, 'find_bus_drive_job', NULL, 3, 'economic-scenario-03-en-mt.mp4', 'Calculating monthly pay and holidays');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (103, 3, 34, 'prepare_presentation', NULL, 4, 'economic-scenario-04-en-mt.mp4', 'Preparing a PowerPoint presentation');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (104, 3, 33, 'school_trip', NULL, 1, 'personal-scenario-01-en-mt.mp4', 'Selecting clothes for my child');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (105, 3, 33, 'birthday_party', NULL, 2, 'personal-scenario-02-en-mt.mp4', 'Sending an invite by WhatsApp');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (106, 3, 33, 'car_loan', NULL, 3, 'personal-scenario-03-en-mt.mp4', 'Using an online loan calculator');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (107, 3, 33, 'credit_card_interest', NULL, 4, 'personal-scenario-04-en-mt.mp4', 'Calculating the interest on a credit card');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (108, 3, 35, 'find_job_over_twelve_euros', NULL, 1, 'economic-scenario-01-en-mt.mp4', 'Selecting the correct job ad');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (109, 3, 35, 'create_email_address', NULL, 2, 'economic-scenario-02-en-mt.mp4', 'Creating an email account');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (110, 3, 35, 'find_bus_drive_job', NULL, 3, 'economic-scenario-03-en-mt.mp4', 'Calculating monthly pay and holidays');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (111, 3, 35, 'prepare_presentation', NULL, 4, 'economic-scenario-04-en-mt.mp4', 'Preparing a PowerPoint presentation');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (116, 3, 37, 'enrol_course', NULL, 1, 'education-scenario-01-en-mt.mp4', 'Completing an application form');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (117, 3, 37, 'find_courses_in_your_area', NULL, 2, 'education-scenario-02-en-mt.mp4', 'Finding online maths courses');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (118, 3, 37, 'book_pay_driver_test', NULL, 3, 'education-scenario-03-en-mt.mp4', 'Booking and paying for a driver’s theory test');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (119, 3, 37, 'buy_book_sale', NULL, 4, 'education-scenario-04-en-mt.mp4', 'Selecting the best book deal');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (120, 3, 38, 'look_train_timetable', NULL, 1, 'social-scenario-01-en-mt.mp4', 'Looking at the bus timetable');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (121, 3, 38, 'check_rain_for_holidays', NULL, 2, 'social-scenario-02-en-mt.mp4', 'Checking the weather for rain');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (122, 3, 38, 'calculate_recipe', NULL, 3, 'social-scenario-03-en-mt.mp4', 'Making spaghetti Bolognese');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (123, 3, 38, 'create_fish_pond', NULL, 4, 'social-scenario-04-en-mt.mp4', 'Building an outdoor area');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (124, 3, 39, 'look_train_timetable', NULL, 1, 'social-scenario-01-en-mt.mp4', 'Looking at the bus timetable');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (125, 3, 39, 'check_rain_for_holidays', NULL, 2, 'social-scenario-02-en-mt.mp4', 'Checking the weather for rain');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (126, 3, 39, 'calculate_recipe', NULL, 3, 'social-scenario-03-en-mt.mp4', 'Making spaghetti Bolognese');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (127, 3, 39, 'create_fish_pond', NULL, 4, 'social-scenario-04-en-mt.mp4', 'Building an outdoor area');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (114, 3, 9, 'book_pay_driver_test', NULL, 3, 'education-scenario-03-en-mt.mp4', 'Booking and paying for a driver’s theory test');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (115, 3, 9, 'buy_book_sale', NULL, 4, 'education-scenario-04-en-mt.mp4', 'Selecting the best book deal');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (1, 1, 2, 'school_trip', 'Your child is going on school trip tomorrow. You want to choose the clothes your child willwear. Look at tomorrow’s weather forecast on your phone and decide if you can select appropriate clothing foryour child', 1, 'personal-scenario-01-en-ie.mp4', 'Selecting clothes for my child');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (2, 1, 2, 'birthday_party', 'It’s your partner’s birthday. You are organising a party for them at a local restaurant and want to invite your friends. Decide if you can type and send a short message on WhatsApp to invite your friends to the party.', 2, 'personal-scenario-02-en-ie.mp4', 'Sending an invite by WhatsApp');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (6, 1, 1, 'find_courses_in_your_area', 'You want to improve your maths skills. You go online to a training course website to find evening courses in your area. Decide if you can search for maths courses on the website and identify courses within 10 kilometres of the city centre.', 2, 'education-scenario-02-en-ie.mp4', 'Identifying online maths courses');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (7, 1, 1, 'book_pay_driver_test', 'You want to book and pay for your driver’s theory test online. To apply online for your test, you need to fill in the online application form, select the correct licence type, pick an appointment time and then pay a fee. Decide if you can use the online booking system to book and pay for your driver’s theory test.', 3, 'education-scenario-03-en-ie.mp4', 'Booking and paying for a driver’s theory test');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (8, 1, 1, 'buy_book_sale', 'You have recently enrolled in a course and want to buy a textbook. You found the textbook online, priced normally for €14.95 but now reduced by 25%. The same textbook is sold by your local bookstore for €11.15. Decide if you can select the best deal.', 4, 'education-scenario-04-en-ie.mp4', 'Selecting the best book deal');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (14, 1, 4, 'check_rain_for_holidays', 'You would like to go to Rome, Italy for your summer holiday with two friends. Decide if you can find weather information for Rome online. Look at the weather forecast graph and decide if you can select the month with the least chance of rain.', 2, 'social-scenario-02-en-ie.mp4', 'Checking the weather for rain');
INSERT INTO public.scenario (id, product, interest, name, description, level, resource, text) VALUES (16, 1, 4, 'create_fish_pond', 'You are creating a community garden and you want to build a patio area 5 metres long and 3 metres wide, using decking. Your local DIY store is selling planks of wood that are 2 metres long and 0.25 metres wide. To help with the project you want to ask for volunteers from the community. Decide if you can calculate the area of the patio and work out how much decking you will need to buy and share photos of the garden on Facebook inviting your neighbours to help.', 4, 'social-scenario-04-en-ie.mp4', 'Building a patio area');


--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 197
-- Name: answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skillschecker
--

SELECT pg_catalog.setval('public.answer_id_seq', 1288, true);


--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 199
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skillschecker
--

SELECT pg_catalog.setval('public.category_id_seq', 12, true);


--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 201
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skillschecker
--

SELECT pg_catalog.setval('public.course_id_seq', 4069, true);


--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 203
-- Name: interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skillschecker
--

SELECT pg_catalog.setval('public.interest_id_seq', 43, true);


--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 205
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skillschecker
--

SELECT pg_catalog.setval('public.product_id_seq', 1, true);


--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 207
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skillschecker
--

SELECT pg_catalog.setval('public.question_id_seq', 318, true);


--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 209
-- Name: questionorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skillschecker
--

SELECT pg_catalog.setval('public.questionorder_id_seq', 29, true);


--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 211
-- Name: scenario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skillschecker
--

SELECT pg_catalog.setval('public.scenario_id_seq', 145, true);


--
-- TOC entry 3740 (class 2606 OID 16480)
-- Name: answer answer_pkey; Type: CONSTRAINT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);


--
-- TOC entry 3742 (class 2606 OID 16482)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3744 (class 2606 OID 16484)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- TOC entry 3746 (class 2606 OID 16486)
-- Name: interest interest_pkey; Type: CONSTRAINT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.interest
    ADD CONSTRAINT interest_pkey PRIMARY KEY (id);


--
-- TOC entry 3748 (class 2606 OID 16488)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3750 (class 2606 OID 16490)
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- TOC entry 3752 (class 2606 OID 16492)
-- Name: questionorder questionorder_pkey; Type: CONSTRAINT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.questionorder
    ADD CONSTRAINT questionorder_pkey PRIMARY KEY (id);


--
-- TOC entry 3754 (class 2606 OID 16494)
-- Name: scenario scenario_pkey; Type: CONSTRAINT; Schema: public; Owner: skillschecker
--

ALTER TABLE ONLY public.scenario
    ADD CONSTRAINT scenario_pkey PRIMARY KEY (id);


--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: dbmasteruser
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO dbmasteruser;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2022-02-25 16:33:33

--
-- PostgreSQL database dump complete
--

