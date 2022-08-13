<?php
//-----Подключаем функции-----//
include 'system/func.php';
include 'system/ftp_connect.php';
$d=dir_url('/'.prov(boff($_GET['d'])));
$title='Fayl tahrirlash"'.basename($d).'"';
include 'system/head.php';
title($title);
if (empty($d)){
header('Location: /mgr/explode.php');
}else{
if (ftp_size($serv, $d) == '-1'){
header('Location: /mgr/explode.php');
}else{
$fi=ftprename($d);
if (ftp_get($serv, 'tmp/'.$savedir.'/notepad.txt', $d, FTP_BINARY)){
$file=file_get_contents('tmp/'.$savedir.'/notepad.txt');
if (isset($_POST['ok'])){
file_put_contents('tmp/'.$savedir.'/notepad.txt', $_POST['text']);
if (ftp_put($serv, $d, 'tmp/'.$savedir.'/notepad.txt', FTP_BINARY)){
echo '<div class="ok">Изменения успешно сохранены</div>';
}else{
err('<div class="err">Не удалось сохранить изменения</div>');
}
}

echo '<div class="menu">
<form method="post">Muharrir:<br/><textarea name="text" id="code" cols="80" rows="15" style="width: 93%">'.htmlspecialchars(trim(file_get_contents('tmp/'.$savedir.'/notepad.txt'))).'</textarea><br/><input class="btn btn-default" type="submit" name="ok" value="Saqlash"></form></div>
<div class="menu">&laquo; <a href="/mgr/file.php?d='.bon($d).'">Orqaga</a></div>';
unlink('tmp/'.$savedir.'/notepad.txt');
}else{
err('<div class="err">Faylni serverga yuklab bo\'lmadi</div>');
}
}
}
ftp_close($serv);
include 'system/foot.php';
?>