<?php
set_time_limit(0);
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");

// Yangi akkauntlar va tozalangan akkauntlarni aktivlaydi!
$qa = $connect->query("SELECT * FROM `users` WHERE `vds_aktiv` = '1'");
foreach ($qa as $ac) {
if ($ac[vds_tid] == 1){
    $vdse = '200';
    $vds_ram = '1024';
    $vds_cpu = '1';
    $vds_ssd = '20000';
}elseif(vds_tid == 2){
    $vdse = '250';
    $vds_ram = '2000';
    $vds_cpu = '2';
    $vds_ssd = '30000';
}elseif(vds_tid == 3){
    $vdse = '350';
    $vds_ram = '4000';
    $vds_cpu = '2';
    $vds_ssd = '50000';
}else{
    $vdse = '9999';
}

if ($ac[vds_money] >= $vdse) {
$isp_paswd	=	generate_password();
$isp_user = $ac[login];
$isp_user = mb_strtolower($isp_user);
$server = '142.4.212.107:1500';
$vlogin = 'noda4';
$vpass = '5K8f6N8p';
$qas=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
$reguserisp = file_get_contents("https://".$server."/vmmgr?authinfo=".$vlogin.":".$vpass."&out=xml&func=vm.edit&family=66.70.168.176/28&cpu_mode=host-passthrough&mem=".$vds_ram."&vcpu=".$vds_cpu."&vsize=".$vds_ssd."&hostnode=5&domain=".$isp_user.".vds.zadc.ru&name=".$isp_user."&password=".$isp_paswd."&confirm=".$isp_paswd."&sok=ok", false, stream_context_create($qas));
$parse_xml = simplexml_load_string($reguserisp);
if (preg_match('<ok/>',$reguserisp)) {
$work = time() +86400 * 30;
$text1='Здравствуйте уважаемый [b]'.$ac[login].'[/b]!
VDS активирован!
IP: '.$parse_xml->ip.'<br/>
Логин: root
Пароль ROOT: '.$isp_paswd.'
С Уважением Fasthostuz Бот Активатор :37:';
$connect->exec("UPDATE `users` SET `vds_money` = `vds_money` - '$vdse', `vds_work` = '".$work."', `vds_aktiv` = '2', `vds_pass` = '$isp_paswd', `vds_ip` = '$parse_xml->ip', `vds_id` = '$parse_xml->id' WHERE `id` = '".$ac[id]."' LIMIT 1");
//$connect->exec("INSERT INTO `logs_money` SET `id_user` = '".$ac[id]."', `type` = 'minus', `count` = '".$vdse."', `action` = 'Активция VDS', `time` = '".$time."'");
$connect->exec("insert into `note` set `name` = 'Активатор', `text` = '$text1', `time` = '$time', `id_user` = '".$ac[id]."'");
	}
	else
	{
		echo '<div class="err">Заказ хостинга временно недоступен!.<br></div>';
	}
}  
}



include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>