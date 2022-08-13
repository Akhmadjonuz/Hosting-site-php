<?php
$title='PHP versiyasini tanlash';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
    $ap = htmlspecialchars(trim($_GET['elid']));
    $contentab = api_query('https://'.$server->ip.'/ispmgr?func=webdomain.edit&owner='.$user['isp_login'].'&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass'].'&elid=' .urlencode(decode($ap)). '&out=xml');
        $parse_xmlab = simplexml_load_string($contentab);
        //echo print_r($parse_xmlab);
        echo '<div class="title">PHP versiyasini tanlash</div>';
        if (empty($_POST['submit'])) {
        echo '<div class="menu">Ushbu domen uchun PHP versiyani tanlang' .urlencode(decode($ap)). '<br/>';    
        echo '<form action="/domen/phpv/'.urlencode($_GET['elid']).'" method="post">' . "\n";
        echo 'PHP versiyasi: 
		<select name="php_cgi_version">';
		if ($parse_xmlab->php_cgi_version == 'isp-php54'){
		echo '
	    <option value="isp-php54">5.4 (alt)</option>
		<option value="isp-php56">5.6 (alt)</option>
		<option value="isp-php72">7.2 (alt)</option>
	    <option value="isp-php74">7.4 (alt)</option>
	    </select> <br/>';
		}elseif($parse_xmlab->php_cgi_version == 'isp-php56'){
		    echo '
		<option value="isp-php56">5.6 (alt)</option>
	    <option value="isp-php54">5.4 (alt)</option>
		<option value="isp-php72">7.2 (alt)</option>
     	<option value="isp-php74">7.4 (alt)</option>
	    </select> <br/>';
		}elseif($parse_xmlab->php_cgi_version == 'isp-php74'){
		    echo '
		<option value="isp-php74">7.4 (alt)</option
	    <option value="isp-php54">5.4 (alt)</option>
	    <option value="isp-php56">5.6 (alt)</option>
	    <option value="isp-php72">7.2 (alt)</option>
	    </select> <br/>';
		}elseif($parse_xmlab->php_cgi_version == 'isp-php72'){
		    echo '
		<option value="isp-php72">7.2 (alt)</option>
	    <option value="isp-php54">5.4 (alt)</option>
	    <option value="isp-php56">5.6 (alt)</option>
	    <option value="isp-php74">7.4 (alt)</option>
	 
	    </select> <br/>';
		}elseif($parse_xmlab->php_mode_cgi == 'native'){
		    echo '
	    <option value="5.4">5.4 (alt)</option>
	    <option value="5.6">5.6 (alt)</option>
	    <option value="7.2">7.2 (alt)</option>
        <option value="isp-php72">7.2 (alt)</option>
	    </select> <br/>';
		}
	    
	    //<option value="native">5.6 (native)</option>
        echo '<input class="btn btn-default" name="submit" type="submit" value="O\'zgartirish" />' . "\n";
        echo '</form></div>';
		echo '<div class="menu"><a href="/domen">&laquo; Orqaga</a></div>' . "\n";
        } else {
        $content = api_query('https://'.$server->ip.'/ispmgr?func=webdomain.edit&elid=' .urlencode(decode($ap)). '&php_cgi_version='.urlencode($_POST['php_cgi_version']).'&sok=ok&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="aqua">PHP versiyasi o\'rnatildi!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/domen">Davom ettirish</a></div>' . "\n";
        } else {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="red">PHP o\'rnatishda xato!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/domen">Davom ettirish</a></div>' . "\n";
        }
    }

} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>