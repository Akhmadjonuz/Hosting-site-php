<?php
$title='Yangi FTP hisob ochish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
echo '<div class="title">Yangi FTP hisob ochish</div>';	
    if (empty($_POST['submit'])) {
        echo '<div class="menu"><form action="/ftp/add" method="post">' . "\n";
        echo 'Hisob: ' . "\n";	
        echo '<input name="name" type="text"/><br />' . "\n";
        echo 'Joy: ' . "\n";
        echo '<input name="d_p" type="text"/> (namuna: example.uz/img)<br />' . "\n";			
        echo 'Parol: ' . "\n";
        echo '<input name="passwd" type="text"/><br />' . "\n";
        echo 'Takroriy parol: ' . "\n";
        echo '<input name="confirm" type="text"/><br />' . "\n";
        echo '<input class="btn btn-default" name="submit" type="submit" value="Qo\'shish" />' . "\n";
        echo '</form></div>';
		echo '<div class="menu"><a href="/ftp">&laquo; Orqaga</a></div>' . "\n";
        } else {
		// Фильтрация	
		$name = filter($_POST['name']);
        $passwd = filter($_POST['passwd']);	
        $confirm = filter($_POST['confirm']);
        $d_p = filter($_POST['d_p']);		
        $content = api_query('https://'.$server->ip.'/ispmgr?func=ftp.user.edit&name='.mb_strtolower($user['login'].'_'.$name).'&passwd='.$passwd.'&owner='.$user['isp_login'].'&confirm='.$confirm.'&home=www/'.$d_p.'&sok=ok&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="aqua">FTP hisobi muvaffaqiyatli qo\'shildi!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/ftp">Продолжить</a></div>' . "\n";
        } else {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="red">FTP hisobini qo\'shishda xato!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/ftp.php">Продолжить</a></div>' . "\n";
        }
    }	
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>