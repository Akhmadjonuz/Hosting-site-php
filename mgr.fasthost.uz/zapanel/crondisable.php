<?php
$title='Cronni o\'chirish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
$ap = htmlspecialchars(trim($_GET['elid']));
$content = api_query('https://'.$server->ip.'/ispmgr?func=scheduler.suspend&elid=' .urlencode(decode($ap)). '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
$parse_xml = simplexml_load_string($content);
echo '<div class="title">Cronni o\'chirish</div>';
if (isset($parse_xml->ok)) {
    echo '<div class="menu">' . "\n";
    echo '<center><font color="aqua">CRON vazifasi muvaffaqiyatli o\'chirildi!</font></center></div>' . "\n";
    echo '<div class="menu"><a href="/cron">Davom ettirish</a></div>' . "\n";
} else {
    echo '<div class="menu">' . "\n";
    echo '<center><font color="red">CRON vazifasini o\'chirishda xato!</font></center></div>' . "\n";
    echo '<div class="menu"><a href="/cron">Davom ettirish</a></div>' . "\n";
}
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>