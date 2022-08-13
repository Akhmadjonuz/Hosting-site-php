<?php
$title='Ma\'lumotlar bazasi | O\'chirish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'"); 
    $server = $server->fetch(PDO::FETCH_LAZY);
   echo '<div class="title">Ma\'lumotlar bazasini o\'chirish</div>';
   if (empty($_GET['sok'])) {
    echo '<div class="menu">' . "\n";
    echo '<center><font color="red">Ma\'lumotlar bazasini o\'chirishni xoxlaysizmi ? ' . htmlentities($_GET['elid'], ENT_QUOTES, 'UTF-8') . '?</font><br />' . "\n";
    echo '<a href="/db/delete/' . urlencode($_GET['elid']) . '&amp;sok=yes">Ha</a> / <a href="/db">Yo\'q</a></center>' . "\n";
    echo '</div>' . "\n";
} else {
        $content = api_query('https://'.$server->ip.'/ispmgr?func=db.delete&elid=' . urlencode($_GET['elid']) . '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
		
        if (isset($parse_xml->ok)) {

            echo '<div class="menu">' . "\n";
            echo '<center><font color="aqua">Ma\'lumotlar bazasi o\'chirildi!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/db">Продолжить</a></div>' . "\n";
        } else {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="red">Ma\'lumotlar bazasini o\'chirishda xatolik!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/db">Продолжить</a></div>' . "\n";
        }
    

}
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>