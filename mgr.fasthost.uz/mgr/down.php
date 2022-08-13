<?php
//-----Подключаем функции-----//
    include 'system/func.php';
    include 'system/ftp_connect.php';

$d=boff(prov($_GET['d']));
if (empty($d)){
header('Location: /mgr/explode.php');
}else{
$res=ftp_size($serv, $d);
if ($res == '-1'){
header('Location: /mgr/explode.php');
}else{
if (ftp_get($serv, 'tmp/'.$savedir.'/'.basename($d), $d, FTP_BINARY)){
header('Content-type: application/force-download');
header ('Content-Type: application/octet-stream');
header ('Accept-Ranges: bytes');
header ('Content-Length: '.$res);
header ('Content-Disposition: attachment; filename='.basename($d));
echo file_get_contents('tmp/'.$savedir.'/'.basename($d));
unlink('tmp/'.$savedir.'/'.basename($d));
exit();
}else{
header('Location: /mgr/file.php?d='.bon($d));
}
}
}
ftp_close($serv);
?>