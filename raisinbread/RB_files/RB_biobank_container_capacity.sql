SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `biobank_container_capacity`;
LOCK TABLES `biobank_container_capacity` WRITE;
INSERT INTO `biobank_container_capacity` (`ContainerCapacityID`, `Quantity`, `UnitID`) VALUES (1,10.000,3);
INSERT INTO `biobank_container_capacity` (`ContainerCapacityID`, `Quantity`, `UnitID`) VALUES (2,1000.000,1);
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS=1;
