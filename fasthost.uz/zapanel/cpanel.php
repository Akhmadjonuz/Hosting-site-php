<?php
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
switch($act) {
default:
$auth_succ = $connect->query("SELECT COUNT(*) FROM `authlog` WHERE `uid` = '$user->id' AND `status` = '1'")->fetchColumn();
$auth_fail = $connect->query("SELECT COUNT(*) FROM `authlog` WHERE `uid` = '$user->id' AND `status` = '0'")->fetchColumn();
$or_host = $connect->query("SELECT COUNT(*) FROM `orders_hosting` WHERE `id_user` = '$user->id'")->fetchColumn();
$log_monp = $connect->query("SELECT COUNT(*) FROM `logs_money` WHERE `id_user` = '$user->id' AND `type` = 'plus'")->fetchColumn();
$log_monm = $connect->query("SELECT COUNT(*) FROM `logs_money` WHERE `id_user` = '$user->id' AND `type` = 'minus'")->fetchColumn();
$new_admt = $connect->query("SELECT COUNT(*) FROM `tickets` WHERE `read_adm` = '0'")->fetchColumn();
$admt1 = $connect->query("SELECT COUNT(*) FROM `tickets` ")->fetchColumn();
if ($new_admt >= 1) {$newta='[<font color="red">+'.$new_admt.'</font>]';}else{$newta='';}
echo '<div class="title"><b>Shaxxsiy kabinet</b></div>';
echo '<div class="menu">&bull; <a href="/user/listauth"> Avtorizatsiya tarixi [<font color="aqua">'.$auth_succ.'</font>/<font color="red">'.$auth_fail.'</font>]</a></div>';
echo '<div class="menu">&bull; <a href="/user/moneyhistory"> Mablag\'lar harakati [<font color="aqua">'.$log_monp.'</font>/<font color="red">'.$log_monm.'</font>]</a></div>';
//echo '<div class="menu">&bull; <a href="/user/pascan"> Пасспортный проверка ['.($user['pascan_act']==1 ? '<font color="red">не подтвержден</font>':'<font color="aqua">подтвержден</font>').']</a></div>';
echo '<div class="menu">&bull; <a href="/user/tg"> Telegram hisobi ['.(!empty($user['tg_id']) ? '<font color="aqua">Yoniq</font>' : '<font color="red">не подключен</font>').']</a></div>';
echo '<div class="menu">&bull; <a href="/user/email"> Pochtani almashtirish</a></div>';
echo '<div class="menu">&bull; <a href="/pay/"> Hisobni to\'ldirish</a></div>';
echo '<div class="menu">&bull; <a href="/user/exit"> Chiqish</a></div>';

if ($adm_id == 5) {
echo '<div class="title"><b>Adminstratorlar uchun</b></div>';
$allon=$count_online_user + $count_online_guest;
echo '<div class="menu">&bull; <a href="/adm"> Boshqaruv paneli ['.$allon.'] ('.$count_online_user.'/'.$count_online_guest.')</a></div>';
}
break;
case 'settings':
echo '<div class="title">Paraolni o\'zgartirish</div>';

$error = '';
			
if (isset($_POST['pass']) && isset($_POST['new_pass']) && isset($_POST['last_pass'])) {
if (empty($_POST['pass'])) {
$error.= 'Haqiqiy parolni kiriting!<br/>';
}
elseif (md5(md5($_POST['pass'])) != $user['pass']) {
$error.= 'Noto\'g\'ri parol, noto\'g\'ri kiritildi!<br/>';
}
elseif (empty($_POST['new_pass'])) {
$error.= 'Yangi parolni kiriting!<br/>';
}
elseif (mb_strlen($_POST['new_pass']) < 3 or mb_strlen($_POST['new_pass']) > 15) {
$error.= 'Yangi parol 3 dan 15 belgigacha bo\'lishi kerak!<br/>';
}
elseif (empty($_POST['last_pass'])) {
$error.= 'Tasdiqlash parolini kiriting!<br/>';
}
elseif ($_POST['last_pass'] != $_POST['new_pass']) {
$error.= 'Tasdiqlash paroli noto‘g‘ri kiritildi!<br/>';
}
elseif (md5(md5($_POST['new_pass'])) == $user['pass']) {
$error.= 'Sizda ushbu parol yoqilgan.!<br/>';
}
if ($error) {
echo '<div class="menu"><center><font color="red">'.$error.'</font></center></div>';
} else {
$stmt = $connect->prepare("update `users` set `pass` = ? where `login` = ? limit 1");
if ($stmt->execute(array(md5(md5($_POST['new_pass'])), $user['login']))) {
setcookie('pass', md5(md5($_POST['new_pass'])), time() + 3600 * 24 * 30);
echo '<div class="menu"><center><font color="aqua">Parol muvaffaqiyatli o\'zgartirildi!</font></center></div><meta http-equiv="Refresh" content="3; "/>';
} else {
echo '<div class="menu"><center><font color="red">Xatolik yuz berdi!</font></center></div>';
}
}
}
echo '<div class="menu"><form action="" method="post">Haqiqiy parol:<br /><input type="password" name="pass" maxlength="15"/><br/>Yangi parol:<br /><input type="password" name="new_pass" maxlength="15"/><br/>Yangi parolni takroran kiriting:<br /><input type="password" name="last_pass" maxlength="15"/><br/><input class="btn btn-default" type="submit" value="Изменить"/></form></div>';
break; 
case 'enter':
if (isset($_POST['submit'])) {
header('location: /user/menu');
}
echo '<div class="title">Kirish</div>';
echo '<div class="menu">IP: '.filter($_SERVER['REMOTE_ADDR']).'<br/>
UA: '.filter($user['ua']).'<br/>
Vaqt: '.date('d.m.Y H:i', $user['lasttime']).'</div>
<div class="menu"><form action="" method="post"><input class="btn btn-default" type="submit" name="submit" value="Shaxsiy kabinetga kirish"></form>
Aftologin:<br/><input type="text" value="'.ROOT.'/auth?login='.filter($user['login']).'&pass=ВАШ_ПАРОЛЬ"/></div>';
break;
case 'exit':
if ($set['close'] == 1) {

        if (isset($_POST['exit'])) {

            $reset_auth = $connect->prepare("update `authlog` set `status` = ? where `uid` = ? and `key` = ?");

            $reset_auth->execute(array(0, $user['id'], $authash));

            setcookie('user_id', null, time() - 3600, '/');
            setcookie('pass', null, time() - 3600, '/');
            setcookie('auth', null, time() - 3600, '/');

            header('Location: /');

        }
        echo '<div class="title">Hisobdan chiqish</div>';
        echo '<div class="menu"><form action="" method="POST">
        Haqiqatan ham tizimdan chiqmoqchimisiz??<br/>
        <input type="submit" class="btn btn-default" name="exit" value="Xa, chiqmoqchiman">
        </form></div>';

    } else{
        echo '<div class="err">Siz sayt yopiqligida tizimdan chiqa olmaysiz!</div>';

}
break;

}
} else {
header('Location: /auth');}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>