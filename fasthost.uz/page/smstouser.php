<?php
$title = 'Foydalanuvchiga habar jo\'natish!';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
/*for ($i=1; $i < 100; $i++){
    tg("386776082","Salom do'stim qalesiz! ko'rinmaysiz!");
}*/
//$connect->exec("update `users` set `time_work` = `time_work` + 864000 where `id` = 1");
/*$sqlaa = $connect->query("select * from `users`")->fetchAll();
foreach ($sqlaa as $rowx) {
if ($rowx[activ] == 2){
    $connect->exec("update `users` set `time_work` = `time_work` + 864000 where `id` = '$rowx[id]'");
}
}*/

if ($adm_id == 5){
echo '<div class="title"><b>Foydalanuvchiga habar jo\'natish!</b></div>';
if (isset($_POST['ok'])){
$smid=uid($_POST['login']);
$sql = $connect->query("select * from `users` where `id` = '$smid'")->fetchAll();
$text= $_POST['text'];
foreach ($sql as $row) {
$res = $connect->prepare("insert into `note` set `name` = 'Система', `text` = ?, `time` = ?, `id_user` = ?"); 
$res->execute(array($text,$time,$row[id]));
if (!empty($row[tg_id])) {
    $tgmsg='Assalom alaykum, '.$row[login].'
    Sizga yangi bildirishnoma mavjud!
    Kimdan: Tizimdan
    Habar: '.$text;
    tgmsg($row[tg_id], filteroff($tgmsg), '');
}
}
header('Location: /adm/users/sms?ok=ok');
}
if ($_GET['ok']== 'ok') {echo '<div class="menu"><center><font color="aqua">Habar jo\'natildi!</font></center></div>';}
include($_SERVER["DOCUMENT_ROOT"]."/inc/smiles_bb.php");
echo '<div class="menu"><form method="post">

<b>Foydalanuvchi:</b> <br/><input type="text" name="login"><br/>
<b>Habar:</b><br /><textarea name="text" rows="3" cols="20"></textarea> <br />

<input class="btn btn-default" type="submit" name="ok" value="Jo\'natish" />
</form></div>';
echo '<div class="menu">&bull;<a href="/adm"> <b>Orqaga</b></a></div>';
} else {
    header('Location: /');
}
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>