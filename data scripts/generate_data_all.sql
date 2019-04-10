CREATE TABLE `fac_person` (
  `email` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `department` varchar(255) default NULL,
  `phone` varchar(100) default NULL,
  `fullTime` tinyint default NULL,
  `title` varchar(255) default NULL
);

INSERT INTO `fac_person` (`email`,`name`,`department`,`phone`,`fullTime`,`title`) VALUES ("Sed.id.risus@pedeetrisus.ca","Breanna Davis","Computer Science","7407430267",1,"Adjunct"),("vel.quam.dignissim@nonlaciniaat.com","Rhonda Petersen","Chemistry","2805671456",1,"Professor"),("taciti@pretiumneque.com","Luke Dickson","Psychology","5634261020",1,"Lecturer"),("neque.Nullam@egetvariusultrices.net","Samuel Wynn","Psychology","3016005547",0,"Lecturer"),("pede.blandit.congue@accumsannequeet.net","Nero Jarvis","Computer Science","5578653907",0,"Adjunct"),("magnis.dis@gravida.com","Demetrius Compton","Psychology","7092567227",0,"Lecturer"),("et.magnis@ipsumdolor.edu","Wynne Ramsey","Biology","4206275463",0,"Lecturer"),("Sed.et@ligula.co.uk","Zephania Trevino","Mathematics","5489172602",1,"Lecturer"),("nascetur@metus.edu","Alexander Vang","Chemistry","9541267552",0,"Adjunct"),("velit.egestas@orci.ca","Christine Sharp","Chemistry","6982463167",1,"Lecturer"),("tempor.lorem.eget@scelerisque.net","Mira Harper","Psychology","6002383424",1,"Adjunct"),("at.pede.Cras@placerat.com","Cassidy Duke","Computer Science","9375252753",0,"Professor"),("eleifend.nec@quam.co.uk","Pearl Lindsey","Business","6876988460",0,"Professor"),("Integer.vulputate.risus@sodalesnisimagna.ca","Scott Tanner","Biology","2634354933",1,"Professor"),("faucibus@Suspendisse.ca","Fay Mcguire","Computer Science","6318502011",1,"Professor"),("tellus.id.nunc@ipsum.net","Jade Burt","Business","7116335276",1,"Professor"),("Aliquam.rutrum@libero.com","Jakeem Nichols","Biology","5209162410",1,"Adjunct"),("dapibus.ligula@Vivamusmolestiedapibus.ca","Kellie Tanner","Chemistry","8725153572",0,"Professor"),("Donec@turpisAliquamadipiscing.edu","Seth Hughes","Biology","2206511980",0,"Adjunct"),("Mauris.quis@semutcursus.com","Kimberley Craft","Psychology","2361236378",0,"Lecturer");

INSERT INTO Persons (email, name, department, phone)
SELECT email, name, department, phone
FROM fac_person as fp;

INSERT INTO faculty (email, fullTime, title)
SELECT email, fullTime, title
FROM fac_person;

SELECT * FROM persons as p
JOIN faculty as f
WHERE p.email = f.email;

DROP TABLE `fac_person`;
---------------------------------------------
CREATE TABLE `tmp` (
  `email` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `department` varchar(255) default NULL,
  `phone` varchar(100) default NULL,
  `gradYear` int(4) default NULL,
  `birthdate` DATE
);

