<?php
include 'func.php';
deldir('../tmp/');
mkdir('../tmp');
$zap='
deny from all
php flag_engine off
CharsetRecodeMultipartForms Off
';
file_put_contents('../tmp/.htaccess', $zap, FILE_APPEND);
?>