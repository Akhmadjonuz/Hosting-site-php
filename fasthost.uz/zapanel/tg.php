<?php
$title = 'Telegram hisob';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
////////
if (isset($_GET['rand']) && empty($user['tg_sess'])) {
$ses=md5($time);
$connect->query("UPDATE `users` SET `tg_sess` = '$ses' WHERE `id` = '".$user->id."'");
header('Location: /user/tg');
}
////////////

echo '<div class="title"><b>Telegram hisob</b></div>';
if (empty($user['tg_id'])) {
    echo '<div class="menu"><center><font color="red">Sizning hisobingiz telegramga ulanmagan!</font></center></div>';
    echo '<div class="menu">Telegram akkauntini ulash uchun bizning botimizga aktivatsiya kodini yuboring!<br/>
    <b>Bizning bot</b>: @Fasthostuz_Bot<br/>
    <b>Aktivlash kodi</b>: '.(!empty($user['tg_sess']) ? filter($user['tg_sess']) : '<font color="red">Aktivlash kodi mavjud emas!</font> <a href="/user/tg?rand">[Aktivlashtirish kodini yaratish] </a>').'</div>';
}else{
    echo '<div class="menu"><center><font color="aqua">Sizning telegram hisobingiz faol!</font></center></div>';
    echo '<div class="menu"><b>Sizning telegram ID</b>: <font color="red">'.filter($user['tg_id']).'</font> ';
    echo '<div class="menu"><b>Bot comandalari <font color="red">(@pcouz)</font> kanalimizda!</b>';
    echo '</div>';
}







} else {
header('Location: /auth');}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
 ?>