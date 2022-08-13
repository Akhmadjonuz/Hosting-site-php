<?php
//-----Подключаем функции-----//
include 'system/func.php';
include 'system/ftp_connect.php';
$d=dir_url('/'.boff(prov($_GET['d'])));
$title='Fayl liniyasini chiziqlar bo\'yicha tahrirlash "'.basename($d).'"';
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
$fi=ftprename($d);
$path=pathinfo($fi);
$rf=mb_strtolower($path['extension'],'UTF-8');
if ($rf != 'jpg' && $rf != 'jpeg' && $rf != 'jpe' && $rf != 'png' && $rf != 'gif' && $rf != 'bmp' && $rf != 'dll' && $rf != 'wav' && $rf != 'mid' && $rf != 'midi' && $rf != 'mp3' && $rf != 'mmf' && $rf != 'psd' && $rf != 'doc' && $rf != 'pdf' && $rf != 'zip' && $rf != 'rar' && $rf != 'jar' && $rf != '3gp' && $rf != 'avi' && $rf != 'mp4' && $rf != '7z' && $rf != 'tgz' && $rf != 'gz' && $rf != 'bz' && $rf != 'gz2' && $rf != 'bz2' && $rf != 'tbz' && $rf != 'tbz2' && $rf != 'tgz2' && $rf != 'tar' && $rf != 'ico'){
 if(!is_file('tmp/'.$savedir.'/'.$fi)){  
if (@!ftp_get($serv, 'tmp/'.$savedir.'/'.$fi, $d, FTP_BINARY)){
err('Faylni serverga yuklab bo\'lmadi');
include 'system/foot.php';
exit();
}
} 
switch($act){
default:
$file=file('tmp/'.$savedir.'/'.$fi);
$cnt=count($file);
echo '<div class="menu">';
if ($cnt > 0){
$total=intval(($cnt-1)/50)+1;
if (empty($page) OR $page < 1) $page=1;
elseif ($page > $total) $page=$total;
$start=$page*50-50;
for($i=$start; $i<($start+50); $i++){
$file[$i]=htmlspecialchars($file[$i]);
echo '<span id="'.($i+1).'">'.($i+1).'</span> <a href="/mgr/edit.php?act=edit&amp;d='.bon($d).'&amp;page='.$page.'&amp;str='.$i.'">'.$file[$i].'</a>';
echo ' <a href="/mgr/edit.php?act=newstr&amp;d='.bon($d).'&page='.$page.'&amp;str='.$i.'"><font color="red"><b>I</b></font></a> ';
echo ' <a href="/mgr/edit.php?act=delstr&amp;d='.bon($d).'&amp;page='.$page.'&amp;str='.$i.'"><font color="red"><b>X</b></font></a><br/>';
if ($i == ($cnt-1)) break;
}
}else{
echo '<a href="/mgr/edit.php?act=ob&amp;d='.bon($d).'"><font color="red"><b>l</b></font></a>';
}
echo'</div>';
navigator($cnt, $page, '50', $total, '/mgr/edit.php?d='.bon($d).'&amp;page=');
echo '<div class="title">Всего строк: '.$cnt.'</div>';
echo '<div class="menu"><a class="section" href="/mgr/file.php?d='.bon($d).'">&laquo; Orqaga</a></div>';
break;
case 'edit':
$file=file('tmp/'.$savedir.'/'.$fi);
if (empty($file[$str])){
header('Location: /mgr/edit.php?d='.bon($d));
}else{
if (isset($_POST['ok'])){
$cnt=count($file);
for($i=0; $i<$cnt; $i++){
if ($str == $i){
$fp=fopen('tmp/'.$savedir.'/'.$fi, "a+");
flock($fp, LOCK_EX);
ftruncate($fp, 0);
for($i=0; $i<sizeof($file); $i++){
if ($str != $i){
fputs($fp, $file[$i]);
}else{
fputs($fp, $_POST['text']."\r\n");
}
}
fflush($fp);
flock($fp, LOCK_UN);
fclose($fp);
}
}
if (ftp_put($serv, $d, 'tmp/'.$savedir.'/'.$fi, FTP_BINARY)){
header ('Location: /mgr/edit.php?d='.bon($d).'&page='.$page.'#'.$str);
}else{
err('Faylni saqlab bo\'lmadi!');
}
}
echo '<div class="menu">Chiziq: #'.($str+1).'<form method="post">Muharrir:<br/><textarea name="text" cols="80" rows="15" style="width: 93%">'.htmlspecialchars(trim($file[$str])).'</textarea><br/><input class="btn btn-default" type="submit" name="ok" value="Saqlash"></form></div>';
echo '<div class="menu">&laquo; <a href="/mgr/edit.php?d='.bon($d).'&amp;page='.$page.'#'.($str+1).'">Orqaga</a></div>';
}
 break;
case 'newstr':
$file=file('tmp/'.$savedir.'/'.$fi);
if (isset($_POST['ok'])){
$cnt=count($file);
$fp=fopen('tmp/'.$savedir.'/'.$fi,"a+");
if (!$cnt)$cnt='';
for ($i=0; $i<$cnt; $i++){
if($str == $i){
flock ($fp,LOCK_EX);
ftruncate($fp,0); 
for($i=0; $i<sizeof($file); $i++){
if ($str != $i){
fputs($fp,$file[$i]);
}else{
$bizname=$file[$i]; 
fputs($fp,$bizname.$_POST['text']."\r\n");
}
} 
fflush ($fp); flock($fp,LOCK_UN);
fclose($fp);
}
}
if (ftp_put($serv, $d, 'tmp/'.$savedir.'/'.$fi, FTP_BINARY)){
header('Location: /mgr/edit.php?d='.bon($d).'&page='.$page.'#'.$str);
}else{
err('Qator qo\'shib bo\'lmadi');
}
}
echo '<div class="menu">Yangi qator<form method="post">Qator: #'.($str+1).'<br/><textarea name="text" cols="80" rows="15" style="width: 93%"></textarea><br/><input class="btn btn-default" type="submit" name="ok" value="Joylashtirish"></form></div>';
echo '<div class="menu">&laquo; <a href="/mgr/edit.php?d='.bon($d).'&amp;page='.$page.'#'.$str.'">Orqaga</a></div>';
break;
case 'delstr':
$file=file('tmp/'.$savedir.'/'.$fi);
$fp=fopen('tmp/'.$savedir.'/'.$fi,"w");
flock ($fp,LOCK_EX); 
for ($i=0; $i< sizeof($file); $i++){ 
if ($str == $i){
unset($file[$i]);
}
} 
fputs($fp,implode($file)); 
flock ($fp,LOCK_UN); 
fclose($fp);  
if (ftp_put($serv, $d, 'tmp/'.$savedir.'/'.$fi, FTP_BINARY)){
header('Location: /mgr/edit.php?d='.bon($d).'&page='.$page.'#'.$str);
}else{
err('Qatorni o\'chirib bo\'lmadi!');
}
 break;
case 'ob':
if (isset($_POST['ok'])){
$fp=fopen('tmp/'.$savedir.'/'.$fi,"a+");
flock ($fp,LOCK_EX);
fputs($fp,"".$_POST['text']."\r\n");
flock ($fp,LOCK_UN);
fclose($fp);
if (ftp_put($serv, $d, 'tmp/'.$savedir.'/'.$fi, FTP_BINARY)){
header('Location: /mgr/edit.php?d='.bon($d).'&page='.$page.'#'.$str);
}else{
err('Qator qo\'shib bo\'lmadi!');
}
}
echo '<div class="menu">Yangi qator<form method="post">Qator: #1<br/><textarea name="text" cols="80" rows="15" style="width: 93%"></textarea><br/><input class="btn btn-default" type="submit" name="ok" value="Joylashtirish"></form></div>';
echo '<div class="menu">&laquo; <a href="/mgr/edit.php?d='.bon($d).'">Назад</a></div>';
 break;
case 'pstring':
if (isset($_POST['ok'])){
$stroka=intval(($_POST['str']-1)/50)+1;
$stk=intval($_POST['str']);
$file=file('tmp/'.$savedir.'/'.$fi);
$cnt=count($file);
$total=intval(($cnt-1)/50)+1;
if (empty($stroka) || $stroka < 1){
$stroka=1;
$stk=1;
}
elseif ($stroka > $total){
$stroka=$total;
$stk=$cnt;
}
header('Location: /mgr/edit.php?d='.bon($d).'&page='.$stroka.'#'.$stk);
}else{
header('Location: /mgr/edit.php?d='.bon($d));
}
 break;
}
unlink('tmp/'.$savedir.'/'.$fi);
}else{
err('Ushbu fayl formatini tahrirlab bo\'lmaydi!');
}
}
}
include 'system/foot.php';
?>