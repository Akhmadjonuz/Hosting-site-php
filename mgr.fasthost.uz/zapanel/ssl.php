<?php
$title='SSL sertifikatlar';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
$content = api_query('https://'.$server->ip.'/ispmgr?func=sslcert&out=xml&authinfo='.$user['isp_login'].':'.$user['isp_pass']);
$parse_xml = simplexml_load_string($content);
$sta = array(
    'on' => '<img src="/img/on.png" width="13" height="13" alt="Включен" />',
    'off' => '<img src="/img/off.png" width="13" height="13" alt="Отключен" />'
    ); 
echo '<div class="title">SSL sertifikatlar</div>';
echo '<div class="menu"><a href="/ssl/add"><img src="/img/cp/domen_st.png" width="19" height="19"> BEPUL SSL sertifikat generatori</a></div>';
if(count($parse_xml->elem) > 0){
foreach($parse_xml->elem as $var) {
	echo '<div class=title> Ism: ' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . '</font></a>';
    echo '</div>';
    echo '<div class=menu><b>Faolligi:</b> '.htmlentities((string)$var->valid_after) . '<br/>';
	echo '<b>Ma\'lumot:</b> '.$var->info.'<br/>';
	echo '<b>Status:</b> '.strtr((string)$var->active , $sta) . '<br/>';
	echo '<b>Holati:</b> '.($var->letsencrypt_verifying ? '<font color="'.$var->type[color].'">'.($var->type[color] == 'blue' ? 'Tayyorlanmoqda!' : 'Faol!').'</font>' : '<font color="'.$var->type[color].'">'.($var->type[color] == 'blue' ? 'Tayyorlanmoqda!' : 'Faol!').'</font>').'<br/>';
	if('' . htmlentities((string)$var->active, ENT_QUOTES, 'UTF-8') . ''== 'on'){
   echo '<td width="50%"><div class=subm><img src="/img/mgr/x.png" width="20" height="20"> <s>O\'chirish</s></div></td></tr></tbody></table></div>';
   } else {
   echo '<td width="50%"><a class=subm href="/ssl/delete/' . urlencode((string)$var->name) . '"><img src="/img/mgr/x.png" width="20" height="20"> O\'chirish</a></td></tr></tbody></table></div>';
}
}
}else{
	echo '<div class="menu"><center><font color="red">Список доменов пуст!</font></center></div>';
}

} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>