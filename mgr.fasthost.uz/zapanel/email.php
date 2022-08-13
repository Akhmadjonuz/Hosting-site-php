<?php
$title='Почтовые ящики (Mail)';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
$content = api_query('https://'.$server->ip.'/ispmgr?func=email&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
$parse_xml = simplexml_load_string($content);
$sta = array(
    'on' => '<img src="/img/on.png" width="13" height="13" alt="Включен" />',
    'off' => '<img src="/img/off.png" width="13" height="13" alt="Отключен" />'
    );
echo '<div class="title">Почтовые ящики (Mail)</div>';
echo '<a class="section" href="/email/add"><img src="/img/mgr/p.png" width="19" height="19"> Добавить mail аккаунт</a>';
if(count($parse_xml->elem) > 0){
foreach($parse_xml->elem as $var) {
	echo '<div class=title>Имя: <font color=#fff>' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . '</font></a> ';
    echo '</div>';	
	echo '<div class="menu"><b>Состояние:</b> '.strtr((string)$var->active , $sta) . '<br/>';
	echo '	<table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>
			<td width="50%"><a href="?e=enable&amp;elid='.encode($var->name).'"><img src=/img/on.png> Включить</a></td>
			</tr></tbody></table><table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>';
    echo '<td width="50%"><a href="?e=disable&amp;elid='.encode($var->name).'"><img src=/img/off.png> Выключить</a></td>';
    echo '<td width="50%"><a href="?e=delete&amp;elid='.encode($var->name).'"><img src="/img/mgr/x.png" width="20" height="20"> Удалить</a></td></tr></tbody></table></div>';
}
}else{
	echo '<div class="error">Список mail аккаунтов пуст!<br/></div>';
}

} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>