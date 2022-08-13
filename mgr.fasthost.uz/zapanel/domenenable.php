<?php
$title='Domenni yoqish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
echo '<div class="title">Domenni yoqish</div>';
$content = api_query('https://'.$server->ip.'/ispmgr?func=webdomain.resume&elid=' . urlencode($_GET['elid']) . '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
$parse_xml = simplexml_load_string($content);
if (isset($parse_xml->ok)) {
    echo '<div class="menu">' . "\n";
    echo '<center><font color="aqua">Domen muvoffaqiyatli yondi!</font></center></div>' . "\n";
    echo '<div class="menu"><a href="/domen">Davom ettirish</a></div>' . "\n";
} else {
    echo '<div class="menu">' . "\n";
    echo '<center><font color="red">Xato, domenni qayta faollashtiring!</font></center></div>' . "\n";
    echo '<div class="menu"><a href="/domen">Davom ettirish</a></div>' . "\n";
}
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>