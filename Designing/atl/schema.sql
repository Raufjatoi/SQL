-- schema.sql

-- Drop tables if they exist to avoid conflicts
DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Airlines;
DROP TABLE IF EXISTS Flights;
DROP TABLE IF EXISTS CheckIns;

-- Create Passengers table
CREATE TABLE Passengers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL
);

-- Create Airlines table
CREATE TABLE Airlines (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    concourse TEXT NOT NULL
);

-- Create Flights table
CREATE TABLE Flights (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    flight_number TEXT NOT NULL,
    airline_id INTEGER NOT NULL,
    departure_airport_code TEXT NOT NULL,
    arrival_airport_code TEXT NOT NULL,
    expected_departure_time TEXT NOT NULL,
    expected_arrival_time TEXT NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES Airlines(id)
);

-- Create CheckIns table
CREATE TABLE CheckIns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    passenger_id INTEGER NOT NULL,
    flight_id INTEGER NOT NULL,
    checkin_time TEXT NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(id),
    FOREIGN KEY (flight_id) REFERENCES Flights(id)
);
