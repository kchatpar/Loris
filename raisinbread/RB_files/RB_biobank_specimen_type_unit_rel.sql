SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `biobank_specimen_type_unit_rel`;
LOCK TABLES `biobank_specimen_type_unit_rel` WRITE;
INSERT INTO `biobank_specimen_type_unit_rel` (`SpecimenTypeID`, `UnitID`) VALUES (4,1);
INSERT INTO `biobank_specimen_type_unit_rel` (`SpecimenTypeID`, `UnitID`) VALUES (5,1);
INSERT INTO `biobank_specimen_type_unit_rel` (`SpecimenTypeID`, `UnitID`) VALUES (6,1);
INSERT INTO `biobank_specimen_type_unit_rel` (`SpecimenTypeID`, `UnitID`) VALUES (8,1);
INSERT INTO `biobank_specimen_type_unit_rel` (`SpecimenTypeID`, `UnitID`) VALUES (7,2);
INSERT INTO `biobank_specimen_type_unit_rel` (`SpecimenTypeID`, `UnitID`) VALUES (1,3);
INSERT INTO `biobank_specimen_type_unit_rel` (`SpecimenTypeID`, `UnitID`) VALUES (2,3);
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS=1;
