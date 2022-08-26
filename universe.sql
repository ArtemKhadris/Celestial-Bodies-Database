psql --username=freecodecamp --dbname=postgres
CREATE DATABASE universe;
CREATE TABLE galaxy (galaxy_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, 
num_stars NUMERIC NOT NULL, gal_type TEXT, gal_group TEXT);
CREATE TABLE star (star_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, galaxy_id INT NOT NULL, color TEXT, 
temperature_in_k INT, size_in_km INT);
ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy (galaxy_id);
CREATE TABLE planet (planet_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, life BOOLEAN NOT NULL, 
moons INT, radius_in_km INT, star_id INT NOT NULL);
ALTER TABLE planet ADD FOREIGN KEY (star_id) REFERENCES star (star_id);
CREATE TABLE moon (moon_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, size_in_km INT, distance_f_p_km INT, 
planet_id INT NOT NULL, life BOOLEAN);
ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet (planet_id);
CREATE TABLE black_hole (black_hole_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, size_in_km INT, weight_in_suns INT, 
galaxy_id INT NOT NULL);
ALTER TABLE black_hole ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy (galaxy_id);
INSERT INTO galaxy(name, num_stars, gal_type, gal_group) VALUES ('Milky Way', 250000000000, 'SBbc', 'Local'), 
('CMa Dwarf', 1000000000, 'Irr', 'Local'), ('Sgr Dwarf Elliptical Galaxy', 1000000000, 'dSph(t)', 'Local'), 
('Large Magellanic Cloud', 5000000000, 'SB(s)m', 'Local'), ('Bootes Dwarf Galaxy', 500000000, 'dSph', 'Local'), 
('Small Magellanic Cloud', 1500000000, 'SB(s)m', 'Local');
INSERT INTO star(name, galaxy_id, color, temperature_in_k, size_in_km) VALUES ('Sun', 1, 'White', 15700000, 695700), 
('Proxima Centauri', 1, 'Orange', 3042, 107277), ('Alpha Centauri A', 1, 'White', 5260, 597675), 
('Alpha Centauri B', 1, 'Yellow', 5750, 848754), ('Barnard`s star', 1, 'Orange', 3100, 136357), 
('Wolf 359', 1, 'Orange', 2749, 100180), ('Ross 128', 1, 'Orange', 3192, 136844), ('Gliese 876', 1, 'Red', 3129, 261652);
INSERT INTO planet(name, life, moons, radius_in_km, star_id) VALUES ('Mercury', false, 0, 2440, 1), 
('Venus', false, 0, 6051, 1), ('Earth', true, 1, 6371, 1), ('Mars', false, 2, 3389, 1), ('Jupiter', false, 80, 69911, 1), 
('Saturn', false, 83, 58232, 1), ('Uranus', false, 27, 25362, 1), ('Neptune', false, 14, 24622, 1), 
('Proxima Centauri b', false, 0, 7015, 2), ('Barnard`s Star b', false, 0, 20409, 5), ('Ross 128 b', false, 0, 10204, 7), 
('Gliese 876 d', false, 0, 2296, 8);
INSERT INTO moon(name, size_in_km, distance_f_p_km, planet_id, life) VALUES ('Moon', 1737, 384400, 3, false), 
('Phobos', 11, 9376, 4, false), ('Deimos', 6, 23463, 4, false), ('Metis', 21, 128000, 5, false), 
('Adrastea', 8, 129000, 5, false), ('Amaltea', 83, 181000, 5, false), ('Thebe', 49, 221889, 5, false), 
('Io', 1821, 421700, 5, false), ('Europa', 1560, 670900, 5, false), ('Ganymede', 2634, 1070400, 5, false), 
('Callisto', 2410, 1882700, 5, false), ('Mimas', 198, 185539, 6, false), ('Enceladus', 504, 237905, 6, false), 
('Tethys', 1062, 294619, 6, false), ('Dione', 1122, 377396, 6, false), ('Rhea', 1527, 527108, 6, false), 
('Titan', 5150, 1221930, 6, false), ('Titania', 1576, 435910, 7, false), ('Oberon', 1522, 583510, 7, false), 
('Triton', 2705, 354759, 8, false), ('Proteus', 420, 117646, 8, false);
INSERT INTO black_hole(name, size_in_km, weight_in_suns, galaxy_id) VALUES ('A0620-00', 695700, 11, 1), 
('GRS 1124-683', 122000, 7, 1), ('Cygnus X-1', 14609700, 22, 1);
