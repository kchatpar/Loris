SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `password_blacklist`;
LOCK TABLES `password_blacklist` WRITE;
INSERT INTO `password_blacklist` (`ID`, `password_hash`) VALUES (1,'$2y$10$e4JT8q0hWNYB2t7BfjdKte6r8.C74eqkIXyTabWEpz/CfMEkKpFyi');
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS=1;
