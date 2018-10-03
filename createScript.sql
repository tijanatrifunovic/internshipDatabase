CREATE DATABASE `internship` /*!40100 DEFAULT CHARACTER SET latin1 */;


CREATE TABLE `usertype` (
  `idusertype` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idusertype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `internship`.`usertype`
(`idusertype`,
`name`)
VALUES
("1", "student"),
("2", "company");


CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `idusertype` int(11) NOT NULL,
  PRIMARY KEY (`iduser`),
  KEY `idusertype_idx` (`idusertype`),
  CONSTRAINT `idusertype` FOREIGN KEY (`idusertype`) REFERENCES `usertype` (`idusertype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `company` (
  `iduser` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`),
  CONSTRAINT `idcompany` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `department` (
  `iddepartment` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`iddepartment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `internship`.`department`
(`iddepartment`,
`name`)
VALUES
("1", "Software Engineering"),
("2", "Electronics"),
("3", "Energetics"),
("4", "Computer Science and Information Theory"),
("5", "Signals and Systems"),
("6", "Telecommunications and Information Technology"),
("7", "Physical Electronics");


CREATE TABLE `student` (
  `iduser` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `indexnumber` varchar(45) NOT NULL,
  `iddepartment` int(11) NOT NULL,
  PRIMARY KEY (`iduser`),
  KEY `iddepartment_idx` (`iddepartment`),
  CONSTRAINT `iddepartment` FOREIGN KEY (`iddepartment`) REFERENCES `department` (`iddepartment`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `iduser` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `internship` (
  `idinternship` int(11) NOT NULL AUTO_INCREMENT,
  `idcompany` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `iddepartment` int(11) NOT NULL,
  `startDate` varchar(45) NOT NULL,
  `endDate` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `taken` int(11) NOT NULL,
  `idstudent` int(11) DEFAULT NULL,
  `done` int(11) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`idinternship`),
  KEY `internshipCompany_idx` (`idcompany`),
  KEY `internshipDepartment_idx` (`iddepartment`),
  KEY `internshipStudent_idx` (`idstudent`),
  CONSTRAINT `internshipCompany` FOREIGN KEY (`idcompany`) REFERENCES `company` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `internshipDepartment` FOREIGN KEY (`iddepartment`) REFERENCES `department` (`iddepartment`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `internshipStudent` FOREIGN KEY (`idstudent`) REFERENCES `student` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


