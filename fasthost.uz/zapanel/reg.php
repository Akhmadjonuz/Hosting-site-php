<?php
$title = 'Ro\'yxatdan o\'tish | Fasthost.Uz';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
echo '<div class="title">Ro\'yxatdan o\'tish</div>';
if ($set['registration'] == 2) {
echo '<div class="menu"><center><font color="red">Ro\'yxatdan o\'tish yopiq!</font></center></div>';
exit(include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php"));
}
if (isset($active) == true) {
header('Location: /user/menu');
} else {
if (isset($_POST['login']) && isset($_POST['pass']) && isset($_POST['email'])  && isset($_POST['code'])){
$error = '';
$stmt = $connect->prepare("select count(`id`) from `users` where `login` = ?");
$stmt->execute(array($_POST['login']));
$num = $stmt->fetchColumn();
if (empty($_POST['login'])) {
$error.= 'Kirish maydoni to\'ldirilishi shart!<br/>';
}
elseif (mb_strlen($_POST['login']) < 4 or mb_strlen($_POST['login']) > 10) {
$error.= 'Login 3 dan 10 gacha belgidan iborat bo\'lishi kerak!<br/>';
}
elseif (!preg_match("#^[a-z0-9]{1,15}$#i", $_POST['login'])) {
$error.= 'Kechirasiz, login lotin harflarida bolishi kerak<br />';
} 
elseif ($num > 0) {
$error.= 'Ushbu login bilan foydalanuvchi allaqachon ro\'yxatdan o\'tgan!<br/>';
}
if (empty($_POST['email'])) {
$error.= 'Elektron pochta satrini to\'ldirish shart!<br/>';
}
elseif (!preg_match('|^([a-z0-9_\.\-]{1,25})@([a-z0-9\.\-]{1,25})\.([a-z]{2,4})$|ius', $_POST['email'])) {
$error.= 'E-pochta maydoni noto‘g‘ri!<br/>';
} 
if (empty($_POST['pass'])) {
$error.= 'Parol maydonini kiritish shart!<br/>';
}
elseif (mb_strlen($_POST['pass']) < 6 or mb_strlen($_POST['pass']) > 20) {
$error.= 'Parol 6 dan 20 gacha belgidan iborat bo\'lishi kerak!<br/>';
}
if (!empty($_POST['email'])){
$stmt = $connect->prepare("select count(`id`) from `users` where `email` = ?");
$stmt->execute(array($_POST['email']));
$num = $stmt->fetchColumn();
if ($num > 0) {
$error.= 'Ushbu pochta qutisiga ega foydalanuvchi allaqachon ro\'yxatdan o\'tgan!<br/>';
}
}
$qz = $connect->prepare("SELECT * FROM `tarifs_hosting` WHERE `activ`='1' AND `id_server` = '1' AND `id` = ?");
$qz->execute(array($_POST['tarif']));
$qznum = $qz->fetchColumn();
if (empty($_POST['tarif'])){
    $error.= 'Siz tarifni tanlamadingiz! <br/>';
}elseif (empty($qznum)){
    $error.= 'Siz tanlagan tarif faol emas! <br/>';
}
if (empty($_POST['code'])) {
$error.= 'Capt\'cha(suratdagi tasdiqlash kodi)ni kiriting!<br/>';
}
elseif ($_SESSION['code'] != $_POST['code']) {
$error.= 'Capt\'cha(suratdagi tasdiqlash kodi)ni xato kiritdingiz!<br/>';
}
if ($error) {
echo '<div class="menu"><center><font color="red">'.$error.'</font></center></div>';
} else {
$stmt = $connect->prepare("insert into `users` set `datereg` = ?, `login` = ?, `pass` = ?, `email` = ?, `wmr` = ?, `id_tarif` = ?");
$acrn = rand(10000,99999);
if ($stmt->execute(array(time(), $_POST['login'], md5(md5($_POST['pass'])), $_POST['email'], $acrn, $_POST['tarif']))) {
$lid = $connect->LastInsertId();
if ($lid == 1) {
$connect->exec("update `users` set `admin` = '1' where `id` = '1'");
$stmt = $connect->prepare("update `settings` SET `value` = ? where `name` = 'mail'");
$stmt->execute(array($_POST['email']));
} else {
mailto($_POST['email'], 'Ro\'yxatdan o\'tish  Fasthost.Uz (t.me/pcouz)',
'Xostingda ro\'yxatdan o\'tganingiz uchun tashakkur!<br/>Kirish ma\'lumotlaringiz:<br/>
Login: '.$_POST['login'].'<br/>Parol: '.$_POST['pass'].'<br/>
Aktivatsiya kodi: '.$acrn.'<br/>');
}
$auth = bin2hex(random_bytes(64)); // ключ авторизации

                    $authlog->execute(array(time(), $lid, $ip, $ua, md5(md5($auth)), 0));

                    $expire = time() + 3600 * 24 * 365;

                    // авторизация
                    setcookie('user_id', $lid);
                    setcookie('user_id', $lid, $expire, '/');
                    setcookie('pass', md5(md5($_POST['pass'])));
                    setcookie('pass', md5(md5($_POST['pass'])), $expire, '/');
                    setcookie('auth', $auth);
                    setcookie('auth', $auth, $expire, '/');

                    header('Location: /');
} else {
echo '<div class="menu"><center><font color="red">Ro\'yxatdan o\'tishda xato!</font></center></div>';
}
}
}
$q = $connect->query("SELECT * FROM `tarifs_hosting` WHERE `activ`='1' AND `id_server` = '1' ORDER BY `sort`")->fetchAll();

echo '<form name="registration" action="" method="post"><div class="menu">
Login:<br /><input type="text" name="login" maxlength="15" /><br/>
Parol:<br /><input type="text" name="pass" maxlength="15" /><br/>
Pochta:<br /><input type="text" value="@" name="email" maxlength="35" /><br/>';
echo 'Tarif:<br/><select size="1" name="tarif">';
foreach ($q as $ta){
    echo '<option value="'.$ta[id].'"> '.filter($ta[name]).' ('.$ta[price_day].' So\'m/Kuniga)</option>';
}
echo '</select><br/>';
echo 'Capt\'cha: <img src="/inc/code.php" alt="check"><br /><input type="text" name="code" /><br />
<input class="btn btn-default" type="submit" value="Ro\'yxatdan o\'tish" /></div></form>'; 
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>