-- schema.sql

-- Creating the users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(128) NOT NULL -- Hashed password, max length of 128 characters
);

-- Creating the schools table
CREATE TABLE schools (
    school_id INT AUTO_INCREMENT PRIMARY KEY,
    school_name VARCHAR(100) NOT NULL,
    school_type ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    location VARCHAR(100) NOT NULL,
    year_founded YEAR NOT NULL
);

-- Creating the companies table
CREATE TABLE companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    industry ENUM('Technology', 'Education', 'Business') NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- Creating the connections_people table
CREATE TABLE connections_people (
    connection_id INT AUTO_INCREMENT PRIMARY KEY,
    user1_id INT NOT NULL,
    user2_id INT NOT NULL,
    connection_date DATE NOT NULL,
    FOREIGN KEY (user1_id) REFERENCES users(user_id),
    FOREIGN KEY (user2_id) REFERENCES users(user_id)
);

-- Creating the connections_schools table
CREATE TABLE connections_schools (
    connection_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    school_id INT NOT NULL,
    degree VARCHAR(100),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (school_id) REFERENCES schools(school_id)
);

-- Creating the connections_companies table
CREATE TABLE connections_companies (
    connection_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    company_id INT NOT NULL,
    title VARCHAR(100),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- Inserting sample data into the users table
INSERT INTO users (first_name, last_name, username, password)
VALUES
('Claudine', 'Gay', 'claudine', 'password'),
('Reid', 'Hoffman', 'reid', 'password');

-- Inserting sample data into the schools table
INSERT INTO schools (school_name, school_type, location, year_founded)
VALUES
('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', 1636);

-- Inserting sample data into the companies table
INSERT INTO companies (company_name, industry, location)
VALUES
('LinkedIn', 'Technology', 'Sunnyvale, California');

-- Inserting sample data into the connections_schools table
INSERT INTO connections_schools (user_id, school_id, degree, start_date, end_date)
VALUES
(1, 1, 'PhD', '1993-01-01', '1998-12-31');

-- Inserting sample data into the connections_companies table
INSERT INTO connections_companies (user_id, company_id, title, start_date, end_date)
VALUES
(2, 1, 'CEO and Chairman', '2003-01-01', '2007-02-01');
