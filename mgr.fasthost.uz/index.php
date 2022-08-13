<?php
$title = 'Fasthost.Uz | Sayt boshqaruvi!';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");

if ($user){
$ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
$ontarif->execute(array($user['id_tarif']));
$ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
// Akkauntni aktivlash
/*if ($user[test]==1){
    if (isset($_POST['ok']))
{
    $code=val($_POST['code']);
    if ($user[wmr]==$code) {
        $connect->query("update `users` set `test` = '2' where `id` = ".$user['id']."");
        $redsa='';
        header('Location: /user/menu');
    }else{
        $redsa='<div class="menu"><center><font color="red">Неверно! Код активация!</font></center></div>';
    }
    
    
}
$oks=$_SESSION['ok'];
if (isset($_POST['else'])) {
$qa1='1';
$qasss=$_SESSION['ok']+$qa1;
$_SESSION['ok'] = $qasss;
if ($oks<=2){
mailto($user->email, 'fasthost.uz | Активация аккаунт! ','fasthost.uz | Мобильный хостинг!<br/>Ваш логин: '.$user->login.'<br/>Код активация: '.$user->wmr.'<br/><br/>С Уважением Администратор ZaDc.Ru! ', $set['mail']);
$redsa='<div class="menu"><center><font color="aqua">На Ваш почта отправлен код активация!</font></center></div>';
}else{$redsa='<div class="menu"><center><font color="red">Вы много отправиль код активатция на ваш E-Mail!!!</font></center></div>';}}
if ($redsa) echo $redsa;
    echo '<div class="title">Подтверждение почта!</div>';
    echo '<div class="menu"><font color=red>Ваш Почта</font>: <b>'.$user->email.'</b><br/>
    <font color="red">Раздел Восстановление пароля не доступен, пока не будет подтвержден MAIL адрес!</font>
<form method="post">
Код активация [0-9]:<br /><input type="text"  name="code" pattern="^[0-9]{3,7}$"/> <br />
<input class="btn btn-default" type="submit" name="ok" value="Активировать" /><input class="btn btn-default" type="submit" name="else" value="Отправить код активация ещё" />
</form></div>';}*/
 if ($user[activ] == 2) {
      $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
      $server = $server->fetch(PDO::FETCH_LAZY);
     $content = api_query('https://'.$server->ip.'/ispmgr?func=userstat&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
     $parse_xml = simplexml_load_string($content);
     echo '<div class="title">Assalom alaykum, <font color="yellow">'.filter($user['login']).'!</font>. </div>';
     echo '<div class="menu"><b> - Disk</b>: <font color="aqua">'.$parse_xml->elem[18]->usages_used.' / '.$parse_xml->elem[18]->usages_total.'</font> MiB     </div>';
     echo '<div class="title"><b>Mening menyuyim!</b></div>';
     echo '<div class="menu">&bull; <a href="/domen"> WWW domenlari <font color="aqua">(Subdomenlar domenlar)</font></a></div>';
     echo '<div class="menu">&bull; <a href="/ssl"> SSL sertifikatlar</a></div>';
     //echo '<div class="menu">&bull; <a href="/ftp"> FTP hisoblar</a></div>';
     echo '<div class="menu">&bull; <a href="/db"> Ma\'lumotlar bazalari <font color="aqua">(MySql)</font></a></div>';
 echo '<div class="menu">&bull; <a href="/mgr"> Fayl menejer</a></div>'; 
 echo '<div class="menu">&bull; <a href="/webfm" target="_blank"> Fayl menejer <font color="aqua">[WEB]</font> </a></div>'; 
 echo '<div class="menu">&bull; <a href="/infor"> Ishlatilgan manbalar</a></div>';
 echo '<div class="menu">&bull; <a href="/cron"> Rejalashtirish <font color="aqua">(CRON)</font></a></div>';
 echo '<div class="title"><b>Turli-Xil</b></div>';
 echo '<div class="menu">&bull; <a href="/webhook" target="_blank"> Webhook <font color="aqua">[Telegram-bot]</font></a></div>';
 
 echo '<div class="menu">&bull; <a href="/pma" target="_blank"> PhpMyAdmin <font color="aqua">[WAP]</font></a></div>';
 echo '<div class="menu">&bull; <a href="http://Fasthost.uz/phpmyadmin" target="_blank"> PhpMyAdmin <font color="aqua">[WEB]</font></a></div>';
 echo '<div class="menu">&bull; <a href="http://fasthost.uz/roundcube" target="_blank"> RoundCube WebMail <font color="aqua">[WEB]</font></a></div>';
 }else{
     if ($user[activ]==0) {$c1='<font color="red">Sizning hisobingiz faol emas!</font> ()';}
if ($user[activ]==1) {$c1='<font color="red">Sizning hisobingiz faol emas!</font>'; $c2='Faollashtirish uchun hisobingizni  '.$ustarif['price_day'].' Rubl miqdorda to\'ldiring (To\'ldirish uchun telegram orqali aloqaga chiqing @Fasthost_Uz)';}
if ($user[activ]==2) {$c1='<font color="aqua">Sizning hisobingiz faol!</font>';}
if ($user[activ]==3) {$c1='<font color="red">Sizning hisobingiz o\'chirilgan!</font>'; $c2=' Diqqat! <a href="http://fasthost.uz/info/rules/"> Hosting qoidalariga </a> muvofiq 7 kundan ko\'proq vaqt davomida to\'lov amalga oshirilmagan taqdirda, sizning hisobingiz ma\'lumotni tiklash imkonisiz avtomatik ravishda yo\'q qilinadi.</span><br/>Faollashtirish uchun <a href="http://fasthost.uz/info/pay">Hisobni to\'ldirish</a> ushbu miqdorda '.$ustarif['price_day'].' Rubl)';}
if ($user[activ]==4) {$c1='<font color="red">Sizning hisobingiz blocklangan!</font>';}
if (empty($c1)) {$c1='<font color="red">Xato :)</font>';}
if($user['money']>=$ustarif['price_day'] && $user[activ] <> 2){
    $ts='0';
echo '<div class="ok">Iltimos, faollashishni kuting (1-2 daqiqa)!</div>';}else{$ts='1';}
echo '<div class="menu"><b>Hisobingiz holati:  '.$c1.'</b></div>';
if ($c2 && $ts) {
echo'<div class="menu"><h1 style="color: red;"><b>Diqqat!</b></h1>';
echo '<font color="red">'.$c2.'</font>';
echo '</div>';
}
 }
}else{
echo'<div class="menu"><h1 style="color: red;"><b>Diqqat!</b></h1>';
echo '<font color="red">Iltimos, hisobingizga kiring!</font>';
echo '</div>';
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
 ?>