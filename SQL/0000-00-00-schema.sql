-- ********************************
-- DROP TABLE (ORDER MATTERS)
-- ********************************
DROP TABLE IF EXISTS `candidate_consent_rel`;
DROP TABLE IF EXISTS `consent`;
DROP TABLE IF EXISTS `candidate_consent_history`;

DROP TABLE IF EXISTS `acknowledgements`;

DROP TABLE IF EXISTS `data_release_permissions`;
DROP TABLE IF EXISTS `data_release`;

DROP TABLE IF EXISTS `ExternalLinks`;
DROP TABLE IF EXISTS `ExternalLinkTypes`;

DROP TABLE IF EXISTS `feedback_mri_comments`;
DROP TABLE IF EXISTS `feedback_mri_predefined_comments`;
DROP TABLE IF EXISTS `feedback_mri_comment_types`;
DROP TABLE IF EXISTS `feedback_bvl_entry`;
DROP TABLE IF EXISTS `feedback_bvl_thread`;
DROP TABLE IF EXISTS `feedback_bvl_type`;

DROP TABLE IF EXISTS `genomic_cpg`;
DROP TABLE IF EXISTS `genomic_cpg_annotation`;
DROP TABLE IF EXISTS `genomic_sample_candidate_rel`;
DROP TABLE IF EXISTS `genomic_candidate_files_rel`;
DROP TABLE IF EXISTS `genomic_files`;
DROP TABLE IF EXISTS `genomic_analysis_modality_enum`;
DROP TABLE IF EXISTS `GWAS`;
DROP TABLE IF EXISTS `CNV`;
DROP TABLE IF EXISTS `SNP_candidate_rel`;
DROP TABLE IF EXISTS `SNP`;
DROP TABLE IF EXISTS `genotyping_platform`;
DROP TABLE IF EXISTS `gene`;
DROP TABLE IF EXISTS `genome_loc`;

DROP TABLE IF EXISTS `biobank_container_parent`;                                
DROP TABLE IF EXISTS `biobank_container_psc_rel`;                               
DROP TABLE IF EXISTS `biobank_specimen_pool_rel`;                               
DROP TABLE IF EXISTS `biobank_specimen_parent`;                                 
DROP TABLE IF EXISTS `biobank_specimen_type_unit_rel`;                          
DROP TABLE IF EXISTS `biobank_specimen_protocol_container_type_rel`;            
DROP TABLE IF EXISTS `biobank_specimen_type_container_type_rel`;                
DROP TABLE IF EXISTS `biobank_specimen_protocol_attribute_rel`;                 
DROP TABLE IF EXISTS `biobank_specimen_type_attribute_rel`;                     
DROP TABLE IF EXISTS `biobank_pool`;                                            
DROP TABLE IF EXISTS `biobank_specimen_attribute`;                              
DROP TABLE IF EXISTS `biobank_specimen_attribute_referencetable`;               
DROP TABLE IF EXISTS `biobank_specimen_attribute_datatype`;                     
DROP TABLE IF EXISTS `biobank_specimen_analysis`;                               
DROP TABLE IF EXISTS `biobank_specimen_preparation`;                            
DROP TABLE IF EXISTS `biobank_specimen_collection`;                             
DROP TABLE IF EXISTS `biobank_specimen_freezethaw`;                             
DROP TABLE IF EXISTS `biobank_specimen`;                                        
DROP TABLE IF EXISTS `biobank_specimen_protocol`;                               
DROP TABLE IF EXISTS `biobank_specimen_process`;                                
DROP TABLE IF EXISTS `biobank_specimen_type`;                                   
DROP TABLE IF EXISTS `biobank_container`;                                       
DROP TABLE IF EXISTS `biobank_container_status`;                                
DROP TABLE IF EXISTS `biobank_container_type`;                                  
DROP TABLE IF EXISTS `biobank_container_dimension`;                             
DROP TABLE IF EXISTS `biobank_container_capacity`;                              
DROP TABLE IF EXISTS `biobank_unit`; 

DROP TABLE IF EXISTS `parameter_session`;
DROP TABLE IF EXISTS `parameter_file`;
DROP TABLE IF EXISTS `parameter_candidate`;
DROP TABLE IF EXISTS `parameter_type_override`;
DROP TABLE IF EXISTS `parameter_type_category_rel`;
DROP TABLE IF EXISTS `parameter_type_category`;
DROP TABLE IF EXISTS `parameter_type`;

DROP TABLE IF EXISTS `issues_watching`;
DROP TABLE IF EXISTS `issues_comments_history`;
DROP TABLE IF EXISTS `issues_history`;
DROP TABLE IF EXISTS `issues_comments`;
DROP TABLE IF EXISTS `issues`;
DROP TABLE IF EXISTS `issues_categories`;

DROP TABLE IF EXISTS `media`;

DROP TABLE IF EXISTS `server_processes`;

DROP TABLE IF EXISTS `StatisticsTabs`;

DROP TABLE IF EXISTS `user_login_history`;

DROP TABLE IF EXISTS `user_account_history`;
-- TODO :: Add permissions here... because useR_perm_rel needs to be DROPed before users

DROP TABLE IF EXISTS `data_integrity_flag`;

DROP TABLE IF EXISTS `certification_training_quiz_answers`;
DROP TABLE IF EXISTS `certification_training_quiz_questions`;
DROP TABLE IF EXISTS `certification_training`;
DROP TABLE IF EXISTS `certification_history`;
DROP TABLE IF EXISTS `certification`;
DROP TABLE IF EXISTS `examiners_psc_rel`;
DROP TABLE IF EXISTS `examiners`;

DROP TABLE IF EXISTS `participant_status_history`;
DROP TABLE IF EXISTS `family`;
DROP TABLE IF EXISTS `participant_emails`;
DROP TABLE IF EXISTS `participant_accounts`;
DROP TABLE IF EXISTS `participant_status`;
DROP TABLE IF EXISTS `participant_status_options`;

DROP TABLE IF EXISTS `conflicts_resolved`;
DROP TABLE IF EXISTS `conflicts_unresolved`;


DROP TABLE IF EXISTS `notification_spool`;
DROP TABLE IF EXISTS `notification_types`;
DROP TABLE IF EXISTS `notification_history`;
DROP TABLE IF EXISTS `users_notifications_rel`;
DROP TABLE IF EXISTS `notification_modules_services_rel`;
DROP TABLE IF EXISTS `notification_services`;
DROP TABLE IF EXISTS `notification_modules`;

DROP TABLE IF EXISTS `document_repository`;
DROP TABLE IF EXISTS `document_repository_categories`;

DROP TABLE IF EXISTS `violations_resolved`;
DROP TABLE IF EXISTS `mri_violations_log`;
DROP TABLE IF EXISTS `mri_protocol_checks`;
DROP TABLE IF EXISTS `mri_upload`;
DROP TABLE IF EXISTS `MRICandidateErrors`;
DROP TABLE IF EXISTS `mri_protocol_violated_scans`;
DROP TABLE IF EXISTS `mri_protocol`;
DROP TABLE IF EXISTS `mri_acquisition_dates`;
DROP TABLE IF EXISTS `files_qcstatus`;
DROP TABLE IF EXISTS `files_intermediary`;
DROP TABLE IF EXISTS `files`;
DROP TABLE IF EXISTS `mri_scan_type`;
DROP TABLE IF EXISTS `mri_scanner`;
DROP TABLE IF EXISTS `mri_processing_protocol`;
DROP TABLE IF EXISTS `ImagingFileTypes`;

DROP TABLE IF EXISTS `tarchive_files`;
DROP TABLE IF EXISTS `tarchive_series`;
DROP TABLE IF EXISTS `tarchive`;

DROP TABLE IF EXISTS bids_mri_scan_type_rel;
DROP TABLE IF EXISTS bids_category;
DROP TABLE IF EXISTS bids_scan_type;
DROP TABLE IF EXISTS bids_scan_type_subcategory;

DROP TABLE IF EXISTS `history`;
DROP TABLE IF EXISTS `Visit_Windows`;
DROP TABLE IF EXISTS `test_battery`;
DROP TABLE IF EXISTS `flag`;
DROP TABLE IF EXISTS `instrument_subtests`;
DROP TABLE IF EXISTS `test_names`;
DROP TABLE IF EXISTS `test_subgroups`;
DROP TABLE IF EXISTS `session_status`;
DROP TABLE IF EXISTS `session`;
DROP TABLE IF EXISTS `user_psc_rel`;
DROP TABLE IF EXISTS `candidate`;
DROP TABLE IF EXISTS `caveat_options`;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `users`;
SET FOREIGN_KEY_CHECKS=1;
DROP TABLE IF EXISTS `language`;
DROP TABLE IF EXISTS `psc`;
DROP TABLE IF EXISTS `project_rel`;
DROP TABLE IF EXISTS `subproject`;
DROP TABLE IF EXISTS `Project`;
DROP TABLE IF EXISTS `visit_project_subproject_rel`;
DROP TABLE IF EXISTS `visit`;

-- ********************************
-- Core tables
-- ********************************


