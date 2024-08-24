-- schema.sql

-- Drop tables if they exist to avoid conflicts
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Schools;
DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS UserConnections;
DROP TABLE IF EXISTS UserSchools;
DROP TABLE IF EXISTS UserCompanies;

-- Create Users table
CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

-- Create Schools table
CREATE TABLE Schools (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    location TEXT NOT NULL,
    founded_year INTEGER NOT NULL
);

-- Create Companies table
CREATE TABLE Companies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    industry TEXT NOT NULL,
    location TEXT NOT NULL
);

-- Create UserConnections table to represent connections between users
CREATE TABLE UserConnections (
    user_id INTEGER NOT NULL,
    connection_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (connection_id) REFERENCES Users(id),
    PRIMARY KEY (user_id, connection_id)
);

-- Create UserSchools table to represent connections between users and schools
CREATE TABLE UserSchools (
    user_id INTEGER NOT NULL,
    school_id INTEGER NOT NULL,
    degree TEXT,
    start_date TEXT,
    end_date TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (school_id) REFERENCES Schools(id),
    PRIMARY KEY (user_id, school_id)
);

-- Create UserCompanies table to represent connections between users and companies
CREATE TABLE UserCompanies (
    user_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    position TEXT,
    start_date TEXT,
    end_date TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (company_id) REFERENCES Companies(id),
    PRIMARY KEY (user_id, company_id)
);
