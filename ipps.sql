-- Derek Holsapple
-- Justin Strelka


CREATE DATABASE ipps;

USE ipps;

-- We need to 3rd normalize the 12 csv columns and create tables
CREATE TABLE raw_df (
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
    hospitalReferralRegionDescription VARCHAR(120) NOT NULL
    );

CREATE TABLE providers (
    providerID INT NOT NULL, 
    providerName VARCHAR(100) NOT NULL, 
    providerStreetAddress VARCHAR(120) NOT NULL,
    providerCity VARCHAR(100) NOT NULL,
    providerState CHAR(2) NOT NULL,
    providerZipCode CHAR(5) NOT NULL
    );

-- dRgKey
-- dRgDescription

-- referralRegionState 
-- hospitalReferralRegionDescription


-- create users
CREATE USER IF NOT EXISTS 'ipps' IDENTIFIED BY '12345';

-- Give total access to ipps
GRANT ALL PRIVILEGES ON ipps.* TO 'ipps';