CREATE TABLE `Project` (
    `ProjectID` INT(2) NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NULL,
    `recruitmentTarget` INT(6) Default NULL,
    PRIMARY KEY (`ProjectID`)
) ENGINE = InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `subproject` (
    `SubprojectID` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(255) NOT NULL,
    `useEDC` boolean,
    `WindowDifference` enum('optimal', 'battery'),
    `RecruitmentTarget` int(10) unsigned,
    PRIMARY KEY (SubprojectID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Subprojects used in Loris';


INSERT INTO subproject (title, useEDC, WindowDifference) VALUES
  ('Control', false, 'optimal'),
  ('Experimental', false, 'optimal');

CREATE TABLE `project_rel` (
  `ProjectID` int(2) NOT NULL,
  `SubprojectID` int(2) NOT NULL,
  PRIMARY KEY (ProjectID, SubprojectID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `psc` (
  `CenterID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL DEFAULT '',
  `PSCArea` varchar(150) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(150) DEFAULT NULL,
  `StateID` tinyint(2) unsigned DEFAULT NULL,
  `ZIP` varchar(12) DEFAULT NULL,
  `Phone1` varchar(12) DEFAULT NULL,
  `Phone2` varchar(12) DEFAULT NULL,
  `Contact1` varchar(150) DEFAULT NULL,
  `Contact2` varchar(150) DEFAULT NULL,
  `Alias` char(3) NOT NULL DEFAULT '',
  `MRI_alias` varchar(4) NOT NULL DEFAULT '',
  `Account` varchar(8) DEFAULT NULL,
  `Study_site` enum('N','Y') DEFAULT 'Y',
  PRIMARY KEY (`CenterID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `psc` (Name, Alias, Study_site) VALUES ('Data Coordinating Center','DCC', 'Y');

CREATE TABLE `language` (
  `language_id` integer unsigned NOT NULL AUTO_INCREMENT,
  `language_code` varchar(255) NOT NULL,
  `language_label` varchar(255) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY (`language_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO language (language_code, language_label) VALUES ('en-CA', 'English');

CREATE TABLE `users` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `UserID` varchar(255) NOT NULL default '',
  `Password` varchar(255) default NULL,
  `Real_name` varchar(255) default NULL,
  `First_name` varchar(255) default NULL,
  `Last_name` varchar(255) default NULL,
  `Degree` varchar(255) default NULL,
  `Position_title` varchar(255) default NULL,
  `Institution` varchar(255) default NULL,
  `Department` varchar(255) default NULL,
  `Address` varchar(255) default NULL,
  `City` varchar(255) default NULL,
  `State` varchar(255) default NULL,
  `Zip_code` varchar(255) default NULL,
  `Country` varchar(255) default NULL,
  `Phone` varchar(15) default NULL,
  `Fax` varchar(255) default NULL,
  `Email` varchar(255) NOT NULL default '',
  `Privilege` tinyint(1) NOT NULL default '0',
  `PSCPI` enum('Y','N') NOT NULL default 'N',
  `DBAccess` varchar(10) NOT NULL default '',
  `Active` enum('Y','N') NOT NULL default 'Y',
  `Password_hash` varchar(255) default NULL,
  `Password_expiry` date NOT NULL default '1990-04-01',
  `Pending_approval` enum('Y','N') default 'Y',
  `Doc_Repo_Notifications` enum('Y','N') default 'N',
  `language_preference` integer unsigned default NULL,
  `active_from` date default NULL,
  `active_to` date default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `UserID` (`UserID`),
  CONSTRAINT `FK_users_2` FOREIGN KEY (`language_preference`) REFERENCES `language` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `users` (ID,UserID,Real_name,First_name,Last_name,Email,Privilege,PSCPI,DBAccess,Active,Pending_approval,Password_expiry)
VALUES (1,'admin','Admin account','Admin','account','admin@example.com',0,'N','','Y','N','2016-03-30');

CREATE TABLE `user_psc_rel` (
  `UserID` int(10) unsigned NOT NULL,
  `CenterID` integer unsigned NOT NULL,
  PRIMARY KEY  (`UserID`,`CenterID`),
  KEY `FK_user_psc_rel_2` (`CenterID`),
  CONSTRAINT `FK_user_psc_rel_2` FOREIGN KEY (`CenterID`) REFERENCES `psc` (`CenterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_psc_rel_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO user_psc_rel (UserID, CenterID) SELECT 1, CenterID FROM psc;

CREATE TABLE `caveat_options` (
  `ID` int(6),
  `Description` varchar(255),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `candidate` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CandID` int(6) NOT NULL DEFAULT '0',
  `PSCID` varchar(255) NOT NULL DEFAULT '',
  `ExternalID` varchar(255) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `EDC` date DEFAULT NULL,
  `Sex` enum('Male','Female') DEFAULT NULL,
  `RegistrationCenterID` integer unsigned NOT NULL DEFAULT '0',
  `ProjectID` int(11) DEFAULT NULL,
  `Ethnicity` varchar(255) DEFAULT NULL,
  `Active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `Date_active` date DEFAULT NULL,
  `RegisteredBy` varchar(255) DEFAULT NULL,
  `UserID` varchar(255) NOT NULL DEFAULT '',
  `Date_registered` date DEFAULT NULL,
  `flagged_caveatemptor` enum('true','false') DEFAULT 'false',
  `flagged_reason` int(6) DEFAULT NULL,
  `flagged_other` varchar(255) DEFAULT NULL,
  `flagged_other_status` enum('not_answered') DEFAULT NULL,
  `Testdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Entity_type` enum('Human','Scanner') NOT NULL DEFAULT 'Human',
  `ProbandSex` enum('Male','Female') DEFAULT NULL,
  `ProbandDoB` date DEFAULT NULL,
  PRIMARY KEY (`CandID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `ExternalID` (`ExternalID`),
  KEY `FK_candidate_1` (`RegistrationCenterID`),
  KEY `CandidateActive` (`Active`),
  KEY `FK_candidate_2_idx` (`flagged_reason`),
  KEY `PSCID` (`PSCID`),
  CONSTRAINT `FK_candidate_1` FOREIGN KEY (`RegistrationCenterID`) REFERENCES `psc` (`CenterID`),
  CONSTRAINT `FK_candidate_2` FOREIGN KEY (`flagged_reason`) REFERENCES `caveat_options` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `session` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CandID` int(6) NOT NULL DEFAULT '0',
  `CenterID` integer unsigned NOT NULL,
  `VisitNo` smallint(5) unsigned DEFAULT NULL,
  `Visit_label` varchar(255) NOT NULL,
  `SubprojectID` int(11) DEFAULT NULL,
  `Submitted` enum('Y','N') DEFAULT NULL,
  `Current_stage` enum('Not Started','Screening','Visit','Approval','Subject','Recycling Bin') DEFAULT NULL,
  `Date_stage_change` date DEFAULT NULL,
  `Screening` enum('Pass','Failure','Withdrawal','In Progress') DEFAULT NULL,
  `Date_screening` date DEFAULT NULL,
  `Visit` enum('Pass','Failure','Withdrawal','In Progress') DEFAULT NULL,
  `Date_visit` date DEFAULT NULL,
  `Approval` enum('In Progress','Pass','Failure') DEFAULT NULL,
  `Date_approval` date DEFAULT NULL,
  `Active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `Date_active` date DEFAULT NULL,
  `RegisteredBy` varchar(255) DEFAULT NULL,
  `UserID` varchar(255) NOT NULL DEFAULT '',
  `Date_registered` date DEFAULT NULL,
  `Testdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Hardcopy_request` enum('-','N','Y') NOT NULL DEFAULT '-',
  `BVLQCStatus` enum('Complete') DEFAULT NULL,
  `BVLQCType` enum('Visual','Hardcopy') DEFAULT NULL,
  `BVLQCExclusion` enum('Excluded','Not Excluded') DEFAULT NULL,
  `QCd` enum('Visual','Hardcopy') DEFAULT NULL,
  `Scan_done` enum('N','Y') DEFAULT NULL,
  `MRIQCStatus` enum('','Pass','Fail') NOT NULL DEFAULT '',
  `MRIQCPending` enum('Y','N') NOT NULL DEFAULT 'N',
  `MRIQCFirstChangeTime` datetime DEFAULT NULL,
  `MRIQCLastChangeTime` datetime DEFAULT NULL,
  `MRICaveat` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`ID`),
  KEY `session_candVisit` (`CandID`,`VisitNo`),
  KEY `FK_session_2` (`CenterID`),
  KEY `SessionSubproject` (`SubprojectID`),
  KEY `SessionActive` (`Active`),
  CONSTRAINT `FK_session_1` FOREIGN KEY (`CandID`) REFERENCES `candidate` (`CandID`),
  CONSTRAINT `FK_session_2` FOREIGN KEY (`CenterID`) REFERENCES `psc` (`CenterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table holding session information';

CREATE TABLE `session_status` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SessionID` int(10) unsigned NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `session_status_index` (`SessionID`,`Name`),
  CONSTRAINT `fk_session_status_1` FOREIGN KEY (`SessionID`) REFERENCES `session` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used if SupplementalSessionStatus configSettings is true';

CREATE TABLE `test_subgroups` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `Subgroup_name` varchar(255) default NULL,
  `group_order` tinyint(4) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO test_subgroups (Subgroup_name) VALUES ('Instruments'),('Imaging');

CREATE TABLE `test_names` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Test_name` varchar(255) default NULL,
  `Full_name` varchar(255) default NULL,
  `Sub_group` int(11) unsigned default NULL,
  `IsDirectEntry` boolean default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `Test_name` (`Test_name`),
  KEY `FK_test_names_1` (`Sub_group`),
  CONSTRAINT `FK_test_names_1` FOREIGN KEY (`Sub_group`) REFERENCES `test_subgroups` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `instrument_subtests` (
  `ID` int(11) NOT NULL auto_increment,
  `Test_name` varchar(255) NOT NULL default '',
  `Subtest_name` varchar(255) NOT NULL default '',
  `Description` varchar(255) NOT NULL default '',
  `Order_number` int(11) NOT NULL default '0',
  UNIQUE KEY `unique_index` (`Test_name`, `Subtest_name`),
  PRIMARY KEY  (`ID`),
  KEY `FK_instrument_subtests_1` (`Test_name`),
  CONSTRAINT `FK_instrument_subtests_1` FOREIGN KEY (`Test_name`) REFERENCES `test_names` (`Test_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `flag` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `SessionID` int(10) unsigned NOT NULL default '0',
  `Test_name` varchar(255) NOT NULL default '',
  `CommentID` varchar(255) NOT NULL default '',
  `Data_entry` enum('In Progress','Complete') default NULL,
  `Administration` enum('None','Partial','All') default NULL,
  `Validity` enum('Questionable','Invalid','Valid') default NULL,
  `Exclusion` enum('Fail','Pass') default NULL,
  `Flag_status` enum('P','Y','N','F') default NULL,
  `UserID` varchar(255) default NULL,
  `Testdate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `Data` TEXT default NULL,
  PRIMARY KEY  (`CommentID`),
  KEY `Status` (`Flag_status`),
  KEY `flag_ID` (`ID`),
  KEY `flag_SessionID` (`SessionID`),
  KEY `flag_Test_name` (`Test_name`),
  KEY `flag_Exclusion` (`Exclusion`),
  KEY `flag_Data_entry` (`Data_entry`),
  KEY `flag_Validity` (`Validity`),
  KEY `flag_Administration` (`Administration`),
  KEY `flag_UserID` (`UserID`),
  CONSTRAINT `FK_flag_1` FOREIGN KEY (`SessionID`) REFERENCES `session` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_flag_2` FOREIGN KEY (`Test_name`) REFERENCES `test_names` (`Test_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `history` (
  `id` int(11) NOT NULL auto_increment,
  `tbl` varchar(255) NOT NULL default '',
  `col` varchar(255) NOT NULL default '',
  `old` text,
  `new` text,
  `primaryCols` text,
  `primaryVals` text,
  `changeDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `userID` varchar(255) NOT NULL default '',
  `type` char(1),
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps track of ongoing changes in the database. ';

CREATE TABLE `test_battery` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Test_name` varchar(255) NOT NULL default '',
  `AgeMinDays` int(10) unsigned default NULL,
  `AgeMaxDays` int(10) unsigned default NULL,
  `Active` enum('Y','N') NOT NULL default 'Y',
  `Stage` varchar(255) default NULL,
  `SubprojectID` int(11) default NULL,
  `Visit_label` varchar(255) default NULL,
  `CenterID` int(11) default NULL,
  `firstVisit` enum('Y','N') default NULL,
  `instr_order` tinyint(4) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `age_test` (`AgeMinDays`,`AgeMaxDays`,`Test_name`),
  KEY `FK_test_battery_1` (`Test_name`),
  CONSTRAINT `FK_test_battery_1` FOREIGN KEY (`Test_name`) REFERENCES `test_names` (`Test_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Visit_Windows` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Visit_label` varchar(255) DEFAULT NULL,
  `WindowMinDays` int(11) DEFAULT NULL,
  `WindowMaxDays` int(11) DEFAULT NULL,
  `OptimumMinDays` int(11) DEFAULT NULL,
  `OptimumMaxDays` int(11) DEFAULT NULL,
  `WindowMidpointDays` int(11) DEFAULT NULL,
   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ********************************
-- tarchive tables
-- ********************************


CREATE TABLE `tarchive` (
  `DicomArchiveID` varchar(255) NOT NULL default '',
  `PatientID` varchar(255) NOT NULL default '',
  `PatientName` varchar(255) NOT NULL default '',
  `PatientDoB` date default NULL,
  `PatientSex` varchar(255) default NULL,
  `neurodbCenterName` varchar(255) default NULL,
  `CenterName` varchar(255) NOT NULL default '',
  `LastUpdate` datetime default NULL,
  `DateAcquired` date default NULL,
  `DateFirstArchived` datetime default NULL,
  `DateLastArchived` datetime default NULL,
  `AcquisitionCount` int(11) NOT NULL default '0',
  `NonDicomFileCount` int(11) NOT NULL default '0',
  `DicomFileCount` int(11) NOT NULL default '0',
  `md5sumDicomOnly` varchar(255) default NULL,
  `md5sumArchive` varchar(255) default NULL,
  `CreatingUser` varchar(255) NOT NULL default '',
  `sumTypeVersion` tinyint(4) NOT NULL default '0',
  `tarTypeVersion` tinyint(4) default NULL,
  `SourceLocation` varchar(255) NOT NULL default '',
  `ArchiveLocation` varchar(255) default NULL,
  `ScannerManufacturer` varchar(255) NOT NULL default '',
  `ScannerModel` varchar(255) NOT NULL default '',
  `ScannerSerialNumber` varchar(255) NOT NULL default '',
  `ScannerSoftwareVersion` varchar(255) NOT NULL default '',
  `SessionID` int(10) unsigned default NULL,
  `uploadAttempt` tinyint(4) NOT NULL default '0',
  `CreateInfo` text,
  `AcquisitionMetadata` longtext NOT NULL,
  `TarchiveID` int(11) NOT NULL auto_increment,
  `DateSent` datetime DEFAULT NULL,
  `PendingTransfer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY  (`TarchiveID`),
  KEY `SessionID` (`SessionID`),
  CONSTRAINT `FK_tarchive_sessionID`
    FOREIGN KEY (`SessionID`) REFERENCES `session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tarchive_series` (
  `TarchiveSeriesID` int(11) NOT NULL auto_increment,
  `TarchiveID` int(11) NOT NULL default '0',
  `SeriesNumber` int(11) NOT NULL default '0',
  `SeriesDescription` varchar(255) default NULL,
  `SequenceName` varchar(255) default NULL,
  `EchoTime` double default NULL,
  `RepetitionTime` double default NULL,
  `InversionTime` double default NULL,
  `SliceThickness` double default NULL,
  `PhaseEncoding` varchar(255) default NULL,
  `NumberOfFiles` int(11) NOT NULL default '0',
  `SeriesUID` varchar(255) default NULL,
  `Modality` ENUM ('MR', 'PT') default NULL,
  PRIMARY KEY  (`TarchiveSeriesID`),
  KEY `TarchiveID` (`TarchiveID`),
  CONSTRAINT `tarchive_series_ibfk_1` FOREIGN KEY (`TarchiveID`) REFERENCES `tarchive` (`TarchiveID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tarchive_files` (
  `TarchiveFileID` int(11) NOT NULL auto_increment,
  `TarchiveID` int(11) NOT NULL default '0',
  `TarchiveSeriesID` INT(11) DEFAULT NULL,
  `SeriesNumber` int(11) default NULL,
  `FileNumber` int(11) default NULL,
  `EchoNumber` int(11) default NULL,
  `SeriesDescription` varchar(255) default NULL,
  `Md5Sum` varchar(255) NOT NULL,
  `FileName` varchar(255) NOT NULL,
  PRIMARY KEY  (`TarchiveFileID`),
  KEY `TarchiveID` (`TarchiveID`),
  KEY `TarchiveSeriesID` (`TarchiveSeriesID`),
  CONSTRAINT `tarchive_files_ibfk_1` FOREIGN KEY (`TarchiveID`) REFERENCES `tarchive` (`TarchiveID`) ON DELETE CASCADE,
  CONSTRAINT `tarchive_files_TarchiveSeriesID_fk` FOREIGN KEY (`TarchiveSeriesID`) REFERENCES `tarchive_series` (`TarchiveSeriesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ********************************
-- Imaging tables
-- ********************************


CREATE TABLE `ImagingFileTypes` (
 `type` varchar(12) NOT NULL PRIMARY KEY,
 `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `ImagingFileTypes` (type, description) VALUES
  ('mnc',      'MINC file'),
  ('obj',      'MNI BIC imaging format for a surface'),
  ('xfm',      'MNI BIC linear transformation matrix file'),
  ('vertstat', 'MNI BIC imaging format for a field on a surface (e.g. cortical thickness)'),
  ('xml',      'XML file'),
  ('txt',      'text file'),
  ('nii',      'NIfTI file'),
  ('nrrd',     'NRRD file format (used by DTIPrep)'),
  ('grid_0',   'MNI BIC non-linear field for non-linear transformation');

CREATE TABLE `mri_processing_protocol` (
  `ProcessProtocolID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProtocolFile` varchar(255) NOT NULL DEFAULT '',
  `FileType` varchar(12) DEFAULT NULL,
  `Tool` varchar(255) NOT NULL DEFAULT '',
  `InsertTime` int(10) unsigned NOT NULL DEFAULT '0',
  `md5sum` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ProcessProtocolID`),
  CONSTRAINT `FK_mri_processing_protocol_FileTypes` FOREIGN KEY (`FileType`) REFERENCES `ImagingFileTypes`(`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mri_scanner` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `Manufacturer` varchar(255) default NULL,
  `Model` varchar(255) default NULL,
  `Serial_number` varchar(255) default NULL,
  `Software` varchar(255) default NULL,
  `CandID` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_mri_scanner_1` (`CandID`),
  CONSTRAINT `FK_mri_scanner_1` FOREIGN KEY (`CandID`) REFERENCES `candidate` (`CandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET @OLD_SQL_MODE=@@SQL_MODE;
SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';


INSERT INTO `mri_scanner` (ID) VALUES (0);

SET SQL_MODE=@OLD_SQL_MODE;

CREATE TABLE `mri_scan_type` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `Scan_type` text NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

INSERT INTO `mri_scan_type` VALUES
    (40,'fMRI'),
    (41,'flair'),
    (44,'t1'),
    (45,'t2'),
    (46,'pd'),
    (47,'mrs'),
    (48,'dti'),
    (49,'t1relx'),
    (50,'dct2e1'),
    (51,'dct2e2'),
    (52,'scout'),
    (53,'tal_msk'),
    (54,'cocosco_cls'),
    (55,'clean_cls'),
    (56,'em_cls'),
    (57,'seg'),
    (58,'white_matter'),
    (59,'gray_matter'),
    (60,'csf_matter'),
    (61,'nlr_masked'),
    (62,'pve'),
    (999,'unknown'),
    (1000,'NA');

CREATE TABLE `files` (
  `FileID` int(10) unsigned NOT NULL auto_increment,
  `SessionID` int(10) unsigned NOT NULL default '0',
  `File` varchar(255) NOT NULL default '',
  `SeriesUID` varchar(64) DEFAULT NULL,
  `EchoTime` double DEFAULT NULL,
  `CoordinateSpace` varchar(255) default NULL,
  `OutputType` varchar(255) NOT NULL default '',
  `AcquisitionProtocolID` int(10) unsigned default NULL,
  `FileType` varchar(12) default NULL,
  `InsertedByUserID` varchar(255) NOT NULL default '',
  `InsertTime` int(10) unsigned NOT NULL default '0',
  `SourcePipeline` varchar(255),
  `PipelineDate` date,
  `SourceFileID` int(10) unsigned DEFAULT '0',
  `ProcessProtocolID` int(11) unsigned,
  `Caveat` tinyint(1) default NULL,
  `TarchiveSource` int(11) default NULL,
  `ScannerID` int(10) unsigned default NULL,
  `AcqOrderPerModality` int(11) default NULL,
  PRIMARY KEY  (`FileID`),
  KEY `file` (`File`),
  KEY `sessionid` (`SessionID`),
  KEY `outputtype` (`OutputType`),
  KEY `filetype_outputtype` (`FileType`,`OutputType`),
  KEY `AcquiIndex` (`AcquisitionProtocolID`,`SessionID`),
  KEY `scannerid` (`ScannerID`),
  KEY `tarchivesource` (`TarchiveSource`),
  CONSTRAINT `FK_files_2` FOREIGN KEY (`AcquisitionProtocolID`) REFERENCES `mri_scan_type` (`ID`),
  CONSTRAINT `FK_files_1` FOREIGN KEY (`SessionID`) REFERENCES `session` (`ID`),
  CONSTRAINT `FK_files_3` FOREIGN KEY (`SourceFileID`) REFERENCES `files` (`FileID`),
  CONSTRAINT `FK_files_4` FOREIGN KEY (`ProcessProtocolID`) REFERENCES `mri_processing_protocol` (`ProcessProtocolID`),
  CONSTRAINT `FK_files_FileTypes` FOREIGN KEY (`FileType`) REFERENCES `ImagingFileTypes`(`type`),
  CONSTRAINT `FK_files_scannerID` FOREIGN KEY (`ScannerID`) REFERENCES `mri_scanner` (`ID`),
  CONSTRAINT `FK_files_TarchiveID` FOREIGN KEY (`TarchiveSource`) REFERENCES `tarchive` (`TarchiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `files_intermediary` (
  `IntermedID` int(11) NOT NULL AUTO_INCREMENT,
  `Output_FileID` int(10) unsigned NOT NULL,
  `Input_FileID` int(10) unsigned NOT NULL,
  `Tool` varchar(255) NOT NULL,
  PRIMARY KEY (`IntermedID`),
  KEY `FK_files_intermediary_1` (`Output_FileID`),
  KEY `FK_files_intermediary_2` (`Input_FileID`),
  CONSTRAINT `FK_files_intermediary_1` FOREIGN KEY (`Output_FileID`) REFERENCES `files` (`FileID`),
  CONSTRAINT `FK_files_intermediary_2` FOREIGN KEY (`Input_FileID`) REFERENCES `files` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `files_qcstatus` (
    `FileQCID` int(11) auto_increment,
    `FileID` int(10) UNSIGNED UNIQUE NULL,
    `SeriesUID` varchar(64) DEFAULT NULL,
    `EchoTime` double DEFAULT NULL,
    `QCStatus` enum('Pass', 'Fail'),
    `QCFirstChangeTime` int(10) unsigned,
    `QCLastChangeTime` int(10) unsigned,
    `Selected` enum('true', 'false') DEFAULT NULL,
    PRIMARY KEY (`FileQCID`),
    KEY (`FileID`),
    CONSTRAINT `FK_filesqcstatus_FileID`
      FOREIGN KEY (`FileID`) REFERENCES `files` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mri_acquisition_dates` (
  `SessionID` int(10) unsigned NOT NULL default '0',
  `AcquisitionDate` date default NULL,
  PRIMARY KEY  (`SessionID`),
  CONSTRAINT `FK_mri_acquisition_dates_1` FOREIGN KEY (`SessionID`) REFERENCES `session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mri_protocol` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `Center_name` varchar(4) NOT NULL default '',
  `ScannerID` int(10) unsigned NOT NULL default '0',
  `Scan_type` int(10) unsigned NOT NULL default '0',
  `TR_min` DECIMAL(10,4) DEFAULT NULL,
  `TR_max` DECIMAL(10,4) DEFAULT NULL,
 	`TE_min` DECIMAL(10,4) DEFAULT NULL,
 	`TE_max` DECIMAL(10,4) DEFAULT NULL,
 	`TI_min` DECIMAL(10,4) DEFAULT NULL,
 	`TI_max` DECIMAL(10,4) DEFAULT NULL,
 	`slice_thickness_min` DECIMAL(9,4) DEFAULT NULL,
 	`slice_thickness_max` DECIMAL(9,4) DEFAULT NULL,
 	`xspace_min` int(4) DEFAULT NULL,
 	`xspace_max` int(4) DEFAULT NULL,
 	`yspace_min` int(4) DEFAULT NULL,
 	`yspace_max` int(4) DEFAULT NULL,
 	`zspace_min` int(4) DEFAULT NULL,
 	`zspace_max` int(4) DEFAULT NULL,
 	`xstep_min` DECIMAL(9,4) DEFAULT NULL,
 	`xstep_max` DECIMAL(9,4) DEFAULT NULL,
  `ystep_min` DECIMAL(9,4) DEFAULT NULL,
  `ystep_max` DECIMAL(9,4) DEFAULT NULL,
  `zstep_min` DECIMAL(9,4) DEFAULT NULL,
  `zstep_max` DECIMAL(9,4) DEFAULT NULL,
 	`time_min` int(4) DEFAULT NULL,
 	`time_max` int(4) DEFAULT NULL,
  `series_description_regex` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_mri_protocol_1` (`ScannerID`),
  CONSTRAINT `FK_mri_protocol_1` FOREIGN KEY (`ScannerID`) REFERENCES `mri_scanner` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;


INSERT INTO mri_protocol (Center_name,Scan_type,TR_min,TR_max,TE_min,
 TE_max,time_min,time_max) VALUES
   ('ZZZZ',48,8000,14000,80,130,0,200),
   ('ZZZZ',40,1900,2700,10,30,0,500),
   ('ZZZZ',44,2000,2500,2,5,NULL,NULL),
   ('ZZZZ',45,3000,9000,100,550,NULL,NULL);

CREATE TABLE `mri_upload` (
  `UploadID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UploadedBy` varchar(255) NOT NULL DEFAULT '',
  `UploadDate` DateTime DEFAULT NULL,
  `UploadLocation` varchar(255) NOT NULL DEFAULT '',
  `DecompressedLocation` varchar(255) NOT NULL DEFAULT '',
  `InsertionComplete` tinyint(1) NOT NULL DEFAULT '0',
  `Inserting` tinyint(1) DEFAULT NULL,
  `PatientName` varchar(255) NOT NULL DEFAULT '',
  `number_of_mincInserted` int(11) DEFAULT NULL,
  `number_of_mincCreated` int(11) DEFAULT NULL,
  `TarchiveID` int(11) DEFAULT NULL,
  `SessionID` int(10) unsigned DEFAULT NULL,
  `IsCandidateInfoValidated` tinyint(1) DEFAULT NULL,
  `IsTarchiveValidated` tinyint(1) NOT NULL DEFAULT '0',
  `IsPhantom` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`UploadID`),
  KEY (`SessionID`),
  KEY (`TarchiveID`),
  CONSTRAINT `FK_mriupload_SessionID`
    FOREIGN KEY (`SessionID`) REFERENCES `session` (`ID`),
  CONSTRAINT `FK_mriupload_TarchiveID`
    FOREIGN KEY (`TarchiveID`) REFERENCES `tarchive` (`TarchiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mri_protocol_checks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Scan_type` int(11) unsigned DEFAULT NULL,
  `Severity` enum('warning','exclude') DEFAULT NULL,
  `Header` varchar(255) DEFAULT NULL,
  `ValidMin` int(4) DEFAULT NULL,
  `ValidMax` int(4) DEFAULT NULL,
  `ValidRegex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY (`Scan_type`),
  CONSTRAINT `FK_mriProtocolChecks_ScanType`
    FOREIGN KEY (`Scan_type`) REFERENCES `mri_scan_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ********************************
-- BIDS tables
-- ********************************

CREATE TABLE `bids_category` (
 `BIDSCategoryID`   int(3)      UNSIGNED NOT NULL AUTO_INCREMENT,
 `BIDSCategoryName` varchar(10)          NOT NULL UNIQUE,
 PRIMARY KEY (`BIDSCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `bids_category` (BIDSCategoryName) VALUES
      ('anat'),
      ('func'),
      ('dwi'),
      ('fmap');

CREATE TABLE `bids_scan_type_subcategory` (
  `BIDSScanTypeSubCategoryID` int(3)       UNSIGNED NOT NULL AUTO_INCREMENT,
  `BIDSScanTypeSubCategory`   varchar(100)          NOT NULL UNIQUE,
  PRIMARY KEY (`BIDSScanTypeSubCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `bids_scan_type_subcategory` (BIDSScanTypeSubCategory) VALUES
  ('task-rest');

CREATE TABLE `bids_scan_type` (
  `BIDSScanTypeID` int(3)       UNSIGNED NOT NULL AUTO_INCREMENT,
  `BIDSScanType`   varchar(100)          NOT NULL UNIQUE,
  PRIMARY KEY (`BIDSScanTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `bids_scan_type` (BIDSScanType) VALUES
  ('bold'),
  ('FLAIR'),
  ('T1w'),
  ('T2w'),
  ('dwi');

CREATE TABLE `bids_mri_scan_type_rel` (
  `MRIScanTypeID`             int(10) UNSIGNED NOT NULL,
  `BIDSCategoryID`            int(3)  UNSIGNED DEFAULT NULL,
  `BIDSScanTypeSubCategoryID` int(3)  UNSIGNED DEFAULT NULL,
  `BIDSScanTypeID`            int(3)  UNSIGNED DEFAULT NULL,
  `BIDSEchoNumber`            int(3)  UNSIGNED DEFAULT NULL,
  PRIMARY KEY  (`MRIScanTypeID`),
  KEY `FK_bids_mri_scan_type_rel` (`MRIScanTypeID`),
  CONSTRAINT `FK_bids_mri_scan_type_rel`     FOREIGN KEY (`MRIScanTypeID`)             REFERENCES `mri_scan_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bids_category`              FOREIGN KEY (`BIDSCategoryID`)            REFERENCES `bids_category`(`BIDSCategoryID`),
  CONSTRAINT `FK_bids_scan_type_subcategory` FOREIGN KEY (`BIDSScanTypeSubCategoryID`) REFERENCES `bids_scan_type_subcategory` (`BIDSScanTypeSubCategoryID`),
  CONSTRAINT `FK_bids_scan_type`             FOREIGN KEY (`BIDSScanTypeID`)            REFERENCES `bids_scan_type` (`BIDSScanTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Default schema scan types; make some of them named in a BIDS compliant manner
INSERT INTO bids_mri_scan_type_rel
  (MRIScanTypeID, BIDSCategoryID, BIDSScanTypeSubCategoryID, BIDSScanTypeID, BIDSEchoNumber)
  VALUES
  (
    (SELECT ID FROM mri_scan_type WHERE Scan_type = 'flair'),
    (SELECT BIDSCategoryID FROM bids_category WHERE BIDSCategoryName='anat'),
    NULL,
    (SELECT BIDSScanTypeID FROM bids_scan_type WHERE BIDSSCanType='FLAIR'),
    NULL
  ),
  (
    (SELECT ID FROM mri_scan_type WHERE Scan_type = 'fMRI'),
    (SELECT BIDSCategoryID FROM bids_category WHERE BIDSCategoryName='func'),
    (SELECT BIDSScanTypeSubCategoryID FROM bids_scan_type_subcategory WHERE BIDSScanTypeSubCategory='task-rest'),
    (SELECT BIDSScanTypeID FROM bids_scan_type WHERE BIDSSCanType='bold'),
    NULL
  ),
  (
    (SELECT ID FROM mri_scan_type WHERE Scan_type = 't1'),
    (SELECT BIDSCategoryID FROM bids_category WHERE BIDSCategoryName='anat'),
    NULL,
    (SELECT BIDSScanTypeID FROM bids_scan_type WHERE BIDSSCanType='T1w'),
    NULL
  ),
  (
    (SELECT ID FROM mri_scan_type WHERE Scan_type = 't2'),
    (SELECT BIDSCategoryID FROM bids_category WHERE BIDSCategoryName='anat'),
    NULL,
    (SELECT BIDSScanTypeID FROM bids_scan_type WHERE BIDSSCanType='T2w'),
    NULL
  ),
  (
    (SELECT ID FROM mri_scan_type WHERE Scan_type = 'dti'),
    (SELECT BIDSCategoryID FROM bids_category WHERE BIDSCategoryName='dwi'),
    NULL,
    (SELECT BIDSScanTypeID FROM bids_scan_type WHERE BIDSSCanType='dwi'),
    NULL
  );

-- ********************************
-- MRI violations tables
-- ********************************


CREATE TABLE `MRICandidateErrors` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeRun` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SeriesUID` varchar(64) DEFAULT NULL,
  `TarchiveID` int(11) DEFAULT NULL,
  `MincFile` varchar(255) DEFAULT NULL,
  `PatientName` varchar(255) DEFAULT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_tarchive_MRICandidateError_1`
    FOREIGN KEY (`TarchiveID`) REFERENCES `tarchive` (`TarchiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mri_violations_log` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeRun` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SeriesUID` varchar(64) DEFAULT NULL,
  `TarchiveID` int(11) DEFAULT NULL,
  `MincFile` varchar(255) DEFAULT NULL,
  `PatientName` varchar(255) DEFAULT NULL,
  `CandID` int(6) DEFAULT NULL,
  `Visit_label` varchar(255) DEFAULT NULL,
  `CheckID` int(11) DEFAULT NULL,
  `Scan_type` int(11) unsigned DEFAULT NULL,
  `Severity` enum('warning','exclude') DEFAULT NULL,
  `Header` varchar(255) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `ValidRange` varchar(255) DEFAULT NULL,
  `ValidRegex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LogID`),
  CONSTRAINT `FK_tarchive_mriViolationsLog_1`
    FOREIGN KEY (`TarchiveID`) REFERENCES `tarchive` (`TarchiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `violations_resolved` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) NOT NULL,
  `ExtID` bigint(20) NOT NULL,
  `TypeTable` varchar(255) DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `ChangeDate` datetime DEFAULT NULL,
  `Resolved` enum('unresolved', 'reran', 'emailed', 'inserted', 'rejected', 'inserted_flag', 'other') DEFAULT 'unresolved',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mri_protocol_violated_scans` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CandID` int(6),
  `PSCID` varchar(255),
  `TarchiveID` int(11),
  `time_run` datetime,
  `series_description` varchar(255) DEFAULT NULL,
  `minc_location` varchar(255),
  `PatientName` varchar(255) DEFAULT NULL,
  `TR_range` varchar(255) DEFAULT NULL,
  `TE_range` varchar(255) DEFAULT NULL,
  `TI_range` varchar(255) DEFAULT NULL,
  `slice_thickness_range` varchar(255) DEFAULT NULL,
  `xspace_range` varchar(255) DEFAULT NULL,
  `yspace_range` varchar(255) DEFAULT NULL,
  `zspace_range` varchar(255) DEFAULT NULL,
  `xstep_range` varchar(255) DEFAULT NULL,
  `ystep_range` varchar(255) DEFAULT NULL,
  `zstep_range` varchar(255) DEFAULT NULL,
  `time_range` varchar(255)  DEFAULT NULL,
  `SeriesUID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TarchiveID` (`TarchiveID`),
  CONSTRAINT `FK_mri_violated_1` FOREIGN KEY (`TarchiveID`) REFERENCES `tarchive` (`TarchiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ********************************
-- document_repository tables
-- ********************************


CREATE TABLE `document_repository_categories` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `parent_id` int(3) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `document_repository` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `PSCID` varchar(255) DEFAULT NULL,
  `Instrument` varchar(255) DEFAULT NULL,
  `visitLabel` varchar(255) DEFAULT NULL,
  `Date_taken` date DEFAULT NULL,
  `Date_uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Data_dir` varchar(255) DEFAULT NULL,
  `File_name` varchar(255) DEFAULT NULL,
  `File_type` varchar(20) DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `File_size` bigint(20) unsigned DEFAULT NULL,
  `uploaded_by` varchar(255) DEFAULT NULL,
  `For_site` int(2) DEFAULT NULL,
  `comments` text,
  `multipart` enum('Yes','No') DEFAULT NULL,
  `EARLI` tinyint(1) DEFAULT '0',
  `hide_video` tinyint(1) DEFAULT '0',
  `File_category` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `fk_document_repository_1_idx` (`File_category`),
  CONSTRAINT `fk_document_repository_1` FOREIGN KEY (`File_category`) REFERENCES `document_repository_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- Notification tables
-- ********************************


CREATE TABLE `notification_types` (
  `NotificationTypeID` int(11) NOT NULL auto_increment,
  `Type` varchar(255) NOT NULL default '',
  `private` tinyint(1) default '0',
  `Description` text,
  PRIMARY KEY  (`NotificationTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `notification_types` (Type,private,Description) VALUES
    ('mri new study',0,'New studies processed by the MRI upload handler'),
    ('mri new series',0,'New series processed by the MRI upload handler'),
    ('mri upload handler emergency',1,'MRI upload handler emergencies'),
    ('mri staging required',1,'New studies received by the MRI upload handler that require staging'),
    ('mri invalid study',0,'Incorrectly labelled studies received by the MRI upload handler'),
    ('hardcopy request',0,'Hardcopy requests'),
    ('visual bvl qc',0,'Timepoints selected for visual QC'),
    ('mri qc status',0,'MRI QC Status change'),
    ('minc insertion',1,'Insertion of a MINC file into the MRI tables (files/parameter_file)'),
    ('tarchive loader',1,'calls specific Insertion Scripts'),
    ('tarchive validation',1,'Validation of the dicoms After uploading'),
    ('mri upload runner',1,'Validation of DICOMS before uploading'),
    ('mri upload processing class',1,'Validation and execution of DicomTar.pl and TarchiveLoader'),
    ('imaging non minc file insertion', 1, 'Insertion of a non-MINC file into the MRI tables (files/parameter_file)');

CREATE TABLE `notification_spool` (
  `NotificationID` int(11) NOT NULL auto_increment,
  `NotificationTypeID` int(11) NOT NULL default '0',
  `ProcessID` int(11) NOT NULL DEFAULT '0',
  `TimeSpooled` datetime DEFAULT NULL,
  `Message` text,
  `Error` enum('Y','N') default NULL,
  `Verbose` enum('Y','N') NOT NULL DEFAULT 'N',
  `Sent` enum('N','Y') NOT NULL default 'N',
  `CenterID` integer unsigned default NULL,
  `Origin` varchar(255) DEFAULT NULL,
  PRIMARY KEY  (`NotificationID`),
  KEY `FK_notification_spool_1` (`NotificationTypeID`),
  KEY `FK_notification_spool_2` (`CenterID`),
  CONSTRAINT `FK_notification_spool_2` FOREIGN KEY (`CenterID`) REFERENCES `psc` (`CenterID`),
  CONSTRAINT `FK_notification_spool_1` FOREIGN KEY (`NotificationTypeID`) REFERENCES `notification_types` (`NotificationTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `notification_modules` (
  `id` int(10) unsigned auto_increment NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `operation_type` varchar(100) NOT NULL,
  `as_admin` enum('Y','N') NOT NULL DEFAULT 'N',
  `template_file` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY (`module_name`),
  UNIQUE(module_name,operation_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `notification_services` (
  `id` int(10) unsigned auto_increment NOT NULL,
  `service` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE(service)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Associates modules with the service available for each
CREATE TABLE `notification_modules_services_rel` (
  `module_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`module_id`,`service_id`),
  KEY `FK_notification_modules_services_rel_1` (`module_id`),
  KEY `FK_notification_modules_services_rel_2` (`service_id`),
  CONSTRAINT `FK_notification_modules_services_rel_1` FOREIGN KEY (`module_id`) REFERENCES `notification_modules` (`id`),
  CONSTRAINT `FK_notification_modules_services_rel_2` FOREIGN KEY (`service_id`) REFERENCES `notification_services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- saves users preferences for notification type
CREATE TABLE `users_notifications_rel` (
  `user_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`module_id`,`service_id`),
  KEY `FK_notifications_users_rel_1` (`user_id`),
  KEY `FK_notifications_users_rel_2` (`module_id`),
  KEY `FK_notifications_users_rel_3` (`service_id`),
  CONSTRAINT `FK_notifications_users_rel_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_notifications_users_rel_2` FOREIGN KEY (`module_id`) REFERENCES `notification_modules` (`id`),
  CONSTRAINT `FK_notifications_users_rel_3` FOREIGN KEY (`service_id`) REFERENCES `notification_services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- history log
CREATE TABLE `notification_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `date_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trigger_user` int(10) unsigned NOT NULL,
  `target_user` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notification_history_1` (`trigger_user`),
  KEY `FK_notification_history_2` (`target_user`),
  CONSTRAINT `FK_notification_history_1` FOREIGN KEY (`trigger_user`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notification_history_2` FOREIGN KEY (`target_user`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- basic notification service
INSERT INTO notification_services (service) VALUES
('email_text');

-- Pre-implemented notifications
INSERT INTO notification_modules (module_name, operation_type, as_admin, template_file, description) VALUES
  ('media', 'upload', 'N', 'notifier_media_upload.tpl', 'Media: New File Uploaded'),
  ('media', 'download', 'N', 'notifier_media_download.tpl', 'Media: File Downloaded'),
  ('document_repository', 'new_category', 'N', 'notifier_document_repository_new_category.tpl', 'Document Repository: New Category'),
  ('document_repository', 'upload', 'N', 'notifier_document_repository_upload.tpl', 'Document Repository: New Document Uploaded'),
  ('document_repository', 'delete', 'N', 'notifier_document_repository_delete.tpl', 'Document Repository: Document Deleted'),
  ('document_repository', 'edit', 'N', 'notifier_document_repository_edit.tpl', 'Document Repository: Document Edited');

-- enable doc repo basic text emails
INSERT INTO notification_modules_services_rel SELECT nm.id, ns.id FROM notification_modules nm JOIN notification_services ns WHERE nm.module_name='document_repository' AND ns.service='email_text';

-- Transfer Document repository notifications to new system
INSERT INTO users_notifications_rel SELECT u.ID, nm.id, ns.id FROM users u JOIN notification_modules nm JOIN notification_services ns WHERE nm.module_name='document_repository' AND ns.service='email_text' AND u.Doc_Repo_Notifications='Y';


-- ********************************
-- conflict_resolver tables
-- ********************************


CREATE TABLE `conflicts_unresolved` (
  `ConflictID` int(10) NOT NULL AUTO_INCREMENT,
  `TableName` varchar(255) NOT NULL,
  `ExtraKeyColumn` varchar(255) DEFAULT NULL,
  `ExtraKey1` varchar(255) NOT NULL,
  `ExtraKey2` varchar(255) NOT NULL,
  `FieldName` varchar(255) NOT NULL,
  `CommentId1` varchar(255) NOT NULL,
  `Value1` text DEFAULT NULL,
  `CommentId2` varchar(255) NOT NULL,
  `Value2` text DEFAULT NULL,
  PRIMARY KEY (`ConflictID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `conflicts_resolved` (
  `ResolvedID` int(10) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(255) NOT NULL,
  `ResolutionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `User1` varchar(255) DEFAULT NULL,
  `User2` varchar(255) DEFAULT NULL,
  `TableName` varchar(255) NOT NULL,
  `ExtraKeyColumn` varchar(255) DEFAULT NULL,
  `ExtraKey1` varchar(255) NOT NULL DEFAULT '',
  `ExtraKey2` varchar(255) NOT NULL DEFAULT '',
  `FieldName` varchar(255) NOT NULL,
  `CommentId1` varchar(255) NOT NULL,
  `CommentId2` varchar(255) NOT NULL,
  `OldValue1` text DEFAULT NULL,
  `OldValue2` text DEFAULT NULL,
  `NewValue` text DEFAULT NULL,
  `ConflictID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ResolvedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- candidate_parameter tables
-- ********************************


CREATE TABLE `participant_status_options` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  `Required` tinyint(1) DEFAULT NULL,
  `parentID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `participant_status_options` (Description, Required) VALUES
  ('Active',0),
  ('Refused/Not Enrolled',0),
  ('Ineligible',0),
  ('Excluded',0),
  ('Inactive',1),
  ('Incomplete',1),
  ('Complete',0);

INSERT INTO `participant_status_options` (Description, Required, parentID) VALUES
  ('Unsure',NULL,@tmp_val),
  ('Requiring Further Investigation',NULL,@tmp_val),
  ('Not Responding',NULL,@tmp_val);
SET @tmp_val = NULL;

INSERT INTO `participant_status_options` (Description, Required, parentID) VALUES
  ('Death',NULL,@tmp_val),
  ('Lost to Followup',NULL,@tmp_val);
SET @tmp_val = NULL;

CREATE TABLE `participant_status` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CandID` int(6) NOT NULL DEFAULT '0',
  `UserID` varchar(255) DEFAULT NULL,
  `entry_staff` varchar(255) DEFAULT NULL,
  `data_entry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `participant_status` int(10) unsigned DEFAULT NULL,
  `participant_suboptions` int(10) unsigned DEFAULT NULL,
  `reason_specify` text,
  `reason_specify_status` enum('dnk','not_applicable','refusal','not_answered') DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CandID` (`CandID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `fk_participant_status_1_idx` (`participant_status`),
  KEY `fk_participant_status_2_idx` (`participant_suboptions`),
  CONSTRAINT `fk_participant_status_1` FOREIGN KEY (`participant_status`) REFERENCES `participant_status_options` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_participant_status_2` FOREIGN KEY (`participant_suboptions`) REFERENCES `participant_status_options` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_participant_status_3` FOREIGN KEY (`CandID`) REFERENCES `candidate` (`CandID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `participant_accounts` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SessionID` int(6) DEFAULT NULL,
  `Test_name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` enum('Created','Sent','In Progress','Complete') DEFAULT NULL,
  `OneTimePassword` varchar(16) DEFAULT NULL,
  `CommentID` varchar(255) DEFAULT NULL,
  `UserEaseRating` varchar(1) DEFAULT NULL,
  `UserComments` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `participant_emails` (
  `Test_name` varchar(255) NOT NULL,
  `DefaultEmail` mediumtext,
  PRIMARY KEY (`Test_name`),
  CONSTRAINT `fk_participant_emails_1` FOREIGN KEY (`Test_name`) REFERENCES `test_names` (`Test_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

CREATE TABLE `participant_status_history` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CandID` int(6) NOT NULL DEFAULT '0',
  `entry_staff` varchar(255) DEFAULT NULL,
  `data_entry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `participant_status` int(11) DEFAULT NULL,
  `reason_specify` varchar(255) DEFAULT NULL,
  `reason_specify_status` enum('not_answered') DEFAULT NULL,
  `participant_subOptions` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `family` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FamilyID` int(6) NOT NULL,
  `CandID` int(6) NOT NULL,
  `Relationship_type` enum('half_sibling','full_sibling','1st_cousin') DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- Training tables
-- ********************************


CREATE TABLE `examiners` (
  `examinerID` int(10) unsigned NOT NULL auto_increment,
  `full_name` varchar(255) default NULL,
  `radiologist` tinyint(1) default 0 NOT NULL,
  `userID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY  (`examinerID`),
  UNIQUE KEY `full_name` (`full_name`),
  KEY `FK_examiners_2` (`userID`),
  CONSTRAINT `FK_examiners_2` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `examiners_psc_rel` (
  `examinerID` int(10) unsigned NOT NULL,
  `centerID` integer unsigned NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `pending_approval` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY  (`examinerID`,`centerID`),
  KEY `FK_examiners_psc_rel_2` (`centerID`),
  CONSTRAINT `FK_examiners_psc_rel_1` FOREIGN KEY (`examinerID`) REFERENCES `examiners` (`examinerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_examiners_psc_rel_2` FOREIGN KEY (`centerID`) REFERENCES `psc` (`CenterID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `certification` (
  `certID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `examinerID` int(10) unsigned NOT NULL DEFAULT '0',
  `date_cert` date DEFAULT NULL,
  `visit_label` varchar(255) DEFAULT NULL,
  `testID` int(10) UNSIGNED NOT NULL,
  `pass` enum('not_certified','in_training','certified') DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`certID`,`testID`),
  CONSTRAINT `FK_certifcation_1` FOREIGN KEY (`testID`) REFERENCES `test_names` (`ID`),
  CONSTRAINT `FK_certifcation_2` FOREIGN KEY (`examinerID`) REFERENCES `examiners` (`examinerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `certification_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `col` varchar(255) NOT NULL DEFAULT '',
  `old` text,
  `old_date` date DEFAULT NULL,
  `new` text,
  `new_date` date DEFAULT NULL,
  `primaryCols` varchar(255) DEFAULT 'certID',
  `primaryVals` text,
  `testID` int(3) DEFAULT NULL,
  `visit_label` varchar(255) DEFAULT NULL,
  `changeDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` varchar(255) NOT NULL DEFAULT '',
  `type` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='primaryVals should always contain a valid certID from the certification table';

CREATE TABLE `certification_training` (
    `ID` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `TestID` int(10) UNSIGNED NOT NULL,
    `Title` varchar(255) NOT NULL,
    `Content` text,
    `TrainingType` enum('text', 'pdf', 'video', 'quiz') NOT NULL,
    `OrderNumber` INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY (`ID`),
    CONSTRAINT `FK_certification_training` FOREIGN KEY (`TestID`) REFERENCES `test_names` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `certification_training_quiz_questions` (
    `ID` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `TestID` int(10) unsigned NOT NULL,
    `Question` varchar(255) NOT NULL,
    `OrderNumber` INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY (`ID`),
    CONSTRAINT `FK_certification_training_quiz_questions` FOREIGN KEY (`TestID`) REFERENCES `test_names` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `certification_training_quiz_answers` (
    `ID` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `QuestionID` INTEGER UNSIGNED NOT NULL,
    `Answer` varchar(255) NOT NULL,
    `Correct` boolean NOT NULL,
    `OrderNumber` INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY (`ID`),
    CONSTRAINT `FK_certification_training_quiz_answers` FOREIGN KEY (`QuestionID`) REFERENCES `certification_training_quiz_questions` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- data_intergrity_flag tables
-- ********************************


CREATE TABLE `data_integrity_flag` (
  `dataflag_id` int(11) NOT NULL AUTO_INCREMENT,
  `dataflag_visitlabel` varchar(255) NOT NULL,
  `dataflag_instrument` varchar(255) NOT NULL,
  `dataflag_date` date NOT NULL,
  `dataflag_status` int(11) NOT NULL,
  `dataflag_comment` text,
  `latest_entry` tinyint(1) NOT NULL DEFAULT '1',
  `dataflag_fbcreated` int(11) NOT NULL DEFAULT '0',
  `dataflag_fbclosed` int(11) NOT NULL DEFAULT '0',
  `dataflag_fbcomment` int(11) NOT NULL DEFAULT '0',
  `dataflag_fbdeleted` int(11) NOT NULL DEFAULT '0',
  `dataflag_userid` varchar(255) NOT NULL,
  PRIMARY KEY (`dataflag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- user_account_history tables
-- ********************************


CREATE TABLE `user_account_history` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserID` varchar(255) NOT NULL DEFAULT '',
  `PermID` int(10) unsigned DEFAULT NULL,
  `PermAction` enum('I','D') DEFAULT NULL,
  `ChangeDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- user_login_history tables
-- ********************************


CREATE TABLE `user_login_history` (
  `loginhistoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` varchar(255) NOT NULL DEFAULT '',
  `Success` enum('Y','N') NOT NULL DEFAULT 'Y',
  `Failcode` varchar(2) DEFAULT NULL,
  `Fail_detail` varchar(255) DEFAULT NULL,
  `Login_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IP_address` varchar(255) DEFAULT NULL,
  `Page_requested` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`loginhistoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- StatisticsTabs tables
-- ********************************


CREATE TABLE `StatisticsTabs` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ModuleName` varchar(255) NOT NULL,
  `SubModuleName` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `OrderNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores list of tabs for the statistics module';


INSERT INTO StatisticsTabs (ModuleName, SubModuleName, Description, OrderNo) VALUES
  ('statistics', 'stats_general', 'General Description', 1),
  ('statistics', 'stats_demographic', 'Demographic Statistics', 2),
  ('statistics', 'stats_behavioural', 'Behavioural Statistics', 3),
  ('statistics', 'stats_MRI', 'Imaging Statistics', 4);

-- ********************************
-- server_processes tables
-- ********************************


CREATE TABLE `server_processes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL,
  `type` enum('mri_upload') NOT NULL,
  `stdout_file` varchar(255) DEFAULT NULL,
  `stderr_file` varchar(255) DEFAULT NULL,
  `exit_code_file` varchar(255) DEFAULT NULL,
  `exit_code` varchar(255) DEFAULT NULL,
  `userid` varchar(255) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `exit_text` text,
  PRIMARY KEY (`id`),
  KEY `FK_task_1` (`userid`),
  CONSTRAINT `FK_task_1` FOREIGN KEY (`userid`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `instrument` varchar(255) DEFAULT NULL,
  `date_taken` date DEFAULT NULL,
  `comments` text,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `data_dir` varchar(255) NOT NULL,
  `uploaded_by` varchar(255) DEFAULT NULL,
  `hide_file` tinyint(1) DEFAULT '0',
  `date_uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `language_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_name` (`file_name`),
  FOREIGN KEY (`session_id`) REFERENCES `session` (`ID`),
  FOREIGN KEY (`instrument`) REFERENCES `test_names` (`Test_name`),
  CONSTRAINT `FK_media_language` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- issues tables
-- ********************************


CREATE TABLE `issues_categories` (
  `categoryID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categoryName` (`categoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO issues_categories (categoryName) VALUES
  ('Behavioural Battery'),
  ('Behavioural Instruments'),
  ('Data Entry'),
  ('Examiners'),
  ('Imaging'),
  ('Technical Issue'),
  ('User Accounts'),
  ('Other');

CREATE TABLE `issues` (
  `issueID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `reporter` varchar(255) NOT NULL DEFAULT '',
  `assignee` varchar(255) DEFAULT NULL,
  `status` enum('new','acknowledged','feedback','assigned','resolved','closed') NOT NULL DEFAULT 'new',
  `priority` enum('low','normal','high','urgent','immediate') NOT NULL DEFAULT 'low',
  `module` int(10) unsigned DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdatedBy` varchar(255) DEFAULT NULL,
  `sessionID` int(10) unsigned DEFAULT NULL,
  `centerID` integer unsigned DEFAULT NULL,
  `candID` int(6) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issueID`),
  KEY `fk_issues_1` (`reporter`),
  KEY `fk_issues_2` (`assignee`),
  KEY `fk_issues_3` (`candID`),
  KEY `fk_issues_4` (`sessionID`),
  KEY `fk_issues_5` (`centerID`),
  KEY `fk_issues_6` (`lastUpdatedBy`),
  KEY `fk_issues_8` (`category`),
  CONSTRAINT `fk_issues_8` FOREIGN KEY (`category`) REFERENCES `issues_categories` (`categoryName`),
  CONSTRAINT `fk_issues_1` FOREIGN KEY (`reporter`) REFERENCES `users` (`UserID`),
  CONSTRAINT `fk_issues_2` FOREIGN KEY (`assignee`) REFERENCES `users` (`UserID`),
  CONSTRAINT `fk_issues_3` FOREIGN KEY (`candID`) REFERENCES `candidate` (`CandID`),
  CONSTRAINT `fk_issues_4` FOREIGN KEY (`sessionID`) REFERENCES `session` (`ID`),
  CONSTRAINT `fk_issues_5` FOREIGN KEY (`centerID`) REFERENCES `psc` (`CenterID`),
  CONSTRAINT `fk_issues_6` FOREIGN KEY (`lastUpdatedBy`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `issues_history` (
  `issueHistoryID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `newValue` longtext NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fieldChanged` enum('assignee','status','comment','sessionID','centerID','title','category','module','lastUpdatedBy','priority','candID') NOT NULL DEFAULT 'comment',
  `issueID` int(11) unsigned NOT NULL,
  `addedBy` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`issueHistoryID`),
  KEY `fk_issues_comments_1` (`issueID`),
  CONSTRAINT `fk_issues_comments_1` FOREIGN KEY (`issueID`) REFERENCES `issues` (`issueID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `issues_comments` (
  `issueCommentID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `issueID` int(11) unsigned NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `addedBy` varchar(255) NOT NULL DEFAULT '',
  `issueComment` text NOT NULL,
  PRIMARY KEY (`issueCommentID`),
  KEY `fk_issue_comments_1` (`issueID`),
  CONSTRAINT `fk_issue_comments_1` FOREIGN KEY (`issueID`) REFERENCES `issues` (`issueID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `issues_comments_history` (
  `issueCommentHistoryID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `issueCommentID` int(11) unsigned NOT NULL,
  `dateEdited` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `newValue` longtext NOT NULL,
  `editedBy` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`issueCommentHistoryID`),
  KEY `fk_issues_comments_history` (`issueCommentID`),
  CONSTRAINT `fk_issues_comments_history` FOREIGN KEY (`issueCommentID`) REFERENCES `issues_comments` (`issueCommentID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `issues_watching` (
  `userID` varchar(255) NOT NULL DEFAULT '',
  `issueID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`userID`,`issueID`),
  KEY `fk_issues_watching_2` (`issueID`),
  CONSTRAINT `fk_issues_watching_1` FOREIGN KEY (`userID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- parameter tables
-- ********************************


CREATE TABLE `parameter_type` (
  `ParameterTypeID` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(255) NOT NULL default '',
  `Type` text,
  `Description` text,
  `RangeMin` double default NULL,
  `RangeMax` double default NULL,
  `SourceField` text,
  `SourceFrom` text,
  `SourceCondition` text,
  `CurrentGUITable` varchar(255) default NULL,
  `Queryable` tinyint(1) default '1',
  `IsFile` tinyint(1) default '0',
  PRIMARY KEY  (`ParameterTypeID`),
  KEY `name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='dictionary of all the variables in the project';


INSERT INTO `parameter_type` VALUES
  (2,'Geometric_distortion','text',NULL,NULL,NULL,NULL,'parameter_file',NULL,NULL,0,0),
  (3,'Intensity_artifact','text',NULL,NULL,NULL,NULL,'parameter_file',NULL,NULL,0,0),
  (4,'Movement_artifacts_within_scan','text',NULL,NULL,NULL,NULL,'parameter_file',NULL,NULL,0,0),
  (5,'Movement_artifacts_between_packets','text',NULL,NULL,NULL,NULL,'parameter_file',NULL,NULL,0,0),
  (6,'Coverage','text',NULL,NULL,NULL,NULL,'parameter_file',NULL,NULL,0,0),
  (7,'md5hash','varchar(255)','md5hash magically created by NeuroDB::File',NULL,NULL,'parameter_file.Value','parameter_file',NULL,'quat_table_1',1,0),
  (8,'Color_Artifact','text',NULL,NULL,NULL,NULL,'parameter_file',NULL,NULL,0,0),
  (9,'Entropy','text',NULL,NULL,NULL,NULL,'parameter_file',NULL,NULL,0,0);


INSERT INTO parameter_type (Name, Type, Description, RangeMin, RangeMax, SourceField, SourceFrom, CurrentGUITable, Queryable, SourceCondition) VALUES
  ('candidate_label','text','Identifier_of_candidate',null,null,'PSCID','candidate',null,1,null),
  ('Visit_label','varchar(255)','Visit_label',null,null,'visit_label','session',null,1,null),
  ('candidate_dob','date','Candidate_Dob',null,null,'DoB','candidate',null,1,null);

CREATE TABLE `parameter_type_category` (
  `ParameterTypeCategoryID` int(11) unsigned NOT NULL auto_increment,
  `Name` varchar(255) default NULL,
  `Type` enum('Metavars','Instrument') default 'Metavars',
  PRIMARY KEY  (`ParameterTypeCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `parameter_type_category` (Name, Type) VALUES
  ('MRI Variables','Metavars'),
  ('Identifiers', 'Metavars'),
  ('Electrophysiology Variables', 'Metavars');

CREATE TABLE `parameter_type_category_rel` (
  `ParameterTypeID` int(11) unsigned NOT NULL default '0',
  `ParameterTypeCategoryID` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ParameterTypeCategoryID`,`ParameterTypeID`),
  KEY `FK_parameter_type_category_rel_1` (`ParameterTypeID`),
  CONSTRAINT `FK_parameter_type_category_rel_2` FOREIGN KEY (`ParameterTypeCategoryID`) REFERENCES `parameter_type_category` (`ParameterTypeCategoryID`),
  CONSTRAINT `FK_parameter_type_category_rel_1` FOREIGN KEY (`ParameterTypeID`) REFERENCES `parameter_type` (`ParameterTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO parameter_type_category_rel (ParameterTypeID,ParameterTypeCategoryID)
  SELECT pt.ParameterTypeID,ptc.ParameterTypeCategoryID
  FROM parameter_type pt,parameter_type_category ptc
  WHERE ptc.Name='Identifiers' AND pt.Name IN ('candidate_label', 'Visit_label','candidate_dob');

CREATE TABLE `parameter_candidate` (
  `ParameterCandidateID` int(10) unsigned NOT NULL auto_increment,
  `CandID` int(6) NOT NULL default '0',
  `ParameterTypeID` int(10) unsigned NOT NULL default '0',
  `Value` varchar(255) default NULL,
  `InsertTime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ParameterCandidateID`),
  KEY `candidate_type` (`CandID`,`ParameterTypeID`),
  KEY `parameter_value` (`ParameterTypeID`,`Value`(64)),
  CONSTRAINT `FK_parameter_candidate_2` FOREIGN KEY (`CandID`) REFERENCES `candidate` (`CandID`),
  CONSTRAINT `FK_parameter_candidate_1` FOREIGN KEY (`ParameterTypeID`) REFERENCES `parameter_type` (`ParameterTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='per-candidate equivalent of parameter_session';

CREATE TABLE `parameter_file` (
  `ParameterFileID` int(10) unsigned NOT NULL auto_increment,
  `FileID` int(10) unsigned NOT NULL default '0',
  `ParameterTypeID` int(10) unsigned NOT NULL default '0',
  `Value` longtext,
  `InsertTime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ParameterFileID`),
  UNIQUE KEY `file_type_uniq` (`FileID`,`ParameterTypeID`),
  KEY `parameter_value` (`ParameterTypeID`,`Value`(64)),
  CONSTRAINT `FK_parameter_file_2` FOREIGN KEY (`ParameterTypeID`) REFERENCES `parameter_type` (`ParameterTypeID`),
  CONSTRAINT `FK_parameter_file_1` FOREIGN KEY (`FileID`) REFERENCES `files` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `parameter_session` (
  `ParameterSessionID` int(10) unsigned NOT NULL auto_increment,
  `SessionID` int(10) unsigned NOT NULL default '0',
  `ParameterTypeID` int(10) unsigned NOT NULL default '0',
  `Value` varchar(255) default NULL,
  `InsertTime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ParameterSessionID`),
  KEY `session_type` (`SessionID`,`ParameterTypeID`),
  KEY `parameter_value` (`ParameterTypeID`,`Value`(64)),
  CONSTRAINT `FK_parameter_session_2` FOREIGN KEY (`ParameterTypeID`) REFERENCES `parameter_type` (`ParameterTypeID`),
  CONSTRAINT `FK_parameter_session_1` FOREIGN KEY (`SessionID`) REFERENCES `session` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `parameter_type_override` (
  `Name` varchar(255) NOT NULL,
  `Description` text,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- biobank tables
-- ********************************

-- Creates --

/*Global*/

CREATE TABLE `biobank_unit` (
  `UnitID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(20) NOT NULL UNIQUE,
  CONSTRAINT `PK_biobank_unit` PRIMARY KEY (`UnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/*Container*/

CREATE TABLE `biobank_container_capacity` (
  `ContainerCapacityID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Quantity` decimal(10, 3) NOT NULL,
  `UnitID` integer unsigned NOT NULL,
  CONSTRAINT `PK_biobank_container_capacity` PRIMARY KEY (`ContainerCapacityID`),
  CONSTRAINT `FK_biobank_container_capacity_UnitID`
    FOREIGN KEY (`UnitID`) REFERENCES `biobank_unit`(`UnitID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `UK_biobank_container_capacity_Quantity_UnitID` UNIQUE(`Quantity`, `UnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_container_dimension` (
  `ContainerDimensionID` integer unsigned NOT NULL AUTO_INCREMENT,
  `X` integer unsigned NOT NULL,
  `XNumerical` BIT(1) NOT NULL,
  `Y` integer unsigned NOT NULL,
  `YNumerical` BIT(1) NOT NULL,
  `Z` integer unsigned NOT NULL,
  `ZNumerical` BIT(1) NOT NULL,
  CONSTRAINT `PK_biobank_container_dimension` PRIMARY KEY (`ContainerDimensionID`),
  CONSTRAINT `UK_biobank_container_dimension_X_Y_Z` UNIQUE(`X`, `Y`, `Z`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_container_type` (
  `ContainerTypeID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Brand` varchar(50) NOT NULL,
  `ProductNumber` varchar(50) NOT NULL,
  `Label` varchar(40) NOT NULL,
  `Primary` BIT(1) NOT NULL,
  `ContainerCapacityID` integer unsigned,
  `ContainerDimensionID` integer unsigned,
  CONSTRAINT `PK_biobank_container_type` PRIMARY KEY (`ContainerTypeID`),
  CONSTRAINT `FK_biobank_container_type_CapacityID`
    FOREIGN KEY (`ContainerCapacityID`) REFERENCES `biobank_container_capacity`(`ContainerCapacityID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_container_type_DimensionID`
    FOREIGN KEY (`ContainerDimensionID`) REFERENCES `biobank_container_dimension`(`ContainerDimensionID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `UK_biobank_container_type_Brand_ProductNumber` UNIQUE(`Brand`, `ProductNumber`),
  CONSTRAINT `UK_biobank_container_type_Label` UNIQUE (`Label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* Should this be simply biobank_status since it applies to both containers and specimen? */
CREATE TABLE `biobank_container_status` (
  `ContainerStatusID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(40) NOT NULL,
  CONSTRAINT `PK_biobank_container_status` PRIMARY KEY (`ContainerStatusID`),
  CONSTRAINT `UK_biobank_container_status_Label` UNIQUE (`Label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_container` (
  `ContainerID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Barcode` varchar(40) NOT NULL, /*index by barcode*/
  `ContainerTypeID` integer unsigned NOT NULL,
  `Temperature` decimal(5, 2) NOT NULL DEFAULT 20,
  `ContainerStatusID` integer unsigned NOT NULL,
  `OriginCenterID` integer unsigned NOT NULL,
  `CurrentCenterID` integer unsigned NOT NULL,
  `DateTimeCreate` DATETIME NOT NULL DEFAULT NOW(),
  `DateTimeUpdate` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  CONSTRAINT `PK_biobank_container` PRIMARY KEY (`ContainerID`),
  CONSTRAINT `FK_biobank_container_ContainerTypeID`
    FOREIGN KEY (`ContainerTypeID`) REFERENCES `biobank_container_type`(`ContainerTypeID`)  
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_container_ContainerStatusID`
    FOREIGN KEY (`ContainerStatusID`) REFERENCES `biobank_container_status`(`ContainerStatusID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_container_OriginCenterID`
    FOREIGN KEY (`OriginCenterID`) REFERENCES `psc`(`CenterID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_container_CurrentCenterID`
    FOREIGN KEY (`CurrentCenterID`) REFERENCES `psc`(`CenterID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `UK_biobank_container_Barcode` UNIQUE (`Barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/*Specimen*/
CREATE TABLE `biobank_specimen_type` (
  `SpecimenTypeID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(50) NOT NULL,
  `FreezeThaw` BIT(1) NOT NULL,
  `ParentSpecimenTypeID` integer unsigned,
  `Regex` varchar(100),
  CONSTRAINT `PK_biobank_specimen_type` PRIMARY KEY (`SpecimenTypeID`),
  CONSTRAINT `FK_biobank_specimen_type_ParentSpecimenTypeID`
    FOREIGN KEY (`ParentSpecimenTypeID`) REFERENCES `biobank_specimen_type`(`SpecimenTypeID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `UK_biobank_specimen_type_Label` UNIQUE (`Label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_process` (
  `SpecimenProcessID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(50) NOT NULL,
  CONSTRAINT `PK_biobank_specimen_process` PRIMARY KEY (`SpecimenProcessID`),
  CONSTRAINT `UK_biobank_specimen_process_Label` UNIQUE (`Label`)
);

CREATE TABLE `biobank_specimen_protocol` (
  `SpecimenProtocolID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(50) NOT NULL,
  `SpecimenProcessID` integer unsigned NOT NULL,
  `SpecimenTypeID` integer unsigned NOT NULL,
  CONSTRAINT `PK_biobank_specimen_protocol` PRIMARY KEY (`SpecimenProtocolID`),
  CONSTRAINT `FK_biobank_specimen_protocol_SpecimenProcessID`
    FOREIGN KEY (`SpecimenProcessID`) REFERENCES `biobank_specimen_process`(`SpecimenProcessID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_protocol_SpecimenTypeID`
    FOREIGN KEY (`SpecimenTypeID`) REFERENCES `biobank_specimen_type`(`SpecimenTypeID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `UK_biobank_specimen_protocol_Label` UNIQUE (`Label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 

CREATE TABLE `biobank_specimen` (
  `SpecimenID` integer unsigned NOT NULL AUTO_INCREMENT,
  `ContainerID` integer unsigned NOT NULL, /*Index by ContainerID*/
  `SpecimenTypeID` integer unsigned NOT NULL,
  `Quantity` DECIMAL(10, 3) NOT NULL,
  `UnitID` integer unsigned NOT NULL,
  `SessionID` integer unsigned UNSIGNED NOT NULL,
  CONSTRAINT `PK_biobank_specimen` PRIMARY KEY (`SpecimenID`),
  CONSTRAINT `FK_biobank_specimen_ContainerID`
    FOREIGN KEY (`ContainerID`) REFERENCES `biobank_container`(`ContainerID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_SpecimenTypeID` 
    FOREIGN KEY (`SpecimenTypeID`) REFERENCES `biobank_specimen_type`(`SpecimenTypeID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_UnitID` 
    FOREIGN KEY (`UnitID`) REFERENCES `biobank_unit` (`UnitID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_SessionID`
    FOREIGN KEY (`SessionID`) REFERENCES `session`(`ID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `UK_biobank_specimen_ContainerID` UNIQUE (`ContainerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_freezethaw` (
  `SpecimenID` integer unsigned NOT NULL,
  `FreezeThawCycle` integer unsigned NOT NULL,
  CONSTRAINT `PK_biobank_specimen_freezethaw` PRIMARY KEY (`SpecimenID`),
  CONSTRAINT `FK_biobank_specimen_freezethaw_SpecimenID`
    FOREIGN KEY (`SpecimenID`) REFERENCES `biobank_specimen`(`SpecimenID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_collection` (
  `SpecimenID` integer unsigned NOT NULL,
  `SpecimenProtocolID` integer unsigned NOT NULL,
  `Quantity` DECIMAL(10, 3) NOT NULL,
  `UnitID` integer unsigned NOT NULL,
  `CenterID` integer unsigned NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  `Comments` varchar(255),
  `Data` json DEFAULT NULL,
  CONSTRAINT `PK_biobank_specimen_collection` PRIMARY KEY (`SpecimenID`),
  CONSTRAINT `FK_biobank_specimen_collection_SpecimenID`
    FOREIGN KEY (`SpecimenID`) REFERENCES `biobank_specimen`(`SpecimenID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_collection_SpecimenProtocolID`
    FOREIGN KEY (`SpecimenProtocolID`) REFERENCES `biobank_specimen_protocol`(`SpecimenProtocolID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_collection_UnitID`
    FOREIGN KEY (`UnitID`) REFERENCES `biobank_unit`(`UnitID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_collection_CenterID`
    FOREIGN KEY (`CenterID`) REFERENCES `psc`(`CenterID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_preparation` (
  `SpecimenID` integer unsigned NOT NULL,
  `SpecimenProtocolID` integer unsigned NOT NULL,
  `CenterID` integer unsigned NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  `Comments` varchar(255),
  `Data` json DEFAULT NULL,
  CONSTRAINT `PK_biobank_specimen_preparation` PRIMARY KEY (`SpecimenID`),
  CONSTRAINT `FK_biobank_specimen_preparation_SpecimenID`
    FOREIGN KEY (`SpecimenID`) REFERENCES `biobank_specimen`(`SpecimenID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_preparation_SpecimenProtocolID`
    FOREIGN KEY (`SpecimenProtocolID`) REFERENCES `biobank_specimen_protocol`(`SpecimenProtocolID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_preparation_CenterID`
    FOREIGN KEY (`CenterID`) REFERENCES `psc`(`CenterID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_analysis` (
  `SpecimenID` integer unsigned NOT NULL,
  `SpecimenProtocolID` integer unsigned NOT NULL,
  `CenterID` integer unsigned NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  `Comments` varchar(255),
  `Data` json DEFAULT NULL,
  CONSTRAINT `PK_biobank_specimen` PRIMARY KEY (`SpecimenID`),
  CONSTRAINT `FK_biobank_specimen_analysis_SpecimenID`
    FOREIGN KEY (`SpecimenID`) REFERENCES `biobank_specimen`(`SpecimenID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_analysis_SpecimenProtocolID`
    FOREIGN KEY (`SpecimenProtocolID`) REFERENCES `biobank_specimen_protocol`(`SpecimenProtocolID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_analysis_CenterID`
    FOREIGN KEY (`CenterID`) REFERENCES `psc`(`CenterID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_attribute_datatype` (
  `DatatypeID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Datatype` varchar(20) NOT NULL UNIQUE,
  CONSTRAINT `PK_biobank_datatype` PRIMARY KEY (`DatatypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_attribute_referencetable` (
  `ReferenceTableID` integer unsigned NOT NULL AUTO_INCREMENT,
  `TableName` varchar(50) NOT NULL,
  `ColumnName` varchar(50) NOT NULL,
  CONSTRAINT `PK_biobank_specimen_attribute_referencetable` PRIMARY KEY (`ReferenceTableID`),
  CONSTRAINT `UK_bio_spec_attribute_referencetable_TableName_ColumnName` UNIQUE(`TableName`, `ColumnName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `biobank_specimen_attribute` (
  `SpecimenAttributeID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(40) NOT NULL,
  `DatatypeID` integer unsigned NOT NULL,
  `ReferenceTableID` integer unsigned,
  CONSTRAINT `PK_biobank_specimen_attribute` PRIMARY KEY (`SpecimenAttributeID`),
  CONSTRAINT `FK_biobank_specimen_attribute_DatatypeID`
    FOREIGN KEY (`DatatypeID`) REFERENCES `biobank_specimen_attribute_datatype`(`DatatypeID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_attribute_ReferenceTableID` 
    FOREIGN KEY (`ReferenceTableID`) REFERENCES `biobank_specimen_attribute_referencetable`(`ReferenceTableID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `UK_biobank_specimen_attribute_Label` UNIQUE (`Label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Pool*/
CREATE TABLE `biobank_pool` (
  `PoolID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(40) NOT NULL,
  `CenterID` integer unsigned NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  CONSTRAINT `PK_biobank_pool` PRIMARY KEY (`PoolID`),
  CONSTRAINT `FK_biobank_pool_CenterID`
    FOREIGN KEY (`CenterID`) REFERENCES `psc` (`CenterID`),
  CONSTRAINT `UK_biobank_pool_Label` UNIQUE (`Label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/*Relational Tables*/
CREATE TABLE `biobank_specimen_type_attribute_rel` (
  `SpecimenTypeID` integer unsigned NOT NULL,
  `SpecimenAttributeID` integer unsigned NOT NULL,
  `Required` BIT(1) NOT NULL, 
  CONSTRAINT `PK_biobank_specimen_type_attribute_rel` PRIMARY KEY (`SpecimenTypeID`, `SpecimenAttributeID`),
  CONSTRAINT `FK_biobank_specimen_type_attribute_rel_SpecimenTypeID`
    FOREIGN KEY (`SpecimenTypeID`) REFERENCES `biobank_specimen_type`(`SpecimenTypeID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_type_attribute_rel_SpecimenAttributeID` 
    FOREIGN KEY (`SpecimenAttributeID`) REFERENCES `biobank_specimen_attribute`(`SpecimenAttributeID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_protocol_attribute_rel` (
  `SpecimenProtocolID` integer unsigned NOT NULL,
  `SpecimenAttributeID` integer unsigned NOT NULL,
  `Required` BIT(1) NOT NULL, 
  CONSTRAINT `PK_biobank_specimen_protocol_attribute_rel` PRIMARY KEY (`SpecimenProtocolID`, `SpecimenAttributeID`),
  CONSTRAINT `FK_biobank_specimen_protocol_attribute__rel_SpecimenProtocolID` 
    FOREIGN KEY (`SpecimenProtocolID`) REFERENCES `biobank_specimen_protocol`(`SpecimenProtocolID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_protocol_attribute_rel_SpecimenAttributeID` 
    FOREIGN KEY (`SpecimenAttributeID`) REFERENCES `biobank_specimen_attribute`(`SpecimenAttributeID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_protocol_container_type_rel` (
  `SpecimenProtocolID` integer unsigned NOT NULL,
  `ContainerTypeID` integer unsigned NOT NULL,
  CONSTRAINT `PK_biobank_specimen_protocol_container_type_rel` PRIMARY KEY (SpecimenProtocolID, ContainerTypeID),
  CONSTRAINT `FK_bio_spec_protocol_container_type_rel_SpecimenProtocolID` 
    FOREIGN KEY (`SpecimenProtocolID`) REFERENCES `biobank_specimen_protocol`(`SpecimenProtocolID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_protocol_container_type_rel_ContainerTypeID` 
    FOREIGN KEY (`ContainerTypeID`) REFERENCES `biobank_container_type`(`ContainerTypeID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_type_container_type_rel` (
  `SpecimenTypeID` integer unsigned NOT NULL,
  `ContainerTypeID` integer unsigned NOT NULL,
  `Regex` varchar(255) NOT NULL,
  CONSTRAINT `PK_biobank_specimen_type_container_type_rel` PRIMARY KEY (SpecimenTypeID, ContainerTypeID),
  CONSTRAINT `FK_biobank_specimen_type_container_type_rel_SpecimenTypeID` 
    FOREIGN KEY (`SpecimenTypeID`) REFERENCES `biobank_specimen_type`(`SpecimenTypeID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_validate_identifier_ContainerTypeID` 
    FOREIGN KEY (`ContainerTypeID`) REFERENCES `biobank_container_type`(`ContainerTypeID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_type_unit_rel` (
  `SpecimenTypeID` integer unsigned NOT NULL, 
  `UnitID` integer unsigned  NOT NULL,
  CONSTRAINT `PK_biobank_container_psc_rel` PRIMARY KEY (`SpecimenTypeID`, `UnitID`),
  CONSTRAINT `FK_biobank_specimen_type_unit_rel_TypeID`
    FOREIGN KEY (`SpecimenTypeID`) REFERENCES `biobank_specimen_type` (`SpecimenTypeID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_type_unit_rel_SourceID`
    FOREIGN KEY (`UnitID`) REFERENCES `biobank_unit` (`UnitID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_parent` (
  `SpecimenID` integer unsigned NOT NULL,
  `ParentSpecimenID` integer unsigned NOT NULL,
  CONSTRAINT `PK_biobank_specimen_parent` PRIMARY KEY (`SpecimenID`, `ParentSpecimenID`),
  CONSTRAINT `FK_biobank_specimen_parent_SpecimenID`
    FOREIGN KEY (`SpecimenID`) REFERENCES `biobank_specimen`(`SpecimenID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_parent_ParentSpecimenID`
    FOREIGN KEY (`ParentSpecimenID`) REFERENCES `biobank_specimen`(`SpecimenID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_specimen_pool_rel` (
  `SpecimenID` integer unsigned NOT NULL,
  `PoolID` integer unsigned NOT NULL,
  CONSTRAINT `PK_biobank_specimen_pool_rel` PRIMARY KEY (`SpecimenID`),
  CONSTRAINT `FK_biobank_specimen_pool_rel_SpecimenID`
    FOREIGN KEY (`SpecimenID`) REFERENCES `biobank_specimen`(`SpecimenID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_specimen_pool_rel_PoolID`
    FOREIGN KEY (`PoolID`) REFERENCES `biobank_pool`(`PoolID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `biobank_container_parent` (
  `ContainerID` integer unsigned NOT NULL,
  `ParentContainerID` integer unsigned NOT NULL,
  `Coordinate` integer unsigned,
  CONSTRAINT `PK_biobank_container_parent_ContainerID`
    PRIMARY KEY (`ContainerID`),
  CONSTRAINT `FK_biobank_container_parent_ContainerID`
    FOREIGN KEY (`ContainerID`) REFERENCES `biobank_container` (`ContainerID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `FK_biobank_container_parent_ParentContainerID`
    FOREIGN KEY (`ParentContainerID`) REFERENCES `biobank_container` (`ContainerID`)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `UK_biobank_container_parent_ParentContainerID_Coordinate`
    UNIQUE (`ParentContainerID`, `Coordinate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/*INSERTS*/

/*XXX: The following 4 lines are for testing. Delete before merging.*/
DELETE FROM LorisMenu WHERE `Label`='Specimens';
DELETE FROM LorisMenu WHERE `Label`='Containers';
DELETE FROM LorisMenu WHERE `Label`='Pools';
DELETE FROM LorisMenu WHERE `Label`='Biobank';

DELETE FROM permissions WHERE 
    `code`='biobank_specimen_view' OR 
    `code`='biobank_specimen_create' OR
    `code`='biobank_specimen_update' OR
    `code`='biobank_container_view' OR
    `code`='biobank_container_create' OR
    `code`='biobank_container_update' OR
    `code`='biobank_pool_view' OR
    `code`='biobank_pool_create';

DELETE FROM ConfigSettings WHERE
    `Name`='biobankPath';

/*Loris Menu*/
UPDATE LorisMenu SET `OrderNumber`=5 WHERE `Label`='Reports';
UPDATE LorisMenu SET `OrderNumber`=6 WHERE `Label`='Tools';
UPDATE LorisMenu SET `OrderNumber`=7 WHERE `Label`='Admin';

INSERT INTO LorisMenu (Label, OrderNumber) VALUES
    ('Biobank', 4)
;

INSERT INTO LorisMenu (Label, Link, Parent, OrderNumber) VALUES                  
    ('Specimens', 'biobank#specimens/', (SELECT ID FROM LorisMenu as L WHERE Label='Biobank'), 1),
    ('Containers', 'biobank#containers/', (SELECT ID FROM LorisMenu as L WHERE Label='Biobank'), 2),
    ('Pools', 'biobank#pools/', (SELECT ID FROM LorisMenu as L WHERE Label='Biobank'), 3)
;

/*Permissions*/
INSERT INTO permissions (code, description, categoryID) VALUES
    ('biobank_specimen_view', 'Biobank: View Specimen Data', 2),
    ('biobank_specimen_create', 'Biobank: Create Specimen Data', 2),
    ('biobank_specimen_update', 'Biobank: Update Specimen Data', 2),
    ('biobank_container_view', 'Biobank: View Container Data', 2),
    ('biobank_container_create', 'Biobank: Create Container Data', 2),
    ('biobank_container_update', 'Biobank: Update Container Data', 2),
    ('biobank_pool_view', 'Biobank: View Pool Data', 2),
    ('biobank_pool_create', 'Biobank: Create Pool Data', 2)
;

/*Config*/
INSERT INTO ConfigSettings (Name, Description, Visible, AllowMultiple, DataType, Parent, Label, OrderNumber)
    SELECT 'biobankPath', 'Path to Biobank data files', 1, 0, 'text', ID, 'Biobank', 10
    FROM ConfigSettings
    WHERE Name="paths";

/*Global*/
INSERT INTO biobank_specimen_attribute_datatype (Datatype)
VALUES  ('boolean'),
        ('number'),
        ('text'),
        ('datetime'),
        ('file')
;

/*Container*/
INSERT INTO biobank_container_status (Label)
VALUES  ('Available'),
        ('Reserved'),
        ('Dispensed'),
        ('Discarded')
;
                                                                                
-- ********************************
-- genomic_browser tables
-- ********************************


CREATE TABLE `genome_loc` (
  `GenomeLocID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Chromosome` varchar(255) DEFAULT NULL,
  `Strand` varchar(255) DEFAULT NULL,
  `EndLoc` int(11) DEFAULT NULL,
  `Size` int(11) DEFAULT NULL,
  `StartLoc` int(11) DEFAULT NULL,
  PRIMARY KEY (`GenomeLocID`),
  UNIQUE KEY `Chromosome` (`Chromosome`,`StartLoc`,`EndLoc`),
  KEY `Chromosome_2` (`Chromosome`,`EndLoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gene` (
  `GeneID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Symbol` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `NCBIID` varchar(255) DEFAULT NULL,
  `OfficialSymbol` varchar(255) DEFAULT NULL,
  `OfficialName` text,
  `GenomeLocID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`GeneID`),
  KEY `geneGenomeLocID` (`GenomeLocID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `genotyping_platform` (
  `PlatformID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Description` text,
  `TechnologyType` varchar(255) DEFAULT NULL,
  `Provider` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PlatformID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `SNP` (
  `SNPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `rsID` varchar(20) DEFAULT NULL,
  `Description` text,
  `SNPExternalName` varchar(255) DEFAULT NULL,
  `SNPExternalSource` varchar(255) DEFAULT NULL,
  `ReferenceBase` enum('A','C','T','G') DEFAULT NULL,
  `MinorAllele` enum('A','C','T','G') DEFAULT NULL,
  `Markers` varchar(255) DEFAULT NULL,
  `FunctionPrediction` enum('exonic','ncRNAexonic','splicing','UTR3','UTR5') DEFAULT NULL,
  `Damaging` enum('D','NA') DEFAULT NULL,
  `ExonicFunction` enum('nonsynonymous','unknown') DEFAULT NULL,
  `Chromosome` varchar(255) DEFAULT NULL,
  `Strand` varchar(255) DEFAULT NULL,
  `EndLoc` int(11) DEFAULT NULL,
  `StartLoc` int(11) DEFAULT NULL,
  `Symbol` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `NCBIID` varchar(255) DEFAULT NULL,
  `OfficialSymbol` varchar(255) DEFAULT NULL,
  `OfficialName` text,
  PRIMARY KEY (`SNPID`),
  UNIQUE KEY `uniq_snp` (`rsID`,`SNPExternalSource`),
  KEY `index3` (`Chromosome`,`StartLoc`,`EndLoc`,`Strand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `SNP_candidate_rel` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SNPID` bigint(20) NOT NULL DEFAULT '0',
  `CandID` int(6) NOT NULL DEFAULT '0',
  `AlleleA` enum('A','C','T','G') DEFAULT NULL,
  `AlleleB` enum('A','C','T','G') DEFAULT NULL,
  `ArrayReport` enum('Normal','Uncertain','Pending') DEFAULT NULL,
  `ArrayReportDetail` varchar(255) DEFAULT NULL,
  `ValidationMethod` varchar(50) DEFAULT NULL,
  `Validated` enum('0','1') DEFAULT NULL,
  `GenotypeQuality` int(4) DEFAULT NULL,
  `PlatformID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_SNP_candidate_rel_2` (`CandID`),
  KEY `fk_SNP_candidate_rel_1_idx` (`SNPID`),
  CONSTRAINT `fk_SNP_candidate_rel_1` FOREIGN KEY (`SNPID`) REFERENCES `SNP` (`SNPID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SNP_candidate_rel_2` FOREIGN KEY (`CandID`) REFERENCES `candidate` (`CandID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CNV` (
  `CNVID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CandID` int(6) DEFAULT NULL,
  `Description` text,
  `Type` enum('gain','loss','unknown') DEFAULT NULL,
  `EventName` varchar(255) DEFAULT NULL,
  `Common_CNV` enum('Y','N') DEFAULT NULL,
  `Characteristics` enum('Benign','Pathogenic','Unknown') DEFAULT NULL,
  `CopyNumChange` int(11) DEFAULT NULL,
  `Inheritance` enum('de novo','NA','unclassified','unknown','maternal','paternal') DEFAULT NULL,
  `ArrayReport` enum('Normal','Abnormal','Pending','Uncertain') DEFAULT NULL,
  `Markers` varchar(255) DEFAULT NULL,
  `ArrayReportDetail` varchar(255) DEFAULT NULL,
  `ValidationMethod` varchar(50) DEFAULT NULL,
  `PlatformID` bigint(20) DEFAULT NULL,
  `Chromosome` varchar(255) DEFAULT NULL,
  `Strand` varchar(255) DEFAULT NULL,
  `EndLoc` int(11) DEFAULT NULL,
  `StartLoc` int(11) DEFAULT NULL,
  `Symbol` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `NCBIID` varchar(255) DEFAULT NULL,
  `OfficialSymbol` varchar(255) DEFAULT NULL,
  `OfficialName` text,
  PRIMARY KEY (`CNVID`),
  KEY `PlatformID` (`PlatformID`),
  KEY `CandID` (`CandID`),
  KEY `index4` (`Chromosome`,`StartLoc`,`EndLoc`,`Strand`),
  CONSTRAINT `CNV_ibfk_1` FOREIGN KEY (`PlatformID`) REFERENCES `genotyping_platform` (`PlatformID`),
  CONSTRAINT `CNV_ibfk_3` FOREIGN KEY (`CandID`) REFERENCES `candidate` (`CandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `GWAS` (
  `GWASID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SNPID` bigint(20) NOT NULL,
  `rsID` varchar(20) DEFAULT NULL,
  `MajorAllele` enum('A','C','T','G') DEFAULT NULL,
  `MinorAllele` enum('A','C','T','G') DEFAULT NULL,
  `MAF` varchar(20) DEFAULT NULL,
  `Estimate` varchar(20) DEFAULT NULL,
  `StdErr` varchar(20) DEFAULT NULL,
  `Pvalue` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GWASID`),
  KEY `SNPID` (`SNPID`),
  CONSTRAINT `GWAS_ibfk_1` FOREIGN KEY (`SNPID`) REFERENCES `SNP` (`SNPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores results of Genome-Wide Analysis Study';

CREATE TABLE `genomic_analysis_modality_enum` (
  `analysis_modality` varchar(100),
  PRIMARY KEY (`analysis_modality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT IGNORE INTO `genomic_analysis_modality_enum` (analysis_modality) VALUES
  ('Methylation beta-values'),
  ('Other');

CREATE TABLE `genomic_files` (
  `GenomicFileID` int unsigned NOT NULL AUTO_INCREMENT,
  `FileName` varchar(255) NOT NULL,
  `FilePackage` tinyint(1) DEFAULT NULL,
  `Description` varchar(255) NOT NULL,
  `FileType` varchar(255) NOT NULL,
  `FileSize` int(20) NOT NULL,
  `Platform` varchar(255) DEFAULT NULL,
  `Batch` varchar(255) DEFAULT NULL,
  `Source` varchar(255) DEFAULT NULL,
  `Date_taken` date DEFAULT NULL,
  `Category` enum('raw','cleaned') DEFAULT NULL,
  `Pipeline` varchar(255) DEFAULT NULL,
  `Algorithm` varchar(255) DEFAULT NULL,
  `Normalization` varchar(255) DEFAULT NULL,
  `SampleID` varchar(255) DEFAULT NULL,
  `AnalysisProtocol` varchar(255) DEFAULT NULL,
  `InsertedByUserID` varchar(255) NOT NULL DEFAULT '',
  `Date_inserted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Caveat` tinyint(1) DEFAULT NULL,
  `Notes` text,
  `AnalysisModality` varchar(100),
  PRIMARY KEY (`GenomicFileID`),
  KEY `AnalysisModality` (`AnalysisModality`),
  CONSTRAINT `genomic_files_ibfk_1` FOREIGN KEY (`AnalysisModality`) REFERENCES `genomic_analysis_modality_enum` (`analysis_modality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `genomic_candidate_files_rel` (
  `CandID` int(6) NOT NULL,
  `GenomicFileID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`CandID`,`GenomicFileID`),
  KEY `GenomicFileID` (`GenomicFileID`),
  CONSTRAINT `genomic_candidate_files_rel_ibfk_1` FOREIGN KEY (`CandID`) REFERENCES `candidate` (`CandID`),
  CONSTRAINT `genomic_candidate_files_rel_ibfk_2` FOREIGN KEY (`GenomicFileID`) REFERENCES `genomic_files` (`GenomicFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `genomic_sample_candidate_rel` (
  `sample_label` varchar(100) NOT NULL,
  `CandID` int(6) NOT NULL,
  PRIMARY KEY (`sample_label`,`CandID`),
  UNIQUE KEY `sample_label` (`sample_label`),
  KEY `CandID` (`CandID`),
  CONSTRAINT `genomic_sample_candidate_rel_ibfk_1` FOREIGN KEY (`CandID`) REFERENCES `candidate` (`CandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `genomic_cpg_annotation` (
  `cpg_name` varchar(100) NOT NULL,
  `address_id_a` int(10) unsigned DEFAULT NULL,
  `probe_seq_a` varchar(100) DEFAULT NULL,
  `address_id_b` int(10) unsigned DEFAULT NULL,
  `probe_seq_b` varchar(100) DEFAULT NULL,
  `design_type` varchar(20) DEFAULT NULL,
  `color_channel` enum('Red','Grn') DEFAULT NULL,
  `genome_build` varchar(40) DEFAULT NULL,
  `probe_snp_10` varchar(40) DEFAULT NULL,
  `gene_name` text,
  `gene_acc_num` text,
  `gene_group` text,
  `island_loc` varchar(100) DEFAULT NULL,
  `island_relation` enum('island','n_shelf','n_shore','s_shelf','s_shore') DEFAULT NULL,
  `fantom_promoter_loc` varchar(100) DEFAULT NULL,
  `dmr` enum('CDMR','DMR','RDMR') DEFAULT NULL,
  `enhancer` tinyint(1) DEFAULT NULL,
  `hmm_island_loc` varchar(100) DEFAULT NULL,
  `reg_feature_loc` varchar(100) DEFAULT NULL,
  `reg_feature_group` varchar(100) DEFAULT NULL,
  `dhs` tinyint(1) DEFAULT NULL,
  `platform_id` bigint(20) DEFAULT NULL,
  `Chromosome` varchar(255) DEFAULT NULL,
  `Strand` varchar(255) DEFAULT NULL,
  `EndLoc` int(11) DEFAULT NULL,
  `StartLoc` int(11) DEFAULT NULL,
  PRIMARY KEY (`cpg_name`),
  KEY `platform_id` (`platform_id`),
  KEY `index3` (`Chromosome`,`StartLoc`,`EndLoc`,`Strand`),
  CONSTRAINT `genomic_cpg_annotation_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `genotyping_platform` (`PlatformID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `genomic_cpg` (
  `sample_label` varchar(100) NOT NULL,
  `cpg_name` varchar(100) NOT NULL,
  `beta_value` decimal(4,3) DEFAULT NULL,
  PRIMARY KEY (`sample_label`,`cpg_name`),
  KEY `cpg_name` (`cpg_name`),
  CONSTRAINT `genomic_cpg_ibfk_1` FOREIGN KEY (`sample_label`) REFERENCES `genomic_sample_candidate_rel` (`sample_label`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `genomic_cpg_ibfk_2` FOREIGN KEY (`cpg_name`) REFERENCES `genomic_cpg_annotation` (`cpg_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- External links
-- ********************************


CREATE TABLE `ExternalLinkTypes` (
  `LinkTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `LinkType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LinkTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `ExternalLinkTypes` (LinkType) VALUES
  ('FooterLink'),
  ('StudyLinks'),
  ('dashboard');

CREATE TABLE `ExternalLinks` (
  `LinkID` int(11) NOT NULL AUTO_INCREMENT,
  `LinkTypeID` int(11) DEFAULT NULL,
  `LinkText` varchar(255) NOT NULL,
  `LinkURL` varchar(255) NOT NULL,
  PRIMARY KEY (`LinkID`),
  KEY `LinkTypeID` (`LinkTypeID`),
  CONSTRAINT `ExternalLinks_ibfk_1` FOREIGN KEY (`LinkTypeID`) REFERENCES `ExternalLinkTypes` (`LinkTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `ExternalLinks` (LinkTypeID, LinkText, LinkURL) VALUES
  ((SELECT LinkTypeID from ExternalLinkTypes WHERE LinkType='FooterLink'), 'Loris Website', 'http://www.loris.ca'),
  ((SELECT LinkTypeID from ExternalLinkTypes WHERE LinkType='FooterLink'), 'GitHub', 'https://github.com/aces/Loris'),
  ((SELECT LinkTypeID from ExternalLinkTypes WHERE LinkType='StudyLinks'), 'Loris Website', 'http://www.loris.ca'),
  ((SELECT LinkTypeID from ExternalLinkTypes WHERE LinkType='StudyLinks'), 'GitHub', 'https://github.com/aces/Loris'),
  ((SELECT LinkTypeID from ExternalLinkTypes WHERE LinkType='dashboard'), 'Loris Website', 'http://www.loris.ca');

-- ********************************
-- data_release
-- ********************************


CREATE TABLE `data_release` (
 `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `file_name` varchar(255),
 `version` varchar(255),
 `upload_date` date,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `data_release_permissions` (
 `userid` int(10) unsigned NOT NULL,
 `data_release_id` int(10) unsigned NOT NULL,
 PRIMARY KEY (`userid`, `data_release_id`),
 KEY `FK_userid` (`userid`),
 KEY `FK_data_release_id` (`data_release_id`),
 CONSTRAINT `FK_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`ID`),
 CONSTRAINT `FK_data_release_id` FOREIGN KEY (`data_release_id`) REFERENCES `data_release` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- Acknowledgements
-- ********************************


CREATE TABLE `acknowledgements` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `citation_name` varchar(255) DEFAULT NULL,
  `affiliations` varchar(255) DEFAULT NULL,
  `degrees` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `present` enum('Yes', 'No') DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- Feedback
-- ********************************

CREATE TABLE `feedback_bvl_type` (
  `Feedback_type` int(11) unsigned NOT NULL auto_increment,
  `Name` varchar(100) NOT NULL default '',
  `Description` text,
  PRIMARY KEY  (`Feedback_type`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `feedback_bvl_type` (Name, Description) VALUES
  ('Input','Input Errors'),
  ('Scoring','Scoring Errors');

CREATE TABLE `feedback_bvl_thread` (
  `FeedbackID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CandID` int(6) DEFAULT NULL,
  `SessionID` int(11) unsigned DEFAULT NULL,
  `CommentID` varchar(255) DEFAULT NULL,
  `Feedback_level` enum('profile','visit','instrument') NOT NULL DEFAULT 'profile',
  `Feedback_type` int(11) unsigned DEFAULT NULL,
  `Public` enum('N','Y') NOT NULL DEFAULT 'N',
  `Status` enum('opened','answered','closed','comment') NOT NULL DEFAULT 'opened',
  `Active` enum('N','Y') NOT NULL DEFAULT 'N',
  `Date_taken` date DEFAULT NULL,
  `UserID` varchar(255) NOT NULL DEFAULT '',
  `Testdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FieldName` text,
  PRIMARY KEY (`FeedbackID`),
  KEY `FK_feedback_bvl_thread_1` (`Feedback_type`),
  KEY `FeedbackCandidate` (`CandID`),
  CONSTRAINT `FK_feedback_bvl_thread_1` FOREIGN KEY (`Feedback_type`) REFERENCES `feedback_bvl_type` (`Feedback_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `feedback_bvl_entry` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `FeedbackID` int(11) unsigned default NULL,
  `Comment` text,
  `UserID` varchar(255) default NULL,
  `Testdate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`),
  KEY `FK_feedback_bvl_entry_1` (`FeedbackID`),
  CONSTRAINT `FK_feedback_bvl_entry_1` FOREIGN KEY (`FeedbackID`) REFERENCES `feedback_bvl_thread` (`FeedbackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `feedback_mri_comment_types` (
  `CommentTypeID` int(11) unsigned NOT NULL auto_increment,
  `CommentName` varchar(255) NOT NULL default '',
  `CommentType` enum('volume','visit') NOT NULL default 'volume',
  `CommentStatusField` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`CommentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `feedback_mri_comment_types` (CommentName,CommentType,CommentStatusField) VALUES
  ('Geometric distortion','volume','a:2:{s:5:\"field\";s:20:\"Geometric_distortion\";s:6:\"values\";a:5:{i:0;s:0:\"\";i:1;s:4:\"Good\";i:2;s:4:\"Fair\";i:3;s:4:\"Poor\";i:4;s:12:\"Unacceptable\";}}'),
  ('Intensity artifact','volume','a:2:{s:5:\"field\";s:18:\"Intensity_artifact\";s:6:\"values\";a:5:{i:0;s:0:\"\";i:1;s:4:\"Good\";i:2;s:4:\"Fair\";i:3;s:4:\"Poor\";i:4;s:12:\"Unacceptable\";}}'),
  ('Movement artifact','volume','a:2:{s:5:\"field\";s:30:\"Movement_artifacts_within_scan\";s:6:\"values\";a:5:{i:0;s:0:\"\";i:1;s:4:\"None\";i:2;s:15:\"Slight Movement\";i:3;s:12:\"Poor Quality\";i:4;s:12:\"Unacceptable\";}}'),
  ('Packet movement artifact','volume','a:2:{s:5:\"field\";s:31:\"Movement_artifacts_between_packets\";s:6:\"values\";a:5:{i:0;s:0:\"\";i:1;s:4:\"None\";i:2;s:15:\"Slight Movement\";i:3;s:12:\"Poor Quality\";i:4;s:12:\"Unacceptable\";}}'),
  ('Coverage','volume','a:2:{s:5:\"field\";s:8:\"Coverage\";s:6:\"values\";a:5:{i:0;s:0:\"\";i:1;s:4:\"Good\";i:2;s:4:\"Fair\";i:3;s:5:\"Limit\";i:4;s:12:\"Unacceptable\";}}'),
  ('Overall','volume',''),
  ('Subject','visit',''),
  ('Dominant Direction Artifact (DWI ONLY)','volume','a:2:{s:5:"field";s:14:"Color_Artifact";s:6:"values";a:5:{i:0;s:0:"";i:1;s:4:"Good";i:2;s:4:"Fair";i:3;s:4:"Poor";i:4;s:12:"Unacceptable";}}'),
  ('Entropy Rating (DWI ONLY)','volume','a:2:{s:5:"field";s:7:"Entropy";s:6:"values";a:5:{i:0;s:0:"";i:1;s:10:"Acceptable";i:2;s:10:"Suspicious";i:3;s:12:"Unacceptable";i:4;s:13:"Not Available";}}');

CREATE TABLE `feedback_mri_predefined_comments` (
  `PredefinedCommentID` int(11) unsigned NOT NULL auto_increment,
  `CommentTypeID` int(11) unsigned NOT NULL default '0',
  `Comment` text NOT NULL,
  PRIMARY KEY  (`PredefinedCommentID`),
  KEY `CommentType` (`CommentTypeID`),
  CONSTRAINT `FK_feedback_mri_predefined_comments_1` FOREIGN KEY (`CommentTypeID`) REFERENCES `feedback_mri_comment_types` (`CommentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `feedback_mri_predefined_comments` (CommentTypeID, Comment) VALUES
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'missing slices'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'reduced dynamic range due to bright artifact/pixel'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'slice to slice intensity differences'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'noisy scan'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'susceptibilty artifact above the ear canals.'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'susceptibilty artifact due to dental work'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'sagittal ghosts'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Movement artifact'),'slight ringing artefacts'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Movement artifact'),'severe ringing artefacts'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Movement artifact'),'movement artefact due to eyes'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Movement artifact'),'movement artefact due to carotid flow'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Packet movement artifact'),'slight movement between packets'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Packet movement artifact'),'large movement between packets'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Coverage'),'Large AP wrap around, affecting brain'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Coverage'),'Medium AP wrap around, no affect on brain'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Coverage'),'Small AP wrap around, no affect on brain'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Coverage'),'Too tight LR, cutting into scalp'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Coverage'),'Too tight LR, affecting brain'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Coverage'),'Top of scalp cut off'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Coverage'),'Top of brain cut off'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Coverage'),'Base of cerebellum cut off'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Coverage'),'missing top third - minc conversion?'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Overall'),'copy of prev data'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'checkerboard artifact'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'horizontal intensity striping (Venetian blind effect, DWI ONLY)'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'diagonal striping (NRRD artifact, DWI ONLY)'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'high intensity in direction of acquisition'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'signal loss (dark patches)'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Dominant Direction Artifact (DWI ONLY)'),'red artifact'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Dominant Direction Artifact (DWI ONLY)'),'green artifact'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Dominant Direction Artifact (DWI ONLY)'),'blue artifact'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Overall'),'Too few remaining gradients (DWI ONLY)'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Overall'),'No b0 remaining after DWIPrep (DWI ONLY)'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Overall'),'No gradient information available from scanner (DWI ONLY)'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Overall'),'Incorrect diffusion direction (DWI ONLY)'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Overall'),'Duplicate series'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Movement artifact'),'slice wise artifact (DWI ONLY)'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Movement artifact'),'gradient wise artifact (DWI ONLY)'),
  ((SELECT `CommentTypeID` FROM `feedback_mri_comment_types` WHERE `CommentName`='Intensity artifact'),'susceptibility artifact due to anatomy');

CREATE TABLE `feedback_mri_comments` (
  `CommentID` int(11) unsigned NOT NULL auto_increment,
  `FileID` int(10) unsigned default NULL,
  `SeriesUID` varchar(64) default NULL,
  `EchoTime` double default NULL,
  `SessionID` int(10) unsigned default NULL,
  `CommentTypeID` int(11) unsigned NOT NULL default '0',
  `PredefinedCommentID` int(11) unsigned default NULL,
  `Comment` text,
  `ChangeTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`CommentID`),
  KEY `FK_feedback_mri_comments_1` (`CommentTypeID`),
  KEY `FK_feedback_mri_comments_2` (`PredefinedCommentID`),
  KEY `FK_feedback_mri_comments_3` (`FileID`),
  KEY `FK_feedback_mri_comments_4` (`SessionID`),
  CONSTRAINT `FK_feedback_mri_comments_4` FOREIGN KEY (`SessionID`) REFERENCES `session` (`ID`),
  CONSTRAINT `FK_feedback_mri_comments_1` FOREIGN KEY (`CommentTypeID`) REFERENCES `feedback_mri_comment_types` (`CommentTypeID`),
  CONSTRAINT `FK_feedback_mri_comments_2` FOREIGN KEY (`PredefinedCommentID`) REFERENCES `feedback_mri_predefined_comments` (`PredefinedCommentID`),
  CONSTRAINT `FK_feedback_mri_comments_3` FOREIGN KEY (`FileID`) REFERENCES `files` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ********************************
-- Consent tables
-- ********************************

CREATE TABLE `consent` (
  `ConsentID` integer unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Label` varchar(255) NOT NULL,
  CONSTRAINT `PK_consent` PRIMARY KEY (`ConsentID`),
  CONSTRAINT `UK_consent_Name` UNIQUE KEY `Name` (`Name`),
  CONSTRAINT `UK_consent_Label` UNIQUE KEY `Label` (`Label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `candidate_consent_rel` (
  `CandidateID` int(6) NOT NULL,
  `ConsentID` integer unsigned NOT NULL,
  `Status` enum('yes','no') DEFAULT NULL,
  `DateGiven` date DEFAULT NULL,
  `DateWithdrawn` date DEFAULT NULL,
  CONSTRAINT `PK_candidate_consent_rel` PRIMARY KEY (`CandidateID`,`ConsentID`),
  CONSTRAINT `FK_candidate_consent_rel_CandidateID` FOREIGN KEY (`CandidateID`) REFERENCES `candidate` (`CandID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_candidate_consent_rel_ConsentID` FOREIGN KEY (`ConsentID`) REFERENCES `consent` (`ConsentID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `candidate_consent_history` (
  `CandidateConsentHistoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EntryDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DateGiven` date DEFAULT NULL,
  `DateWithdrawn` date DEFAULT NULL,
  `PSCID` varchar(255) NOT NULL,
  `ConsentName` varchar(255) NOT NULL,
  `ConsentLabel` varchar(255) NOT NULL,
  `Status` enum('yes','no') DEFAULT NULL,
  `EntryStaff` varchar(255) DEFAULT NULL,
  CONSTRAINT `PK_candidate_consent_history` PRIMARY KEY (`CandidateConsentHistoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `visit` (
  `VisitID` int(10) unsigned NOT NULL auto_increment,
  `VisitName` varchar(100) NOT NULL,
  CONSTRAINT `visit_PK` PRIMARY KEY (`VisitID`),
  CONSTRAINT `visit_name_UK` UNIQUE KEY (`VisitName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `visit_project_subproject_rel` (
 `VisitID` int(10) unsigned NOT NULL,
 `ProjectID` int(2) NOT NULL,
 `SubprojectID` int(10) unsigned NOT NULL,
  CONSTRAINT `visit_project_subproject_rel_PK` PRIMARY KEY (`VisitID`, `ProjectID`, `SubprojectID`),
  CONSTRAINT `visit_project_subproject_rel_VisitID_visit_VisitID_FK` FOREIGN KEY (`VisitID`)
    REFERENCES `visit`(`VisitID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_project_subproject_ProjectID_visit_ProjectID_FK` FOREIGN KEY (`ProjectID`)
    REFERENCES `Project`(`ProjectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_project_subproject_SubprojectID_visit_SubprojectID_FK` FOREIGN KEY (`SubprojectID`)
    REFERENCES `subproject`(`SubprojectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;