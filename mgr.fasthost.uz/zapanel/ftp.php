<?php
$title='FTP hisoblar';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
$content = api_query('https://'.$server->ip.'/ispmgr?func=ftp.user&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
$parse_xml = simplexml_load_string($content);
$sta = array(
    'on' => '<img src="/img/on.png" width="13" height="13" alt="Включен" />',
    'off' => '<img src="/img/off.png" width="13" height="13" alt="Отключен" />'
    );
echo '<div class="title">FTP hisoblar</div>';
echo '<div class="menu"><a href="/ftp/add"><img src="/img/mgr/fm.png" width="19" height="19"> FTP hisobini qo\'shish</a></div>';
if(count($parse_xml->elem) > 0){
foreach($parse_xml->elem as $var) {
	if('' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . ''=='' . strtolower($user['isp_login'])){
	echo '<div class=title>Ism: <font color=#fff>' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . ' [Tizim]</font></a> ';
    echo '</div>';
	} else {
    echo '<div class=title>Ism: <font color=#fff>' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . '</font></a> ';
    echo '</div>';		
	}
	echo '<div class=menu><b>Server:</b> ' . $server->ip_domain . ' (fasthost.uz)<br/>';
	echo '<b>shart:</b> '.strtr((string)$var->active , $sta) . '<br/>';
    echo '<b>Katalog:</b> ' . htmlentities((string)$var->home, ENT_QUOTES, 'UTF-8') . '<br/>';
	if('' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . ''=='' . strtolower($user['isp_login'])){
	echo '	<table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>
			<td width="50%"><a class=subm><img src=/img/on.png><s> Yoqish</s></td>
			</tr></tbody></table><table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>';
    echo '<td width="50%"><a class=subm><img src=/img/off.png><s> O\'chirish</s></td>';
    } else {
	echo '	<table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>
			<td width="50%"><a class=subm href="/ftp/enable/' . urlencode((string)$var->name) . '"><img src=/img/on.png> Yoqish</a></td>
			</tr></tbody></table><table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>';
    echo '<td width="50%"><a class=subm href="/ftp/disable/' . urlencode((string)$var->name) . '"><img src=/img/off.png> O\'chirish</a></td>';
	}	
   if('' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . ''=='' . strtolower($user['isp_login'])){
   echo '<td width="50%"><div class=subm><img src="/img/mgr/x.png" width="20" height="20"> <s>O\'chirish</s></div></td></tr></tbody></table></div>';
   } else {
   echo '<td width="50%"><a class=subm href="/ftp/delete/' . urlencode((string)$var->name) . '"><img src="/img/mgr/x.png" width="20" height="20"> O\'chirish</a></td></tr></tbody></table></div>';
}		
}
}
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>