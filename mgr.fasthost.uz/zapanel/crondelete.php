<?php
$title='Cronni o\'chirish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
echo '<div class="title">Cronni o\'chirish</div>';
    if (empty($_GET['sok'])) {
		$ap = htmlspecialchars(trim($_GET['elid']));
        echo '<div class="menu">' . "\n";
        echo '<center>Rostan xam cronni o\'chirishni xoxlaysizmi ?<br />' . "\n";
        echo '<a href="/cron/delete/' . urlencode($_GET['elid']) . '&amp;sok=yes"><font color="red">Ha</font></a> / <a href="?"><font color="green">Yo\'q</font></a></center>' . "\n";
        echo '</div>' . "\n";
    } else {
		$ap = htmlspecialchars(trim($_GET['elid']));
        $content = api_query('https://'.$server->ip.'/ispmgr?func=scheduler.delete&elid=' .urlencode(decode($ap)). '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="aqua">CRON vazifasi muvaffaqiyatli o\'chirildi!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/cron">Davom ettirish</a></div>' . "\n";
        } else {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="red">CRON vazifasini o\'chirishda xato!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/cron">Davom ettirish</a></div>' . "\n";
        }
    }
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>