INSERT INTO `tmp` (`email`,`name`,`department`,`phone`,`gradYear`,`birthdate`) VALUES ("ugt@egetmassaSuspendisse.org","Raymond Cobb","Chemistry","9654193242",2024,"1985-06-24"),("amet.ante@Phasellus.ca","Noel Herring","Business","5167768047",2022,"1996-08-06"),("netus.et.malesuada@feugiat.com","Chava Walker","Business","4546935675",2023,"1993-12-06"),("nunc.nulla@eleifend.org","Lee Pace","Computer Science","9474247176",2025,"1988-08-21"),("a.arcu@malesuadaid.com","Warren Sykes","Chemistry","1247287555",2025,"1988-03-09"),("ac.ipsum.Phasellus@eueleifend.co.uk","Tara Edwards","Psychology","4531287673",2022,"1987-12-15"),("feugiat@ac.ca","Price Nguyen","Biology","9167812823",2020,"1986-06-26"),("justo.Praesent.luctus@Phasellusinfelis.com","Bianca Bradley","Biology","8249371252",2019,"1989-05-22"),("lacus.Mauris@Duismienim.org","Declan Holmes","Business","8906606478",2021,"1985-10-01"),("rutrum.magna.Cras@consequatdolor.com","Jessica Drake","Biology","6304066569",2019,"1997-03-02"),("cursus.in.hendrerit@anteiaculis.org","Phelan Owens","Computer Science","4669424089",2021,"1997-03-28"),("Quisque@montesnasceturridiculus.com","Alexander Shields","Computer Science","6323618351",2021,"1992-03-20"),("et@diamSed.com","Jescie Yates","Mathematics","5793987050",2024,"1998-11-14"),("egestas.Aliquam.fringilla@orciUt.net","Bell Swanson","Computer Science","8203405875",2021,"1994-06-14"),("Aenean@Sednecmetus.com","Rigel Hogan","Biology","1976990702",2019,"1998-10-02"),("tristique.pharetra@morbitristiquesenectus.edu","Bertha Huff","Mathematics","8462678664",2021,"1987-04-09"),("nisi.Cum.sociis@ligulaAenean.co.uk","Cameran Bean","Biology","2269807888",2019,"1999-07-11"),("cursus.non@duiaugueeu.org","Myles Jarvis","Biology","9754694986",2023,"1991-08-26"),("dolor.tempus.non@justo.co.uk","Germane Vincent","Psychology","1616389385",2023,"1997-01-03"),("nec.mollis@PhasellusnullaInteger.org","Irene Mays","Mathematics","8774872533",2021,"1997-01-18");

INSERT INTO Persons (email, name, department, phone)
SELECT email, name, department, phone
FROM tmp;

INSERT INTO students (email, gradYear, birthdate)
SELECT email, gradYear, birthdate
FROM tmp;

SELECT * FROM persons as p
JOIN students as f
WHERE p.email = f.email;

DROP TABLE `tmp`;
---------------------------------------------
CREATE TABLE `tmp` (
  `make` varchar(45) default NULL,
  `model` varchar(45) default NULL
);

INSERT INTO `tmp` (`make`,`model`) VALUES ("Yamaha","V1"),("Honda","V2");

INSERT INTO Cart_Models (make, model)
SELECT make, model
FROM tmp;

SELECT * FROM cart_models;

DROP TABLE `tmp`;
---------------------------------------------
CREATE TABLE `tmp` (
  `idModel` int default NULL,
  `numSeats` int default NULL,
  `extraSeats` int default NULL
);

INSERT INTO `tmp` (`idModel`,`numSeats`,`extraSeats`) VALUES (1,3,2),(1,3,2),(1,2,1),(1,2,1),(2,3,2),(2,3,2),(2,2,1),(2,2,1);

INSERT INTO Carts (idModel, numSeats, extraSeats)
SELECT idModel, numSeats, extraSeats
FROM tmp;

SELECT * FROM Carts;

SELECT * FROM Carts as p
JOIN cart_models as f
WHERE p.idModel = f.idCart_Model;

DROP TABLE `tmp`;
---------------------------------------------
CREATE TABLE `tmp` (
  `locationName` varchar(255) default NULL,
  `locationAddress` varchar(255) default NULL
);

INSERT INTO `tmp` (`locationName`,`locationAddress`) VALUES ("Belk Gymnasium","5799 Donec St."),("Woodward Hall","712-8205 Nam Ave"),("Student Health Center","228-2163 Sagittis Street"),("Center City","Ap #862-6882 Lacus. Road"),("Denny","436-9903 Sit St."),("Atkins","2332 Vivamus Av.");

INSERT INTO Locations (locationName, locationAddress)
SELECT locationName , locationAddress
FROM tmp;

SELECT * FROM Locations;

DROP TABLE `tmp`;
---------------------------------------------
CREATE TABLE `tmp` (
  `email` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `department` varchar(255) default NULL,
  `phone` varchar(100) default NULL,
  `Carts_idCart` INT,
  `liscensNumber` varchar(255),
  `dateHired` DATE
);

