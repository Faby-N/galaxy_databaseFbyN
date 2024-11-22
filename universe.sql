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
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    galaxy_id integer NOT NULL,
    galaxy_type text,
    galaxy_age numeric(4,1),
    is_active boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    planet_id integer,
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    composition text,
    diametre numeric(6,1)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    star_id integer,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    temperature numeric(4,1),
    masse numeric(4,1),
    number_moon integer,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    name character varying(30) NOT NULL,
    satellite_id integer NOT NULL,
    planet_id integer,
    type text,
    is_natural boolean
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    galaxy_id integer,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_age numeric(4,1),
    distance_from_earth integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Voie Lactée', 0, 1, 'spirale', 13.6, false);
INSERT INTO public.galaxy VALUES ('Andromède', 3, 2, 'spirale', 10.0, false);
INSERT INTO public.galaxy VALUES ('Sombrero', 31, 3, 'spirale barrée', 12.8, true);
INSERT INTO public.galaxy VALUES ('Triangle', 3, 4, 'spirale', 13.0, true);
INSERT INTO public.galaxy VALUES ('IC 1101', 1, 5, 'elliptique', 12.0, true);
INSERT INTO public.galaxy VALUES ('Grand Magellan', 0, 6, 'irrégulière', 13.3, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 1, 'Io', 'sulfur and rock', 3643.0);
INSERT INTO public.moon VALUES (3, 2, 'Europa', 'ice and rock', 3121.0);
INSERT INTO public.moon VALUES (3, 3, 'Ganymede', 'ice and rock', 5268.0);
INSERT INTO public.moon VALUES (3, 4, 'Callisto', 'ice and rock', 4821.0);
INSERT INTO public.moon VALUES (6, 5, 'Titan', 'ice and rock', 5152.0);
INSERT INTO public.moon VALUES (6, 6, 'Rhea', 'ice and rock', 1528.0);
INSERT INTO public.moon VALUES (6, 7, 'Iapetus', 'ice and rock', 1469.0);
INSERT INTO public.moon VALUES (6, 8, 'Dione', 'ice and rock', 1122.0);
INSERT INTO public.moon VALUES (6, 9, 'Tethys', 'ice and rock', 1066.0);
INSERT INTO public.moon VALUES (6, 10, 'Enceladius', 'ice and rock', 504.0);
INSERT INTO public.moon VALUES (7, 11, 'Miranda', 'ice and rock', 471.0);
INSERT INTO public.moon VALUES (7, 12, 'Ariel', 'ice and rock', 1158.0);
INSERT INTO public.moon VALUES (7, 13, 'Umbriel', 'ice and rock', 1169.0);
INSERT INTO public.moon VALUES (8, 14, 'Triton', 'ice and rock', 2707.0);
INSERT INTO public.moon VALUES (9, 15, 'Charon', 'ice and rock', 1212.0);
INSERT INTO public.moon VALUES (7, 16, 'Oberon', 'ice and rock', 1523.0);
INSERT INTO public.moon VALUES (7, 17, 'Titania', 'ice and rock', 1578.0);
INSERT INTO public.moon VALUES (6, 18, 'Hyperion', 'ice and rock', 270.0);
INSERT INTO public.moon VALUES (6, 19, 'Mimas', 'ice and rock', 396.0);
INSERT INTO public.moon VALUES (5, 20, 'Phobos', 'rock', 22.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Terre', 1, 15.0, 1.0, 1, true);
INSERT INTO public.planet VALUES (3, 'Mars', 2, -63.0, 0.1, 2, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 3, -108.0, 318.0, 79, false);
INSERT INTO public.planet VALUES (3, 'Venus', 4, 462.0, 0.8, 0, false);
INSERT INTO public.planet VALUES (3, 'Mercure', 5, 167.0, 0.1, 0, false);
INSERT INTO public.planet VALUES (3, 'Saturne', 6, -140.0, 95.0, 82, false);
INSERT INTO public.planet VALUES (3, 'Uranus', 7, -195.0, 14.5, 27, false);
INSERT INTO public.planet VALUES (3, 'Neptune', 8, -200.0, 17.1, 14, false);
INSERT INTO public.planet VALUES (3, 'Pluton', 9, -229.0, 0.0, 5, false);
INSERT INTO public.planet VALUES (3, 'Titan', 10, -170.0, 0.0, 1, false);
INSERT INTO public.planet VALUES (3, 'Cerès', 11, -105.0, 0.0, 0, false);
INSERT INTO public.planet VALUES (3, 'Haumea', 12, -220.0, 0.0, 2, false);
INSERT INTO public.planet VALUES (3, 'Makémaké', 13, -225.0, 0.0, 0, false);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES ('Hubble Telescope', 1, 3, 'orbital', false);
INSERT INTO public.satellite VALUES ('Titan', 2, 6, 'moon', true);
INSERT INTO public.satellite VALUES ('Voyager1', 3, 8, 'space probe', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sirius', 0.2, 9);
INSERT INTO public.star VALUES (1, 2, 'Beltegeuse', 8.0, 642);
INSERT INTO public.star VALUES (1, 3, 'Proxima Centauri', 0.0, 4);
INSERT INTO public.star VALUES (1, 4, 'Vega', 0.5, 25);
INSERT INTO public.star VALUES (2, 5, 'Polaris', 70.0, 323);
INSERT INTO public.star VALUES (2, 6, 'Rigel', 8.0, 863);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: satellite satellite_satellite_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_satellite_id_key UNIQUE (satellite_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star galaxy_galaxy_id_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_galaxy_id_key FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_planet_id_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_planet_id_key FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: satellite planet_planet_id_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT planet_planet_id_key FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_star_id_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_star_id_key FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

