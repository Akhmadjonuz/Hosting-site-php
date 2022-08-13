<?php
//-----Подключаем функции-----//
$title='Fayl menejer';
include 'system/func.php';
include 'system/ftp_connect.php';
switch($act){
default:
include 'system/head.php';
title($title);


$d=dir_url('/'.prov(boff($_GET['d'])).'/');
ftp_pasv($serv,true);
$lines = ftp_rawlist($serv, $d);
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
if (!empty($d) && $d != '/') echo '<div class="menu"><a href="/mgr/explode.php?d='.bon(verh($d)).'"><img src="/inc/style/img/up.png" alt="up"></a> '.dir_url('/'.$d.'/').'</div>';
$cnt_dir=0;
for ($i=0; $i<count($lines); $i++) {
$name=preg_replace("~([^\s]*[\s]*){8}\s{1}(.*)~m","\\2",$lines[$i]);
if ($name != '.' && $name != '..' && !preg_match('/->/i',$name)){
$chm=preg_replace("~([^\s]*).*~m","\\1",$lines[$i]);
if ($chm[0] != '-'){
echo '<div class="menu"><a href="/mgr/explode.php?d='.bon(dir_url('/'.$d.'/'.$name.'/')).'"> <img src="/img/mgr/dir.gif"  width="19" height="19"> '.$name.'</a></div>';
$cnt_dir++;
}
}
}
$cnt_file=0;
for($j=0; $j<count($lines); $j++){
$name=preg_replace("~([^\s]*[\s]*){8}\s{1}(.*)~m","\\2",$lines[$j]);
if ($name!="." && $name!=".." && !preg_match('/->/i',$name)){
$size=preg_replace("~([^\s]*[\s]*){4}\s{1}([^\s]*)(.*)~m","\\2",$lines[$j]);
$chm=preg_replace("~([^\s]*).*~m","\\1",$lines[$j]);
if ($chm[0] == "-") {

//echo '<a class="section" href="/mgr/file.php?d='.bon(dir_url('/'.$d.'/'.$name)).'"><img src="/design/mgr/'.strtr((string)$mtip, $img_typ). '" alt="*" width="19" height="19"> '.$name.'  ['.sizer($size).']<br/></a></div>'; 

echo '<div class="menu"><a href="/mgr/file.php?d='.bon(dir_url('/'.$d.'/'.$name)).'"><img src="/img/mgr/file.gif" alt="*" width="19" height="19"> '.$name.'  ['.sizer($size).']</a></div>';    
///
$img_typ = array(
    'html' => 'html.png',
    'php' => 'php.png'
    );
///
$cnt_file++;
 }
 }
}
if ($cnt_dir == 0 && $cnt_file == 0){echo '<div class="err">Jild bo\'sh</div>';}
echo '<div class="title">Jildlar: '.$cnt_dir.' / Fayllar: '.$cnt_file.'</div>';
echo '<div class="menu">Yaratish: <a href="/mgr/explode.php?act=newfile&amp;d='.bon($d).'"><span class="main">Fayl</span></a> / <a href="/mgr/explode.php?act=newdir&amp;d='.bon($d).'"><span class="main">Jild</span></a><br/></div>';
if (!empty($d) && $d != '/') echo '<div class="menu"><a href="/mgr/dir.php?d='.bon($d).'"><img src="/img/mgr/dir.gif" alt="*"> Меню папки ['.basename($d).']</a></div>';
echo '<div class="menu"><a href="/mgr/change.php?d='.bon($d).'"><img src="/img/mgr/multi.gif" alt="*"> Kengaytirilgan rejim</a></div>
<div class="menu"><a href="/mgr/explode.php?act=upload&amp;d='.bon($d).'"><img src="/img/mgr/file.gif" alt="*"> Fayl yuklash</a></div>
<div class="menu"><a href="/mgr/explode.php?act=import&amp;d='.bon($d).'"><img src="/img/mgr/file.gif" alt="*"> Faylni import qilish</a></div>';
 }

