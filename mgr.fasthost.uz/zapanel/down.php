<?php
$title='Dampni yuklash';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
$url = "https://".$server->ip."/ispmgr?authinfo=" . $user['isp_login'] . ":" . $user['isp_pass']."&func=db.dump&elid=" . urlencode($_GET['elid']) . "";

$path = 'ssss.sql';


$fp = fopen($path, 'w');


$ch = curl_init($url);

curl_setopt($ch, CURLOPT_FILE, $fp);


$data = curl_exec($ch);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_close($ch);

fclose($fp);
/*header('Content-Type: application/octet-stream');
header('Content-Description: file transfer');
header('Content-Disposition: attachment; filename="' . $content . '"');
header('Content-Length: '. filesize($content));
*/
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>