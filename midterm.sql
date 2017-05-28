--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_user_id_foreign;
ALTER TABLE ONLY public.resource_tags DROP CONSTRAINT resource_tags_tag_id_foreign;
ALTER TABLE ONLY public.resource_tags DROP CONSTRAINT resource_tags_resource_id_foreign;
ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_user_id_foreign;
ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_resource_id_foreign;
ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_user_id_foreign;
ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_resource_id_foreign;
ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_foreign;
ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_resource_id_foreign;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_pkey;
ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.tags ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.resources ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.tags_id_seq;
DROP TABLE public.tags;
DROP SEQUENCE public.resources_id_seq;
DROP TABLE public.resources;
DROP TABLE public.resource_tags;
DROP TABLE public.ratings;
DROP TABLE public.migrations_lock;
DROP SEQUENCE public.migrations_id_seq;
DROP TABLE public.migrations;
DROP TABLE public.likes;
DROP SEQUENCE public.comments_id_seq;
DROP TABLE public.comments;
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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: labber
--

CREATE TABLE comments (
    id integer NOT NULL,
    resource_id integer,
    user_id integer,
    c_text text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE comments OWNER TO labber;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: labber
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO labber;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: labber
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: labber
--

CREATE TABLE likes (
    resource_id integer,
    user_id integer
);


ALTER TABLE likes OWNER TO labber;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: labber
--

CREATE TABLE migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE migrations OWNER TO labber;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: labber
--

CREATE SEQUENCE migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migrations_id_seq OWNER TO labber;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: labber
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- Name: migrations_lock; Type: TABLE; Schema: public; Owner: labber
--

CREATE TABLE migrations_lock (
    is_locked integer
);


ALTER TABLE migrations_lock OWNER TO labber;

--
-- Name: ratings; Type: TABLE; Schema: public; Owner: labber
--

CREATE TABLE ratings (
    resource_id integer,
    user_id integer,
    value integer
);


ALTER TABLE ratings OWNER TO labber;

--
-- Name: resource_tags; Type: TABLE; Schema: public; Owner: labber
--

CREATE TABLE resource_tags (
    resource_id integer,
    tag_id integer
);


ALTER TABLE resource_tags OWNER TO labber;

--
-- Name: resources; Type: TABLE; Schema: public; Owner: labber
--

CREATE TABLE resources (
    id integer NOT NULL,
    user_id integer,
    resource_url character varying(255),
    title character varying(255),
    description text,
    likes_count integer,
    avg_rating integer,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE resources OWNER TO labber;

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: labber
--

CREATE SEQUENCE resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resources_id_seq OWNER TO labber;

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: labber
--

ALTER SEQUENCE resources_id_seq OWNED BY resources.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: labber
--

CREATE TABLE tags (
    id integer NOT NULL,
    tag_name character varying(255)
);


ALTER TABLE tags OWNER TO labber;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: labber
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO labber;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: labber
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: labber
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255)
);


ALTER TABLE users OWNER TO labber;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: labber
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO labber;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: labber
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: labber
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: labber
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: labber
--

