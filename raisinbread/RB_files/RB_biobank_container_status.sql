SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `biobank_container_status`;
LOCK TABLES `biobank_container_status` WRITE;
INSERT INTO `biobank_container_status` (`ContainerStatusID`, `Label`) VALUES (1,'Available');
INSERT INTO `biobank_container_status` (`ContainerStatusID`, `Label`) VALUES (4,'Discarded');
INSERT INTO `biobank_container_status` (`ContainerStatusID`, `Label`) VALUES (3,'Dispensed');
INSERT INTO `biobank_container_status` (`ContainerStatusID`, `Label`) VALUES (2,'Reserved');
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS=1;
