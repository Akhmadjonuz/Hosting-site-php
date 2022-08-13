<?php
$title='Foydalanilgan manbalar';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
$content = api_query('https://'.$server->ip.'/ispmgr?func=userstat&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
$parse_xml = simplexml_load_string($content);

echo '<div class="title">Foydalanilgan manbalar</div>';

echo '<div class="menu">';
echo '<b>Disk</b>: '.$parse_xml->elem[18]->usages_used.' MB / '.$parse_xml->elem[18]->usages_total.' MB <br/>';
echo '<b>Ma\'lumotlar bazasi</b>: '.$parse_xml->elem[1]->usages_used.' Ta / '.$parse_xml->elem[1]->usages_total.' Ta <br/>';
echo '<b>Umumiy ma\'lumotlar bazasining hajmi</b>: '.$parse_xml->elem[3]->usages_used.' MB / '.$parse_xml->elem[3]->usages_total.' MB <br/>';
echo '<b>Pochta qutilari</b>: '.$parse_xml->elem[7]->usages_used.' Ta / '.$parse_xml->elem[7]->usages_total.' Ta <br/>';
echo '<b>FTP hisoblar</b>: '.$parse_xml->elem[8]->usages_used.' Ta / '.$parse_xml->elem[8]->usages_total.' Ta <br/>';
echo '<b>Saytlar (Domenlar / subdomenlar)</b>: '.$parse_xml->elem[21]->usages_used.' Ta / '.$parse_xml->elem[21]->usages_total.' Ta <br/>';
echo '</div>';
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>