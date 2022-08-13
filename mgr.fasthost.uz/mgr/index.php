<?php
//-----Подключаем функции-----//
include 'system/func.php';
include 'system/head.php';
$ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
$ontarif->execute(array($user['id_tarif']));
$ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
$server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
$server = $server->fetch(PDO::FETCH_LAZY);

header('Location: /mgr/explode.php');
include 'system/foot.php';
?>