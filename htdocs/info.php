<?php
$result = file_get_contents('https://spi-dev.loris.ca');
var_export(json_encode($result));
//print_r(openssl_get_cert_locations());
//phpinfo();
