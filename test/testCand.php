<?php

require_once __DIR__ . '/../vendor/autoload.php';

$factory = NDB_Factory::singleton();
$config  = $factory->config();
$database = "intake_forms"; 
$username = $config->getSetting('username');
$password = $config->getSetting('password');
$host     = $config->getSetting('host');
$db      = Database::singleton($database, $username, $password, $host);


$cand = new Candidate();
$cand->createNew(3, "2001-02-03", null, "Female")
#$candidateID = Candidate::_generateCandID();

?>
