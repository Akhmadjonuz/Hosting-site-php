<?php
$title='BEPUL SSL generatori';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
		$content = api_query('https://'.$server->ip.'/ispmgr?func=letsencrypt.generate&&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass'].'&out=xml');
        $parse_xml = simplexml_load_string($content);
        echo '<div class="title">BEPUL SSL generatori</div>';
        //echo print_r($parse_xml->ssl_cert);
        
        //echo 'https://'.$server->ip.'/ispmgr?func=webdomain.edit&owner='.$user['isp_login'].'&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass'].'&elid=' .urlencode(decode($ap)). '&out=xml ';
        if (empty($_POST['submit'])) {
        echo '<div class="menu">';    
        echo '<form action="/ssl/add" method="post">' . "\n";
        echo '<b>Domen</b>: 
        <select name="domen">';
        foreach($parse_xml->slist[0] as $svar) {
            echo '<option value="'.$svar[key].'">'.$svar.'</option>';
        }
	    echo '</select> <br/> ';
        echo '<input class="btn btn-default" name="submit" type="submit" value="Yaratish" />' . "\n";
        echo '</form></div>';
		echo '<div class="menu"><a href="/ssl">&laquo; Orqaga</a></div>' . "\n";
        } else {
		//$cgi = isset($_POST['cgi'])?'on':'';
		$https = isset($_POST['https'])? 'on' : 'off' ;
        $content = api_query('https://'.$server->ip.'/ispmgr?func=letsencrypt.generate&domain_name='.urlencode($_POST['domen']).'&sok=ok&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="aqua">Bajarildi! Tez orada SSL sertifikat aktivlashadi (2-3 daqiqa)!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/ssl">Davom ettirish</a></div>' . "\n";
        } else {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="red">Ошибка!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/ssl">Davom ettirish</a></div>' . "\n";
        }
    }
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>