INSERT INTO `tmp` (`email`,`name`,`department`,`phone`,`Carts_idCart`,`liscensNumber`,`dateHired`) VALUES ("ultrices.iaculis@Aeneaneget.ca","Paul Hall","Transportation","9092451957",2,"191239671585","2013-03-09"),("Sed@Proin.net","Gillian Cole","Transportation","9418878963",7,"168724194980","2010-12-01"),("malesuada.vel.venenatis@Fuscemollis.org","Jonah Fields","Transportation","8763193213",4,"455512199470","2016-12-24"),("blandit.viverra.Donec@suscipitnonummyFusce.ca","Camden Morse","Transportation","7295130224",6,"827056339840","2005-02-07"),("Donec.est@tellusAenean.org","Rashad Patterson","Transportation","6544295743",3,"966500813981","2004-11-17"),("arcu@faucibus.co.uk","Eaton Key","Transportation","5606159572",8,"929728610252","2015-06-14"),("natoque.penatibus@sed.org","Farrah Ray","Transportation","7995741102",3,"230730883389","2015-10-18"),("Proin.nisl.sem@orciin.com","Mechelle Pruitt","Transportation","3027027801",7,"205957990049","2004-03-13"),("erat@euaccumsansed.net","Noelle Mcintyre","Transportation","1281287365",3,"480669825700","2011-10-09"),("Proin@sitametrisus.co.uk","Magee Dudley","Transportation","7635773632",1,"647073417437","2014-01-12"),("quis.diam.Pellentesque@placerat.com","Stephanie Ewing","Transportation","4703777442",7,"456248513018","2003-03-13"),("nec.quam@eratVivamusnisi.com","Leila Cook","Transportation","1583252532",4,"776797961154","2014-12-03"),("ipsum.non.arcu@nisinibh.com","Aiko Hammond","Transportation","1255986496",5,"227214732837","2012-09-16"),("Donec.est.Nunc@primisinfaucibus.co.uk","Christian Ortega","Transportation","4718201265",1,"951906085013","2006-09-09"),("Suspendisse@malesuadamalesuadaInteger.ca","Abraham Conner","Transportation","3746356473",5,"055324274234","2005-10-20"),("hymenaeos.Mauris@vitaesodalesat.edu","Carol Sloan","Transportation","1647310738",3,"699435163248","2008-07-06"),("ac.risus@tristiquepharetraQuisque.ca","Justin Martin","Transportation","3381983150",5,"962845871178","2009-02-26"),("Mauris@Crasdictum.edu","Conan Mcgowan","Transportation","2793517748",1,"703654353650","2016-04-12"),("lacinia.at.iaculis@euismodac.com","Malcolm Whitaker","Transportation","6301294722",4,"626948270488","2008-09-10"),("libero@adipiscingfringillaporttitor.co.uk","Deborah Gillespie","Transportation","6304414006",5,"289712943397","2017-10-17");

INSERT INTO Persons (email, name, department, phone)
SELECT email, name, department, phone
FROM tmp;

INSERT INTO drivers (email, Carts_idCart, liscensNumber, dateHired)
SELECT email, Carts_idCart, liscensNumber, dateHired
FROM tmp;

SELECT * FROM persons as p
JOIN drivers as f
WHERE p.email = f.email;

DROP TABLE `tmp`;
---------------------------------------------
CREATE TABLE `tmp` (
  `email` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `department` varchar(255) default NULL,
  `phone` varchar(100) default NULL,
  `position` varchar(128) default NULL,
  `admin` tinyint default NULL
);

