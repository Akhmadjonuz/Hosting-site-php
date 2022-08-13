<?php
$title='Ma\'lumotlar bazasi | MySql ochish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
   echo '<div class="title">Yangi ma\'lumotlar bazasi ochish</div>';
    if (empty($_POST['submit'])) {
        echo '<div class="menu"><form action="/db/add" method="post">' . "\n";
        echo 'Baza ismi: ' . "\n";	
        echo '<input name="name" type="text"/> <br />' . "\n"; //('.strtolower($user['login']).'_Назв.)
        echo 'Kodlash: 
		<select name="encoding">
	    <option value="utf8">UTF-8</option>
	    <option value="cp1250">CP1250</option>
		<option value="cp1251">CP1251</option>
	    </select> <br/>';		
        echo 'Parol: ' . "\n";
        echo '<input name="passwd" type="text"/><br />' . "\n";
        echo 'Parolni takrorlash: ' . "\n";
        echo '<input name="confirm" type="text"/><br />' . "\n";
        echo '<input class="btn btn-default" name="submit" type="submit" value="Qo\'shish" />' . "\n";
        echo '</form></div>';
		echo '<div class="menu"><a href="/db">&laquo; Orqaga</a></div>' . "\n";
        } else {
		// Фильтрация	
		$name = mb_strtolower(trim($_POST['name']));
        $passwd = trim($_POST['passwd']);	
        $confirm = trim($_POST['confirm']);
        $content = api_query('https://'.$server->ip.'/ispmgr?func=db.edit&username='.mb_strtolower($user['login']).'_'.$name.'&name='.mb_strtolower($user['login']).'_'.$name.'&password='.$passwd.'&owner='.$user['isp_login'].'&confirm='.$confirm.'&type=mysql&remote_access=on&charset='.urlencode($_POST['encoding']).'&sok=ok&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="aqua">Ma\'lumotlar bazasi muvaffaqiyatli qo\'shildi!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/db">Davom ettirish</a></div>' . "\n";
        } else {
            //print_r($content);
            if (mb_strlen(trim($_POST['name'])) > 5){
                echo '<div class="menu"><h1><font color="red">Asosiy nom 5 belgigacha bo\'lishi kerak!</font></h1></div>';
            }
            echo '<div class="menu">' . "\n";
            echo '<center><font color="red">Ma\'lumotlar bazasini qo\'shishda xato!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/db">Davom ettirish</a></div>' . "\n";
        }
    }	
    
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>