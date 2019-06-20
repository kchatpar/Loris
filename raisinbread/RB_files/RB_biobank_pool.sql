SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `biobank_pool`;
LOCK TABLES `biobank_pool` WRITE;
INSERT INTO `biobank_pool` (`PoolID`, `Label`, `Quantity`, `UnitID`, `CenterID`, `Date`, `Time`) VALUES (1,'2019-05-21-green-top',80.000,3,2,'2019-05-29','09:30:00');
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS=1;
