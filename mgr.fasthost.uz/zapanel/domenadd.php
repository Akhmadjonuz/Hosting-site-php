<?php
$title='Yangi domen';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
echo '<div class="title"><b>Yangi domen</b></div>';	

    
    if (empty($_POST['submit'])) {
        echo '<div class="menu"><form action="/domen/add" method="post">' . "\n";
        echo 'Domen nomini kiriting:  ' . "\n";
        echo '<input name="name" type="text"/>  <br/><b>Namuna</b>: PCOUZ.uz | Subdomen.pcouz.uz<br />' . "\n";
		echo 'Domenni yo\'naltiring! <br />' . "\n";
        echo 'Bizning DNS lar:<br />' . "\n";
        echo '<font color="aqua">ns1.fasthost.uz<br/>ns2.fasthost.uz</font><br />' . "\n";
        echo '<input class="btn btn-default" name="submit" type="submit" value="Qo\'shish" />' . "\n";
        echo '</form></div>' . "\n";
        echo '<div class="menu"><a href="/domen">&laquo; Назад</div></a> ';
       } else {
	$siteisp = 	'zadc.ru';   
    $dm_filter_1simb = strlen(htmlentities($_POST['name']));
	$dm_filter_2simb = strlen('zadc.ru');
	$dm_filter_3simb = $dm_filter_1simb - $dm_filter_2simb;
	if($dm_filter_3simb > '0'){
	$dm_filter_ok = 1;
	$dm_filter_filt = substr($_POST['name'],$dm_filter_3simb,$dm_filter_1simb);
	}else{
	$dm_filter_ok = 0;
	$dm_filter_filt = '';
	}
	if(($dm_filter_ok=='1') and ($dm_filter_filt == 'Fasthost.Uz')){
	echo'<div class=menu><center><font color="red">Xato! tizim domeni va uni sayt manzili sifatida qo\'shish mumkin emas!</font></center></div>';
	echo '<div class="menu"><a href="/domen">Davom ettirish</a></div>';		
     } else {
		// Фильтрация
		$name = htmlentities($_POST['name']);	
		// Mail домен
		$content = api_query("https://".$server->ip."/ispmgr?func=emaildomain.edit&defaction=ignore&ipsrc=auto&owner=".$user['isp_login']."&name=".$name."&authinfo=".$user['isp_login'] . ":" . $user['isp_pass']."&out=xml&sok=yes");
        // Web домен
        $content = api_query("https://".$server->ip."/ispmgr?func=webdomain.edit&owner=".$user['isp_login']."&authinfo=".$user['isp_login'] . ":" . $user['isp_pass']."&name=".$name."&email=admin@".$name."&sok=yes&out=xml");
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="aqua">Domen nomi muvaffaqiyatli qo\'shildi!</font></center>' . "\n";
			echo '</div>' . "\n";
            echo '<div class="menu"><a href="/domen">Davom ettirish</a></div>' . "\n";
        } else {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="red">Domen nomini qo\'shishda xato!</font></center>' . "\n";
			echo '</div>' . "\n";
            echo '<div class="menu"><a href="/domen">Davom ettirish</a></div>' . "\n";
        }
    }
	   }

} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>