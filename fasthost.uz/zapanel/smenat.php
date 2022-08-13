<?php
$title='Tarifni o\'zgartirish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
    $srvid = $server['id'];
echo '<div class="title">Tarifni o\'zgartirish</div>';
if ($user['accesstos'] == 2){
$colls = $connect->query("SELECT * FROM `tarifs_hosting` WHERE `activ`='1' AND `id_server` = '$srvid' AND `id` = '$id'");
// Yangi tarif
$ontarifs = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
$ontarifs->execute(array($id));
$ustarifs = $ontarifs->fetch(PDO::FETCH_LAZY);
$colls = $colls->fetchColumn();
if ($colls > 0){
if ($user[activ]==1 || $user[activ]==2 || $user[activ]==3) {
if ($user[id_tarif] != $id) {
if ($user[activ]==1) {
$connect->exec("UPDATE `users` SET `id_tarif` = '$id' WHERE `id` = '".$user['id']."' LIMIT 1");
echo '<div class="menu"><center><font color="aqua">Тarif muvoffaqiyatli almashdi!</font></center></div>';
echo '<div class="menu"><a href="/"> Keyingisi</a></div> ';
}else{
if ($user['money'] >= $ustarifs['price_day']) {
$preset=$ustarifs[template];
$qas=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
$reguserisp = file_get_contents("https://".$server[ip]."/ispmgr?func=user.edit&owner=zadc&out=xml&authinfo=".$server[login].":".$server[pass]."&elid=".$user[isp_login]."&preset=".$preset."&sok=yes", false, stream_context_create($qas));
if (preg_match('<ok/>',$reguserisp)) {
$cena = $ustarifs['price_day'];
$connect->exec("UPDATE `users` SET `money` = `money` - '$cena', `id_tarif` = '$id' WHERE `id` = '".$user['id']."' LIMIT 1");
$connect->exec("INSERT INTO `logs_money` SET `id_user` = '".$user['id']."', `type` = 'minus', `count` = '".$cena."', `action` = 'Tarifni quyidagiga o\'zgartirish: ".$ustarifs[name]."', `time` = '".$time."'");    
echo '<div class="menu"><center><font color="aqua">Тarif muvoffaqiyatli almashdi!</font></center></div>';
}else{
    //echo print_r($reguserisp);
    echo '<div class="menu"><center><font color="red">Sizda juda ko\'p resurs bor! yangi tarifga qaraganda!!!</font></center></div>';
    echo '<div class="menu"><a href="/"> Keyingisi</a></div> ';
}
}else {
    echo '<div class="menu"><center><font color="red">Sizda tarifni o\'zgartirish uchun etarli mablag\' yo\'q!</font></center></div>';
    echo '<div class="menu"><a href="/"> Keyingisi</a></div> ';
}
}
}else{
    echo '<div class="menu"><center><font color="red">Siz ushbu tarifdan foydalanasiz!</font></center></div>';
    echo '<div class="menu"><a href="/"> Keyingisi</a></div> ';
}
}else {
    echo '<div class="menu"><center><font color="red">Siz tarifni o\'zgartira olmaysiz!!!</font></center></div>';
    echo '<div class="menu"><a href="/"> Keyingisi</a></div> ';
}
}else {
    echo '<div class="menu"><center><font color="red">Tarifga o\'tish mumkin emas!</font></center></div>';
    echo '<div class="menu"><a href="/"> Keyingisi</a></div> ';
}
}else{
    echo '<div class="menu"><center><font color="red">Sizda tarifni o\'zgartirish imkoniyati yo\'q!</font></center></div>';
    echo '<div class="menu"><a href="/"> Keyingisi</a></div> ';
}
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>