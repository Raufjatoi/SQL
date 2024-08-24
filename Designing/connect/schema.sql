CREATE TABLE "Users"(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL ,
    last_name TEXT NOT NULL,
    username TEXT NOT NUll UNIQUE,
    password TEXT NOT NULL
);
CREATE TABLE "Schools"(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    location TEXT NOT NULL,
    founded_year INTEGER NOT NULL
);
CREATE TABLE "Companies"(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    industry TEXT NOT NULL,
    location TEXT NOT NULL
);
CREATE TABLE UserConnections (
    user_id INTEGER NOT NULL,
    connection_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (connection_id) REFERENCES Users(id),
    PRIMARY KEY (user_id, connection_id)
);
CREATE TABLE "UserSchools"(
    user_id INTEGER NOT NULL,
    school_id INTEGER NOT NULL, 
    degree TEXT,
    start_date TEXT, 
    end_date TEXT,
    FOREIGN KEY(user_id) REFERENCES Users(id),
    FOREIGN KEY(school_id) REFERENCES Schools(id),
    PRIMARY KEY (user_id,school_id)
);
CREATE TABLE "UserCompanies"(
    user_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    position TEXT,
    start_date TEXT,
    end_date TEXT,
    FOREIGN KEY(user_id) REFERENCES User(id),
    FOREIGN KEY(company_id) REFERENCES companies(id),
    PRIMARY KEY(user_id,company_id) 
);