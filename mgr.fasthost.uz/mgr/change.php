<?php
//-----Подключаем функции-----//
include 'system/func.php';
include 'system/ftp_connect.php';
$d=dir_url('/'.boff(prov(filteroff($_GET['d']))).'/');
ftp_pasv($serv, true);
$lines = ftp_rawlist($serv, "$d");
if (ftp_chdir($serv, $d) == false){
header('Location: /mgr/explode.php');
}else{
echo '<script>function check(form, name, checked){for(var i=0; i<form[name].length; i++){form[name][i].checked=checked;}}</script>';
if (isset($_POST['check']) && count($_POST['check']) < 2){
$title='Murakkab rejim';
include 'system/head.php';
title($title);
err('Tanlangan ob\'ektlar soni oz!'.$_POST['check']);
include 'system/foot.php';
exit();
}
if(!empty($_POST['check']) && !isset($_POST['action'])){
$title='Murakkab rejim';
include 'system/head.php';
title($title);
echo '<div class="menu"><form method="post">Jami tanlandi: <b>'.count($_POST['check']).'</b><br/>';
foreach($_POST['check'] as $val){
echo'<input type="hidden" name="check[]" value="'.$val.'">';
}
echo '<input type="radio" name="action" value="perenos" checked="checked"> Ko\'chirish<br/>
<input type="radio" name="action" value="del"> O\'chirish<br/>
<input type="radio" name="action" value="chmod"> Kirish huquqlari<br/>';
echo '<input class="btn btn-default" type="submit" name="ok" value="Tanlash"></form></div>';
}elseif (!empty($_POST['check']) && !empty($_POST['action'])){
if ($_POST['action'] == 'chmod'){
$title='Kirish huquqlari';
include 'system/head.php';
title($title);
if (isset($_POST['ok'])){
$chmod=intval($_POST['chmod']);
if (empty($chmod)){
$err='<div class="menu"><center><font color="red">Kirish huquqi kiritilmagan</font></center></div>';
}
elseif (!preg_match('#^([0-9]+){3}$#sU',$chmod) || !is_numeric($chmod) || strlen($chmod) != 3){
$err='<div class="menu"><center><font color="red">Kirish huquqi noto‘g‘ri kiritildi. Kiritish uchun misol: 777</font></center></div>';
}
if (!empty($err)){
err($err);
}else{
$array=$_POST['check'];
foreach($array as $val){
$chmd='CHMOD 0'.$chmod.' '.dir_url('/'.$d.'/'.$val);
ftp_site($serv,$chmd);
}
echo '<div class="menu"><center><font color="Aqua">Buyruq ishga tushdi!</font></center></div>';
}
}
echo '<div class="menu">Tanlandi: <b>'.count($_POST['check']).'</b><br/><br/><form method="post">';
foreach($_POST['check'] as $val){
if (ftp_size($serv, dir_url('/'.$d.'/'.$val)) == '-1'){
echo '<img src="/img/mgr/dir.gif" alt="*"> '.$val.'<br/>';
}else{
echo '<img src="/img/mgr/file.gif" alt="*"> '.$val.'<br/>';
}
echo'<input type="hidden" name="check[]" value="'.$val.'">';
}
echo'<input type="hidden" name="action" value="'.$_POST['action'].'">';
echo '<br/>Kirish huquqi:<br/>
<input type="text" name="chmod" maxlength="3" value="777"><br/>
<input class="btn btn-default" type="submit" name="ok" value="O\'zgartirish"></form></div>';
}elseif($_POST['action'] == 'perenos'){
$title='Ob\'ektlarni ko\'chirish';
include 'system/head.php';
title($title);
foreach($_POST['check'] as $dirz){
$outs.=(ftp_size($serv, dir_url('/'.$d.'/'.$dirz)) == '-1'?'<img src="/img/mgr/dir.gif" alt="*"> '.prov($dirz).'<br/>':'<img src="/img/mgr/file.gif" alt="*"> '.prov($dirz).'<br/>');
}
if (isset($_POST['ok'])){
$put=prov($_POST['put']);
if (!empty($put)){
$put=dir_url('/'.$put.'/');
$verh=dir_url('/'.verh2(verh2($d)).'/');
}
if (empty($put)){
$err='<div class="menu"><center><font color="red">Ko\'chirish uchun manzil kiritilmadi!</font></center></div>';
}
elseif (!preg_match('#^[A-z0-9_\-\/\.]+$#sU',$put)){
$err='<div class="menu"><center><font color="red">Noqonuniy belgilar aniqlandi. Ruxsat berilgan: A-z0-9_-/.</font></center></div>';
}
//elseif ($put == $verh){$err='<div class="error">Выбранные объекты, и так находятся в этой директории</div>';
//}
elseif (ftp_nlist($serv, $put) == false){
$err='<div class="menu"><center><font color="red">Katalog mavjud emas</font></center></div>';
}
if (!empty($err)){
err($err);
}else{
foreach($_POST['check'] as $name){
if (ftp_rename($serv, dir_url('/'.$d.'/'.$name), dir_url('/'.$put.'/'.$name))) {
}
}
echo '<div class="menu"><center><font color="Aqua">Ko‘chirish boshlandi!</font></center></div>';
}
}
echo '<div class="menu">Выбрано: <b>'.count($_POST['check']).'</b><br/><br/><form method="post">';
echo $outs;
foreach($_POST['check'] as $val){
echo '<input type="hidden" name="check[]" value="'.$val.'">';
}
$value=dir_url('/'.verh2(verh2(verh2($d))).'/');
echo '<input type="hidden" name="action" value="'.$_POST['action'].'"><br/>Ko\'chirish joyi:<br/><input type="text" name="put" value="'.$value.'"><br/><input class="btn btn-default" type="submit" name="ok" value="Saqlash"></form></div>';
}elseif($_POST['action'] == "del"){
$title='Ob\'ektlarni o\'chirish';
include 'system/head.php';
title($title);
echo '<div class="menu">Tanlandi: <b>'.count($_POST['check']).'</b><br/></div>';
echo '<div class="menu"><center><font color="Aqua"><b>O‘chirish boshlandi!</b></font></center><br/><br/></div><div class="main">';
foreach($_POST['check'] as $dirz){
if (ftp_size($serv, dir_url('/'.$d.'/'.$dirz)) == '-1'){
echo '<img src="/img/mgr/dir.gif" alt="*"> '.$dirz.'<br/>';
}else{
echo '<img src="/img/mgr/file.gif" alt="*"> '.$dirz.'<br/>';
}
}
foreach($_POST['check'] as $val){
$delete=dir_url('/'.$d.'/'.$val);
if (ftp_size($serv, $delete) == '-1'){
rdir($serv, $delete, $delete);
ftp_rmdir($serv, $delete);
}else{
ftp_delete($serv, $delete);
}
}
echo '</div>';
}
}elseif(!isset($_POST['check']) && !isset($_POST['action'])){
$title='Murakkab rejim';
include 'system/head.php';
title($title);
echo '<div class="menu"><form method="post">';
$cnt_dir=0;
for($i=0; $i<count($lines); $i++) {
  $name=preg_replace("~([^\s]*[\s]*){8}\s{1}(.*)~m","\\2",$lines[$i]);
if ($name != '.' && $name != '..' && !preg_match('/->/i',$name)){
if (ftp_size($serv, $d.'/'.$name) == '-1'){
echo '<input type="checkbox" name="check[]" value="'.$name.'"> <img src="/img/mgr/dir.gif" alt="*"> '.$name.'<br>';
$cnt_dir++;
 }
 }
 }
$cnt_files=0;
for($i=0; $i<count($lines); $i++){
$name=preg_replace("~([^\s]*[\s]*){8}\s{1}(.*)~m","\\2",$lines[$i]);
if ($name != '.' && $name != '..' && !preg_match('/->/i',$name)){
if (ftp_size($serv, $d.'/'.$name) != '-1'){
echo '<input type="checkbox" name="check[]" value="'.$name.'"> <img src="/img/mgr/file.gif" alt="*"> '.$name.' '.sizer(ftp_size($serv, $d.'/'.$name)).'<br/>';
$cnt_files++;
}
}
}
if ($cnt_files == 0 && $cnt_dir == 0){
echo '</div><div class="menu"><center><font color="red">Jild bo\'sh</font></center></div>';
include 'system/foot.php';
exit();
}
echo '<br/><input type="checkbox" value="check" onclick="check(this.form,\'check[]\',this.checked)"> Barchasini belgilash<br/><input class="btn btn-default" type="submit" name="ok" value="Tanlash"></form></div><div class="title">Jildlar: '.$cnt_dir.' / Fayllar: '.$cnt_files.'</div>';
 }
}
echo '<div class="menu">&laquo; <a href="/mgr/explode.php?d='.bon($d).'">Orqaga qaytish</a></div>';
include'system/foot.php';
?>