<?php
$title='SSL sertifikatini olib tashlash';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
echo '<div class="title">SSL sertifikatini olib tashlash</div>';
    if (empty($_GET['sok'])) {
		$ap = htmlspecialchars(trim($_GET['elid']));
		$sta = array(
    'on' => '<img src="/img/on.png" width="13" height="13" alt="Yoniq" />'
    ); 
        echo '<div class="menu">' . "\n";
        echo '<center>Haqiqatan ham SSL sertifikatini yo\'q qilmoqchimisiz ?<br />' . "\n";
        echo '<a href="/ssl/delete/' . urlencode((string)$_GET['elid']) . '&amp;sok=yes">Ha</a> / <a href="?">Yo\'q</a></center>' . "\n";
        echo '</div>' . "\n";
    } else {
		$ap = $user['isp_login'].'%25%23%25'.htmlspecialchars(trim($_GET['elid']));
        $content = api_query('https://'.$server->ip.'/ispmgr?func=sslcert.delete&elid=' .$ap. '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            //echo print_r($content);
            echo '<center><font color="aqua">SSL sertifikati muvaffaqiyatli o\'chirildi!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/ssl">Продолжить</a></div>' . "\n";
        } else {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="red">SSL sertifikatini o\'chirishda xato!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/ssl">Davom ettirish</a></div>' . "\n";
        }
    }
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>