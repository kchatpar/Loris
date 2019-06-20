SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `biobank_specimen_freezethaw`;
LOCK TABLES `biobank_specimen_freezethaw` WRITE;
INSERT INTO `biobank_specimen_freezethaw` (`SpecimenID`, `FreezeThawCycle`) VALUES (2,0);
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS=1;
