<?php
$title='Ma\'lumotlar bazasi';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
    $content = api_query('https://'.$server->ip.'/ispmgr?func=db&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
$parse_xml = simplexml_load_string($content);
echo '<div class="title">Ma\'lumotlar bazasi</div>';
echo '<div class="menu"><a href="/db/add"><img src="/img/mgr/mysql.png" width="19" height="19"> Ma\'lumotlar bazasi qo\'shish</a></div>';
if(count($parse_xml->elem) > 0){
foreach($parse_xml->elem as $var) {
	echo '<div class=title>Malumotlar bazasi: <font color=#fff>' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . '</font></a> ';
    echo '</div>';
	echo '<div class=menu><b>Foydalanuvchi:</b> ' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . '<br/>';
	echo '<b>Turi:</b> ' . htmlentities((string)$var->server, ENT_QUOTES, 'UTF-8'). '<br/>';
	echo '<b>Server:</b> ' . htmlentities((string)$var->server_host, ENT_QUOTES, 'UTF-8'). ' localhost (fasthost.uz)<br/>';
	echo '<b>Hajmi:</b> ' . htmlentities((string)$var->size, ENT_QUOTES, 'UTF-8') . '<br/>';
	echo '	<table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>
			</tr></tbody></table><table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>';// <img src="/img/mgr/x.png" width="20" height="20">
    echo '<td width="50%"><a><img src="/img/mgr/pass.png" width="20" height="20"><s> Dapmni yuklash</s></a></td>';
    echo '<td width="50%"><a class=subm href="/db/delete/' . urlencode((string)$var->key) . '"><img src="/img/mgr/x.png" width="20" height="20"> O\'chirish</a></td></tr></tbody></table></div>';
}
}else{
	echo '<div class="menu"><center><font color="red">Ma\'lumotlar bazalari ro\'yxati bo\'sh!</font></center></div>';
}
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>