<?php
$title='Domen sozlamalari';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
$ap = htmlspecialchars(trim($_GET['elid']));
		$content = api_query('https://'.$server->ip.'/ispmgr?func=webdomain.edit&owner='.$user['isp_login'].'&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass'].'&elid=' .urlencode(decode($ap)). '&out=xml');
        $parse_xml = simplexml_load_string($content);
        echo '<div class="title">Domen sozlamalari</div>';
        //echo print_r($parse_xml->ssl_cert);
        
        //echo 'https://'.$server->ip.'/ispmgr?func=webdomain.edit&owner='.$user['isp_login'].'&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass'].'&elid=' .urlencode(decode($ap)). '&out=xml ';
        if (empty($_POST['submit'])) {
        echo '<div class="menu"><b>Parametrlar:</b> ' .urlencode(decode($ap)). '<br/>';    
        echo '<form action="/domen/set/'.urlencode($_GET['elid']).'" method="post">' . "\n";
        if ($parse_xml->php_mode == 'php_mode_cgi'){
            echo '<b>PHP rejimi</b>: 
        <select name="php_mode">
	    <option value="php_mode_cgi">CGI</option>
	    </select> <br/>';
        }elseif($parse_xml->php_mode == 'php_mode_mod'){
           echo '<b>PHP rejimi</b>: 
        <select name="php_mode">
	    <option value="php_mode_mod">Modul Apache</option>
	    <option value="php_mode_cgi">CGI</option>
	    <option value="php_mode_fcgi_nginxfpm">FastCGI TG+</option>
	    </select> <br/>';
        }else{
            echo '<b>PHP rejimi</b>: 
        <select name="php_mode">
        <option value="php_mode_fcgi_nginxfpm">FastCGI TG+</option>
	    <option value="php_mode_lsapi">LSAPI</option>
	    </select> <br/>';
        }
        if ($parse_xml->charset == 'off'){
            echo '<b>Kodlash</b>: 
        <select name="charset">
	    <option value="off">Belgilamang</option>
	    <option value="UTF-8">UTF-8</option>
	    </select> <br/> ';
        }else{
          echo '<b>Kodlash</b>: 
        <select name="charset">
	    <option value="UTF-8">UTF-8</option>
	    <option value="off">Bellgilamang</option>
	    </select> <br/> ';
        }
        if ($parse_xml->secure == 'on'){
        echo '<b>SSL</b>: 
        <select name="ssl">
        <option value="'.$parse_xml->ssl_cert.'">'.$parse_xml->ssl_cert.' [Tekshirilmoqda]</option>';
        foreach($parse_xml->slist[1] as $svar) {
            if ($svar == 'New self-signed' || $svar == 'Let’s Encrypt certificate'){}
            else{
            echo '<option value="'.$svar[key].'">'.$svar.'</option>';
            }
        }
	    echo '</select> <br/> ';
	     
        if ($parse_xml->redirect_http == 'on'){
        echo '<b>HTTP so\'rovlarini HTTPS-ga yo\'naltirish</b>: 
        <input type="checkbox" name="https" Tekshirilmoqda><br/>';
        }else{
            echo '<b>HTTP so\'rovlarini HTTPS-ga yo\'naltirish</b>: 
        <input type="checkbox" name="https"><br/>';
        }
        }
        echo '####### <b>Jurnallar</b> #######<br/>';
        if ($parse_xml->log_access == 'on'){
        echo '<b>So\'rovlar jurnali</b>: 
        <input type="checkbox" name="logr" Tekshirilmoqda><br/>';
        }else{
             echo '<b>So\'rovlar jurnali</b>: 
        <input type="checkbox" name="logr"><br/>';
        }
        if ($parse_xml->log_error == 'on'){
        echo '<b>Xato jurnali</b>: 
        <input type="checkbox" name="loge" Tekshirilmoqda><br/>';
        }else{
            echo '<b>Xato jurnali</b>: 
        <input type="checkbox" name="loge"><br/>';
        }
        echo '<br/><input class="btn btn-default" name="submit" type="submit" value="O\'zgartirish" />' . "\n";
        echo '</form></div>';
		echo '<div class="menu"><a href="/domen">&laquo; Orqaga</a></div>' . "\n";
        } else {
		//$cgi = isset($_POST['cgi'])?'on':'';
		$https = isset($_POST['https'])? 'on' : 'off' ;
		$logr = isset($_POST['logr'])? 'on' : 'off' ;
		$loge = isset($_POST['loge'])? 'on' : 'off' ;
        $content = api_query('https://'.$server->ip.'/ispmgr?func=webdomain.edit&elid=' .urlencode(decode($ap)). '&log_access='.$logr.'&log_error='.$loge.'&ssl_cert='.urlencode($_POST['ssl']).'&redirect_http='.$https.'&charset='.urlencode($_POST['charset']).'&php_mode='.urlencode($_POST['php_mode']).'&sok=ok&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="aqua">Sozlamalar muvaffaqiyatli o\'zgartirildi!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/domen">Davom ettirish</a></div>' . "\n";
        } else {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="red">Sozlamalarni o‘zgartirishda xato!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/domen">Davom ettirish</a></div>' . "\n";
        }
    }
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>