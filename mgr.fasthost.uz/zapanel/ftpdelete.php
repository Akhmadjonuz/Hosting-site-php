<?php
$title='FTP hisobini o\'chirish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
echo '<div class="title">FTP hisobini o\'chirish</div>';
     if('' . htmlentities($_GET['elid'], ENT_QUOTES, 'UTF-8') . ''=='' . strtolower($user['isp_login'])){
     echo '<div class=menu>';
        echo '<center><font color="red">Системный<i> FTP</i> o\'chirib bo\'lmaydi! </font></center></div>';
        echo '<div class="menu"><a href="/ftp">Davom ettirish</a></div>' . "\n";
}else{

    if (empty($_GET['sok'])) {
        echo '<div class="menu">' . "\n";
        echo '<center><font color="red">Haqiqatan ham FTP hisobini o\'chirmoqchimisiz? ' . htmlentities($_GET['elid'], ENT_QUOTES, 'UTF-8') . '?</font></center><br />' . "\n";
        echo '<center><a href="/ftp/delete/' . urlencode($_GET['elid']) . '&amp;sok=yes">Ha</a> | <a href="/ftp">Yo\'q</a></center>' . "\n";
        echo '</div>' . "\n";
    } else {
        $content = api_query('https://'.$server->ip.'/ispmgr?func=ftp.user.delete&elid=' . urlencode($_GET['elid']) . '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="aqua">FTP hisobi o\'chirildi!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/ftp">Davom ettirish</a></div>' . "\n";
        } else {
            echo '<div class="error">' . "\n";
            echo '<center><font color="red">FTP hisobini o\'chirishda xato!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/ftp">Davom ettirish</a></div>' . "\n";
        }
    }
}
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>