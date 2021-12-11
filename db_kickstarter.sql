DROP DATABASE IF EXISTS Navigator;
CREATE DATABASE IF NOT EXISTS Navigator;
USE Navigator;

CREATE TABLE IF NOT EXISTS Users(
login varchar(255),
password varchar(255),
name varchar(255),
surname varchar(255),
nip varchar(255),
id int NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id) );


CREATE TABLE IF NOT EXISTS UserPreferences(userId int,
transactionPeriod  ENUM('QUARTERLY','MONTHLY'),
PRIMARY KEY(userId));

CREATE TABLE IF NOT EXISTS Invoices(userId int,
invoiceId int,
contractorType ENUM('os.fiz.','N/A','PL','Foreign'),
contractorNip varchar(255),
idCardNumber varchar(255),
transactionDate date,
registrationDate date,
notes varchar(511),
PRIMARY KEY(userId,invoiceId));

CREATE TABLE IF NOT EXISTS Items(taxBracket ENUM('17','15','12.5','10','8.5','5.5','3'),
paymentValue int,
invoiceId int,
PRIMARY KEY(invoiceId,taxBracket) );

-- May or may not be used
CREATE TABLE TaxPayment(userId int NOT NULL,
paymentDate date NOT NULL,
paymentValue int NOT NULL,
id int NOT NULL,
taxType ENUM('health','social','lump') NOT NULL,
PRIMARY KEY(userId,id));


