CREATE TABLE meteorites_temp (
    id INTEGER,
    name TEXT,
    nametype TEXT,
    class TEXT,
    mass REAL,
    discovery TEXT,
    year INTEGER,
    lat REAL,
    long REAL,
    PRIMARY KEY (id)
);
.import -- csv --skip 1 meteorites.csv meteorites_temp
UPDATE meteorites_temp
SET mass = NULL
WHERE mass = "";
UPDATE meteorites_temp 
SET lat = NULL
WHERE mass = "";
UPDATE meteorites_temp 
SET long = NULL
WHERE mass = "";
UPDATE meteorites_temp
SET year = NULL
WHERE year = "";
UPDATE meteorites_temp
SET mass = ROUND(mass,2),
lat = ROUND(lat,2),
long = ROUND(long,2);
CREATE TABLE meteorites(
    name TEXT,
    id INTEGER ,
    class TEXT,
    mass REAL,
    discovery TEXT,
    year INTEGER ,
    lat REAL,
    long REAL ,
    PRIMARY KEY ("id")
);
INSERT INTO meteorites("name","class", "mass", "discovery", "year", "lat" , "long")
SELECT "name","class", "mass", "discovery", "year", "lat" , "long" FROM meteorites_temp
WHERE nametype NOT LIKE "%reclict%"
ORDER BY "year" , "name" ;



