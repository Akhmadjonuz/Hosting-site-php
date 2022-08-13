<?php
$title='Domenni yo\'q qilish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
echo '<div class="title">Domenni yo\'q qilish</div>';
    $siteisp = 'fasthost.uz';
     if('' . htmlentities($_GET['elid'], ENT_QUOTES, 'UTF-8') . ''=='' . strtolower($user['login']) . '.'.$siteisp.''){
		 $siteisp = 'fasthost.uz';
     echo '<div class=menu>';
        echo '<center><font color="red">Domenlarni ko\'rish <i>site.'.$siteisp.'</i> o\'chirib bo\'lmaydi. Siz shunchaki o\'chirib qo\'yishingiz mumkin!</font></center> </div>';
        echo '<div class=menu><a href="/domen">Davom ettirish</a></div>' . "\n";
}else{
if (empty($_GET['sok'])) {
    echo '<div class="menu">' . "\n";
    echo '<center><font color="red">Siz rostan xam domenni o\'chirishni xoxlaysizmi' . htmlentities($_GET['elid'], ENT_QUOTES, 'UTF-8') . '?</font><br />' . "\n";
    echo '<a href="/domen/delete/' . urlencode($_GET['elid']) . '&amp;sok=yes">Xa</a> / <a href="/domen">Yo\'q</a></center>' . "\n";
    echo '</div>' . "\n";
} else {
    api_query('https://'.$server->ip.'/ispmgr?func=domain.delete&elid=' . urlencode($_GET['elid']) . '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
    // Mail домен
    $content = api_query('https://'.$server->ip.'/ispmgr?func=emaildomain.delete&elid=' . urlencode($_GET['elid']) . '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
    // Web домен
    $content = api_query('https://'.$server->ip.'/ispmgr?func=webdomain.delete&elid=' . urlencode($_GET['elid']) . '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
    $parse_xml = simplexml_load_string($content);
    if (isset($parse_xml->ok)) {
        echo '<div class="menu">' . "\n";
        echo '<center><font color="aqua">Domen muvaffaqiyatli yo\'q qilindi!</font></center></div>' . "\n";
        echo '<div class="menu"><a class="section" href="/domen">Davom ettirish</a></div>' . "\n";
        api_query('https://'.$server->ip.'/ispmgr?func=restart&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        } else {
        echo '<div class="menu">' . "\n";
        echo '<center><font color="red">Domenni o\'chirishda xato!</font></center></div>' . "\n";
        echo '<div class="menu"><a href="/domen">Davom ettirish</a></div>' . "\n";
    }
}
}

} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>