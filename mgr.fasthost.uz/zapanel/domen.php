<?php
$title='Domenlar';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
$content = api_query('https://'.$server->ip.'/ispmgr?func=webdomain&out=xml&authinfo='.$user['isp_login'].':'.$user['isp_pass']);
$parse_xml = simplexml_load_string($content);
$sta = array(
    'on' => '<img src="/img/on.png" width="13" height="13" alt="Yoniq" />',
    'off' => '<img src="/img/off.png" width="13" height="13" alt="O\'chirilgan" />'
    ); 
    $stad = array(
    'php_mode_cgi' => 'CGI',
    'php_mode_mod' => 'Modul Apache',
    'php_mode_nophp' => 'PHP  Yondirilmagan !',
    'php_mode_lsapi' => 'LSAPI',
    'php_mode_fcgi_nginxfpm' => 'FastCGI TG+'
    ); 
echo '<div class="title">Domenlar</div>';
echo '<div class="menu"><a href="/domen/add"><img src="/img/cp/domen_st.png" width="19" height="19"> Domen qo\'shish</a></div>';
if(count($parse_xml->elem) > 0){
foreach($parse_xml->elem as $var) {
	echo '<div class=title><img src="/img/cp/domen_st.png" width="16" height="16"> Domen: <a href="http://' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . '" target="_blank"><font color=#fff>' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . '</font></a><span  style="float:right"><small><a href="/domen/set/'.encode($var->name).'"><font color="red"> [Sozlash]</font></a></small></span>';
    echo '</div>';
    echo '<div class=menu><b>PHP rejimi:</b> '.strtr((string)$var->php_mode , $stad) . '<br/>';
	echo '<b>PHP:</b> '.$var->php_version.'<br/>';
	echo '<b>Parametrlar:</b> ';
	 if (isset($var->php)) {
        echo '<img src="/img/cp/p-php.png" alt="php" />';
    }
    if (isset($var->cgi)) {
        echo ' <img src="/img/cp/p-cgi.png" alt="cgi" />';
    }
    if (isset($var->secure) && $var->secure == 'on') {
        echo ' <img src="/img/cp/p-ssl.png" alt="SSL" />';
    }
	echo '<br/>';
	echo '<b>Katalog:</b> ' . htmlentities((string)$var->docroot, ENT_QUOTES, 'UTF-8') . '<br/>';
	echo '<b>Shart:</b> '.strtr((string)$var->active , $sta) . '<br/>';
	echo '	<table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>
			<td width="50%"><a href="/domen/enable/' . urlencode((string)$var->name) . '"><img src=/img/on.png> Yoqish</a></td>';
			if('' . htmlentities((string)$var->php_mode, ENT_QUOTES, 'UTF-8') . ''=='php_mode_cgi'){
		    echo '<td width="50%"><a class=subm href="/domen/phpv/'.encode($var->name).'"><img src=/img/cp/p-php.png> PHP versiyasini tanlash</a></td>';
			}else{
			    echo '<td width="50%"><a><img src=/img/cp/p-php.png><s> PHP versiyasini tanlash</s></a></td>';
			}
			echo '</tr></tbody></table><table width="100%" cellpadding="0" border="0" cellspacing="0"><tbody><tr>';
    echo '<td width="50%"><a href="/domen/disable/' . urlencode((string)$var->name) . '"><img src=/img/off.png> O\'chirish</a></td>';
    
	if('' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . ''=='' . strtolower($user['login']) . '.fasthost.uz'){
	echo '<td width="50%"><img src="/img/mgr/x.png" width="20" height="20"> <s>O\'chirish</s></td></tr></tbody></table>';
    }else{
	echo '<td width="50%"><a href="/domen/delete/' . urlencode((string)$var->name) . '"><img src="/img/mgr/x.png" width="20" height="20"> O\'chirish</a></td></tr></tbody></table>';
    }
    echo '</div>';
}
}else{
	echo '<div class="menu"><center><font color="red">Domenlar ro\'yxati bo\'sh!</font></center></div>';
}

} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>