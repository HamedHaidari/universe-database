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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    galaxy_type text NOT NULL,
    number_of_stars integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    diameter integer NOT NULL
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    planet_type text NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_star numeric NOT NULL,
    number_of_moons integer NOT NULL,
    surface_temperature integer NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255) NOT NULL,
    purpose text NOT NULL,
    launch_date date,
    orbit_type text NOT NULL,
    is_operational boolean NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    luminosity integer NOT NULL,
    has_planets boolean NOT NULL
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milk', 'Spiral', 10001000, 1000, 210000.0, false);
INSERT INTO public.galaxy VALUES (2, 'Cola', 'Spiral', 500000, 10000, 560000.0, false);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'Spiral', 100000000, 13600, 0, true);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'Spiral', 1000000000, 10000, 2537000, false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Spiral', 40000000, 10000, 3000000, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Spiral', 300000000, 500, 23000000, false);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 'Elliptical', 800000000, 9000, 29000000, false);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel Galaxy', 'Spiral', 1000000000, 2100, 21000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 0.00257, 4500, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, true, 0.000006, 4500, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, true, 0.000023, 4500, 12);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 0.0028, 4500, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 0.0045, 4500, 3121);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, 0.0071, 4500, 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 0.0126, 4500, 4820);
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, 0.0082, 4500, 5150);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, true, 0.0016, 4500, 504);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, true, 0.0012, 4500, 396);
INSERT INTO public.moon VALUES (11, 'Triton', 8, true, 0.0036, 4500, 2707);
INSERT INTO public.moon VALUES (12, 'Nereid', 8, true, 0.036, 4500, 340);
INSERT INTO public.moon VALUES (13, 'Charon', 9, true, 0.0008, 4500, 1212);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, true, 0.0043, 4500, 1190);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, true, 0.0025, 4500, 1158);
INSERT INTO public.moon VALUES (16, 'Titania', 7, true, 0.0087, 4500, 1577);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, true, 0.0119, 4500, 1523);
INSERT INTO public.moon VALUES (18, 'Rhea', 6, true, 0.0035, 4500, 1528);
INSERT INTO public.moon VALUES (19, 'Dione', 6, true, 0.0025, 4500, 1122);
INSERT INTO public.moon VALUES (20, 'Tethys', 6, true, 0.0019, 4500, 1062);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', true, 0.39, 0, 340);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', true, 0.72, 0, 737);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, 1.0, 1, 288);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', true, 1.52, 2, 210);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', true, 5.2, 79, -108);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', true, 9.58, 82, -139);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', true, 19.22, 27, -197);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', true, 30.05, 14, -201);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Exoplanet', true, 0.05, 0, -39);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 2, 'Exoplanet', true, 0.04, 0, 1500);
INSERT INTO public.planet VALUES (11, 'Beta Pictoris b', 3, 'Exoplanet', true, 0.05, 0, -50);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 4, 'Exoplanet', true, 1.04, 0, 265);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 'Observation', '1990-04-24', 'Low Earth Orbit', true);
INSERT INTO public.satellite VALUES (2, 'International Space Station', 'Research', '1998-11-20', 'Low Earth Orbit', true);
INSERT INTO public.satellite VALUES (3, 'GPS IIR-1', 'Navigation', '1997-07-23', 'Medium Earth Orbit', true);
INSERT INTO public.satellite VALUES (4, 'Voyager 1', 'Exploration', '1977-09-05', 'Interstellar', true);
INSERT INTO public.satellite VALUES (5, 'WeatherSat-1', 'Weather Monitoring', '2000-05-15', 'Geostationary', false);
INSERT INTO public.satellite VALUES (6, 'SpySat-X', 'Reconnaissance', '2012-08-12', 'Low Earth Orbit', true);
INSERT INTO public.satellite VALUES (7, 'Telecom-1', 'Communication', '1992-11-01', 'Geostationary', false);
INSERT INTO public.satellite VALUES (8, 'ScienceSat', 'Research', '2005-03-17', 'Low Earth Orbit', true);
INSERT INTO public.satellite VALUES (9, 'Mars Observer', 'Exploration', '1992-09-25', 'Heliocentric', false);
INSERT INTO public.satellite VALUES (10, 'AstroSat', 'Astrophysics', '2015-09-28', 'Low Earth Orbit', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-Type', 4600, 1, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M-Type', 4500, 0, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A-Type', 242, 25, false);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'M-Type', 8000, 126000, false);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'B-Type', 8000, 120000, false);
INSERT INTO public.star VALUES (6, 'Vega', 2, 'A-Type', 455, 40, false);
INSERT INTO public.star VALUES (8, 'Ragner', 2, 'H-Type', 5400, 1, true);
INSERT INTO public.star VALUES (9, 'Odin', 3, 'N-Type', 5600, 0, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


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
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


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
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

