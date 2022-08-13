<?php
$title = 'Parolni tiklash';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == false) {
echo '<div class="title"><b>Parolni tiklash</b></div>';
$_SESSION['rand_pass'] = gen_pass();
if (isset($_GET['sess'])){
$stmtab = $connect->prepare("select count(*) from `forgot` where `sess` = ?");
$stmtab->execute(array($_GET['sess']));
$num = $stmtab->fetchColumn();
$error='';
if ($num == 0) {
$error= 'Sizning seansingiz eskirgan yoki yo\'q!';
header( "refresh:3;url=/" );
}
if ($error) {
echo '<div class="menu"><center><font color="red">'.$error.'</font></center></div>';
} else {
$forgota = $connect->prepare("SELECT * FROM `forgot` WHERE `sess` = ?");
$forgota->execute(array($_GET['sess']));
$forgot = $forgota->fetch(PDO::FETCH_LAZY);
$stmt = $connect->prepare("update `users` set `pass` = ? where `login` = ? limit 1");
if ($stmt->execute(array(md5(md5($_SESSION['rand_pass'])), $forgot['login']))) {
mailto($forgot['email'], 'Parolni tiklash | Fasthost.Uz',
'Parolni tiklashni so\'radingiz!<br/>
Sizning yangi parolingiz: '.$_SESSION['rand_pass'].'<br/> Autologin uchun havola: '.ROOT.'/auth?login='.$forgot['login'].'&pass='.$_SESSION['rand_pass'].'<br/><br/>Xurmat bilan Fasthost.Uz Adminstratori',
$set['mail']);
$delsess = $connect->prepare("delete from `forgot` where `id` = ? limit 1");
$delsess->execute(array($forgot['id']));
echo '<div class="menu"><center><font color="aqua">Sizning parolingiz elektron pochtangizga yuborildi!</font></center></div>';
header( "refresh:3;url=/" );
} else {
echo '<div class="menu"><center><font color="red">Parolni tiklashda xato!</font></center></div>';
}
}
}
if (empty($_GET['sess'])){
echo '<div class="menu"><center><font color="red">Bunday sessiya mavjud emas !</font></center></div>';
    header( "refresh:3;url=/" );
}
} else {
header('Location: /user/menu');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>