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

CREATE TABLE Sessions(userId int,
loginDate timestamp,
token varchar(127),
active boolean,
PRIMARY KEY(userId,token));


INSERT INTO Invoices (userId,registrationDate,transactionDate,idCardNumber,contractorType,contractorNip,invoiceId) VALUES (0,'2020-12-30','2020-12-30','765/12/2021','Foreign','6371918445',0),(0,'2021-01-01','2021-01-01','445/1/2021','Foreign','6761787436',1),(0,'2021-01-01','2020-12-31','27/1/2021','Foreign','5372162227',2),(0,'2021-01-01','2021-01-01','180/1/2021','Foreign','7641023725',3),(0,'2021-01-01','2020-12-30','516/1/2021','Foreign','7131045716',4),(0,'2021-01-02','2020-12-30','273/12/2021','Foreign','7532439183',5),(0,'2021-01-02','2021-01-02','403/12/2021','Foreign','8321874184',6),(0,'2021-01-03','2021-01-03','729/12/2021','Foreign','7132578053',7),(0,'2021-01-03','2020-12-31','883/12/2021','Foreign','8881012236',8),(0,'2021-01-03','2021-01-02','487/1/2021','Foreign','8631608904',9),(0,'2021-01-04','2021-01-01','456/1/2021','Foreign','7642697472',10),(0,'2021-01-05','2021-01-02','525/1/2021','Foreign','7361281277',11),(0,'2021-01-05','2021-01-03','860/1/2021','Foreign','9541986750',12),(0,'2021-01-07','2021-01-07','200/1/2021','Foreign','6591419158',13),(0,'2021-01-07','2021-01-05','394/1/2021','Foreign','6140102873',14),(0,'2021-01-08','2021-01-08','381/1/2021','Foreign','7952268469',15),(0,'2021-01-08','2021-01-05','775/1/2021','Foreign','4660344759',16),(0,'2021-01-09','2021-01-08','556/1/2021','Foreign','8831021612',17),(0,'2021-01-10','2021-01-10','717/1/2021','Foreign','5881323348',18),(0,'2021-01-12','2021-01-10','425/1/2021','Foreign','7431312535',19),(0,'2021-01-16','2021-01-14','977/1/2021','Foreign','6492301726',20),(0,'2021-01-17','2021-01-15','42/1/2021','Foreign','7941686192',21),(0,'2021-01-18','2021-01-18','127/1/2021','os.fiz.','osoba fizyczna ',22),(0,'2021-01-18','2021-01-17','847/1/2021','Foreign','8272304103',23),(0,'2021-01-19','2021-01-16','794/1/2021','Foreign','9211373642',24),(0,'2021-01-19','2021-01-19','399/1/2021','Foreign','8571054499',25),(0,'2021-01-19','2021-01-16','472/1/2021','Foreign','8842772931',26),(0,'2021-01-19','2021-01-16','950/1/2021','Foreign','6010085969',27),(0,'2021-01-23','2021-01-22','9/1/2021','Foreign','9492199270',28),(0,'2021-01-24','2021-01-23','625/1/2021','Foreign','FRTT987654321',29),(0,'2021-01-25','2021-01-25','30/1/2021','Foreign','9590829973',30),(0,'2021-01-25','2021-01-22','278/1/2021','Foreign','8331340225',31),(0,'2021-01-26','2021-01-24','900/1/2021','Foreign','CZ123456789',32),(0,'2021-01-26','2021-01-25','196/1/2021','Foreign','8451043292',33),(0,'2021-01-27','2021-01-26','539/1/2021','Foreign','8511066174',34),(0,'2021-01-27','2021-01-27','418/1/2021','Foreign','7962963633',35),(0,'2021-01-27','2021-01-26','829/1/2021','Foreign','8341775108',36),(0,'2021-01-29','2021-01-26','899/2/2021','Foreign','5832097544',37),(0,'2021-01-29','2021-01-29','295/1/2021','Foreign','1132557183',38),(0,'2021-01-29','2021-01-28','920/2/2021','Foreign','1060006024',39),(0,'2021-01-30','2021-01-30','373/1/2021','Foreign','5661868809',40),(0,'2021-01-30','2021-01-29','183/1/2021','Foreign','7631132364',41),(0,'2021-02-01','2021-02-01','442/1/2021','Foreign','5381858098',42),(0,'2021-02-01','2021-02-01','712/1/2021','Foreign','5571616553',43),(0,'2021-02-01','2021-01-31','982/1/2021','Foreign','7781029219',44),(0,'2021-02-01','2021-01-29','121/2/2021','Foreign','9252100160',45),(0,'2021-02-02','2021-01-31','871/2/2021','Foreign','8251036560',46),(0,'2021-02-03','2021-02-02','331/2/2021','Foreign','7811619671',47),(0,'2021-02-05','2021-02-05','316/2/2021','Foreign','2910085431',48),(0,'2021-02-06','2021-02-03','852/2/2021','os.fiz.','os. fiz.',49),(0,'2021-02-07','2021-02-04','55K/21','Foreign','9561664423',50),(0,'2021-02-07','2021-02-06','643/2/2021','Foreign','brak',51),(0,'2021-02-10','2021-02-10','596/2/2021','Foreign','2220041781',52),(0,'2221-02-10','2021-02-09','444/10/2021','Foreign','8551571375',53),(0,'2021-02-15','2021-02-14','775/2/2021','Foreign','6492273177',54),(0,'2021-02-18','2021-02-15','623/2/2021','Foreign','1132258115',55),(0,'2021-02-19','2021-02-16','617/2/2021','Foreign','7392918511',56),(0,'2021-02-21','2021-02-21','466/2/2021','Foreign','6772079447',57),(0,'2021-02-23','2021-02-22','753/2/2021','Foreign','6750006659',58),(0,'2021-02-24','2021-02-21','928/2/2021','Foreign','8341293504',59),(0,'2021-02-25','2021-02-25','254/2/2021','Foreign','5311398579',60),(0,'2021-02-26','2021-02-25','924/3/2021','Foreign','7342731408',61),(0,'2021-02-27','2021-02-24','222/2/2021','Foreign','7952402235',62),(0,'2021-02-28','2021-02-27','962/3/2021','Foreign','7871995455',63),(0,'2021-03-03','2021-03-01','37/3/2021','Foreign','8371011545',64),(0,'2021-03-03','2021-03-02','651/3/2021','Foreign','9591010933',65),(0,'2021-03-03','2021-03-03','844/2/2021','Foreign','8121359313',66),(0,'2021-03-05','2021-03-02','822/3/2021','Foreign','6640006552',67),(0,'2021-03-07','2021-03-05','693/3/2021','Foreign','8831021658',68),(0,'2021-03-10','2021-03-07','61/3/2021','Foreign','7561745445',69),(0,'2021-03-10','2021-03-08','869/3/2021','Foreign','8161123924',70),(0,'2021-03-12','2021-03-12','501/3/2021','Foreign','6251133894',71),(0,'2021-03-13','2021-03-11','315/3/2021','Foreign','6871501820',72),(0,'2021-03-14','2021-03-13','745/3/2021','Foreign','9161394954',73),(0,'2021-03-14','2021-03-13','634/3/2021','Foreign','8421342506',74),(0,'2021-03-15','2021-03-14','98/3/2021','Foreign','6651654898',75),(0,'2021-03-18','2021-03-15','318/3/2021','Foreign','5472156887',76),(0,'2021-03-20','2021-03-17','279/3/2021','Foreign','6590003415',77),(0,'2021-03-21','2021-03-18','465/3/2021','Foreign','5341004094',78),(0,'2021-03-22','2021-03-20','604/3/2021','Foreign','7161628026',79),(0,'2021-03-23','2021-03-23','507/3/2021','Foreign','5342277210',80),(0,'2021-03-24','2021-03-22','776/3/2021','Foreign','7511537006',81),(0,'2021-03-25','2021-03-23','212/3/2021','Foreign','9482366803',82),(0,'2021-03-26','2021-03-25','470/3/2021','Foreign','5711347812',83),(0,'2021-03-28','2021-03-25','793/3/2021','Foreign','5170037677',84),(0,'2021-03-29','2021-03-27','21/4/2021','Foreign','6621629536',85),(0,'2021-03-30','2021-03-27','352/3/2021','Foreign','8721357162',86),(0,'2021-03-30','2021-03-27','179/3/2021','Foreign','5431001811',87),(0,'2021-04-03','2021-04-01','123/4/2021','Foreign','5732479507',88),(0,'2021-04-05','2021-04-04','734/4/2021','Foreign','8431085465',89),(0,'2021-04-05','2021-04-05','396/3/2021','Foreign','8442343959',90),(0,'2021-04-08','2021-04-07','586/4/2021','Foreign','7722260671',91),(0,'2021-04-10','2021-04-10','263/4/2021','Foreign','7710021587',92),(0,'2021-04-10','2021-04-10','538/4/2021','Foreign','6631338562',93),(0,'2021-04-11','2021-04-08','746/4/2021','Foreign','2910068208',94),(0,'2021-04-11','2021-04-08','404/4/2021','Foreign','5950007798',95),(0,'2021-04-11','2021-04-11','551/4/2021','Foreign','8231663667',96),(0,'2021-04-12','2021-04-11','829/4/2021','Foreign','5971731401',97),(0,'2021-04-12','2021-04-10','52/4/2021','Foreign','9442249244',98),(0,'2021-04-12','2021-04-11','477/4/2021','Foreign','5252234214',99),(0,'2021-04-14','2021-04-14','439/4/2021','Foreign','8762457222',100),(0,'2021-04-14','2021-04-12','197/4/2021','Foreign','6783124128',101),(0,'2021-04-15','2021-04-15','884/4/2021','Foreign','8621007534',102),(0,'2021-04-16','2021-04-14','137/4/2021','Foreign','8221765308',103),(0,'2021-04-21','2021-04-20','731/4/2021','Foreign','7571140382',104),(0,'2021-04-21','2021-04-19','388/4/2021','Foreign','7270134702',105),(0,'2021-04-23','2021-04-23','828/4/2021','Foreign','6861518256',106),(0,'2021-04-24','2021-04-21','497/4/2021','Foreign','8211618095',107),(0,'2021-04-26','2021-04-26','498/4/2021','Foreign','5792207899',108),(0,'2021-04-28','2021-04-28','844/4/2021','Foreign','5611052365',109),(0,'2021-04-28','2021-04-27','369/5/2021','Foreign','8762410290',110),(0,'2021-04-29','2021-04-29','891/5/2021','Foreign','6580002590',111);
INSERT INTO Items (taxBracket,paymentValue,invoiceId) VALUES ('17', 10,0),('15',42921 ,0),('17', 1,1),('15',71276 ,1),('17', 5,2),('15',51347 ,2),('15', 33,3),('12.5',69083 ,3),('10', 143,4),('8.5',44507 ,4),('17', 130,5),('15',55374 ,5),('15', 72,6),('12.5',25770 ,6),('17', 144,7),('15',39650 ,7),('8.5', 106,7),('5.5',76405 ,7),('10', 98,8),('8.5',88611 ,8),('10', 1,9),('8.5',43400 ,9),('15', 50,10),('12.5',86132 ,10),('17', 109,11),('15',86341 ,11),('17', 38,12),('15',14592 ,12),('12.5', 26,13),('10',03766 ,13),('12.5', 58,14),('10',79978 ,14),('8.5', 37,15),('5.5',94980 ,15),('12.5', 1,16),('10',01244 ,16),('3', 74,16),('10', 81,17),('8.5',57269 ,17),('15', 81,18),('12.5',66000 ,18),('5.5', 101,18),('3',76101 ,18),('15', 10,19),('12.5',32106 ,19),('8.5', 129,19),('5.5',87827 ,19),('17', 55,20),('15',49150 ,20),('5.5', 62,20),('3',77917 ,20),('3', 87,21),('17', 103,22),('15',51173 ,22),('8.5', 37,22),('5.5',22898 ,22),('12.5', 34,23),('10',19337 ,23),('15', 84,24),('12.5',00895 ,24),('15', 145,25),('12.5',62299 ,25),('12.5', 2,26),('10',15783 ,26),('10', 91,27),('8.5',18850 ,27),('17', 56,28),('15',29866 ,28),('12.5', 148,28),('10',85909 ,28),('5.5', 19,28),('3',91038 ,28),('17', 85,29),('15',26246 ,29),('12.5', 13,30),('10',43832 ,30),('5.5', 20,30),('3',53703 ,30),('12.5', 47,31),('10',32875 ,31),('17', 83,32),('15',12749 ,32),('17', 80,33),('15',16345 ,33),('10', 134,33),('8.5',17184 ,33),('17', 75,34),('15',41561 ,34),('17', 60,35),('15',60350 ,35),('8.5', 103,35),('5.5',09639 ,35),('8.5', 124,36),('5.5',90999 ,36),('15', 125,37),('12.5',18691 ,37),('10', 66,38),('8.5',19579 ,38),('5.5', 74,39),('3',47296 ,39),('17', 76,40),('15',88121 ,40),('10', 70,40),('8.5',45258 ,40),('15', 41,41),('12.5',14636 ,41),('12.5', 70,42),('10',80795 ,42),('12.5', 65,43),('10',09283 ,43),('3', 61,43),('8.5', 144,44),('5.5',59263 ,44),('10', 72,45),('8.5',43304 ,45),('15', 4,46),('12.5',90011 ,46),('5.5', 36,47),('3',36288 ,47),('15', 117,48),('12.5',81719 ,48),('15', 61,49),('12.5',28212 ,49),('17',-5,50),('15',58533 ,50),('5.5', 136,51),('3',43138 ,51),('17', 76,52),('15',37898 ,52),('17', 88,53),('15',67342 ,53),('3', 21,54),('8.5', 115,55),('5.5',80576 ,55),('8.5', 1,56),('5.5',49322 ,56),('15', 69,57),('12.5',20504 ,57),('17', 76,58),('15',38626 ,58),('3', 102,58),('10', 25,59),('8.5',94597 ,59),('3', 127,60),('15', 69,61),('12.5',68380 ,61),('5.5', 122,61),('3',36038 ,61),('3', 108,62),('17', 148,63),('15',02904 ,63),('17', 67,64),('15',92327 ,64),('12.5', 14,65),('10',66814 ,65),('10', 98,66),('8.5',39359 ,66),('17', 15,67),('15',54984 ,67),('3', 92,68),('17', 132,69),('15',11176 ,69),('10', 35,69),('8.5',07263 ,69),('5.5', 132,70),('3',66787 ,70),('5.5', 57,71),('3',77476 ,71),('8.5', 17,72),('5.5',63823 ,72),('17', 122,73),('15',21635 ,73),('5.5', 65,73),('3',92978 ,73),('5.5', 52,74),('3',50175 ,74),('17', 35,75),('15',46956 ,75),('15', 129,76),('12.5',74547 ,76),('8.5', 122,76),('5.5',38437 ,76),('17', 142,77),('15',71958 ,77),('8.5', 12,77),('5.5',85090 ,77),('3', 55,78),('15', 149,79),('12.5',85905 ,79),('17', 57,80),('15',65484 ,80),('10', 144,80),('8.5',72782 ,80),('10', 75,81),('8.5',88052 ,81),('3', 103,82),('5.5', 107,83),('3',93662 ,83),('5.5', 78,84),('3',49230 ,84),('15', 146,85),('12.5',73042 ,85),('15', 88,86),('12.5',99190 ,86),('12.5', 140,87),('10',80076 ,87),('15', 54,88),('12.5',38474 ,88),('17', 67,89),('15',10819 ,89),('17', 149,90),('15',17896 ,90),('3', 131,90),('17', 50,91),('15',43534 ,91),('5.5', 90,92),('3',35262 ,92),('5.5', 98,93),('3',47832 ,93),('12.5', 33,94),('10',40583 ,94),('10', 135,95),('8.5',71703 ,95),('3', 7,95),('12.5', 67,96),('10',49928 ,96),('3', 58,96),('12.5', 17,97),('10',83184 ,97),('15', 3,98),('12.5',24806 ,98),('8.5', 81,98),('5.5',89791 ,98),('15', 30,99),('12.5',07806 ,99),('15', 34,100),('12.5',15308 ,100),('12.5', 130,101),('10',35594 ,101),('17', 136,102),('15',94027 ,102),('8.5', 140,102),('5.5',89759 ,102),('3', 109,102),('8.5', 9,103),('5.5',04081 ,103),('15', 7,104),('12.5',44039 ,104),('10', 42,104),('8.5',96602 ,104),('17', 32,105),('15',03360 ,105),('5.5', 91,105),('3',00791 ,105),('5.5', 68,106),('3',14426 ,106),('3', 143,107),('10', 82,108),('8.5',81419 ,108),('12.5', 102,109),('10',16674 ,109),('8.5', 12,110),('5.5',86425 ,110),('12.5', 79,111),('10',81241 ,111),('5.5', 83,111),('3',70037 ,111);
INSERT INTO Users (login,password,name,surname,nip) values ('jp2','gmd','janusz','pavlacz','2137'),('kamil','nowak','kamil','nowak','420');