INSERT INTO `tmp` (`email`,`name`,`department`,`phone`,`position`,`admin`) VALUES ("elit.pretium.et@sitametdapibus.edu","Keith Luna","Student Affairs","6822547596","Employee",0),("viverra.Donec@atauctor.ca","Julie Stanley","Human Resources","8201833217","Employee",1),("nec@consectetuercursuset.com","Robert Mcgee","Tech Support","8737834727","Employee",1),("sapien.gravida@Nuncsed.org","Blaze Molina","Human Resources","1616387379","Manager",1),("Vivamus.nisi@vitaealiquam.co.uk","Phoebe Boyd","Tech Support","2131687696","Manager",1),("nisi.magna@tristique.co.uk","TaShya Kaufman","Tech Support","6604388129","Manager",1),("in.faucibus.orci@Loremipsumdolor.edu","Shoshana Cash","Tech Support","7477084069","Employee",0),("rutrum.Fusce@intempuseu.ca","Iris Clemons","Student Affairs","7035823812","Manager",1),("tellus@nequevitaesemper.edu","Devin Ball","Tech Support","3734766566","Employee",1),("Nunc.commodo.auctor@faucibus.co.uk","Mari Daniel","Human Resources","9041950050","Manager",1),("Nullam.scelerisque@ametornarelectus.net","Karyn Oneal","Human Resources","8351580424","Manager",0),("purus.sapien@pedeblandit.ca","Nathaniel Murphy","Student Affairs","4082438550","Employee",0),("pede.Cum@morbitristiquesenectus.edu","Akeem Faulkner","Human Resources","8743093629","Manager",0),("ac.orci.Ut@mauris.net","Amir Nichols","Tech Support","8337804998","Manager",0),("aliquet.libero@loremutaliquam.ca","Jackson Irwin","Student Affairs","2561619877","Manager",0),("libero@sedpedeCum.edu","Erin Price","Human Resources","4333882482","Employee",0),("ut.odio.vel@aliquetlibero.ca","Ezra Dudley","Student Affairs","2807905764","Employee",0),("tristique@velit.edu","Ivy Reeves","Human Resources","3771161963","Employee",1),("Morbi.quis@Quisque.com","Florence Saunders","Human Resources","2205425796","Employee",0),("mauris.Suspendisse@justonec.ca","Scott Foreman","Human Resources","5964457164","Employee",1);

INSERT INTO Persons (email, name, department, phone)
SELECT email, name, department, phone
FROM tmp;

INSERT INTO staff (email, position, admin)
SELECT email, position, admin
FROM tmp;

SELECT * FROM persons as p
JOIN staff as f
WHERE p.email = f.email;

DROP TABLE `tmp`;
---------------------------------------------
CREATE TABLE `tmp` (
  `emailCustomer` varchar(255) default NULL,
  `emailDriver` varchar(255) default NULL,
  `idLocationStart` mediumint default NULL,
  `idLocationEnd` mediumint default NULL,
  `date` varchar(255),
  `time` varchar(255),
  `numberPeople` mediumint default NULL
);

INSERT INTO `tmp` (`emailCustomer`,`emailDriver`,`idLocationStart`,`idLocationEnd`,`date`,`time`,`numberPeople`) VALUES ("cursus.non@duiaugueeu.org","libero@adipiscingfringillaporttitor.co.uk",2,3,"2019-01-08","17:37:44",2),("cursus.in.hendrerit@anteiaculis.org ","hymenaeos.Mauris@vitaesodalesat.edu ",2,5,"2019-01-15","10:36:19",1),("aliquet.libero@loremutaliquam.ca ","ipsum.non.arcu@nisinibh.com ",4,5,"2019-02-08","17:05:36",1),("ac.ipsum.Phasellus@eueleifend.co.uk","erat@euaccumsansed.net ",6,3,"2019-01-27","17:18:09",1),("cursus.in.hendrerit@anteiaculis.org ","lacinia.at.iaculis@euismodac.com ",4,5,"2019-05-04","11:36:19",1),("amet.ante@Phasellus.ca ","Donec.est.Nunc@primisinfaucibus.co.uk ",2,4,"2019-02-15","05:24:00",1),("ac.ipsum.Phasellus@eueleifend.co.uk","Donec.est@tellusAenean.org ",6,5,"2019-03-08","23:10:49",1),("amet.ante@Phasellus.ca ","Donec.est@tellusAenean.org ",6,1,"2019-05-13","23:10:33",1),("Aliquam.rutrum@libero.com ","ipsum.non.arcu@nisinibh.com ",1,3,"2019-03-02","05:12:31",1),("aliquet.libero@loremutaliquam.ca ","ipsum.non.arcu@nisinibh.com ",1,2,"2019-03-19","01:57:13",2);

INSERT INTO Ride (emailCustomer, emailDriver, idLocationStart, idLocationEnd, date, time, numberPeople)
SELECT emailCustomer, emailDriver, idLocationStart, idLocationEnd, date, time, numberPeople
FROM tmp;

SELECT * FROM Ride;

DROP TABLE `tmp`;
---------------------------------------------
SELECT * FROM Ride as p
JOIN Drivers as f
WHERE p.emailDriver = f.email;