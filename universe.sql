--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    composition text NOT NULL,
    speed_kmph integer NOT NULL,
    is_near_earth boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age numeric NOT NULL,
    description text,
    has_black_hole boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    radius_km integer NOT NULL,
    is_tidal_locked boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    has_life boolean NOT NULL,
    diameter_km integer NOT NULL,
    atmosphere_composition text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    is_main_sequence boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Rock, Ice', 17900, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Rock, Metal', 19800, false);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Rock, Carbonaceous', 17500, false);
INSERT INTO public.asteroid VALUES (4, 'Eros', 'Silicate Rock', 24000, true);
INSERT INTO public.asteroid VALUES (5, 'Itokawa', 'Stony, Rubble-pile', 36000, true);
INSERT INTO public.asteroid VALUES (6, 'Apophis', 'Silicate Rock, Metal', 31000, true);
INSERT INTO public.asteroid VALUES (7, 'Bennu', 'Carbonaceous', 28000, true);
INSERT INTO public.asteroid VALUES (8, 'Ryugu', 'Carbonaceous', 27000, true);
INSERT INTO public.asteroid VALUES (9, 'Hygiea', 'Carbonaceous', 17800, false);
INSERT INTO public.asteroid VALUES (10, 'Ida', 'Silicate Rock', 27000, false);
INSERT INTO public.asteroid VALUES (11, 'Mathilde', 'Carbonaceous Chondrite', 22000, false);
INSERT INTO public.asteroid VALUES (12, 'Toutatis', 'Metallic, Rocky', 35000, true);
INSERT INTO public.asteroid VALUES (13, 'Gaspra', 'Silicate Rock', 19000, false);
INSERT INTO public.asteroid VALUES (14, 'Psyche', 'Metallic (Nickel-Iron)', 25000, false);
INSERT INTO public.asteroid VALUES (15, 'Eunomia', 'Silicate Rock', 20000, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.6, 'Our home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.0, 'Closest spiral galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 4.0, 'Third largest in Local Group', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 3.5, 'Spiral with star formation', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9.0, 'Bright galaxy with large bulge', false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 13.2, 'Has a supermassive black hole', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, true);
INSERT INTO public.moon VALUES (4, 'Io', 3, 1821, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1560, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 2634, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 2410, true);
INSERT INTO public.moon VALUES (8, 'Titan', 3, 2575, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 3, 252, true);
INSERT INTO public.moon VALUES (10, 'Miranda', 3, 236, true);
INSERT INTO public.moon VALUES (11, 'Oberon', 3, 761, true);
INSERT INTO public.moon VALUES (12, 'Triton', 5, 1353, true);
INSERT INTO public.moon VALUES (13, 'Charon', 6, 606, true);
INSERT INTO public.moon VALUES (14, 'Nereid', 5, 170, false);
INSERT INTO public.moon VALUES (15, 'Proteus', 5, 210, false);
INSERT INTO public.moon VALUES (16, 'Hyperion', 3, 135, false);
INSERT INTO public.moon VALUES (17, 'Iapetus', 3, 735, true);
INSERT INTO public.moon VALUES (18, 'Dione', 3, 562, true);
INSERT INTO public.moon VALUES (19, 'Rhea', 3, 763, true);
INSERT INTO public.moon VALUES (20, 'Ariel', 3, 578, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 12742, 'Nitrogen, Oxygen');
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 6779, 'Carbon Dioxide');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, 139820, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (4, 'Venus', 1, false, 12104, 'Carbon Dioxide');
INSERT INTO public.planet VALUES (5, 'Neptune', 1, false, 49244, 'Methane, Hydrogen');
INSERT INTO public.planet VALUES (6, 'Proxima b', 4, false, 12000, 'Unknown');
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 6, false, 30000, 'Unknown');
INSERT INTO public.planet VALUES (8, 'Gliese 581g', 3, false, 15000, 'Carbon Dioxide');
INSERT INTO public.planet VALUES (9, 'HD 209458b', 5, false, 20000, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (10, '55 Cancri e', 6, false, 22000, 'Unknown');
INSERT INTO public.planet VALUES (11, 'Kepler-10b', 6, false, 18000, 'Unknown');
INSERT INTO public.planet VALUES (12, 'HD 189733b', 5, false, 25000, 'Methane');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2.02, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 20.0, false);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 1.1, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 2.1, true);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 21.0, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 15, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

