<?php
//-----Подключаем функции-----//
include 'system/func.php';
include 'system/ftp_connect.php';
switch(@$act){
default:
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Fayl menyusi "'.basename($d).'"';
include 'system/head.php';
title($title);
if(empty($d)){ 
header('Location: /mgr/explode.php');
}else{
ftp_pasv($serv,true);
$res = ftp_size($serv,$d);
if ($res == '-1') {
header('Location: /mgr/explode.php');
}else{
$path=pathinfo(ftprename($d));
$rf=mb_strtolower($path['extension'],'UTF-8');

if ($rf != 'jpg' && $rf != 'jpeg' && $rf != 'jpe' && $rf != 'png' && $rf != 'gif' && $rf != 'bmp' && $rf != 'ico'){    
echo '<div class="menu"><a class="section" href="/mgr/down.php?d='.bon($d).'"><b>&bull;</b> Faylni yuklab olish</a></div>';
}


if ($rf == 'zip'){
echo '<div class="menu"><a class="section" href="/mgr/unzip.php?d='.bon($d).'"><b>&bull;</b> Arzixdan chiqarish</a></div>
<div class="menu"><a class="section" href="/mgr/zip.php?arh='.bon($d).'"><b>&bull;</b> Просмотр архива</a></div>';
}
if ($rf == 'sql'){
echo '<div class="menu"><a class="section" href="/mgr/sql.php?d='.bon($d).'"><b>&bull;</b> SQL\'ni dampga yuklash</a></div>';
}
if ($rf != 'jpg' && $rf != 'jpeg' && $rf != 'jpe' && $rf != 'png' && $rf != 'gif' && $rf != 'bmp' && $rf != 'dll' && $rf != 'wav' && $rf != 'mid' && $rf != 'midi' && $rf != 'mp3' && $rf != 'mmf' && $rf != 'psd' && $rf != 'doc' && $rf != 'pdf' && $rf != 'zip' && $rf != 'rar' && $rf != 'jar' && $rf != '3gp' && $rf != 'avi' && $rf != 'mp4' && $rf != 'tgz' && $rf != 'gz' && $rf != 'bz' && $rf != 'gz2' && $rf != 'bz2' && $rf != 'tbz' && $rf != 'tbz2' && $rf != 'tgz2' && $rf != 'tar' && $rf != '7z' && $rf != 'ico') {
echo'<div class="menu"><a class="section" href="/mgr/notepad.php?d='.bon($d).'"><b>&bull;</b> Oddiy taxrirlash</a></div>
<div class="menu"><a class="section" href="/mgr/edit.php?d='.bon($d).'"><b>&bull;</b> Bloknotda taxrirlash</a></div>
<div class="menu"><a class="section" href="/mgr/file.php?act=inzip&amp;d='.bon($d).'"><b>&bull;</b> Zip fayl</a></div>';
}
echo '<div class="menu"><a class="section" href="/mgr/file.php?act=iconv&amp;d='.bon($d).'"><b>&bull;</b> Fayl kodlash</a></div>
<div class="menu"><a class="section" href="/mgr/file.php?act=view&amp;d='.bon($d).'"><b>&bull;</b> Kod ko\'rinishi</a></div>
<div class="menu"><a class="section" href="/mgr/file.php?act=copy&amp;d='.bon($d).'"><b>&bull;</b> Faylni nusxalash</a></div>
<div class="menu"><a class="section" href="/mgr/file.php?act=rename&amp;d='.bon($d).'"><b>&bull;</b> Nomini o\'zgartirish</a></div>';
echo '<div class="menu"><a class="section" href="/mgr/file.php?act=perenos&amp;d='.bon($d).'"><b>&bull;</b> Faylni ko\'chirish</a></div>
<div class="menu"><a class="section" href="/mgr/file.php?act=del&amp;d='.bon($d).'"><b>&bull;</b> Faylni o\'chirish</a></div>
<div class="menu"><a class="section" href="/mgr/file.php?act=clear&amp;d='.bon($d).'"><b>&bull;</b> Faylni bo\'shatish</a></div>
<div class="menu"><a class="section" href="/mgr/file.php?act=chmod&amp;d='.bon($d).'"><b>&bull;</b> Kirish huquqlari</a></div>
<div class="menu"><a class="section" href="/mgr/file.php?act=info&amp;d='.bon($d).'"><b>&bull;</b> Xususiyatlari</a></div>';
echo '<div class="menu"><a class="section" href="/mgr/explode.php?d='.bon(verh2($d)).'">&laquo;  Orqaga</a></div>';
}
}
ftp_close($serv);
break;
case 'loadfile':
$d=boff(prov($_GET['d']));
if (empty($d)){
header('Location: /mgr/explode.php');
}else{
$res=ftp_size($serv, $d);
if ($res == '-1'){
header('Location: /mgr/explode.php');
}else{
if (ftp_get($serv, 'tmp/'.$savedir.'/'.basename($d), $d, FTP_BINARY)){
////header('Content-Type: application/octet-stream');
header('Content-Length: '.$res);
header('Content-Disposition: attachment; filename='.basename($d));
echo file_get_contents('tmp/'.$savedir.'/'.basename($d));
unlink('tmp/'.$savedir.'/'.basename($d));
exit();
}else{
header('Location: /mgr/file.php?d='.bon($d));
}
}
}
ftp_close($serv);
break;
case 'iconv':
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Faylni kodlash "'.basename($d).'"';
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
if (isset($_POST['ok'])){
$v=prov($_POST['v']);
$iz=prov($_POST['iz']);
$type=intval($_POST['type']);
if (empty($v) || empty($iz)){
$err='<div class="err">Kodlash tanlanmagan</div>';
}
elseif (empty($type) || $type != '1' && $type != '2'){
$err='<div class="err">Hech qanday konversiya turi tanlanmagan!</div>';
}
elseif ($iz == $v){
$err='<div class="err">Qayta yozib olib bo‘lmaydi<b>'.$iz.'</b> в <b>'.$v.'</b></div>';
}
if (!empty($err)){
err($err);
}else{
if (ftp_get($serv, 'tmp/'.$savedir.'/recode.txt', $d, FTP_BINARY)) {
$file=file_get_contents('tmp/'.$savedir.'/recode.txt');
$file=iconv($iz,$v,$file);
file_put_contents('tmp/'.$savedir.'/recode.txt', $file);
if (ftp_put($serv, $d.''.($type == '2'?'.ftp':''), 'tmp/'.$savedir.'/recode.txt', FTP_BINARY)) {
echo '<div class="ok">Fayl kodlash muvaffaqiyatli o\'zgartirildi!</div>';
unlink('tmp/'.$savedir.'/recode.txt');
} else {
err('<div class="err">Faylni kodlab bo\'lmadi!</div>');
}
} else {
err('<div class="error">Faylni serverga yuklab bo\'lmadi</div>');
}
}
}
echo '<div class="menu"><form method="post">Asl kodlash:<br/>
<select name="iz"><option value="utf-8" selected="selected">utf-8</option><option value="windows-1251">windows-1251</option><option value="koi8-r">koi8-r</option><option value="cp866">cp866</option><option value="cp1251">cp1251</option><option value="iso-8859-1">iso-8859-1</option></select>
<br/>Yangi koshlash:<br/><select name="v"><option value="utf-8" selected="selected">utf-8</option><option value="windows-1251">windows-1251</option><option value="koi8-r">koi8-r</option><option value="cp866">cp866</option><option value="cp1251">cp1251</option><option value="iso-8859-1">iso-8859-1</option></select>
<br/>Kodlash turi:<br/><input type="radio" name="type" value="1" checked="checked"> Faylni qayta yozing<br/><input type="radio" name="type" value="2"> Yangi faylga saqlash<b>.ftp</b><br/><input class="btn btn-default" type="submit" name="ok" value="Qayta tiklash"></form></div>';
}
}
ftp_close($serv);
break;
case 'view':
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Fayl kodi "'.basename($d).'"';
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
if (ftp_get($serv, 'tmp/'.$savedir.'/'.basename($d), $d, FTP_BINARY)) {
$file=file_get_contents('tmp/'.$savedir.'/'.basename($d));
if (empty($file)){
err('Fayl bo\'sh');
}else{
$code=highlight_string($file, true);
$code=preg_replace('#<code>(.*)</code>#sU','\1',$code);
echo '<div class="menu">'.$code.'</div>';
}
unlink('tmp/'.$savedir.'/'.basename($d));
 } else {
err('<div class="err">Faylni serverga yuklab bo\'lmadi!</div>');
}
}
}
ftp_close($serv);
break;
case 'chmod':
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Fayl ruxsati "'.basename($d).'"';
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
if (isset($_POST['ok'])){
$chmod=intval($_POST['chmod']);
if (empty($chmod)){
$err='<div class="err">Kirish huquqi kiritilmagan!</div>';
}
elseif (!preg_match('#^[0-9]{3}+$#sU',$chmod) || !is_numeric($chmod) || strlen($chmod) != 3){
$err='<div class="err">Ruxsat noto‘g‘ri kiritildi!</div>';
}
if (!empty($err)){
err($err);
}else{
if (ftp_site($serv, 'CHMOD 0'.$chmod.' '.$d)){
echo '<div class="ok">Ruxsatnomalar muvaffaqiyatli o\'zgartirildi!</div>';
} else {
err('<div class="err">Ruxsatlarni o\'zgartirib bo\'lmadi</div>');
}
}
}
echo '<div class="menu"><form method="post">Kirish huquqlari (chmod):<br/><input type="text" name="chmod" value="'.chminf($serv, $d).'"><br/><input class="btn btn-default" type="submit" name="ok" value="O\'zgartirish"></form></div>';
}
}
ftp_close($serv);
break;
case 'del':
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Faylni o\'chirish "'.basename($d).'"';
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
if (isset($_GET['ok'])){
$content = api_query('https://'.$server->ip.'/ispmgr?func=file.delete&elid=' .urlencode(substr($d, 1)). '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
header('Location: /mgr/explode.php?d='.bon(verh2($d)));
} else {
err('<div class="err">Faylni o\'chirib bo\'lmadi.</div>');
}
}else{
echo '<div class="menu">Haqiqatan ham ushbu faylni yo\'q qilmoqchimisiz?<br/><center><a href="/mgr/file.php?act=del&amp;ok&amp;d='.bon($d).'">Ha</a> | <a href="/mgr/file.php?d='.bon($d).'">Yo\'q, aslo</a></center></div>';
}
}
}
ftp_close($serv);
break;
case 'clear':
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Faylni tozalash "'.basename($d).'"';
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
if (isset($_GET['ok'])){
$fi=ftprename($d);
file_put_contents('tmp/'.$savedir.'/'.$fi,'',0664);
if (ftp_put($serv, $d, 'tmp/'.$savedir.'/'.$fi, FTP_BINARY)){
echo '<div class="success">Fayl tozalandi!</div>';
unlink('tmp/'.$savedir.'/'.$fi);
} else {
err('<div class="err">Faylni tozalab bo\'lmadi</div>');
}
}else{
echo '<div class="menu">Haqiqatan ham ushbu faylni tozalamoqchimisiz?<br/><center><a href="/mgr/file.php?act=clear&amp;ok&amp;d='.bon($d).'">Ha</a> | <a href="/mgr/file.php?d='.bon($d).'">Yo\'q</a></center></div>';
}
}
}
ftp_close($serv);
break;
case 'rename':
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Faylni ismini o\'zgartirish "'.basename($d).'"';
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
if (isset($_POST['ok'])){
$name=prov($_POST['name']);
if (empty($name)){
$err='<div class="err">Fayl ismini kiritmadingiz!</div>';
}
elseif (!preg_match('#^[A-z0-9_\-\.]+$#sU',$name)){
$err='<div class="err">Noqonuniy belgilar aniqlandi. Ruxsat berilgan: A-z0-9_-.</div>';
}
if (!empty($err)){
err($err);
}else{
$newdir=dir_url('/'.ftprename2($d).'/'.$name);
if (ftp_rename($serv,$d,$newdir)) {
header('Location: /mgr/explode.php?d='.bon(verh2($d)));
} else {
err('<div class="err">Fayl ismini taxrirlab bo\'lmadi</div>');
}
}
}
echo '<div class="menu"><form method="post">Fayl nomi (A-z0-9_-.):<br/><input type="text" name="name" value="'.ftprename($d).'"><br/><input class="btn btn-default" type="submit" name="ok" value="O\'zgartirish"></form></div>';
}
}
ftp_close($serv);
break;
case 'perenos':
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Faylni ko\'chirish "'.basename($d).'"';
include 'system/head.php';
title($title);
if (empty($d)){
header('Location: /mgr/explode.php');
}else{
ftp_pasv($serv,true);
$res = ftp_size($serv,$d);
if ($res == '-1'){
header('Location: /mgr/explode.php');
}else{
if (isset($_POST['ok'])){
$put=prov($_POST['put']);
if (!empty($put)){
$put=dir_url('/'.$put.'/');
$verh=dir_url('/'.verh2($d).'/');
}
if (empty($put)){
$err='<div class="err">Siz faylni ko\'chish joyini kiritmadingiz!</div>';
}
elseif (!preg_match('#^[A-z0-9_\-\/\.]+$#sU',$put)){
$err='<div class="err">Noqonuniy belgilar aniqlandi. Ruxsat berilgan: A-z0-9_-/.</div>';
}
//elseif ($put == $verh){$err='<div class="error">Данный файл и так находится в этой директории</div>';}
if (!empty($err)){
err($err);
}else{
$newdir=dir_url('/'.$put.'/'.basename($d));
if (ftp_rename($serv,$d,$newdir)) {
header('Location: /mgr/explode.php?d='.bon($put));
} else {
err('<div class="err">Faylni ko\'chirib bo\'lmadi!</div>');
}
}
}
$value=dir_url('/'.verh2(verh2($d)).'/');
echo '<div class="menu"><form method="post">Ko\'chirish uchun manzil (A-z0-9_-/.):<br/><input type="text" name="put" value="'.$value.'"><br/><input class="btn btn-default" type="submit" name="ok" value="Ko\'chirish"></form></div>';
}
}
ftp_close($serv);
break;
case 'copy':
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Faylni nusxalash "'.basename($d).'"';
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
if (isset($_POST['ok'])){
$put=prov($_POST['put']);
if (!empty($put)){
$put=dir_url('/'.$put.'/');
$verh=dir_url('/'.verh2($d).'/');
}
if (empty($put)){
$err='<div class="err">Nusxalash uchun manzil kiritilmadi!</div>';
}
elseif (!preg_match('#^[A-z0-9_\-\/\.]+$#sU',$put)){
$err='<div class="err">Noqonuniy belgilar aniqlandi. Ruxsat berilgan: A-z0-9_-/.</div>';
}
//elseif ($put == $verh){$err='<div class="error">Данный файл уже есть в этой директории</div>';}
if (!empty($err)){
err($err);
}else{
$newdir=dir_url('/'.$put.'/'.basename($d));
if (ftp_get($serv, 'tmp/'.$savedir.'/'.basename($d), $d, FTP_BINARY)) {
if (ftp_put($serv, $newdir, 'tmp/'.$savedir.'/'.basename($d), FTP_BINARY)) {
unlink('tmp/'.$savedir.'/'.basename($d));
header('Location: /mgr/explode.php?d='.bon($put));
} else {
err('<div class="err">Faylni nusxalab bo\'lmadi!</div>');
}
} else {
err('<div class="err">Faylni serverga yuklab bo\'lmadi!</div>');
}
}
}
$value=dir_url('/'.verh2(verh2($d)).'/');
echo '<div class="menu"><form method="post">Nusxalash uchun manzil (A-z0-9_-/.):<br/><input type="text" name="put" value="'.$value.'"><br/><input class="btn btn-default" type="submit" name="ok" value="Nusxalash"></form></div>';
}
}
ftp_close($serv);
break;
case 'inzip':
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Faylni arxivlash "'.basename($d).'"';
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
if (isset($_POST['ok'])){
$name=prov($_POST['name']);
if (empty($name)){
$err='<div class="err">Arxiv uchun nom kiritmadingiz!</div>';
}
elseif (!preg_match('#^[A-z0-9_\-\.]+$#sU',$name)){
$err='<div class="err">Noqonuniy belgilar aniqlandi. Ruxsat berilgan: A-z0-9_-.</div>';
}
if (!empty($err)){
err($err);
}else{
mkdir('tmp/'.$savedir.'/archive',0777);
if (ftp_get($serv, 'tmp/'.$savedir.'/archive/'.basename($d), $d, FTP_BINARY)){
include 'system/pclzip.php';
$zip=new PclZip('tmp/'.$savedir.'/'.$name.'.zip');
if ($zip->create('tmp/'.$savedir.'/archive/'.basename($d), PCLZIP_OPT_REMOVE_ALL_PATH) != false){
ftp_put($serv, dir_url('/'.verh2($d).'/'.$name.'.zip'), 'tmp/'.$savedir.'/'.$name.'.zip',FTP_BINARY);
unlink('tmp/'.$savedir.'/'.$name.'.zip');
deldir('tmp/'.$savedir.'/archive');
unlink('tmp/'.$savedir.'/'.basename($d));
header('Location: /mgr/explode.php?d='.bon(verh2($d)));
    }else{
err('<div class="err">Arxiv yaratishda xato!</div>');
	}
	}else{
err('<div class="err">Faylni serverga yuklashda xato!</div>');
	}
	}
}
$value=pathinfo($d);
if ($value['basename'] != '.htaccess'){
$value=str_replace('.'.$value['extension'],'',$value['basename']);
}else{
$value='htaccess';
}
echo '<div class="menu"><form method="post">Arxiv nomi (A-z0-9_-.):<br/><input type="text" name="name" value="'.$value.'">.zip<br/><input class="btn btn-default" type="submit" name="ok" value="Arxivlash"></form></div>';
}
}
ftp_close($serv);
break;
case 'info':
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Fayl haqida malumot "'.basename($d).'"';
include 'system/head.php';
title($title);
if (empty($d)){
header('Location: /mgr/explode.php');
}else{
$res=ftp_size($serv, $d);
if ($res == '-1'){
header('Location: /mgr/explode.php');
}else{
echo '<div class="menu">Ismi: '.basename($d).'<br/>Hajmi: '.sizer($res).'<br/>Kirish huquqlari: '.chminf($serv, $d).''.(dirinf($serv, $d, 'user') !=false?'<br/>Egasi: '.dirinf($serv, $d, 'user'):'').''.(dirinf($serv, $d, 'group') != false?'<br/>Guruhi: '.dirinf($serv, $d, 'group'):'').''.(dirinf($serv, $d, 'date') != false?'<br/>Yaratilgan sana: '.dirinf($serv, $d, 'date'):'').'</div>';
}
}
ftp_close($serv);
break;
}
if ($act){
echo '<div class="menu"><a class="section" href="/mgr/file.php?d='.prov($_GET['d']).'">&laquo; Orqaga</a></div>';
}
include 'system/foot.php';
?>