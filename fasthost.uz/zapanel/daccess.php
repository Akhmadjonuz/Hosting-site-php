<?php
$title = 'Tarqatishga kirish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
echo '<div class="title"><b>Tarqatishga kirish</b></div>';
if ($_GET['daccess'] && $user['access_cp']) {
    $dacc = $connect->prepare("update `users` set `access_cp` = ? where `id` = ? limit 1");
if ($dacc->execute(array(0, $user['id']))) {
    header('Location: ?');
}
}
if (isset($_POST['ok']) && empty($user['access_cp'])) {
$stnum = $connect->prepare("select count(`id`) from `users` where `login` = ?");
$stnum->execute(array($_POST['login'])); 
$num = $stnum->fetchColumn();
$idd = uid($_POST['login']);
if (empty($_POST['login'])) {
$error.= 'Qabul qiluvchining loginini kiriting!';
}
elseif ($num == 0) {
$error.= 'Bunday foydalanuvchi mavjud emas!';
}elseif($idd == $user['id']){
    $error.= 'Siz buni o\'zingiz qilolmaysiz!<br/>';
}
if ($error) {
    echo '<div class="err">'.$error.'</div>';
}else{
    
    $dacc = $connect->prepare("update `users` set `access_cp` = ? where `id` = ? limit 1");
if ($dacc->execute(array($idd, $user['id']))) {
    header('Location: ?');
}
}

}
if ($user['access_cp']){
    echo '<div class="menu"> Kirish huquqini berdingiz'.ulogin($user['access_cp']).' [<a href="?daccess=deny">O\'chirish</a>]</div>';
}else{
    echo '<div class="menu">';
    echo '<form method="post" action="">
<b>Login:</b><br /><input type="text" name="login" maxlength="25"> <br />
<input class="btn btn-default" type="submit" name="ok" value="Faollashtirish" />
</form>';
    echo '</div>';
}
} else {header('Location: /auth');}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>