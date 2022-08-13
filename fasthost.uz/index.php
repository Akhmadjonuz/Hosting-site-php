<?php
$title = 'Fasthost.Uz - Mobil veb-xosting!';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
$ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
$ontarif->execute(array($user['id_tarif']));
$ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
// Akkauntni aktivlash
if ($user[test]==1){
    if (isset($_POST['ok']))
{
    $code=val($_POST['code']);
    if ($user[wmr]==$code) {
        $connect->query("update `users` set `test` = '2' where `id` = ".$user['id']."");
        $redsa='';
        header('Location: /');
    }else{
        $redsa='<div class="menu"><center><font color="red">Pochta tasdiqlash kodi xato!</font></center></div>';
    }
    
    
}
$oks=$_SESSION['ok'];
if (isset($_POST['else'])) {
$qa1='1';
$qasss=$_SESSION['ok']+$qa1;
$_SESSION['ok'] = $qasss;
if ($oks<=2){
mailto($user->email, 'FastHost.Uz | Pochta tasdiqlash!','FastHost.Uz | Mobil hosting!<br/>Sizning loginingiz: '.$user->login.'<br/>Tasdiqlash kodi: '.$user->wmr.'<br/><br/>Xurmat bilan sizning adminstrator - FastHost.Uz! ', $set['mail']);
$redsa='<div class="menu"><center><font color="Aqua">Tasdiqlash kodi sizning pochtangizga jo\'natildi!</font></center></div>';
}else{$redsa='<div class="menu"><center><font color="red">Siz elektron pochta manzilingizga juda ko\'p tasdiqlash kodini yubordingiz.!!!</font></center></div>';}}
if ($redsa) echo $redsa;
    echo '<div class="title">Pochta tasdiqlash | Fasthost.Uz</div>';
    echo '<div class="menu"><font color=red>Sizning pochta</font>: <b>'.$user->email.'</b><br/>
    <font color="red">Pochta tasdiqlanmaguncha saytimizdan foydalana olmaysiz !</font>
<form method="post">

Faollashtirish kodi [0-9]:<br /><input type="text"  name="code" pattern="^[0-9]{3,7}$"/> <br />
<input class="btn btn-default" type="submit" name="ok" value="Tasdiqlash" /><input class="btn btn-default" type="submit" name="else" value="Tasdiqlash kodini qayta jo" />
</form></div>';}
echo '<div class="title"><b>Mening menyuyim</b></div>';
if ($user[activ]==0) {$c1='<font color="red">faollashtirilmagan! (Aktivlashtirish uchun, telegram: t.me/Fasthost_Uz orqali balansni to\'ldirish)</font> ()';}
if ($user[activ]==1) {$c1='<font color="red">faollashtirilmagan! (Aktivlashtirish uchun, telegram: t.me/Fasthost_Uz orqali balansni to\'ldirish)</font>'; $c2='Для активации <a href="/pay">пополните</a> баланс на '.($ustarif['price_day'] - $user['money']).' рублей)';}
if ($user[activ]==2) {$c1='<font color="Aqua">Faol!</font>';}
if ($user[activ]==3) {$c1='<font color="red">O\'chirilgan!</font>'; $c2='Shaxsiy hisobingizda mablag\' yo\'qligi sababli hisobingiz to\'xtatildi. Shaxsiy hisobingiz haqida batafsil ma\'lumotni shaxsiy kabinetdan topishingiz mumkin. Diqqat! Tarif to\'lanmagan taqdirda 7 kundan ortib ketsa barcha ma\'lumotlar o\'chiriladi!">Правилам Хостинг</a> - ваш аккаунт будет удален автоматически без возможности восстановления данных.</span><br/>Для активации <a href="/pay">пополните</a> баланс на '.($ustarif['price_day'] - $user['money']).' рублей)';}
if ($user[activ]==4) {$c1='<font color="red">blocklangan!</font>';}
if (empty($c1)) {$c1='<font color="red">Xato :)</font>';}
if(($user['money']>=$ustarif['price_month'] && $user[activ] == 1) || ($user['money']>=$ustarif['price_day'] && $user[activ] == 3 && $ustarif['price_pay'] ==1) || ($user['money']>=$ustarif['price_month'] && $user[activ] == 3 && $ustarif['price_pay'] == 2)){
    $ts='0';
echo '<div class="ok">Hisobga ishlov berilmoqda! Iltimos, faollashishni kuting! (1-2 daqiqa)</div>';}else{$ts='1';}
echo'<div class="akhmadjon" >
<b>Assalom alaykum</b>, <font color="aqua"><b>'.filter($user['login']).'</font></b>!<br/>
<b>Sizning hisobingiz</b>: <font color="red"><b>'.filter($user['money']).' So\'m</b></font> <a href="/info/pay"><font color="aqua"><b>[Hisobni to\'ldirish]</b></font></a><br/>';
$usm=$user[money];
$tcm=$ustarif['price_day'];
if ($tcm == 0) {$k='9999';}else{
for ($k=0;$tcm <=$usm;$k++){
    $usm=$usm-$tcm;
}
}
if ($k >= 1) {
    $allc = 86400 * $k;
}else{$allc='0';}
if ($user['activ'] == 2) {
echo '<b>Kun qoldi</b>: <font color="aqua">'.order_day(($user['time_work'] + $allc)).'</font> (<b>Shun kungacha faol</b>: <font color="red">'.vremja(($user['time_work'] + $allc)).'</font>)<br/>
'.(order_day($user['time_work'],true) < 0.01 ? '<font color="red"><b>Hisob o\'chirilishigacha qoldi</b>: '.order_day(($user['time_work'] + (84600 * 7))).' Kun </font><br/>' : '').' ';}
echo '<b>Tarifingiz</b>: <font color="aqua"><b>'.$ustarif['name'].'</font><font color="red"> ('.($ustarif['price_pay'] == 1 ? $ustarif['price_day'].' So\'m/kun' : $ustarif['price_month'].' So\'m/Oy').')</b></font><br/>
'.($user['activ']==2 ? '<b>Sizning domeningiz: <a href="http://'.filter($user['login']).'.fasthost.Uz" target="_blank"><font color="aqua">'.filter($user['login']).'.fasthost.Uz</font></a></b><br/>' : '').'
<b>Hisobingizdagi holat:  '.$c1.'</b>
</div></font>';
if (($c2 && $ts && empty($user['money']>=$ustarif['price_month']) && $ustarif['price_pay'] == 1) || ($c2 && $ts && empty($user['money']>=$ustarif['price_month']) && $ustarif['price_pay'] == 2)) {
echo'<div class="menu"><h1 style="color: red;"><b>Diqqat!</b></h1>';
echo '<font color="red">'.$c2.'</font>';
echo '</div></div>';
}
?>
<?
echo '<div class="title"><b>Xizmatlar</b></div>';
echo '<div class="menu">&bull; <a href="/tarifs/hosting"> Hosting [Tariflar] [Tarifni o\'zgartirish]</a></div>';
echo '<div class="title"><b>Sayt menyusi</b></div>';
if (isset($user) && $user['activ'] == 2){
echo '<div class="menu">&bull; <a href="/authcp"> Sayt boshqaruvi <font color="aqua">[CP]</font></a></div>';
}

