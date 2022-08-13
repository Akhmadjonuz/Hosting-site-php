<?php
//-----Подключаем функции-----//
include 'system/func.php';
include 'system/ftp_connect.php';
switch(@$act){
default:
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
$title='Jild menyusi "'.basename($d).'"';
include 'system/head.php';
title($title);
if (empty($d)){
header('Location: /mgr/explode.php');
}else{
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
echo '<div class="menu"><a class="section" href="/mgr/dir.php?act=copy&amp;d='.bon($d).'"><b>&bull;</b> Nusxalash</a></div>
<div class="menu"><a class="section" href="/mgr/dir.php?act=inzip&amp;d='.bon($d).'"><b>&bull;</b> Jildni arxivlash</a></div>
<div class="menu"><a class="section" href="/mgr/dir.php?act=rename&amp;d='.bon($d).'"><b>&bull;</b> Jild nomini o\'zgartirish</a></div>
<div class="menu"><a class="section" href="/mgr/dir.php?act=perenos&amp;d='.bon($d).'"><b>&bull;</b> Ko\'chirish</a></div>
<div class="menu"><a class="section" href="/mgr/dir.php?act=del&amp;d='.bon($d).'"><b>&bull;</b> O\'chirish</a></div>
<div class="menu"><a class="section" href="/mgr/dir.php?act=clear&amp;d='.bon($d).'"><b>&bull;</b> Tozalash</a></div>
<div class="menu"><a class="section" href="/mgr/dir.php?act=chmod&amp;d='.bon($d).'"><b>&bull;</b> Kirish huquqlari</a></div>
<div class="menu"><a class="section" href="/mgr/dir.php?act=info&amp;d='.bon($d).'"><b>&bull;</b> Xususiyatlari</a></div>';
echo '<div class="menu"><a class="section" href="/mgr/explode.php?d='.bon($d).'">&laquo; Orqaga</a></div>';
//echo '<a class="section" href="/mgr/explode.php?d='.bon(verh2(verh2($d))).'">&laquo; Назад</a>';
}
}
ftp_close($serv);
break;
case 'chmod':
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
$title='Jild ruxsatnomalari "'.basename($d).'"';
include 'system/head.php';
title($title);
if(empty($d)){ 
header('Location: /mgr/explode.php');
}else{
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
if (isset($_POST['ok'])){
$chmod=intval($_POST['chmod']);
if (empty($chmod)){
$err='<div class="err">Kirish huquqi kiritilmagan!</div>';
}
elseif (!preg_match('#^[0-9]{3}+$#sU',$_POST['chmod']) || !is_numeric($chmod) || strlen($chmod) != 3){
$err='<div class="err">Kirish huquqi noto‘g‘ri kiritildi. Kiritish uchun misol: 777</div>';
}
if (!empty($err)){
err($err);
}else{
$chmd='CHMOD 0'.$chmod.' '.$d;
if (ftp_site($serv,$chmd)){
echo '<div class="ok">Ruxsatnomalar muvaffaqiyatli o\'zgartirildi!</div>';
} else {
err('<div class="err">Не удалось изменить права</div>');
include 'system/foot.php';
exit();
}
}
}
echo '<div class="menu"><form method="post">Kirish huquqlari (chmod):<br/><input type="text" name="chmod" value="'.chminf($serv, verh2($d)).'"><br/><input class="btn btn-default" type="submit" name="ok" value="Saqlash"></form></div>';
}
}
ftp_close($serv);
break;
case 'del':
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
$title='Jildni o\'chirish "'.basename($d).'"';
include 'system/head.php';
title($title);
if(empty($d)){ 
header('Location: /mgr/explode.php');
}else{
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
if(isset($_GET['ok'])){
$content = api_query('https://'.$server->ip.'/ispmgr?func=file.delete&elid=' .urlencode(substr($d, 1)). '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
        $parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            header('Location: /mgr/explode.php?d='.bon(verh2(verh2($d))));
} else {
err('<div class="err">Faylni o\'chirib bo\'lmadi!</div>');
}
}else{
echo '<div class="menu">Haqiqatan ham ushbu jildni va uning ichidagi barcha jildlarni yo\'q qilmoqchimisiz??<br/><center><a href="/mgr/dir.php?act=del&amp;ok&amp;d='.bon($d).'">Ha</a> | <a href="/mgr/dir.php?d='.bon($d).'">Yo\'q</a></center></div>';
}
}
}
ftp_close($serv);
break;
case 'clear':
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
$title='Jildni tozalash "'.basename($d).'"';
include 'system/head.php';
title($title);
if(empty($d)){ 
header('Location: /mgr/explode.php');
}else{
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
if (isset($_GET['ok'])){
if (rdir($serv, $d, 'cl')){
header('Location: /mgr/dir.php?d='.bon($d));
} else {
err('<div class="err">Jildni o\'chirib bo\'lmadi!</div>');
}
}else{
echo '<div class="menu">Haqiqatan ham ushbu jildni barcha jildlardan va undagi fayllardan tozalamoqchimisiz??<br/><center><a href="/mgr/dir.php?act=clear&amp;ok&amp;d='.bon($d).'">Ha</a> | <a href="/mgr/dir.php?d='.bon($d).'">Yo\'q</a></center></div>';
}
}
}
ftp_close($serv);
break;
case 'rename':
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
$title='Jildning nomini o\'zgartirish "'.basename($d).'"';
include 'system/head.php';
title($title);
if(empty($d)){ 
header('Location: /mgr/explode.php');
}else{
if (ftp_chdir($serv, $d)== false){
header('Location: /mgr/explode.php');
}else{
if (isset($_POST['ok'])){
$name=prov($_POST['name']);
if (empty($name)){
$err='<div class="err">Jild nomi kiritilmadi!</div>';
}
elseif (!preg_match('/^[A-z0-9_\-\.]+$/ui',$name)){
$err='<div class="err">Jild nomi noto\'g\'ri kiritilgan. Ruxsat berilgan: A-z0-9-_.</div>';
}
if (!empty($err)){
err($err);
}else{
$newdir=dir_url('/'.verh2(verh2($d)).'/'.$name.'/');
if (ftp_rename($serv,$d,$newdir)) {
header('Location: /mgr/explode.php?d='.bon(verh2(verh2($d))));
} else {
err('<div class="err">Jildni nomini o\'zgartirib bo\'lmadi</div>');
}
}
}
echo '<div class="menu"><form method="post">Ismi (A-z0-9_-.):<br/><input type="text" name="name" value="'.basename($d).'"><br/><input class="btn btn-default" type="submit" name="ok" value="Jild nomini o\'zgartirish"></form></div>';
}
}
ftp_close($serv);
break;
case 'perenos':
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
$title='Jildni ko\'chirish "'.basename($d).'"';
include 'system/head.php';
title($title);
if(empty($d)){ 
header('Location: /mgr/explode.php');
}else{
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
if (isset($_POST['ok'])){
$put=prov($_POST['put']);
if (!empty($put)){
$put=dir_url('/'.$put.'/');
$verh=dir_url('/'.verh2(verh2($d)).'/');
}
if (empty($put)){
$err='<div class="err">Siz ko\'chirish uchun manzilni kiritmadingiz!</div>';
}
elseif (!preg_match('/^[A-z0-9_\-\/\.]+$/ui',$put)){
$err='<div class="err">Yo\'lda taqiqlangan belgilar mavjud. Ruxsat berilgan: A-z0-9_-./</div>';
}
//elseif ($put == $verh){
//$err='<div class="error">Данная папка и так находится в этой папке</div>';
//}
elseif (preg_match('#'.$d.'#sU',$put)){
$err='<div class="err">Jildni quyi jildiga ko\'chirish taqiqlanadi!</div>';
}
if (!empty($err)){
err($err);
}else{
$newdir=dir_url('/'.$put.'/'.basename($d).'/');
if (ftp_rename($serv,$d,$newdir)) {
header('Location: /mgr/explode.php?d='.bon(dir_url($put)));
} else {
err('<div class="err">Jildni ko‘chirib bo‘lmadi!</div>');
}
}
}
$value=dir_url('/'.verh2(verh2(verh2($d))).'/');
echo '<div class="menu"><form method="post">Ko\'chirish manzili (A-z0-9_-/.):<br/><input type="text" name="put" value="'.$value.'"><br/><input class="btn btn-default" type="submit" name="ok" value="Ko\'chirish"></form></div>';
}
}
ftp_close($serv);
break;
case 'inzip':
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
$title='Jildni arxivlash "'.basename($d).'"';
include 'system/head.php';
title($title);
if(empty($d)){ 
header('Location: /mgr/explode.php');
}else{
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
if (isset($_POST['ok'])){
$name=prov($_POST['name']);
if (empty($name)){
$err='<div class="err">Arxiv nomi kiritilmadi!</div>';
}
elseif (!preg_match('/^[A-z0-9_\-\.]+$/ui',$name)){
$err='<div class="err">Arxiv nomidan taqiqlangan belgilar mavjud. Ruxsat berilgan A-z0-9_-.</div>';
}
if (!empty($err)){
err($err);
}else{
mkdir($_SERVER['DOCUMENT_ROOT'].'/mgr/tmp/'.$savedir.'/archive');
inzip($serv, $d, $d);
include 'system/pclzip.php';
$zip=new PclZip('tmp/'.$savedir.'/'.$name.'.zip');
if ($zip->create('tmp/'.$savedir.'/archive', PCLZIP_OPT_REMOVE_PATH, 'tmp/'.$savedir.'/archive') != false) {
$kuda=dir_url('/'.verh2(verh2($d)).'/');
ftp_put($serv, $kuda.''.$name.'.zip','tmp/'.$savedir.'/'.$name.'.zip',FTP_BINARY);
deldir('tmp/'.$savedir.'/archive');
unlink('tmp/'.$savedir.'/'.$name.'.zip');
header('Location: /mgr/explode.php?d='.bon(verh2(verh2($d))));
}else{
err('<div class="err">Arxiv yaratishda xato!</div>');
}
}
}
echo '<div class="menu"><form method="post">Arxiv nomi (A-z0-9_-.):<br/><input type="text" name="name" value="'.basename($d).'">.zip<br/><input class="btn btn-default" type="submit" name="ok" value="Arxivlash"></form></div>';
}
}
ftp_close($serv);
break;
case 'info':
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
$title='Jild haqida ma\'lumot "'.basename($d).'"';
include 'system/head.php';
title($title);
if (empty($d)){
header('Location: /mgr/explode.php');
}else{
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
$global_size=0;
$global_size=get_ftp_size($serv, $d, $global_size);
echo '<div class="menu">Nomi: '.basename($d).'<br/>Hajmi: '.sizer($global_size).'<br/>Kirish huquqlari: '.chminf($serv, verh2($d)).''.(dirinf($serv, verh2($d), 'user') != false?'<br/>Egasi: '.dirinf($serv, verh2($d), 'user'):'').''.(dirinf($serv, verh2($d), 'group') != false?'<br/>Guruhi: '.dirinf($serv, verh2($d), 'group'):'').''.(dirinf($serv, verh2($d), 'date') != false?'<br/>Yaratilgan sanasi: '.dirinf($serv, verh2($d), 'date'):'').'</div>';
}
}
ftp_close($serv);
break;
case 'copy':
$d=dir_url('/'.boff(prov($_GET['d'])).'/');
$title='Jildni nusxalash "'.basename($d).'"';
include 'system/head.php';
title($title);
if (empty($d)){
header('Location: /mgr/explode.php');
}else{
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
if (isset($_POST['ok'])){
$put=prov($_POST['put']);
$type=intval($_POST['type']);
if (!empty($put)){
$put=dir_url('/'.$put.'/');
$verh=dir_url('/'.verh2(verh2($d)).'/');
}
if (empty($put)){
$err='<div class="err">Nusxalash yo\'li ko\'rsatilmagan!</div>';
}
elseif (!preg_match('/^[A-z0-9_\-\.\/]+$/ui',$put)){
$err='<div class="err">Nusxalash yo\'lida noqonuniy belgilar mavjud. Ruxsat berilgan: A-z0-9_-/.</div>';
}
//elseif ($put == $verh){
//$err='<div class="error">Данная папка и так находится в этой папке</div>';
//}
elseif (preg_match('#'.$d.'#sU',$put)){
$err='<div class="err">Jildni quyi jildiga nusxalash taqiqlangan!</div>';
}
elseif (ftp_chdir($serv, $put) == false){
$err='<div class="err">Katalog mavjud emas!</div>';
}
elseif ($type != '1' && $type != '2'){
$err='<div class="err">Nusxalash turi tanlanmagan!</div>';
}
if (!empty($err)){
err($err);
}else{
if ($type == 1){
$put=dir_url('/'.$put.'/'.basename($d).'/');
ftp_mkdir($serv, $put);
}else{
$put=$put;
}
mkdir($_SERVER['DOCUMENT_ROOT'].'/tmp/'.$savedir.'/archive');
inzip($serv, $d, $d);
dircopy($serv, $_SERVER['DOCUMENT_ROOT'].'/tmp/'.$savedir.'/archive', $put, $_SERVER['DOCUMENT_ROOT'].'/tmp/'.$savedir.'/archive');
deldir($_SERVER['DOCUMENT_ROOT'].'/tmp/'.$savedir.'/archive');
header('Location: /mgr/explode.php?d='.bon($put));
}
}
$value=dir_url('/'.verh2(verh2(verh2($d))).'/');;
echo '<div class="menu"><form method="post">Nusxalash uchun manzil (A-z0-9_-./):<br/><input type="text" name="put" value="'.$value.'"><br/>Nusxalash turi:<br/><input type="radio" name="type" value="1" checked="checked"> Faqat jild<br/><input type="radio" name="type" value="2"> Faqat tarkib<br/><br/><input class="btn btn-default" type="submit" name="ok" value="Nusxalash"></form></div>';
}
}
ftp_close($serv);
break;
}
if ($act){
echo '<div class="menu"><a href="/mgr/dir.php?d='.prov($_GET['d']).'">&laquo; Orqaga</a></div>';
}
include 'system/foot.php';
?>