ALTER TABLE ONLY resources ALTER COLUMN id SET DEFAULT nextval('resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: labber
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: labber
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: labber
--

COPY comments (id, resource_id, user_id, c_text, created_at) FROM stdin;
1	3	1	Awesome!!	2017-05-27 13:39:21.427283+00
3	2	3	It's okay.	2017-05-27 13:39:21.428651+00
2	1	2	The book was a better teacher and had a better personality.	2017-05-27 13:39:21.429938+00
4	1	3	So good, the best.	2017-05-27 13:39:21.43072+00
5	4	4	Learned stairway to heaven! Now everyone loves me at parties.	2017-05-27 13:39:21.430703+00
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labber
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: labber
--

COPY likes (resource_id, user_id) FROM stdin;
2	1
1	2
1	3
2	3
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: labber
--

COPY migrations (id, name, batch, migration_time) FROM stdin;
1	20170526162718_createAllTablesv1.js	1	2017-05-27 13:35:14.936+00
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labber
--

SELECT pg_catalog.setval('migrations_id_seq', 1, true);


--
-- Data for Name: migrations_lock; Type: TABLE DATA; Schema: public; Owner: labber
--

COPY migrations_lock (is_locked) FROM stdin;
0
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: labber
--

COPY ratings (resource_id, user_id, value) FROM stdin;
1	2	4
3	1	5
2	3	3
1	3	1
\.


--
-- Data for Name: resource_tags; Type: TABLE DATA; Schema: public; Owner: labber
--

COPY resource_tags (resource_id, tag_id) FROM stdin;
3	6
1	6
2	11
1	3
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: labber
--

COPY resources (id, user_id, resource_url, title, description, likes_count, avg_rating, created_at) FROM stdin;
1	1	www.lighthouselabs.ca	We make developers!	Lighthouse Labs in 2013 by a group of software developers with a passion for code, mentorship, and education. They offer various courses and learning materials for anyone interested in advancing their coding knowledge.	2	3	2017-05-27 13:39:21.28766+00
2	3	www.yahoo.com	Yahoo!	The word yahoo is a backronym for Yet Another Hierarchically Organized Oracle or Yet Another Hierarchical Officious Oracle. It's like google.	2	3	2017-05-27 13:39:21.288823+00
3	1	http://mashable.com/	mashable  wtf - whats dis4	Mashable is the go-to source for tech, digital culture and entertainment content for its dedicated and influential audience around the globe.	0	5	2017-05-27 13:39:21.289981+00
4	2	https://www.ultimate-guitar.com/	Ultimate Guitar Tabs	Large amount of guitar tabs posted by users and ranked based on popularity. Great for learning those songs you know and love.	0	5	2017-05-27 13:39:21.292515+00
5	3	324324	324243324	\N	0	0	2017-05-27 19:53:08.060016+00
6	3	adsfasd	sdafdsfdfsa	\N	0	0	2017-05-27 20:57:38.537654+00
7	3	adsfasd	sdafdsfdfsa	\N	0	0	2017-05-27 20:57:41.741324+00
8	3	adsfasd	sdafdsfdfsa	\N	0	0	2017-05-27 21:35:42.118922+00
9	3	sdf	sfd	\N	0	0	2017-05-27 22:05:49.763312+00
10	3	http :www.youtube.com	retwrteerw	\N	0	0	2017-05-28 02:17:24.614013+00
11	3	http :www.youtube.com	retwrteerw	\N	0	0	2017-05-28 02:19:24.605516+00
12	3	2312jlkjflsjlkjalafddf	Awesome Page	\N	0	0	2017-05-28 02:49:42.035736+00
13	3	https://www.youtube.com/results?search_query=lighthouse+labs	Awesome!	\N	0	0	2017-05-28 02:53:51.52359+00
14	3	https://www.youtube.com/results?search_query=lighthouse+labs	awesome	\N	0	0	2017-05-28 02:55:26.008591+00
15	3	https://www.youtube.com/results?search_query=lighthouse+labs	youtub	\N	0	0	2017-05-28 02:57:39.095201+00
\.


--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labber
--

SELECT pg_catalog.setval('resources_id_seq', 15, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: labber
--

COPY tags (id, tag_name) FROM stdin;
1	Art
2	Biology
3	Geography
4	Business
5	Music
8	Philosophy
6	Tech
7	Food
9	Engineering
10	Photography
11	Other
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labber
--

SELECT pg_catalog.setval('tags_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: labber
--

COPY users (id, name, email, password) FROM stdin;
1	Alice	resourcewall@yahoo.com	123
2	Bob	misterveale@gmail.com	456
3	Charlie	resourcewall@gmail.com	789
4	Dan	dan@gmail.com	012
5	jo	jo@g.com	111
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labber
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: resources_pkey; Type: CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: comments_resource_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_resource_id_foreign FOREIGN KEY (resource_id) REFERENCES resources(id);


--
-- Name: comments_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: likes_resource_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_resource_id_foreign FOREIGN KEY (resource_id) REFERENCES resources(id);


--
-- Name: likes_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: ratings_resource_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_resource_id_foreign FOREIGN KEY (resource_id) REFERENCES resources(id);


--
-- Name: ratings_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: resource_tags_resource_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY resource_tags
    ADD CONSTRAINT resource_tags_resource_id_foreign FOREIGN KEY (resource_id) REFERENCES resources(id);


--
-- Name: resource_tags_tag_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY resource_tags
    ADD CONSTRAINT resource_tags_tag_id_foreign FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- Name: resources_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id);


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