echo '<div class="menu">&bull; <a href="/service"> Xizmatlar </div>';
echo '<div class="menu">&bull; <a href="/user/chat">  Master chat </a><font color="aqua">['.$ch.'</font><font color=red>'.$new_chat.'</font><font color="aqua">]</font></div>';
echo '<div class="menu">&bull; <a href="/news"> Yangiliklar </a><font color="aqua">['.$count_news.''.$new_news.']</font></div>';
echo '<div class="menu">&bull; <a href="/info/support"> Qo\'llab quvatlash</a></div>';
echo '<div class="menu">&bull; <a href="/info/server"> Server konfiguratsiyasi</a></div>';
echo '<div class="menu">&bull; <a href="/info/rules"> Hosting qoidalari</a></div>';
echo '<div class="menu">&bull; <a href="/info/pay"> To\'lov usullari</a></div>';
}else{
if (isset($_GET['ref']) && user($_GET['ref'])){
    $_SESSION['ref'] = intval($_GET['ref']);
}
        
echo '<div class="title"><b>Bizning Afzalliklarimiz</b></div><div class="menu">
<div class="akhmadjon"><b>✓ Telefoningizdan saytni to\'liq boshqarish!<br>
✓ PHP 5.4/5.6/7.2/7.3/7.4 и MySQL, DNS-ni qo\'llab-quvatlash<br>
✓ Har bir domen uchun PHP versiyasini tanlash.<br>
✓ Boshqaruv panellari ISPManager Web/Wab, WapManager, phpMyAdmin<br>
✓ Saytingizga FTP protokoli yordamida bog\'lanish<br>
✓ Bepul SSL sertifikati (aktivlanish 4-5 daqiqa!)(Let\'s Encrypt)<br>
✓ Cheksiz CRON rejalashtirish(Unlimit)<br>
✓ Subdomain yaratish va domenlarni to\'xtatish<br>
✓ Telegram botlar uchun yuqori darajali tezlik!<br>
✓ Cheksiz Madeline ulash! (Unlimit)</b></div>';

?>

<?
echo '<div id="son" class="title"><b>Xizmatlar</b></div>';
echo '<div class="menu">&bull; <a href="/tarifs/hosting"> Virtual hosting [tariflar]</a></div>';
echo '<div class="title"><b>Sayt menyusi</b></div>';
echo '<div class="menu">&bull; <a href="/news"> Yangiliklar </a><font color="aqua">['.$count_news.''.$new_news.']</font></div>';
echo '<div class="menu">&bull; <a href="/info/support"> Qo\'llab - quvatlash</a></div>';
echo '<div class="menu">&bull; <a href="/info/server"> Server konfiguratsiyasi</a></div>';
echo '<div class="menu">&bull; <a href="/info/rules"> Hosting qoidalari</a></div>';
echo '<div class="menu">&bull; <a href="/info/pay"> To\'lov usullari</a></div>';
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
 ?>