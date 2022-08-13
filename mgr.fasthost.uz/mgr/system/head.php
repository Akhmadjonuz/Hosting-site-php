<?php
//-----Подключаем функции-----//
$title=(empty($title)?'Fayl menejer':$title);
//-----Подключаем вверх-----//
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");

if (isset($active) && $active == true){
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
}

?>