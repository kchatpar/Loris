SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `biobank_unit`;
LOCK TABLES `biobank_unit` WRITE;
INSERT INTO `biobank_unit` (`UnitID`, `Label`) VALUES (2,'10⁶/mL');
INSERT INTO `biobank_unit` (`UnitID`, `Label`) VALUES (3,'mL');
INSERT INTO `biobank_unit` (`UnitID`, `Label`) VALUES (1,'µL');
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS=1;
