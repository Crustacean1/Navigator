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
invoiceId int NOT NULL AUTO_INCREMENT KEY,
contractorType ENUM('os.fiz.','N/A','PL','Foreign'),
contractorNip varchar(255),
idCardNumber varchar(255),
transactionDate date,
registrationDate date,
pit17 int,
pit15 int,
pit12 int,
pit10 int,
pit85 int,
pit55 int,
pit03 int,
notes varchar(511));

-- CREATE TABLE IF NOT EXISTS Items(taxBracket ENUM('17','15','12.5','10','8.5','5.5','3'),
-- paymentValue int,
-- invoiceId int,
-- PRIMARY KEY(invoiceId,taxBracket) );

-- May or may not be used
CREATE TABLE TaxPayment(userId int NOT NULL,
paymentDate date NOT NULL,
paymentValue int NOT NULL,
id int NOT NULL,
taxType ENUM('health','social','lump') NOT NULL,
PRIMARY KEY(userId,id));

CREATE TABLE Sessions(userId int,
loginDate timestamp,
token varchar(127),
active boolean,
PRIMARY KEY(userId,token));

INSERT INTO Invoices (userId,registrationDate,transactionDate,idCardNumber,contractorType,contractorNip,pit17,pit15,pit12,pit10,pit85,pit55,pit03) VALUES (0,'2020-12-30',' 2020-12-30',' 765/12/2021','PL',' 6371918445',  1042921, 0, 0, 0, 0, 0, 0),(0,'2021-01-01',' 2021-01-01',' 445/1/2021','PL',' 6761787436',  171276, 0, 0, 0, 0, 0, 0),(0,'2021-01-01',' 2020-12-31',' 27/1/2021','PL',' 5372162227',  551347, 0, 0, 0, 0, 0, 0),(0,'2021-01-01',' 2021-01-01',' 180/1/2021','PL',' 7641023725', 0,  3369083, 0, 0, 0, 0, 0),(0,'2021-01-01',' 2020-12-30',' 516/1/2021','PL',' 7131045716', 0, 0, 0,  14344507, 0, 0, 0),(0,'2021-01-02',' 2020-12-30',' 273/12/2021','PL',' 7532439183',  13055374, 0, 0, 0, 0, 0, 0),(0,'2021-01-02',' 2021-01-02',' 403/12/2021','PL',' 8321874184', 0,  7225770, 0, 0, 0, 0, 0),(0,'2021-01-03',' 2021-01-03',' 729/12/2021','PL',' 7132578053',  14439650, 0, 0,  10676405, 0, 0, 0),(0,'2021-01-03',' 2020-12-31',' 883/12/2021','PL',' 8881012236', 0, 0, 0,  9888611, 0, 0, 0),(0,'2021-01-03',' 2021-01-02',' 487/1/2021','PL',' 8631608904', 0, 0, 0,  143400, 0, 0, 0),(0,'2021-01-04',' 2021-01-01',' 456/1/2021','PL',' 7642697472', 0,  5086132, 0, 0, 0, 0, 0),(0,'2021-01-05',' 2021-01-02',' 525/1/2021','PL',' 7361281277',  10986341, 0, 0, 0, 0, 0, 0),(0,'2021-01-05',' 2021-01-03',' 860/1/2021','PL',' 9541986750',  3814592, 0, 0, 0, 0, 0, 0),(0,'2021-01-07',' 2021-01-07',' 200/1/2021','PL',' 6591419158', 0, 0,  2603766, 0, 0, 0, 0),(0,'2021-01-07',' 2021-01-05',' 394/1/2021','PL',' 6140102873', 0, 0,  5879978, 0, 0, 0, 0),(0,'2021-01-08',' 2021-01-08',' 381/1/2021','PL',' 7952268469', 0, 0, 0, 0,  3794980, 0,  13536324),(0,'2021-01-08',' 2021-01-05',' 775/1/2021','PL',' 4660344759', 0, 0,  101244, 0, 0,  7476239, 0),(0,'2021-01-09',' 2021-01-08',' 556/1/2021','PL',' 8831021612', 0, 0, 0,  8157269, 0, 0, 0),(0,'2021-01-10',' 2021-01-10',' 717/1/2021','PL',' 5881323348', 0,  8166000, 0, 0,  10176101, 0, 0),(0,'2021-01-12',' 2021-01-10',' 425/1/2021','PL',' 7431312535', 0,  1032106, 0,  12987827, 0, 0, 0),(0,'2021-01-16',' 2021-01-14',' 977/1/2021','PL',' 6492301726',  5549150, 0, 0, 0,  6277917,  14871343, 0),(0,'2021-01-17',' 2021-01-15',' 42/1/2021','PL',' 7941686192', 0, 0, 0, 0, 0, 0,  8744817),(0,'2021-01-18',' 2021-01-18',' 127/1/2021','os.fiz.',' osoba fizyczna ',  10351173, 0, 0,  3722898, 0, 0, 0),(0,'2021-01-18',' 2021-01-17',' 847/1/2021','PL',' 8272304103', 0, 0,  3419337, 0, 0, 0, 0),(0,'2021-01-19',' 2021-01-16',' 794/1/2021','PL',' 9211373642', 0,  8400895, 0, 0, 0, 0, 0),(0,'2021-01-19',' 2021-01-19',' 399/1/2021','PL',' 8571054499', 0,  14562299, 0, 0, 0, 0, 0),(0,'2021-01-19',' 2021-01-16',' 472/1/2021','PL',' 8842772931', 0, 0,  215783, 0, 0, 0, 0),(0,'2021-01-19',' 2021-01-16',' 950/1/2021','PL',' 6010085969', 0, 0, 0,  9118850, 0, 0, 0),(0,'2021-01-23',' 2021-01-22',' 9/1/2021','PL',' 9492199270',  5629866,  14885909, 0,  1991038, 0, 0, 0),(0,'2021-01-24',' 2021-01-23',' 625/1/2021','Foreign',' FRTT987654321',  8526246, 0, 0, 0, 0, 0, 0),(0,'2021-01-25',' 2021-01-25',' 30/1/2021','PL',' 9590829973', 0, 0,  1343832, 0,  2053703, 0, 0),(0,'2021-01-25',' 2021-01-22',' 278/1/2021','PL',' 8331340225', 0, 0,  4732875, 0, 0, 0, 0),(0,'2021-01-26',' 2021-01-24',' 900/1/2021','Foreign',' CZ123456789',  8312749, 0, 0, 0, 0, 0, 0),(0,'2021-01-26',' 2021-01-25',' 196/1/2021','PL',' 8451043292',  8016345, 0,  13417184, 0, 0, 0, 0),(0,'2021-01-27',' 2021-01-26',' 539/1/2021','PL',' 8511066174',  7541561, 0, 0, 0, 0, 0, 0),(0,'2021-01-27',' 2021-01-27',' 418/1/2021','PL',' 7962963633',  6060350, 0, 0,  10309639, 0,  12628621, 0),(0,'2021-01-27',' 2021-01-26',' 829/1/2021','PL',' 8341775108', 0, 0, 0, 0,  12490999, 0, 0),(0,'2021-01-29',' 2021-01-26',' 899/2/2021','PL',' 5832097544', 0,  12518691, 0, 0, 0, 0, 0),(0,'2021-01-29',' 2021-01-29',' 295/1/2021','PL',' 1132557183', 0, 0, 0,  6619579, 0, 0, 0),(0,'2021-01-29',' 2021-01-28',' 920/2/2021','PL',' 1060006024', 0, 0, 0, 0, 0,  7447296, 0),(0,'2021-01-30',' 2021-01-30',' 373/1/2021','PL',' 5661868809',  7688121, 0,  7045258, 0, 0,  11781439, 0),(0,'2021-01-30',' 2021-01-29',' 183/1/2021','PL',' 7631132364', 0,  4114636, 0, 0, 0, 0, 0),(0,'2021-02-01',' 2021-02-01',' 442/1/2021','PL',' 5381858098', 0, 0,  7080795, 0, 0, 0, 0),(0,'2021-02-01',' 2021-02-01',' 712/1/2021','PL',' 5571616553', 0, 0,  6509283, 0, 0,  6114498, 0),(0,'2021-02-01',' 2021-01-31',' 982/1/2021','PL',' 7781029219', 0, 0, 0, 0,  14459263, 0, 0),(0,'2021-02-01',' 2021-01-29',' 121/2/2021','PL',' 9252100160', 0, 0, 0,  7243304, 0, 0,  4993001),(0,'2021-02-02',' 2021-01-31',' 871/2/2021','PL',' 8251036560', 0,  490011, 0, 0, 0, 0, 0),(0,'2021-02-03',' 2021-02-02',' 331/2/2021','PL',' 7811619671', 0, 0, 0, 0, 0,  3636288, 0),(0,'2021-02-05',' 2021-02-05',' 316/2/2021','PL',' 2910085431', 0,  11781719, 0, 0, 0, 0,  6085891),(0,'2021-02-06',' 2021-02-03',' 852/2/2021','os.fiz.',' os. fiz.', 0,  6128212, 0, 0, 0, 0,  9590300),(0,'2021-02-07',' 2021-02-04',' 55K/21','PL',' 9561664423', -558533, 0, 0, 0, 0, 0, 0),(0,'2021-02-07',' 2021-02-06',' 643/2/2021','Foreign',' brak', 0, 0, 0, 0, 0,  13643138, 0),(0,'2021-02-10',' 2021-02-10',' 596/2/2021','PL',' 2220041781',  7637898, 0, 0, 0, 0, 0, 0),(0,'2221-02-10',' 2021-02-09',' 444/10/2021','PL',' 8551571375',  8867342, 0, 0, 0, 0, 0, 0),(0,'2021-02-15',' 2021-02-14',' 775/2/2021','PL',' 6492273177', 0, 0, 0, 0, 0, 0,  2133701),(0,'2021-02-18',' 2021-02-15',' 623/2/2021','PL',' 1132258115', 0, 0, 0, 0,  11580576, 0, 0),(0,'2021-02-19',' 2021-02-16',' 617/2/2021','PL',' 7392918511', 0, 0, 0, 0,  149322, 0, 0),(0,'2021-02-21',' 2021-02-21',' 466/2/2021','PL',' 6772079447', 0,  6920504, 0, 0, 0, 0, 0),(0,'2021-02-23',' 2021-02-22',' 753/2/2021','PL',' 6750006659',  7638626, 0, 0, 0, 0,  10239306, 0),(0,'2021-02-24',' 2021-02-21',' 928/2/2021','PL',' 8341293504', 0, 0, 0,  2594597, 0, 0, 0),(0,'2021-02-25',' 2021-02-25',' 254/2/2021','PL',' 5311398579', 0, 0, 0, 0, 0, 0,  12775493),(0,'2021-02-26',' 2021-02-25',' 924/3/2021','PL',' 7342731408', 0,  6968380, 0, 0,  12236038, 0, 0),(0,'2021-02-27',' 2021-02-24',' 222/2/2021','PL',' 7952402235', 0, 0, 0, 0, 0, 0,  10829784),(0,'2021-02-28',' 2021-02-27',' 962/3/2021','PL',' 7871995455',  14802904, 0, 0, 0, 0, 0, 0),(0,'2021-03-03',' 2021-03-01',' 37/3/2021','PL',' 8371011545',  6792327, 0, 0, 0, 0, 0, 0),(0,'2021-03-03',' 2021-03-02',' 651/3/2021','PL',' 9591010933', 0, 0,  1466814, 0, 0, 0, 0),(0,'2021-03-03',' 2021-03-03',' 844/2/2021','PL',' 8121359313', 0, 0, 0,  9839359, 0, 0, 0),(0,'2021-03-05',' 2021-03-02',' 822/3/2021','PL',' 6640006552',  1554984, 0, 0, 0, 0, 0, 0),(0,'2021-03-07',' 2021-03-05',' 693/3/2021','PL',' 8831021658', 0, 0, 0, 0, 0, 0,  9241537),(0,'2021-03-10',' 2021-03-07',' 61/3/2021','PL',' 7561745445',  13211176, 0,  3507263, 0, 0, 0, 0),(0,'2021-03-10',' 2021-03-08',' 869/3/2021','PL',' 8161123924', 0, 0, 0, 0, 0,  13266787, 0),(0,'2021-03-12',' 2021-03-12',' 501/3/2021','PL',' 6251133894', 0, 0, 0, 0, 0,  5777476, 0),(0,'2021-03-13',' 2021-03-11',' 315/3/2021','PL',' 6871501820', 0, 0, 0, 0,  1763823, 0, 0),(0,'2021-03-14',' 2021-03-13',' 745/3/2021','PL',' 9161394954',  12221635, 0, 0, 0,  6592978, 0, 0),(0,'2021-03-14',' 2021-03-13',' 634/3/2021','PL',' 8421342506', 0, 0, 0, 0, 0,  5250175, 0),(0,'2021-03-15',' 2021-03-14',' 98/3/2021','PL',' 6651654898',  3546956, 0, 0, 0, 0, 0, 0),(0,'2021-03-18',' 2021-03-15',' 318/3/2021','PL',' 5472156887', 0,  12974547, 0,  12238437, 0, 0, 0),(0,'2021-03-20',' 2021-03-17',' 279/3/2021','PL',' 6590003415',  14271958, 0, 0,  1285090, 0, 0, 0),(0,'2021-03-21',' 2021-03-18',' 465/3/2021','PL',' 5341004094', 0, 0, 0, 0, 0, 0,  5551604),(0,'2021-03-22',' 2021-03-20',' 604/3/2021','PL',' 7161628026', 0,  14985905, 0, 0, 0, 0, 0),(0,'2021-03-23',' 2021-03-23',' 507/3/2021','PL',' 5342277210',  5765484, 0,  14472782, 0, 0, 0, 0),(0,'2021-03-24',' 2021-03-22',' 776/3/2021','PL',' 7511537006', 0, 0, 0,  7588052, 0, 0, 0),(0,'2021-03-25',' 2021-03-23',' 212/3/2021','PL',' 9482366803', 0, 0, 0, 0, 0, 0,  10350264),(0,'2021-03-26',' 2021-03-25',' 470/3/2021','PL',' 5711347812', 0, 0, 0, 0, 0,  10793662, 0),(0,'2021-03-28',' 2021-03-25',' 793/3/2021','PL',' 5170037677', 0, 0, 0, 0, 0,  7849230, 0),(0,'2021-03-29',' 2021-03-27',' 21/4/2021','PL',' 6621629536', 0,  14673042, 0, 0, 0, 0, 0),(0,'2021-03-30',' 2021-03-27',' 352/3/2021','PL',' 8721357162', 0,  8899190, 0, 0, 0, 0, 0),(0,'2021-03-30',' 2021-03-27',' 179/3/2021','PL',' 5431001811', 0, 0,  14080076, 0, 0, 0, 0),(0,'2021-04-03',' 2021-04-01',' 123/4/2021','PL',' 5732479507', 0,  5438474, 0, 0, 0, 0, 0),(0,'2021-04-05',' 2021-04-04',' 734/4/2021','PL',' 8431085465',  6710819, 0, 0, 0, 0, 0, 0),(0,'2021-04-05',' 2021-04-05',' 396/3/2021','PL',' 8442343959',  14917896, 0, 0, 0, 0,  13121850, 0),(0,'2021-04-08',' 2021-04-07',' 586/4/2021','PL',' 7722260671',  5043534, 0, 0, 0, 0, 0, 0),(0,'2021-04-10',' 2021-04-10',' 263/4/2021','PL',' 7710021587', 0, 0, 0, 0, 0,  9035262, 0),(0,'2021-04-10',' 2021-04-10',' 538/4/2021','PL',' 6631338562', 0, 0, 0, 0, 0,  9847832, 0),(0,'2021-04-11',' 2021-04-08',' 746/4/2021','PL',' 2910068208', 0, 0,  3340583, 0, 0, 0, 0),(0,'2021-04-11',' 2021-04-08',' 404/4/2021','PL',' 5950007798', 0, 0, 0,  13571703, 0,  701263, 0),(0,'2021-04-11',' 2021-04-11',' 551/4/2021','PL',' 8231663667', 0, 0,  6749928, 0, 0,  5812421, 0),(0,'2021-04-12',' 2021-04-11',' 829/4/2021','PL',' 5971731401', 0, 0,  1783184, 0, 0, 0, 0),(0,'2021-04-12',' 2021-04-10',' 52/4/2021','PL',' 9442249244', 0,  324806, 0,  8189791, 0, 0,  3194834),(0,'2021-04-12',' 2021-04-11',' 477/4/2021','PL',' 5252234214', 0,  3007806, 0, 0, 0, 0,  4881881),(0,'2021-04-14',' 2021-04-14',' 439/4/2021','PL',' 8762457222', 0,  3415308, 0, 0, 0, 0, 0),(0,'2021-04-14',' 2021-04-12',' 197/4/2021','PL',' 6783124128', 0, 0,  13035594, 0, 0, 0, 0),(0,'2021-04-15',' 2021-04-15',' 884/4/2021','PL',' 8621007534',  13694027, 0, 0,  14089759,  10986933, 0, 0),(0,'2021-04-16',' 2021-04-14',' 137/4/2021','PL',' 8221765308', 0, 0, 0, 0,  904081, 0, 0),(0,'2021-04-21',' 2021-04-20',' 731/4/2021','PL',' 7571140382', 0,  744039,  4296602, 0, 0, 0, 0),(0,'2021-04-21',' 2021-04-19',' 388/4/2021','PL',' 7270134702',  3203360, 0, 0, 0,  9100791, 0, 0),(0,'2021-04-23',' 2021-04-23',' 828/4/2021','PL',' 6861518256', 0, 0, 0, 0, 0,  6814426, 0),(0,'2021-04-24',' 2021-04-21',' 497/4/2021','PL',' 8211618095', 0, 0, 0, 0, 0, 0,  14352759),(0,'2021-04-26',' 2021-04-26',' 498/4/2021','PL',' 5792207899', 0, 0, 0,  8281419, 0, 0, 0),(0,'2021-04-28',' 2021-04-28',' 844/4/2021','PL',' 5611052365', 0, 0,  10216674, 0, 0, 0, 0),(0,'2021-04-28',' 2021-04-27',' 369/5/2021','PL',' 8762410290', 0, 0, 0, 0,  1286425, 0, 0),(0,'2021-04-29',' 2021-04-29',' 891/5/2021','PL',' 6580002590', 0, 0,  7981241, 0,  8370037, 0, 0);
INSERT INTO Users (id,login,password,name,surname,nip) values (4,'jp2','gmd','janusz','pavlacz','2137'),(0,'kamil','nowak','kamil','nowak','420');
