-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema fortyniner golf cart rides
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fortyniner golf cart rides
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fortyniner golf cart rides` DEFAULT CHARACTER SET utf8 ;
USE `fortyniner golf cart rides` ;

-- -----------------------------------------------------
-- Table `fortyniner golf cart rides`.`cart_models`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fortyniner golf cart rides`.`cart_models` (
  `idCart_Model` INT(11) NOT NULL AUTO_INCREMENT,
  `make` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCart_Model`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fortyniner golf cart rides`.`carts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fortyniner golf cart rides`.`carts` (
  `idCart` INT(11) NOT NULL AUTO_INCREMENT,
  `idModel` INT(11) NOT NULL,
  `numSeats` INT(11) NOT NULL,
  `extraSeats` INT(11) NOT NULL,
  PRIMARY KEY (`idCart`),
  INDEX `fk_carts_Cart_Model1_idx` (`idModel` ASC) VISIBLE,
  CONSTRAINT `fk_carts_Cart_Model1`
    FOREIGN KEY (`idModel`)
    REFERENCES `fortyniner golf cart rides`.`cart_models` (`idCart_Model`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fortyniner golf cart rides`.`persons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fortyniner golf cart rides`.`persons` (
  `email` VARCHAR(255) NOT NULL COMMENT 'Parent in specialization which is disjointed.',
  `name` VARCHAR(255) NOT NULL,
  `department` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fortyniner golf cart rides`.`drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fortyniner golf cart rides`.`drivers` (
  `email` VARCHAR(255) NOT NULL COMMENT 'Specialization',
  `carts_idCart` INT(11) NOT NULL,
  `liscensNumber` VARCHAR(12) NOT NULL,
  `dateHired` DATE NOT NULL,
  PRIMARY KEY (`email`),
  INDEX `fk_drivers_carts1_idx` (`carts_idCart` ASC) VISIBLE,
  CONSTRAINT `fk_drivers_carts1`
    FOREIGN KEY (`carts_idCart`)
    REFERENCES `fortyniner golf cart rides`.`carts` (`idCart`),
  CONSTRAINT `fk_drivers_persons1`
    FOREIGN KEY (`email`)
    REFERENCES `fortyniner golf cart rides`.`persons` (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fortyniner golf cart rides`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fortyniner golf cart rides`.`faculty` (
  `email` VARCHAR(256) NOT NULL COMMENT 'Specialization',
  `fullTime` TINYINT(4) NOT NULL,
  `title` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk_faculty_persons1`
    FOREIGN KEY (`email`)
    REFERENCES `fortyniner golf cart rides`.`persons` (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fortyniner golf cart rides`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fortyniner golf cart rides`.`locations` (
  `idLocation` INT(11) NOT NULL AUTO_INCREMENT,
  `locationName` VARCHAR(255) NOT NULL,
  `locationAddress` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idLocation`),
  INDEX `locationsNameIndex` (`locationName` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fortyniner golf cart rides`.`ride`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fortyniner golf cart rides`.`ride` (
  `idride` INT(11) NOT NULL AUTO_INCREMENT,
  `emailCustomer` VARCHAR(255) NOT NULL,
  `emailDriver` VARCHAR(255) NOT NULL,
  `idlocationstart` INT(11) NOT NULL,
  `idLocationEnd` INT(11) NOT NULL,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `numberPeople` INT(11) NOT NULL,
  PRIMARY KEY (`idride`),
  INDEX `fk_Schedule ride_drivers1_idx` (`emailDriver` ASC) VISIBLE,
  INDEX `fk_Schedule ride_Location1_idx` (`idlocationstart` ASC) VISIBLE,
  INDEX `fk_Schedule ride_Location2_idx` (`idLocationEnd` ASC) VISIBLE,
  INDEX `fk_Schedule ride_persons1_idx` (`emailCustomer` ASC) VISIBLE,
  INDEX `locationsIdIndex` (`idlocationstart` ASC, `idLocationEnd` ASC) VISIBLE,
  CONSTRAINT `fk_Schedule ride_Location1`
    FOREIGN KEY (`idlocationstart`)
    REFERENCES `fortyniner golf cart rides`.`locations` (`idLocation`),
  CONSTRAINT `fk_Schedule ride_Location2`
    FOREIGN KEY (`idLocationEnd`)
    REFERENCES `fortyniner golf cart rides`.`locations` (`idLocation`),
  CONSTRAINT `fk_Schedule ride_drivers1`
    FOREIGN KEY (`emailDriver`)
    REFERENCES `fortyniner golf cart rides`.`drivers` (`email`),
  CONSTRAINT `fk_Schedule ride_persons1`
    FOREIGN KEY (`emailCustomer`)
    REFERENCES `fortyniner golf cart rides`.`persons` (`email`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fortyniner golf cart rides`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fortyniner golf cart rides`.`staff` (
  `email` VARCHAR(256) NOT NULL COMMENT 'Specialization',
  `position` VARCHAR(128) NOT NULL,
  `admin` TINYINT(4) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk_staff_persons1`
    FOREIGN KEY (`email`)
    REFERENCES `fortyniner golf cart rides`.`persons` (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fortyniner golf cart rides`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fortyniner golf cart rides`.`students` (
  `email` VARCHAR(256) NOT NULL COMMENT 'Specialization',
  `gradYear` INT(4) NOT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk_students_persons1`
    FOREIGN KEY (`email`)
    REFERENCES `fortyniner golf cart rides`.`persons` (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `fortyniner golf cart rides` ;

-- -----------------------------------------------------
-- Placeholder table for view `fortyniner golf cart rides`.`commonendinglocations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fortyniner golf cart rides`.`commonendinglocations` (`idLocationEnd` INT, `locationName` INT, `total` INT);

-- -----------------------------------------------------
-- Placeholder table for view `fortyniner golf cart rides`.`commonstartinglocations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fortyniner golf cart rides`.`commonstartinglocations` (`idlocationstart` INT, `locationName` INT, `total` INT);

-- -----------------------------------------------------
-- procedure commonEndingLocationsProcedure
-- -----------------------------------------------------

DELIMITER $$
USE `fortyniner golf cart rides`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `commonEndingLocationsProcedure`()
BEGIN
	SELECT locationName, total
    FROM commonStartingLocations;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure commonStartingLocationsProcedure
-- -----------------------------------------------------

DELIMITER $$
USE `fortyniner golf cart rides`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `commonStartingLocationsProcedure`()
BEGIN
	SELECT locationName, total
    FROM commonStartingLocations;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `fortyniner golf cart rides`.`commonendinglocations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fortyniner golf cart rides`.`commonendinglocations`;
USE `fortyniner golf cart rides`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fortyniner golf cart rides`.`commonendinglocations` AS select `endfrequent`.`idLocationEnd` AS `idLocationEnd`,`endfrequent`.`locationName` AS `locationName`,count(0) AS `total` from (select `fortyniner golf cart rides`.`ride`.`idride` AS `idride`,`fortyniner golf cart rides`.`ride`.`emailCustomer` AS `emailCustomer`,`fortyniner golf cart rides`.`ride`.`emailDriver` AS `emailDriver`,`fortyniner golf cart rides`.`ride`.`idlocationstart` AS `idlocationstart`,`fortyniner golf cart rides`.`ride`.`idLocationEnd` AS `idLocationEnd`,`fortyniner golf cart rides`.`ride`.`date` AS `date`,`fortyniner golf cart rides`.`ride`.`time` AS `time`,`fortyniner golf cart rides`.`ride`.`numberPeople` AS `numberPeople`,`fortyniner golf cart rides`.`locations`.`idLocation` AS `idLocation`,`fortyniner golf cart rides`.`locations`.`locationName` AS `locationName`,`fortyniner golf cart rides`.`locations`.`locationAddress` AS `locationAddress` from (`fortyniner golf cart rides`.`ride` join `fortyniner golf cart rides`.`locations`)) `endfrequent` where (`endfrequent`.`idLocationEnd` = `endfrequent`.`idLocation`) group by `endfrequent`.`idLocationEnd` order by count(0) desc;

-- -----------------------------------------------------
-- View `fortyniner golf cart rides`.`commonstartinglocations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fortyniner golf cart rides`.`commonstartinglocations`;
USE `fortyniner golf cart rides`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fortyniner golf cart rides`.`commonstartinglocations` AS select `startfrequent`.`idlocationstart` AS `idlocationstart`,`startfrequent`.`locationName` AS `locationName`,count(0) AS `total` from (select `fortyniner golf cart rides`.`ride`.`idride` AS `idride`,`fortyniner golf cart rides`.`ride`.`emailCustomer` AS `emailCustomer`,`fortyniner golf cart rides`.`ride`.`emailDriver` AS `emailDriver`,`fortyniner golf cart rides`.`ride`.`idlocationstart` AS `idlocationstart`,`fortyniner golf cart rides`.`ride`.`idLocationEnd` AS `idLocationEnd`,`fortyniner golf cart rides`.`ride`.`date` AS `date`,`fortyniner golf cart rides`.`ride`.`time` AS `time`,`fortyniner golf cart rides`.`ride`.`numberPeople` AS `numberPeople`,`fortyniner golf cart rides`.`locations`.`idLocation` AS `idLocation`,`fortyniner golf cart rides`.`locations`.`locationName` AS `locationName`,`fortyniner golf cart rides`.`locations`.`locationAddress` AS `locationAddress` from (`fortyniner golf cart rides`.`ride` join `fortyniner golf cart rides`.`locations`)) `startfrequent` where (`startfrequent`.`idlocationstart` = `startfrequent`.`idLocation`) group by `startfrequent`.`idlocationstart` order by count(0) desc;
USE `fortyniner golf cart rides`;

DELIMITER $$
USE `fortyniner golf cart rides`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `fortyniner golf cart rides`.`ride_BEFORE_INSERT`
BEFORE INSERT ON `fortyniner golf cart rides`.`ride`
FOR EACH ROW
BEGIN
	declare msg varchar(255);
	declare email varchar(255);
	if new.numberPeople > 2 then 
		signal sqlstate '20000' set message_text = 'ValueError: Number of people exceeds allowable';
	end if;

	set email = (select distinct(driverSeat.email)
	from (SELECT drivers.email, carts.extraSeats FROM carts JOIN drivers 
	WHERE carts.idCart=drivers.carts_idCart) as driverSeat, persons
	WHERE driverSeat.extraSeats >= new.numberPeople
	GROUP BY driverSeat.email
	ORDER BY RAND() Limit 1);
    set new.emailDriver = email;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
