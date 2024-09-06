-- Create USER Table
CREATE TABLE USER (
    userID INTEGER PRIMARY KEY,
    username TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

-- Create INFO Table
CREATE TABLE INFO (
    infoID INTEGER PRIMARY KEY,
    userID INTEGER NOT NULL,
    medicalHistory TEXT,
    allergies TEXT,
    symptoms TEXT,
    lastCheckupDate DATE,
    FOREIGN KEY (userID) REFERENCES USER(userID)
);

-- Create PREDICTION Table
CREATE TABLE PREDICTION (
    predictionID INTEGER PRIMARY KEY,
    userID INTEGER NOT NULL,
    diseaseName TEXT,
    predictionDate DATE,
    confidenceScore REAL,
    FOREIGN KEY (userID) REFERENCES USER(userID)
);

-- Create HISTORY Table
CREATE TABLE HISTORY (
    historyID INTEGER PRIMARY KEY,
    userID INTEGER NOT NULL,
    eventDate DATE,
    eventType TEXT,
    details TEXT,
    FOREIGN KEY (userID) REFERENCES USER(userID)
);

-- Create Indexes for USER Table
CREATE UNIQUE INDEX idx_user_email ON USER(email);
CREATE INDEX idx_user_userID ON USER(userID);

-- Create Indexes for INFO Table
CREATE INDEX idx_info_userID ON INFO(userID);

-- Create Indexes for PREDICTION Table
CREATE INDEX idx_prediction_userID ON PREDICTION(userID);
CREATE INDEX idx_prediction_date ON PREDICTION(predictionDate);

-- Create Indexes for HISTORY Table
CREATE INDEX idx_history_userID ON HISTORY(userID);
CREATE INDEX idx_history_date ON HISTORY(eventDate);
