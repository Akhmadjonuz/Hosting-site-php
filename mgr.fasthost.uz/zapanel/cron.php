<?php
$title='Rejalashtiruvchi (CRON)';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
$content = api_query('https://'.$server->ip.'/ispmgr?func=scheduler&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
$parse_xml = simplexml_load_string($content);
$sta = array(
    'on' => '<img src="/img/on.png" width="13" height="13" alt="Yoniq" />',
    'off' => '<img src="/img/off.png" width="13" height="13" alt="O\'chirilgan" />'
    );
echo '<div class="title">Rejalashtiruvchi (CRON)</div>';
echo '<div class="menu"><a href="/cron/add"><img src="/img/mgr/p.png" width="19" height="19"> Cron rejasi qo\'shish</a></div>';
$mm = array(
    'every_hour' => 'Har 1 soatda',
    'every_day' => 'Har 24 soatda',
    'every_week' => 'Har hafta',
    'every_month' => 'Har oy',
    '*/30' => 'Har 30 minutda',
    '*/15' => 'Har 15 minutda',
    '*/5' => 'Har 5 minutda',
    '*/1' => 'Har 1 minutda',
    '*' => '',
    '/usr/bin/wget -O /dev/null ' => ''
    ); 
if(count($parse_xml->elem) > 0){
foreach($parse_xml->elem as $var) {
	echo '<div class=title>Ta\'rif: <font color=#fff>' . htmlentities((string)$var->description, ENT_QUOTES, 'UTF-8') . '</font></a> <span style="float:right"><small><a class="main" href="/cron/edit/'.encode($var->key).'"> Изменить</a></small></span><br />';
    echo '</div>';	
	echo '<div class="menu"><b>Shart:</b> '.strtr((string)$var->active , $sta) . '<br/>';
	if (htmlentities(strtr((string)$var->schedule_type, $mm), ENT_QUOTES, 'UTF-8') == 'custom'){
	$mno = htmlentities(strtr((string)$var->interval, $mm), ENT_QUOTES, 'UTF-8');
	}else{
	$mno = htmlentities(strtr((string)$var->schedule_type, $mm), ENT_QUOTES, 'UTF-8');
	}
    echo '<b>Davr:</b> ' .$mno. '<br/>';
	echo '<b>Cron URL manzili:</b> ' . htmlentities(strtr((string)$var->command, $mm), ENT_QUOTES, 'UTF-8') . '<br/>';
	echo '	<table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>
			<td width="50%"><a href="/cron/enable/'.encode($var->key).'"><img src=/img/on.png> Yondirish</a></td>
			</tr></tbody></table><table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>';
    echo '<td width="50%"><a href="/cron/disable/'.encode($var->key).'"><img src=/img/off.png> To\'xtatish</a></td>';
    echo '<td width="50%"><a href="/cron/delete/'.encode($var->key).'"><img src="/img/mgr/x.png" width="20" height="20"> O\'chirish</a></td></tr></tbody></table></div>';
}
}else{
	echo '<div class="menu"><center><font color="red">Cron vazifalar ro\'yxati bo\'sh!</font></center></div>';
}

} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>