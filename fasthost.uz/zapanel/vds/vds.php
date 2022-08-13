<?php
$title = 'VDS | Сервер! ';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
////////
if (isset($_GET['svds']) && $user['vds_aktiv'] == 1) {
$idnewt = abs(intval($_GET['svds']));
if ($idnewt > 0){
$connect->query("UPDATE `users` SET `vds_tid` = '$idnewt' WHERE `id` = '".$user->id."'");
}

header('Location: /user/vds');
}
////////////

echo '<div class="title">VDS | Сервер!</div>';
if (empty($user['vds_tid'])) {
    echo 'Error~!';
}else{
    if ($user['vds_tid'] == 1){
        $vdst ='VDS 1 (200 руб/мес)';
    }elseif($user['vds_tid'] == 2){
        $vdst ='VDS 2 (250 руб/мес)'; 
    }elseif($user['vds_tid'] == 3){
        $vdst ='VDS 3 (350 руб/мес)';
    }else{
        $vdst = '';
    }
    echo '<div class="menu"><b>Ваш тариф:</b> '.$vdst.' '.($user['vds_aktiv'] == 1 ? '(<a href="/tarifs/vds">Сменить тариф</a>)' : '').'<br/><font color="red">Посли активация смена тариф нельзя!</font></div>';
    if ($user['vds_aktiv'] == 1){
        echo '<div class="menu"><b>Активность: </b> <font color="red">НЕ активен!</font> (<font color="green">Деньги не оплачен!</font>)</div>';
    }elseif($user['vds_aktiv'] == 2){
$server = '142.4.212.107:1500';
$vlogin = 'noda4';
$vpass = '5K8f6N8p';
$qas=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
$info = file_get_contents("https://".$server."/vmmgr?authinfo=".$vlogin.":".$vpass."&out=xml&func=vm.edit&elid=".$user['vds_id']."", false, stream_context_create($qas));
$parse_xml = simplexml_load_string($info);
if ($parse_xml->osinstalled == 'off'){
    $ok = '(<font color="red">Идёт установка OS</font>)';
}else{
    $ok='';
}
$sta = array(
    'running' => '<img src="https://mgr.zadc.ru/img/on.png" width="13" height="13" alt="Включен" />',
    'down' => '<img src="https://mgr.zadc.ru/img/off.png" width="13" height="13" alt="Отключен" />'
    ); 
echo '<div class="menu">
<b>CPU:</b> '.$parse_xml->vcpu.'x'.$parse_xml->cputune.'Mhz<br/>
<b>RAM:</b> '.$parse_xml->mem.' MB DDR3<br/>
<b>SSD:</b> '.$parse_xml->vsize.' MB<br/>
<b>OS:</b> '.$parse_xml->osname.'<br/>
<b>IP:</b> '.$parse_xml->ip.'<br/>
##### VNC Аккаунт данный #####<br/>
<b>VNC Сервер:</b> '.$parse_xml->vnchost.'<br/>
<b>VNC Порт:</b> '.$parse_xml->vncport.'<br/>
<b>VNC Пароль:</b> '.$parse_xml->vncpassword.'<br/>
##### END VNC #####<br/>
<b>Активность: </b> '.strtr((string)$parse_xml->state , $sta) . ' '.$ok.' <br/>';
if ($parse_xml->state == 'running'){
echo '
'.(empty($ok) ? '<a href="/user/vds/reinstall">[Переустановка OS]</a>  <a href="/user/vds/repass">[Изменить Пароль]</a> <a href="/user/vds/stop">[Остановить VDS]</a> <a href="/user/vds/reboot">[Перезагрузка VDS]</a>' : '').'</div>';
}else{
    echo '<a href="/user/vds/start">[Запустить VDS]</a></div>';
}

    }
}







} else {
header('Location: /auth');}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
 ?>