<?php
$title = 'VDS | Переустановка OS';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
if ($user[vds_aktiv] == 2){
$server = '142.4.212.107:1500';
$vlogin = 'noda4';
$vpass = '5K8f6N8p';
$qas=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
$info = file_get_contents("https://".$server."/vmmgr?authinfo=".$vlogin.":".$vpass."&out=xml&func=vm.edit&elid=".$user['vds_id']."", false, stream_context_create($qas));
$parse_xmla = simplexml_load_string($info);

echo '<div class="title">VDS | Переустановка OS</div>';
if ($parse_xmla->osinstalled == 'on'){
    echo '<div class="err">Посли переустановки все данный будут удалены!</div>';
$content = file_get_contents("https://".$server."/vmmgr?authinfo=".$vlogin.":".$vpass."&out=xml&func=vm.reinstall&elid=".$user['vds_id']."", false, stream_context_create($qas));
$parse_xml = simplexml_load_string($content);
if (empty($_POST['submit'])) {
    echo '<div class="menu">';
        echo '<form action="" method="post">' . "\n";
        echo '<b>OS</b>: 
        <select name="os">';
        foreach($parse_xml->slist[0] as $svar) {
            if ($svar == 'New self-signed' || $svar == 'Let’s Encrypt certificate'){}
            else{
            echo '<option value="'.$svar[key].'">'.$svar.'</option>';
            }
        }
	    echo '</select> <br/> 
	    <b>Пароль (Для Linux ROOT! Для Windows Administrator)</b>:<br/>
	    <input type="text" name="ospass"/>';
	    
        echo '<br/><input class="btn btn-default" name="submit" type="submit" value="Установить" />' . "\n";
        echo '</form></div>';
		echo '<div class="menu"><a href="/user/vds">&laquo; Назад</a></div>' . "\n";
        } else {
            $stadd = array(
    'ISPsystem__' => ''
    );
		$osname = strtr((string)$_POST['os'], $stadd);
		$qas=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
        $content = file_get_contents("https://".$server."/vmmgr?authinfo=".$vlogin.":".$vpass."&out=xml&func=vm.reinstall&elid=".$user['vds_id']."&new_password=on&password=".urlencode($_POST['ospass'])."&confirm=".urlencode($_POST['ospass'])."&osname=".$osname."&vmi=".urlencode($_POST['os'])."&sok=ok", false, stream_context_create($qas));
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="gren">ГОТОВО!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/user/vds">Продолжить</a></div>' . "\n";
        } else {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="red">Ошибка с пароль! нужно норм пароль!!!</font></center></div>' . "\n";
            echo '<div class="menu"><a href="/user/vds/reinstall">Продолжить</a></div>' . "\n";
        }
    }
}else{
    echo '<div class="err">Идёт переустановка OS</div>';
}

}
} else {
header('Location: /auth');}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
 ?>