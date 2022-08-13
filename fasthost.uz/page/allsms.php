<?php
$title = 'Barcha foydalanuvchilarga habar jo\'natish';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if ($adm_id == 5){
echo '<div class="title"><b>Barcha foydalanuvchilarga habar jo\'natish</b></div>';
if (isset($_POST['ok'])){
$sql = $connect->query("select * from `users`")->fetchAll();
$text= $_POST['text'];
foreach ($sql as $row) {
$res = $connect->prepare("insert into `note` set `name` = 'Система', `text` = ?, `time` = ?, `id_user` = ?"); 
$res->execute(array($text,$time,$row[id]));
if (!empty($row[tg_id])) {
    $tgmsg='Assalom alaykum, '.$row[login].'
    Sizda yangi bildirishnoma mavjud!
    Kimdan: Tizim
    Habar: '.$text;
    tgmsg($row[tg_id], filteroff($tgmsg), '');
}
}
header('Location: /adm/users/allsms?ok=ok');
}
if ($_GET['ok']== 'ok') {echo '<div class="menu"><center><font color="gren">Habar jo\'natildi!</font></center></div>';}
include($_SERVER["DOCUMENT_ROOT"]."/inc/smiles_bb.php");
echo '<div class="menu"><form method="post">


<b>Habar:</b><br /><textarea name="text" rows="3" cols="20"></textarea> <br />

<input class="btn btn-default" type="submit" name="ok" value="Jo\'natish" />
</form></div>';
echo '<div class="menu">&bull;<a href="/adm"> <b>Orqaga</b></a></div>';
} else {
    header('Location: /');
}
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>