<?php
set_time_limit(0);
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
// To'xtatilgan akkauntlar pul o'tkazsa aktivlaydi!
$qpa = $connect->query("SELECT * FROM `users` WHERE `activ` = '3'");
foreach ($qpa as $apa) {
    $id_tarifpa = $connect->query("SELECT * FROM `tarifs_hosting` WHERE `id` = '".$apa[id_tarif]."'");
    $id_tarifpa = $id_tarifpa->fetch(PDO::FETCH_LAZY);
    $serverpa = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($id_tarifpa->id_server))."'");
    $serverpa = $serverpa->fetch(PDO::FETCH_LAZY);
    if ($apa[money] >= $id_tarifpa['price_day']) {
    $qas=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
    $zaprospa = "user.resume&elid=".$apa['isp_login']."";
    $f = file_get_contents("https://".$serverpa->ip."/?authinfo=".urlencode($serverpa->login).":".urlencode($serverpa->pass)."&out=xml&func=".$zaprospa."&sok=yes", false, stream_context_create($qas));
    if(preg_match('<ok/>',$f))
    {
    $connect->exec("UPDATE `users` SET `error` = '1' WHERE `id` = '".$apa[id]."' LIMIT 1");
    $workapa = time() +86400 * 1;
    $cenapa = $id_tarifpa['price_day']; // Цена
    $connect->exec("UPDATE `users` SET `money` = `money` - '$cenapa', `time_work` = '".$workapa."', `activ` = '2' WHERE `id` = '".$apa[id]."' LIMIT 1");
    $connect->exec("INSERT INTO `logs_money` SET `id_user` = '".$apa[id]."', `type` = 'minus', `count` = '".$cenapa."', `action` = 'Продление аккаунт: Тариф ".$id_tarifpa['name']."', `time` = '".$time."'");
    }
    }
}
// Ishlash vaqti kam qolganlarni uzaytiradi!
$qp = $connect->query("SELECT * FROM `users` WHERE `activ` = '2'");
foreach ($qp as $ap) {
    $id_tarifp = $connect->query("SELECT * FROM `tarifs_hosting` WHERE `id` = '".$ap[id_tarif]."'");
    $id_tarifp = $id_tarifp->fetch(PDO::FETCH_LAZY);
    $workpa = time() +86400 * 1;
    $rr = $ap['time_work'] - time();
    $workp = $workpa + $rr;
    $cenap = $id_tarifp['price_day']; // Цена
    if (order_day($ap['time_work'],true) < 0.02 && $ap[auto_pay] == 1 && $ap[money] >= $id_tarifp['price_day']) {
        $connect->exec("UPDATE `users` SET `money` = `money` - '$cenap', `time_work` = '".$workp."' WHERE `id` = '".$ap[id]."' LIMIT 1");
        $connect->exec("INSERT INTO `logs_money` SET `id_user` = '".$ap[id]."', `type` = 'minus', `count` = '".$cenap."', `action` = 'Продление аккаунт: Тариф ".$id_tarifp['name']."', `time` = '".$time."'");
    }
}
// Yangi akkauntlar va tozalangan akkauntlarni aktivlaydi!
$qa = $connect->query("SELECT * FROM `users` WHERE `activ` = '1'");
foreach ($qa as $ac) {
    $id_tarif = $connect->query("SELECT * FROM `tarifs_hosting` WHERE `id` = '".$ac[id_tarif]."'");
    $id_tarif = $id_tarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".$id_tarif['id_server']."'");
    $server = $server->fetch(PDO::FETCH_LAZY);

if ($ac[money] >= $id_tarif[price_day]) {
$preset=$id_tarif[template];
$isp_paswd	=	generate_password();
$infous= $ac[login].' (Fasthost.uz) '.$ac[email];
$isp_user = 'x_'.$ac[login];
$isp_user = mb_strtolower($isp_user);
$isp_userd = $ac[login];
$isp_userd = mb_strtolower($isp_userd);
$qqa='.Fasthost.uz';
$domen="$isp_userd$qqa";
// &domain=".$domen."
$qas=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
if ($server[ispver]==4) {
$reguserisp = file_get_contents("https://".$server[ip]."/manager/ispmgr?func=user.edit&owner=".$server[login]."&out=xml&authinfo=".$server[login].":".$server[pass]."&name=".$isp_user."&passwd=".$isp_paswd."&confirm=".$isp_paswd."&preset=".$preset."&sok=yes", false, stream_context_create($qas));
}
if ($server[ispver]==5) {
$reguserisp = file_get_contents("https://".$server[ip]."/ispmgr?authinfo=".$server[login].":".$server[pass]."&out=xml&func=user.add&name=".$isp_user."&domain=".$domen."&fullname=".urlencode($infous)."&preset=".$preset."&status=1&passwd=".$isp_paswd."&sok=ok", false, stream_context_create($qas));
}
if (preg_match('<ok/>',$reguserisp)) {
$cena = $id_tarif['price_day']; // Цена
$work = time() +86400 * 1;
$text1='Assalom alaykum xurmatli <font color="aqua">[b]'.$ac[login].'[/b]!</font>
Sizning hisobingiz faollashtirildi!
Sizning domen: <font color="aqua">'.$domen.'</font>
###################################
Bizning server NS\'lari:
'.($server[id]==1 ? 'ns1.fasthost.uz' : 'ns1.fasthost.uz').'
'.($server[id]==1 ? 'ns2.fasthost.uz' : 'ns2.fasthost.uz').'
Xurmat bilan Fasthost.uz faollashtiruvchi bot :37:';
if (isset($ac['tg_id'])) {
$tgmsg='
Assalom alaykum xurmatli '.$ac[login].'!
Sizning hisobingiz faollashtirildi!
Sizning domen: <font color="aqua">'.$domen.'</font>
###################################
Bizning server NS\'lari:
'.($server[id]==1 ? 'ns1.fasthost.uz' : 'ns1.fasthost.uz').'
'.($server[id]==1 ? 'ns2.fasthost.uz' : 'ns2.fasthost.uz').'
Xurmat bilan Fasthost.uz faollashtiruvchi bot';
    tgmsg($ac['tg_id'], $tgmsg, '');
}
$connect->exec("UPDATE `users` SET `error` = '1' WHERE `id` = '".$ac[id]."' LIMIT 1");
$connect->exec("UPDATE `users` SET `money` = `money` - '$cena', `time_work` = '".$work."', `activ` = '2', `isp_login` = '$isp_user', `isp_pass` = '$isp_paswd' WHERE `id` = '".$ac[id]."' LIMIT 1");
$connect->exec("INSERT INTO `logs_money` SET `id_user` = '".$ac[id]."', `type` = 'minus', `count` = '".$cena."', `action` = 'Активция аккаунт: Тариф ".$id_tarif['name']."', `time` = '".$time."'");
$connect->exec("insert into `note` set `name` = 'Активатор', `text` = '$text1', `time` = '$time', `id_user` = '".$ac[id]."'");
	}
	else
	{
	    if ($ac[error] == 1){
	    $qasda=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
        $fda = file_get_contents("https://".$server[ip]."/ispmgr?authinfo=".urlencode($server->login).":".urlencode($server->pass)."&out=xml&func=user.edit&elid=".urlencode($isp_user)."&passwd=".urlencode($isp_paswd)."&sok=yes", false, stream_context_create($qasda));
                file_get_contents("https://".$server[ip]."/ispmgr?authinfo=".urlencode($isp_user).":".urlencode($isp_paswd)."&out=xml&func=ftp.user.edit&elid=".urlencode($isp_user)."&passwd=".urlencode($isp_paswd)."&sok=yes", false, stream_context_create($qasda));
        if(preg_match('<ok/>',$fda))
        {
            $cena = $id_tarif['price_day']; // Цена
$work = time() +86400 * 1;
$text1='Assalom alaykum xurmatli <font color="aqua">[b]'.$ac[login].'[/b]!</font>
Sizning hisobingiz faollashtirildi!
Sizning domen: '.$domen.'
###################################
Bizning server NS\'lari:
'.($server[id]==1 ? 'ns1.fasthost.uz' : 'ns1.fasthost.uz').'
'.($server[id]==1 ? 'ns2.fasthost.uz' : 'ns2.fasthost.uz').'
Xurmat bilan Fasthost.uz faollashtiruvchi bot :37:';
if (isset($ac['tg_id'])) {
$tgmsg='
 Assalom alaykum xurmatli <font color="aqua">'.$ac[login].'!</font>
Sizning hisobingiz faollashtirildi!
Sizning domen: <font color="aqua">'.$domen.'</font>
###################################
Bizning server NS\'lari:
'.($server[id]==1 ? 'ns1.fasthost.uz' : 'ns1.fasthost.uz').'
'.($server[id]==1 ? 'ns2.fasthost.uz' : 'ns2.fasthost.uz').'
Xurmat bilan Fasthost.uz faollashtiruvchi bot';
    tgmsg($ac['tg_id'], $tgmsg, '');
}
$connect->exec("UPDATE `users` SET `error` = '1' WHERE `id` = '".$ac[id]."' LIMIT 1");
$connect->exec("UPDATE `users` SET `money` = `money` - '$cena', `time_work` = '".$work."', `activ` = '2', `isp_login` = '$isp_user', `isp_pass` = '$isp_paswd' WHERE `id` = '".$ac[id]."' LIMIT 1");
$connect->exec("INSERT INTO `logs_money` SET `id_user` = '".$ac[id]."', `type` = 'minus', `count` = '".$cena."', `action` = 'Активция аккаунт: Тариф ".$id_tarif['name']."', `time` = '".$time."'");
$connect->exec("insert into `note` set `name` = 'Активатор', `text` = '$text1', `time` = '$time', `id_user` = '".$ac[id]."'");
        }else{
	    $connect->exec("UPDATE `users` SET `error` = '2' WHERE `id` = '".$ac[id]."' LIMIT 1");
        }
	    }
	    echo print_r($reguserisp);
		echo '<div class="err">Hosting buyurtmasi vaqtincha mavjud emas!<br></div>';
	}
	
}  
}
// Inaktivator
$work_time = time();
$qi = $connect->query("SELECT * FROM `users` WHERE `time_work` < '$work_time' AND `activ` = '2'");
foreach ($qi as $aci) {
    $id_tarifi = $connect->query("SELECT * FROM `tarifs_hosting` WHERE `id` = '".$aci[id_tarif]."'");
    $id_tarifi = $id_tarifi->fetch(PDO::FETCH_LAZY);
    $serveri = $connect->query("SELECT * FROM `servers` WHERE `id` = '".$id_tarifi['id_server']."'");
    $serveri = $serveri->fetch(PDO::FETCH_LAZY);
////////////////////////////////////////
$qasi=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
if ($serveri[ispver]==4) {
$fi = file_get_contents("https://".$serveri[ip]."/manager/ispmgr?func=user.disable&authinfo=".urlencode($serveri->login).":".urlencode($serveri->pass)."&out=xml&elid=".urlencode($aci['isp_login'])."&ok=yes", false, stream_context_create($qasi));
}
if ($serveri[ispver]==5) {
$fi = file_get_contents("https://".$serveri[ip]."/ispmgr?authinfo=".urlencode($serveri->login).":".urlencode($serveri->pass)."&out=xml&func=user.suspend&elid=".urlencode($aci['isp_login'])."&sok=yes", false, stream_context_create($qasi));
}
if(preg_match('<ok/>',$fi))
{
$connect->exec("UPDATE `users` SET `activ` = '3' WHERE `id` = '".$aci[id]."'");
mailto($aci['email'], 'Assalom alaykum xurmatli '.$aci[login].'!',
'Assalom alaykum xurmatli mijoz Fasthost.uz!<br/>
Sizning hisobingiz to\'xtatildi! <br/>
Sizga shuni ma\'lum qilamizki, 7 kundan keyin barcha fayllar, ma\'lumotlar bazalari va boshqa ma\'lumotlar sizning hisobingizdan butunlay yo\'q qilinadi, o\'chirilishining oldini olish uchun iltimos, hisobingizni to\'ldiring!<br/>

Xurmat bilan Fasthost.uz faollashtiruvchi bot
', $set['mail']);
$text1i='Assalom alaykum xurmatli [b]'.$aci[login].'[/b]!
Ваш аккуант приостановлен!
Sizga shuni ma\'lum qilamizki, 7 kundan keyin barcha fayllar, ma\'lumotlar bazalari va boshqa ma\'lumotlar sizning hisobingizdan butunlay yo\'q qilinadi, o\'chirilishining oldini olish uchun iltimos, hisobingizni to\'ldiring! 
Xurmat bilan Fasthost.uz faollashtiruvchi botк :37:';
if (isset($aci['tg_id'])) {
$tgmsgi='
 Assalom alaykum xurmatli '.$aci[login].'!
 Sizning hisobingiz to\'xtatildi!
Sizga shuni ma\'lum qilamizki, 7 kundan keyin barcha fayllar, ma\'lumotlar bazalari va boshqa ma\'lumotlar sizning hisobingizdan butunlay yo\'q qilinadi, o\'chirilishining oldini olish uchun iltimos, hisobingizni to\'ldiring!
Xurmat bilan Fasthost.uz faollashtiruvchi bot ';
    tgmsg($aci['tg_id'], $tgmsgi, '');
}
$connect->exec("UPDATE `users` SET `error` = '1' WHERE `id` = '".$aci[id]."' LIMIT 1");
$connect->exec("insert into `note` set `name` = 'Чистильщик', `text` = '$text1i', `time` = '$time', `id_user` = '".$aci[id]."'");    
}
else
{
    $connect->exec("UPDATE `users` SET `error` = '2' WHERE `id` = '".$aci[id]."' LIMIT 1");
    echo print_r($reguserisp);
echo '<div class="err">Xato, Keyinroq urinib ko‘ring.<br />Qo\'llab-quvvatlash xizmatiga murojaat qiling!<br></div>';
}   
    
}
// deltator :)
$workd = (time() -  (84600 *  7));
$qd = $connect->query("SELECT * FROM `users` WHERE `time_work` < '$workd' AND `activ` = '3'");
foreach ($qd as $acd) {
    $id_tarifd = $connect->query("SELECT * FROM `tarifs_hosting` WHERE `id` = '".$acd[id_tarif]."'");
    $id_tarifd = $id_tarifd->fetch(PDO::FETCH_LAZY);
    $serverd = $connect->query("SELECT * FROM `servers` WHERE `id` = '".$id_tarifd['id_server']."'");
    $serverd = $serverd->fetch(PDO::FETCH_LAZY);
////////////////////////////////////////
$qasd=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
$fd = file_get_contents("https://".$serverd[ip]."/ispmgr?authinfo=".urlencode($serverd->login).":".urlencode($serverd->pass)."&out=xml&func=user.delete&elid=".urlencode($acd['isp_login'])."&sok=yes", false, stream_context_create($qasd));
if($fd)
{
$connect->exec("UPDATE `users` SET `activ` = '1', `time_work` = '0' WHERE `id` = '".$acd[id]."' LIMIT 1");
$text1d='Assalom alaykum xurmatli [b]'.$acd[login].'[/b]!
Hisobingiz tozalandi!
Afsuski, sizning hisobingizni o\'chirishga to\'g\'ri keldi, chunki siz hisobingizni to\'ldirmadingiz :17:
Kechirasiz, lekin fayllaringizni tiklay olmaysiz! :29:
Xurmat bilan Fasthost.uz faollashtiruvchi botк :37:';
if (isset($acd['tg_id'])) {
$tgmsgd='
 Assalom alaykum xurmatli '.$acd[login].'!
 Hisobingiz tozalandi!
Afsuski, sizning hisobingizni o\'chirishga to\'g\'ri keldi, chunki siz hisobingizni to\'ldirmadingiz 
Kechirasiz, lekin fayllaringizni tiklay olmaysiz!
Xurmat bilan Fasthost.uz faollashtiruvchi bot';
    tgmsg($acd['tg_id'], $tgmsgd, '');
}
$connect->exec("UPDATE `users` SET `error` = '1' WHERE `id` = '".$acd[id]."' LIMIT 1");
$connect->exec("insert into `note` set `name` = 'Чистильщик', `text` = '$text1d', `time` = '$time', `id_user` = '".$acd[id]."'");    
}
else
{
    $connect->exec("UPDATE `users` SET `error` = '2' WHERE `id` = '".$acd[id]."' LIMIT 1");
echo '<div class="err">Xato, Keyinroq urinib ko‘ring.<br />Qo\'llab-quvvatlash xizmatiga murojaat qiling!<br></div>';
}   
    
}


// Telegram Uvedemleneye
$qt = $connect->query("SELECT * FROM `tgmsg` WHERE `act` = '1'");
while($act = $qt->fetch(PDO::FETCH_LAZY))
{
    if (empty($act[tg_files])) {
tg($act[tg_id], $act[tg_msg]);
}else{
    tgpo($act[tg_id], $act[tg_files], $act[tg_msg]);
}
$connect->exec("DELETE FROM `tgmsg` WHERE `id` = '".$act[id]."'");
}
/*foreach ($qt as $act) {
if (empty($act[tg_files])) {
tg($act[tg_id], $act[tg_msg]);
}else{
    tgpo($act[tg_id], $act[tg_files], $act[tg_msg]);
}
$connect->exec("DELETE FROM `tgmsg` WHERE `id` = '".$act[id]."'");
}*/


include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>