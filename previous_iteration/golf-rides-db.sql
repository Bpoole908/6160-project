CREATE DATABASE  IF NOT EXISTS `fortyniner golf cart rides` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fortyniner golf cart rides`;
-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: fortyniner golf cart rides
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_models`
--

DROP TABLE IF EXISTS `cart_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_models` (
  `idCart_Model` int(11) NOT NULL AUTO_INCREMENT,
  `make` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  PRIMARY KEY (`idCart_Model`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_models`
--

LOCK TABLES `cart_models` WRITE;
/*!40000 ALTER TABLE `cart_models` DISABLE KEYS */;
INSERT INTO `cart_models` VALUES (1,'Yamaha','V1'),(2,'Honda','V2');
/*!40000 ALTER TABLE `cart_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `idCart` int(11) NOT NULL AUTO_INCREMENT,
  `idModel` int(11) NOT NULL,
  `numSeats` int(11) NOT NULL,
  `extraSeats` int(11) NOT NULL,
  PRIMARY KEY (`idCart`),
  KEY `fk_carts_Cart_Model1_idx` (`idModel`),
  CONSTRAINT `fk_carts_Cart_Model1` FOREIGN KEY (`idModel`) REFERENCES `cart_models` (`idCart_Model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,1,3,2),(2,1,3,2),(3,1,2,1),(4,1,2,1),(5,2,3,2),(6,2,3,2),(7,2,2,1),(8,2,2,1);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `email` varchar(255) NOT NULL COMMENT 'Specialization',
  `carts_idCart` int(11) NOT NULL,
  `liscensNumber` varchar(12) NOT NULL,
  `dateHired` date NOT NULL,
  PRIMARY KEY (`email`),
  KEY `fk_drivers_carts1_idx` (`carts_idCart`),
  CONSTRAINT `fk_drivers_carts1` FOREIGN KEY (`carts_idCart`) REFERENCES `carts` (`idCart`),
  CONSTRAINT `fk_drivers_persons1` FOREIGN KEY (`email`) REFERENCES `persons` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES ('ac.risus@tristiquepharetraQuisque.ca',5,'962845871178','2009-02-26'),('arcu@faucibus.co.uk',8,'929728610252','2015-06-14'),('blandit.viverra.Donec@suscipitnonummyFusce.ca',6,'827056339840','2005-02-07'),('Donec.est.Nunc@primisinfaucibus.co.uk',1,'951906085013','2006-09-09'),('Donec.est@tellusAenean.org',3,'966500813981','2004-11-17'),('erat@euaccumsansed.net',3,'480669825700','2011-10-09'),('hymenaeos.Mauris@vitaesodalesat.edu',3,'699435163248','2008-07-06'),('ipsum.non.arcu@nisinibh.com',5,'227214732837','2012-09-16'),('lacinia.at.iaculis@euismodac.com',4,'626948270488','2008-09-10'),('libero@adipiscingfringillaporttitor.co.uk',5,'289712943397','2017-10-17'),('malesuada.vel.venenatis@Fuscemollis.org',4,'455512199470','2016-12-24'),('Mauris@Crasdictum.edu',1,'703654353650','2016-04-12'),('natoque.penatibus@sed.org',3,'230730883389','2015-10-18'),('nec.quam@eratVivamusnisi.com',4,'776797961154','2014-12-03'),('Proin.nisl.sem@orciin.com',7,'205957990049','2004-03-13'),('Proin@sitametrisus.co.uk',1,'647073417437','2014-01-12'),('quis.diam.Pellentesque@placerat.com',7,'456248513018','2003-03-13'),('Sed@Proin.net',7,'168724194980','2010-12-01'),('Suspendisse@malesuadamalesuadaInteger.ca',5,'055324274234','2005-10-20'),('ultrices.iaculis@Aeneaneget.ca',2,'191239671585','2013-03-09');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `email` varchar(256) NOT NULL COMMENT 'Specialization',
  `fullTime` tinyint(4) NOT NULL,
  `title` varchar(128) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk_faculty_persons1` FOREIGN KEY (`email`) REFERENCES `persons` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('Aliquam.rutrum@libero.com',1,'Adjunct'),('at.pede.Cras@placerat.com',0,'Professor'),('dapibus.ligula@Vivamusmolestiedapibus.ca',0,'Professor'),('Donec@turpisAliquamadipiscing.edu',0,'Adjunct'),('eleifend.nec@quam.co.uk',0,'Professor'),('et.magnis@ipsumdolor.edu',0,'Lecturer'),('faucibus@Suspendisse.ca',1,'Professor'),('Integer.vulputate.risus@sodalesnisimagna.ca',1,'Professor'),('magnis.dis@gravida.com',0,'Lecturer'),('Mauris.quis@semutcursus.com',0,'Lecturer'),('nascetur@metus.edu',0,'Adjunct'),('neque.Nullam@egetvariusultrices.net',0,'Lecturer'),('pede.blandit.congue@accumsannequeet.net',0,'Adjunct'),('Sed.et@ligula.co.uk',1,'Lecturer'),('Sed.id.risus@pedeetrisus.ca',1,'Adjunct'),('taciti@pretiumneque.com',1,'Lecturer'),('tellus.id.nunc@ipsum.net',1,'Professor'),('tempor.lorem.eget@scelerisque.net',1,'Adjunct'),('vel.quam.dignissim@nonlaciniaat.com',1,'Professor'),('velit.egestas@orci.ca',1,'Lecturer');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `idLocation` int(11) NOT NULL AUTO_INCREMENT,
  `locationName` varchar(255) NOT NULL,
  `locationAddress` varchar(255) NOT NULL,
  PRIMARY KEY (`idLocation`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Belk Gymnasium','5799 Donec St.'),(2,'Woodward Hall','712-8205 Nam Ave'),(3,'Student Health Center','228-2163 Sagittis Street'),(4,'Center City','Ap #862-6882 Lacus. Road'),(5,'Denny','436-9903 Sit St.'),(6,'Atkins','2332 Vivamus Av.');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `email` varchar(255) NOT NULL COMMENT 'Parent in specialization which is disjointed.',
  `name` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES ('a.arcu@malesuadaid.com','Warren Sykes','Chemistry','1247287555'),('ac.ipsum.Phasellus@eueleifend.co.uk','Tara Edwards','Psychology','4531287673'),('ac.orci.Ut@mauris.net','Amir Nichols','Tech Support','8337804998'),('ac.risus@tristiquepharetraQuisque.ca','Justin Martin','Transportation','3381983150'),('Aenean@Sednecmetus.com','Rigel Hogan','Biology','1976990702'),('Aliquam.rutrum@libero.com','Jakeem Nichols','Biology','5209162410'),('aliquet.libero@loremutaliquam.ca','Jackson Irwin','Student Affairs','2561619877'),('amet.ante@Phasellus.ca','Noel Herring','Business','5167768047'),('arcu@faucibus.co.uk','Eaton Key','Transportation','5606159572'),('at.pede.Cras@placerat.com','Cassidy Duke','Computer Science','9375252753'),('blandit.viverra.Donec@suscipitnonummyFusce.ca','Camden Morse','Transportation','7295130224'),('cursus.in.hendrerit@anteiaculis.org','Phelan Owens','Computer Science','4669424089'),('cursus.non@duiaugueeu.org','Myles Jarvis','Biology','9754694986'),('dapibus.ligula@Vivamusmolestiedapibus.ca','Kellie Tanner','Chemistry','8725153572'),('dolor.tempus.non@justo.co.uk','Germane Vincent','Psychology','1616389385'),('Donec.est.Nunc@primisinfaucibus.co.uk','Christian Ortega','Transportation','4718201265'),('Donec.est@tellusAenean.org','Rashad Patterson','Transportation','6544295743'),('Donec@turpisAliquamadipiscing.edu','Seth Hughes','Biology','2206511980'),('egestas.Aliquam.fringilla@orciUt.net','Bell Swanson','Computer Science','8203405875'),('eleifend.nec@quam.co.uk','Pearl Lindsey','Business','6876988460'),('elit.pretium.et@sitametdapibus.edu','Keith Luna','Student Affairs','6822547596'),('erat@euaccumsansed.net','Noelle Mcintyre','Transportation','1281287365'),('et.magnis@ipsumdolor.edu','Wynne Ramsey','Biology','4206275463'),('et@diamSed.com','Jescie Yates','Mathematics','5793987050'),('faucibus@Suspendisse.ca','Fay Mcguire','Computer Science','6318502011'),('feugiat@ac.ca','Price Nguyen','Biology','9167812823'),('hymenaeos.Mauris@vitaesodalesat.edu','Carol Sloan','Transportation','1647310738'),('in.faucibus.orci@Loremipsumdolor.edu','Shoshana Cash','Tech Support','7477084069'),('Integer.vulputate.risus@sodalesnisimagna.ca','Scott Tanner','Biology','2634354933'),('ipsum.non.arcu@nisinibh.com','Aiko Hammond','Transportation','1255986496'),('justo.Praesent.luctus@Phasellusinfelis.com','Bianca Bradley','Biology','8249371252'),('lacinia.at.iaculis@euismodac.com','Malcolm Whitaker','Transportation','6301294722'),('lacus.Mauris@Duismienim.org','Declan Holmes','Business','8906606478'),('libero@adipiscingfringillaporttitor.co.uk','Deborah Gillespie','Transportation','6304414006'),('libero@sedpedeCum.edu','Erin Price','Human Resources','4333882482'),('magnis.dis@gravida.com','Demetrius Compton','Psychology','7092567227'),('malesuada.vel.venenatis@Fuscemollis.org','Jonah Fields','Transportation','8763193213'),('Mauris.quis@semutcursus.com','Kimberley Craft','Psychology','2361236378'),('mauris.Suspendisse@justonec.ca','Scott Foreman','Human Resources','5964457164'),('Mauris@Crasdictum.edu','Conan Mcgowan','Transportation','2793517748'),('Morbi.quis@Quisque.com','Florence Saunders','Human Resources','2205425796'),('nascetur@metus.edu','Alexander Vang','Chemistry','9541267552'),('natoque.penatibus@sed.org','Farrah Ray','Transportation','7995741102'),('nec.mollis@PhasellusnullaInteger.org','Irene Mays','Mathematics','8774872533'),('nec.quam@eratVivamusnisi.com','Leila Cook','Transportation','1583252532'),('nec@consectetuercursuset.com','Robert Mcgee','Tech Support','8737834727'),('neque.Nullam@egetvariusultrices.net','Samuel Wynn','Psychology','3016005547'),('netus.et.malesuada@feugiat.com','Chava Walker','Business','4546935675'),('nisi.Cum.sociis@ligulaAenean.co.uk','Cameran Bean','Biology','2269807888'),('nisi.magna@tristique.co.uk','TaShya Kaufman','Tech Support','6604388129'),('Nullam.scelerisque@ametornarelectus.net','Karyn Oneal','Human Resources','8351580424'),('Nunc.commodo.auctor@faucibus.co.uk','Mari Daniel','Human Resources','9041950050'),('nunc.nulla@eleifend.org','Lee Pace','Computer Science','9474247176'),('pede.blandit.congue@accumsannequeet.net','Nero Jarvis','Computer Science','5578653907'),('pede.Cum@morbitristiquesenectus.edu','Akeem Faulkner','Human Resources','8743093629'),('Proin.nisl.sem@orciin.com','Mechelle Pruitt','Transportation','3027027801'),('Proin@sitametrisus.co.uk','Magee Dudley','Transportation','7635773632'),('purus.sapien@pedeblandit.ca','Nathaniel Murphy','Student Affairs','4082438550'),('quis.diam.Pellentesque@placerat.com','Stephanie Ewing','Transportation','4703777442'),('Quisque@montesnasceturridiculus.com','Alexander Shields','Computer Science','6323618351'),('rutrum.Fusce@intempuseu.ca','Iris Clemons','Student Affairs','7035823812'),('rutrum.magna.Cras@consequatdolor.com','Jessica Drake','Biology','6304066569'),('sapien.gravida@Nuncsed.org','Blaze Molina','Human Resources','1616387379'),('Sed.et@ligula.co.uk','Zephania Trevino','Mathematics','5489172602'),('Sed.id.risus@pedeetrisus.ca','Breanna Davis','Computer Science','7407430267'),('Sed@Proin.net','Gillian Cole','Transportation','9418878963'),('Suspendisse@malesuadamalesuadaInteger.ca','Abraham Conner','Transportation','3746356473'),('taciti@pretiumneque.com','Luke Dickson','Psychology','5634261020'),('tellus.id.nunc@ipsum.net','Jade Burt','Business','7116335276'),('tellus@nequevitaesemper.edu','Devin Ball','Tech Support','3734766566'),('tempor.lorem.eget@scelerisque.net','Mira Harper','Psychology','6002383424'),('tristique.pharetra@morbitristiquesenectus.edu','Bertha Huff','Mathematics','8462678664'),('tristique@velit.edu','Ivy Reeves','Human Resources','3771161963'),('ugt@egetmassaSuspendisse.org','Raymond Cobb','Chemistry','9654193242'),('ultrices.iaculis@Aeneaneget.ca','Paul Hall','Transportation','9092451957'),('ut.odio.vel@aliquetlibero.ca','Ezra Dudley','Student Affairs','2807905764'),('vel.quam.dignissim@nonlaciniaat.com','Rhonda Petersen','Chemistry','2805671456'),('velit.egestas@orci.ca','Christine Sharp','Chemistry','6982463167'),('Vivamus.nisi@vitaealiquam.co.uk','Phoebe Boyd','Tech Support','2131687696'),('viverra.Donec@atauctor.ca','Julie Stanley','Human Resources','8201833217');
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride`
--

DROP TABLE IF EXISTS `ride`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ride` (
  `idride` int(11) NOT NULL AUTO_INCREMENT,
  `emailCustomer` varchar(255) NOT NULL,
  `emailDriver` varchar(255) NOT NULL,
  `idlocationstart` int(11) NOT NULL,
  `idLocationEnd` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `numberPeople` int(11) NOT NULL,
  PRIMARY KEY (`idride`),
  KEY `fk_Schedule ride_drivers1_idx` (`emailDriver`),
  KEY `fk_Schedule ride_Location1_idx` (`idlocationstart`),
  KEY `fk_Schedule ride_Location2_idx` (`idLocationEnd`),
  KEY `fk_Schedule ride_persons1_idx` (`emailCustomer`),
  CONSTRAINT `fk_Schedule ride_Location1` FOREIGN KEY (`idlocationstart`) REFERENCES `locations` (`idLocation`),
  CONSTRAINT `fk_Schedule ride_Location2` FOREIGN KEY (`idLocationEnd`) REFERENCES `locations` (`idLocation`),
  CONSTRAINT `fk_Schedule ride_drivers1` FOREIGN KEY (`emailDriver`) REFERENCES `drivers` (`email`),
  CONSTRAINT `fk_Schedule ride_persons1` FOREIGN KEY (`emailCustomer`) REFERENCES `persons` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride`
--

LOCK TABLES `ride` WRITE;
/*!40000 ALTER TABLE `ride` DISABLE KEYS */;
INSERT INTO `ride` VALUES (1,'cursus.non@duiaugueeu.org','libero@adipiscingfringillaporttitor.co.uk',2,3,'2019-01-08','17:37:44',2),(2,'cursus.in.hendrerit@anteiaculis.org ','hymenaeos.Mauris@vitaesodalesat.edu ',2,5,'2019-01-15','10:36:19',1),(3,'aliquet.libero@loremutaliquam.ca ','ipsum.non.arcu@nisinibh.com ',4,5,'2019-02-08','17:05:36',1),(4,'ac.ipsum.Phasellus@eueleifend.co.uk','erat@euaccumsansed.net ',6,3,'2019-01-27','17:18:09',1),(5,'cursus.in.hendrerit@anteiaculis.org ','lacinia.at.iaculis@euismodac.com ',4,5,'2019-05-04','11:36:19',1),(6,'amet.ante@Phasellus.ca ','Donec.est.Nunc@primisinfaucibus.co.uk ',2,4,'2019-02-15','05:24:00',1),(7,'ac.ipsum.Phasellus@eueleifend.co.uk','Donec.est@tellusAenean.org ',6,5,'2019-03-08','23:10:49',1),(8,'amet.ante@Phasellus.ca ','Donec.est@tellusAenean.org ',6,1,'2019-05-13','23:10:33',1),(9,'Aliquam.rutrum@libero.com ','ipsum.non.arcu@nisinibh.com ',1,3,'2019-03-02','05:12:31',1),(10,'aliquet.libero@loremutaliquam.ca ','ipsum.non.arcu@nisinibh.com ',1,2,'2019-03-19','01:57:13',2);
/*!40000 ALTER TABLE `ride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `email` varchar(256) NOT NULL COMMENT 'Specialization',
  `position` varchar(128) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk_staff_persons1` FOREIGN KEY (`email`) REFERENCES `persons` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('ac.orci.Ut@mauris.net','Manager',0),('aliquet.libero@loremutaliquam.ca','Manager',0),('elit.pretium.et@sitametdapibus.edu','Employee',0),('in.faucibus.orci@Loremipsumdolor.edu','Employee',0),('libero@sedpedeCum.edu','Employee',0),('mauris.Suspendisse@justonec.ca','Employee',1),('Morbi.quis@Quisque.com','Employee',0),('nec@consectetuercursuset.com','Employee',1),('nisi.magna@tristique.co.uk','Manager',1),('Nullam.scelerisque@ametornarelectus.net','Manager',0),('Nunc.commodo.auctor@faucibus.co.uk','Manager',1),('pede.Cum@morbitristiquesenectus.edu','Manager',0),('purus.sapien@pedeblandit.ca','Employee',0),('rutrum.Fusce@intempuseu.ca','Manager',1),('sapien.gravida@Nuncsed.org','Manager',1),('tellus@nequevitaesemper.edu','Employee',1),('tristique@velit.edu','Employee',1),('ut.odio.vel@aliquetlibero.ca','Employee',0),('Vivamus.nisi@vitaealiquam.co.uk','Manager',1),('viverra.Donec@atauctor.ca','Employee',1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `email` varchar(256) NOT NULL COMMENT 'Specialization',
  `gradYear` int(4) NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk_students_persons1` FOREIGN KEY (`email`) REFERENCES `persons` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('a.arcu@malesuadaid.com',2025,'1988-03-09'),('ac.ipsum.Phasellus@eueleifend.co.uk',2022,'1987-12-15'),('Aenean@Sednecmetus.com',2019,'1998-10-02'),('amet.ante@Phasellus.ca',2022,'1996-08-06'),('cursus.in.hendrerit@anteiaculis.org',2021,'1997-03-28'),('cursus.non@duiaugueeu.org',2023,'1991-08-26'),('dolor.tempus.non@justo.co.uk',2023,'1997-01-03'),('egestas.Aliquam.fringilla@orciUt.net',2021,'1994-06-14'),('et@diamSed.com',2024,'1998-11-14'),('feugiat@ac.ca',2020,'1986-06-26'),('justo.Praesent.luctus@Phasellusinfelis.com',2019,'1989-05-22'),('lacus.Mauris@Duismienim.org',2021,'1985-10-01'),('nec.mollis@PhasellusnullaInteger.org',2021,'1997-01-18'),('netus.et.malesuada@feugiat.com',2023,'1993-12-06'),('nisi.Cum.sociis@ligulaAenean.co.uk',2019,'1999-07-11'),('nunc.nulla@eleifend.org',2025,'1988-08-21'),('Quisque@montesnasceturridiculus.com',2021,'1992-03-20'),('rutrum.magna.Cras@consequatdolor.com',2019,'1997-03-02'),('tristique.pharetra@morbitristiquesenectus.edu',2021,'1987-04-09'),('ugt@egetmassaSuspendisse.org',2024,'1985-06-24');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fortyniner golf cart rides'
--

--
-- Dumping routines for database 'fortyniner golf cart rides'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-16 15:10:27
