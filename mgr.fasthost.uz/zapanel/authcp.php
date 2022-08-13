<?php
$title='Sayt boshqaruviga kirish!';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
unset($user);
session_destroy();
setcookie('PHPSESSID', null, time() - 3600, '/');
setcookie('SID', null, time() - 3600, '/');
setcookie('id_user', null, time() - 3600, '/');
setcookie('key', null, time() - 3600, '/');
if (isset($_GET['key']) && isset($_GET['id_user'])){
    $kauth = $_GET['key'];
    $id_user = $_GET['id_user'];
setcookie('id_user', $id_user, time() + 3600 * 24 * 30,'/');
setcookie('key', $kauth, time() + 3600 * 24 * 30,'/');
header('Location: /');
}else {
    header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>