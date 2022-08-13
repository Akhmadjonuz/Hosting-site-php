<?php
//-----Подключаем функции-----//
include 'system/func.php';
include 'system/ftp_connect.php';
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Arxivni ochish "'.basename($d).'"';
include 'system/head.php';
title($title);
if(empty($d)){ 
header('Location: /mgr/explode.php');
}else{
ftp_pasv($serv,true);
$res = ftp_size($serv,$d);
if ($res == '-1'){
header('Location: /mgr/explode.php');
}else{
if(isset($_POST['ok'])){
$put=prov($_POST['put']);
if (!empty($put)){
$put=dir_url('/'.$put.'/');
}
if (empty($put)){
$err='<div class="menu"><center><font color="red">Paketni ochish yo\'li kiritilmadi</font></center></div>';
}
elseif (!preg_match('#^[A-z0-9_\-\/\.]+$#sU',$put)){
$err='<div class="menu"><center><font color="red">Noqonuniy belgilar aniqlandi. Ruxsat berilgan: A-z0-9_-/.</font></center></div>';
}
elseif (ftp_chdir($serv, $put) == false){
$err='<div class="menu"><center><font color="red">Belgilangan yo\'l uchun katalog mavjud emas</font></center></div>';
}
if (!empty($err)){
err($err);
}else{
$fi=ftprename($d);
$content = api_query('https://'.$server->ip.'/ispmgr?func=file.extract&elid=' .urlencode(substr($d, 1)). '&newdir=' .urlencode(substr($put, 1)). '&sok=ok&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
header('Location: /mgr/explode.php?d='.bon(verh2($d)));
} else {
err('<div class="err">Ошибка</div>');
}
}
}
$value=dir_url('/'.verh2($d).'/');
echo '<div class="menu"><form method="post">Qayerga chiqarish kerak (A-z0-9_-/.):<br/><input type="text" name="put" value="'.$value.'"><br/><input class="btn btn-default" type="submit" name="ok" value="Chiqarish"></form></div>';
}
}
echo '<div class="menu">&laquo; <a href="/mgr/file.php?d='.bon($d).'">Orqaga</a></div>';
ftp_close($serv);
include 'system/foot.php';
?>