ftp_close($serv);
break;
case 'newdir':
$title='Jild yaratish';
include 'system/head.php';
title($title);
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
if(ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
if (isset($_POST['ok'])){
$name=prov($_POST['name']);
if (empty($name)){$err='<div class="err">Jild uchun nom kiriyilmadi!</div>';}
elseif (!preg_match('/^[A-z0-9_\-\.]+$/ui',$name)){$err='<div class="err">Jild nomi noto\'g\'ri kiritilgan</div>';}
if (!empty($err)){
err($err);
}else{
$dir=dir_url('/'.$d.'/'.$name.'/');
if (ftp_mkdir($serv,$dir)) {
header('Location: /mgr/explode.php?d='.bon($d));
} else {
err('<div class="err">Jildni yaratib bo\'lmadi!</div>');
}
}
}
echo '<div class="menu"><form method="post">Ismi (A-z0-9_-.):<br/><input type="text" name="name" value="image"><br/><input class="btn btn-default" type="submit" name="ok" value="Yaratish"></form></div>';
}
ftp_close($serv);
break;
case 'newfile':
$title='Fayl ochish';
include 'system/head.php';
title($title);
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
if (isset($_POST['ok'])){
$name=prov($_POST['name']);
if (empty($name)){
$err='<div class="err">Fayl uchun ism kiritilmadi</div>';
}
elseif (!preg_match('/^[A-z0-9_\-\.]+$/ui',$name)){
$err='<div class="err">Fayl nomi noto\'g\'ri kiritilgan!</div>';
}
if (!empty($err)){
err($err);
}else{
file_put_contents('tmp/'.$savedir.'/create.txt', filteroff($_POST['text']), 0664);
$remote_file=dir_url('/'.$d.'/'.$name);
if (ftp_put($serv, $remote_file, 'tmp/'.$savedir.'/create.txt', FTP_BINARY)) {
unlink('tmp/'.$savedir.'/create.txt');
header('Location: /mgr/explode.php?d='.bon($d));
} else {
err('<div class="err">Fayl ochib bo\'lmadi</div>');
}
}
}
$value='<?php
/*By @PCOUZ Team :)*/
?>';
echo '<div class="menu"><form method="post">Ismi (A-z0-9_-.):<br/><input type="text" name="name" value="index.php"><br/>Tarkibi:<br/><textarea name="text" cols="80" rows="15" style="width: 93%">'.$value.'</textarea><br/><input class="btn btn-default" type="submit" name="ok" value="Yaratish"></form></div>';
}
ftp_close($serv);
break;
case 'import':
$title='Faylni import qilish';
include 'system/head.php';
title($title);
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
if (isset($_POST['ok'])){
$url=prov($_POST['url']);
$path=pathinfo($url);
if (empty($url) || $url == 'http://' || $url == 'https://'){
$err='<div class="err">Fayl URL manzili kiritilmadi!</div>';
}
elseif (!preg_match('#^(http|https)://(.*)$#sU',$url)){
$err='<div class="err">Fayl manzili noto‘g‘ri kiritildi!</div>';
}
elseif (GetFileSize($url) > $maxupload){
$err='<div class="err">Maksimal import fayl hajmi '.sizer($maxupload).'</div>';
}
elseif (!copy($url, 'tmp/'.$savedir.'/'.$path['basename'])){
$err='<div class="err">Faylni import qilib bo‘lmadi!</div>';
}
if (!empty($err)){
err($err);
}else{
$remote_file=dir_url('/'.$d.'/'.$path['basename']);
if (ftp_put($serv, $remote_file, 'tmp/'.$savedir.'/'.$path['basename'], FTP_BINARY)) {
unlink('tmp/'.$savedir.'/'.$path['basename']);
header('Location: /mgr/explode.php?d='.bon($d));
} else {
err('<div class="err">Faylni import qilib bo‘lmadi!</div>');
}
}
}
echo '<div class="menu"><form method="post">Fayl URL manzili (max '.sizer($maxupload).'):<br/><input type="text" name="url" value="http://"><br/><input class="btn btn-default" type="submit" name="ok" value="Importlash"></form></div>';
}
ftp_close($serv);
break;
case'upload':
$title='Faylni yuklash';
include 'system/head.php';
title($title);
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
if (isset($_POST['ok'])){
if (empty($_FILES['file']['name'])){
$err='<div class="err">Siz faylni tanlamadingiz!</div>';
}
elseif ($_FILES['file']['size'] > $maxupload){
$err='<div class="err">Fayllarni yuklashning maksimal hajmi '.sizer($maxupload).'</div>';
}
elseif (!copy($_FILES['file']['tmp_name'], 'tmp/'.$savedir.'/'.$_FILES['file']['name'])){
$err='<div class="err">Fayl yuklanmadi!</div>';
}
if (!empty($err)){
err($err);
}else{
$remote_file=dir_url('/'.$d.'/'.$_FILES['file']['name']);
$file='tmp/'.$savedir.'/'.$_FILES['file']['name'];
if (ftp_put($serv, $remote_file, $file, FTP_BINARY)) {
unlink($file);
header('Location: /mgr/explode.php?d='.bon($d));
} else {
err('<div class="err">Faylni serverga yuklab bo\'lmadi!</div>');
include 'system/foot.php';
exit();
}
}
}
echo '<div class="menu"><form method="post" enctype="multipart/form-data">Faylni tanlash (max '.sizer($maxupload).'):<br/><input type="file" name="file" style="width: 93%"><br/><input class="btn btn-default" type="submit" name="ok" value="Yuklash"></form></div>';
}
ftp_close($serv);
break;
}
if ($act){
echo '<div class="menu"><a href="/mgr/explode.php?d='.prov($_GET['d']).'">&laquo; Назад</a></div>';
}
include 'system/foot.php';
?>