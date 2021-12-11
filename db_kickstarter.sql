DROP DATABASE IF EXISTS Navigator;
CREATE DATABASE IF NOT EXISTS Navigator;
USE Navigator;

CREATE TABLE IF NOT EXISTS Users(name varchar(255),
surname varchar(255),
nip varchar(255),
id int,
PRIMARY KEY(id) AUTO_INCREMENT);


CREATE TABLE IF NOT EXISTS UserPreferences(userId int,
transactionPeriod  ENUM('QUARTERLY','MONTHLY'),
PRIMARY KEY(userId));

CREATE TABLE IF NOT EXISTS Transactions(userId int,
constractorType ENUM('osoba fizyczna','N/A','PL','Foreign'),
contractorNip varchar(255),
transactionDate DATE,
registrationDate DATE,
taxBracket ENUM('17','15','12.5','10','8.5','5.5','3'),
paymentValue int,
id int,
PRIMARY KEY(userId,transactionDate,id) );

-- May or may not be used
CREATE TABLE TaxPayment(userId int,
paymentDate date,
paymentValue int,
id int,
taxType = ENUM('health','social','lump'),
PRIMARY KEY(userId,id));


