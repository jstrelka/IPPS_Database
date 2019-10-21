-- AUTHORS: Derek Holsapple, Justin Strelka
-- DATE: 10/20/2019
-- PROJECT: IPPS_Database

-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS ipps;

-- SELECT DATABASE TO OPERATE ON
USE ipps;

-- TODO: REMOVE raw_df table as it is only for reference
CREATE TABLE IF NOT EXISTS raw_df (
    providerID INT NOT NULL, 
    providerName VARCHAR(100) NOT NULL, 
    providerStreetAddress VARCHAR(120) NOT NULL,
    providerCity VARCHAR(100) NOT NULL,
    providerState CHAR(2) NOT NULL,
    providerZipCode CHAR(5) NOT NULL,
    totalDischarges INT NOT NULL,
    averageCoveredCharges DECIMAL(20,3) NOT NULL,
    averageTotalPayments DECIMAL(20,3) NOT NULL,
    averageMedicarePayments DECIMAL(20,3) NOT NULL,
    dRgKey INT NOT NULL,
    dRgDescription VARCHAR(120) NOT NULL,
    referralRegionState CHAR(5) NOT NULL,
    referralRegionDescription VARCHAR(120) NOT NULL
    );

-- CREATE providers TABLE
CREATE TABLE IF NOT EXISTS providers (
    providerID INT PRIMARY KEY NOT NULL, 
    providerName VARCHAR(100) NOT NULL, 
    providerStreetAddress VARCHAR(120) NOT NULL,
    providerCity VARCHAR(100) NOT NULL,
    providerState CHAR(2) NOT NULL,
    providerZipCode CHAR(5) NOT NULL,
    referralRegionState CHAR(5) NOT NULL,
    referralRegionDescription VARCHAR(120) NOT NULL
    );

-- CREATE drg TABLE
CREATE TABLE IF NOT EXISTS drg (
    dRgKey INT PRIMARY KEY NOT NULL,
    dRgDescription VARCHAR(120) NOT NULL
    );

-- CREATE proivercondcoverage TABLE
CREATE TABLE IF NOT EXISTS providercondcoverage (
    providerID INT NOT NULL, 
    dRgKey INT NOT NULL,
    totalDischarges INT NOT NULL,
    averageCoveredCharges DECIMAL(20,3) NOT NULL,
    averageTotalPayments DECIMAL(20,3) NOT NULL,
    averageMedicarePayments DECIMAL(20,3) NOT NULL,
    PRIMARY KEY (providerID,dRgKey),
    FOREIGN KEY (providerID) REFERENCES providers(providerID),
    FOREIGN KEY (dRgKey) REFERENCES drg(dRgKey)
    );

-- CREATE USERS
CREATE USER IF NOT EXISTS 'ipps' IDENTIFIED BY '12345';

-- GIVE ALL PRIVILEGES TO ipps USER
GRANT ALL PRIVILEGES ON ipps.* TO 'ipps';