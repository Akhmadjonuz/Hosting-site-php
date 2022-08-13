<?php
$title = 'Parolni tiklash | Fasthost.Uz';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == false) {
echo '<div class="title">Parolni tiklash</div>';
$_SESSION['rand_pass'] = gen_pass();
if (isset($_POST['login']) && isset($_POST['email']) && isset($_POST['code'])) {
$error = '';
$stmt = $connect->prepare("select count(`id`) from `users` where `login` = ?");
$stmt->execute(array($_POST['login']));
$num = $stmt->fetchColumn();
if (empty($_POST['login'])) {
$error.= 'Tizimdagi loginingizni kiriting!<br/>';
}
elseif (mb_strlen($_POST['login']) < 3 or mb_strlen($_POST['login']) > 15) {
$error.= 'Kirish 3 va 15 belgidan iborat bo\'lishi kerak!<br/>';
}
elseif ($num == 0) {
$error.= 'Bunday foydalanuvchi nomi mavjud emas!<br/>';
}
$stmt = $connect->prepare("select count(`id`) from `users` where `login` = ? and `email` = ?");
$stmt->execute(array($_POST['login'], $_POST['email']));
$num = $stmt->fetchColumn();
if (empty($_POST['email'])) {
$error.= 'Pochta manzilingizni!<br/>';
}
elseif (!preg_match('|^([a-z0-9_\.\-]{1,20})@([a-z0-9\.\-]{1,20})\.([a-z]{2,4})$|ius', $_POST['email'])) {
$error.= 'E-pochta maydoni noto‘g‘ri!<br/>';
}
elseif ($num == 0) {
$error.= 'Noto\'g\'ri pochta qutisi kiritildi!<br/>';
}
if (empty($_POST['code'])) {
$error.= 'Capt\'chani kiriting!<br/>';
}
elseif ($_SESSION['code'] != $_POST['code']) {
$error.= 'Capt\'cha xato!<br/>';
}
if ($error) {
echo '<div class="menu"><center><font color="red">'.$error.'</font></center></div>';
} else {
$stmt = $connect->prepare("insert into `forgot` set `sess` = ?,`login` = ?,`email` = ?, `time` = ?");
if ($stmt->execute(array(md5(md5($_SESSION['rand_pass'])), $_POST['login'], $_POST['email'], $time))) {
mailto($_POST['email'], 'Parolni tiklash',
'Siz parolni tiklashni so\'radingiz! (<font color=red>Sessiya aniq 20 daqiqa davomida amal qiladi!</font>)<br/>
Parolni tiklash uchun! ushbu havolani bosing! <a href="https://fasthost.uz/activ/sess/'.md5(md5($_SESSION['rand_pass'])).'">Link</a> <br/><br/>Hurmat bilan, Administrator fasthost.uz',
$set['mail']);
echo '<div class="menu"><center><font color="aqua">Ma\'lumotlar elektron pochta manzilingizga yuborildi.</font></center></div>';
} else {
echo '<div class="menu"><center><font color="red">Parolni tiklashda xato!</font></center></div>';
}
}
}
echo '<div class="menu"><form action="" method="post">Login:<br/><input type="text" name="login" maxlength="15"/><br/>E-mail:<br /><input type="text" name="email" maxlength="35"/><br/>Capt\'cha:<img src="/inc/code.php" alt="check"><br /><input type="text" name="code" /><br/><input class="btn btn-default" type="submit" value="Parolni tiklash"/></form></div>';
} else {
header('Location: /user/menu');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>