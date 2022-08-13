<?php

//-----Подключаем функции-----//
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");

$maxupload='1153100320'; //Максимальный размер файла
@set_time_limit(5000);
session_name('ses');
session_start();
ob_start();
function int($val){
$view=str_replace('-','',(int)$val);
return $view;
}
function bon($code){
$view=base64_encode($code);
return $view;
}
function boff($code){
$view=base64_decode($code);
return $view;
}
function dechm($schm) {
 $n1=0; $n2=0; $n3=0; $ar=array(4,2,1);
 for ($chi=1;$chi<=3;$chi++) {if ($schm[$chi]<>"-") {$n1=$n1+$ar[$chi-1];}}
 for ($chi=4;$chi<=6;$chi++) {if ($schm[$chi]<>"-") {$n2=$n2+$ar[$chi-4];}}
 for ($chi=7;$chi<=9;$chi++) {if ($schm[$chi]<>"-") {$n3=$n3+$ar[$chi-7];}}
 return $n1.$n2.$n3;
}
function verh($url){
$view='';
$ex=explode('/',$url);
$cou=count($ex)-2;
for($i=0; $i<$cou; $i++){
if($cou-1==$i) $v=$ex[$i]; else $v=$ex[$i].'/'; 
$view.=$v;
}
return $view;
}
function verh2($url){
$view='';
$ex=explode('/',$url);
$cou=count($ex)-1;
for($i=0; $i<$cou; $i++){
if($cou-1==$i) $v=$ex[$i]; else $v=$ex[$i].'/'; 
$view.=$v;
}
return $view;
}
function dir_url($url){
$url=preg_replace('|([\/]+)|i','/',$url);
return $url;
}

function rdir($conn, $dir, $z){
ftp_chdir($conn, $dir);
ftp_chmod($conn, 0777, ".");
$arr=ftp_rawlist($conn, ".");
for($i=0; $i<count($arr); $i++){
$name=preg_replace("~([^\s]*[\s]*){8}\s{1}(.*)~m","\\2",$arr[$i]);
if ($name != '.' && $name != '..' && !preg_match('/->/i',$name)){
$chm=preg_replace("~([^\s]*).*~m","\\1",$arr[$i]);
if ($chm[0] == '-'){
$file=dir_url('/'.$dir.'/'.$name);
ftp_chmod($conn, 0777, $file);
ftp_delete($conn, $file);
}else{
$directory=dir_url('/'.$dir.'/'.$name.'/');
ftp_chmod($conn, 0777, $directory);
rdir($conn, $directory, $z);
ftp_rmdir($conn, $directory);
}
}
}
$dirka='/'.$dir;
if ($z == 'del'){
if (ftp_rmdir($conn, $dirka)){return true;}else{return false;}
}
elseif ($z == 'cl'){
if (ftp_chdir($conn, $dirka)){return true;}else{return false;}
}
}
function ftprename($url){
$view='';  
$ex=explode('/',$url);
$cou=count($ex)-1;
$view=$ex[$cou];
unset($ex);
return $view;   
}
function ftprename2($url){
$view='';
$ex=explode('/',$url);
$cou=count($ex);
for($i=0; $i<$cou; $i++){
if($cou-1==$i) $v=''; else $v=$ex[$i].'/';
$view.=$v;
}
return $view;
}
function sizer($size) {
    $arSizeName = array(" Bytes", " KB", " MB", " GB", " TB", " PB", " EB", " ZB", " YB");
    return $size ? round($size/pow(1024, ($i = floor(log($size, 1024)))), 2) . $arSizeName[$i] : '0 Bytes';
}
/*function sizer($s=0){
$e='byte';
if ($s>=1024){$s=round($s/1024 , 2); $e='kb';}
if ($s>=1024){$s=round($s/1024 , 2); $e='mb';}
if ($s>=1024){$r=round($s/1024 , 2); $e='gb';}
if ($s>=1024){$s=round($s/1024 , 2); $e='tb';}
return $s.' '.$e;
}*/
function inzip($conn, $dir, $dirs){
global $savedir;
$dir=dir_url('/'.$dir.'/');
ftp_chdir($conn, $dir);
$arr=ftp_rawlist($conn, "");
for($i=0; $i<count($arr); $i++){
$name=preg_replace("~([^\s]*[\s]*){8}\s{1}(.*)~m","\\2",$arr[$i]);
if ($name != '.' && $name != '..' && !preg_match('/->/i',$name)){
$chm=preg_replace("~([^\s]*).*~m","\\1",$arr[$i]);
if ($chm[0] != '-'){
$directory=dir_url('/'.$dir.'/'.$name);
$mkdir=str_replace($dirs,'',$directory);
$mkdir=dir_url('/'.$mkdir.'/');
mkdir($_SERVER['DOCUMENT_ROOT'].'/mgr/tmp/'.$savedir.'/archive'.$mkdir);
inzip($conn, $directory, $dirs);
}else{
$files=dir_url('/'.$dir.'/'.$name);
$mkfiles=str_replace($dirs,'',$files);
$mkfiles=dir_url('/'.$mkfiles);
ftp_get($conn, $_SERVER['DOCUMENT_ROOT'].'/mgr/tmp/'.$savedir.'/archive'.$mkfiles, $files, FTP_BINARY);
}
}
}
}
function deldir($directory){
$directory=preg_replace('|([\/]+)|i','/',$directory);
$dir=opendir($directory);
while($file=readdir($dir)){
if (is_file($directory.'/'.$file)){
unlink($directory.'/'.$file);
}
elseif (is_dir($directory.'/'.$file) && $file != '.' && $file != '..'){
deldir($directory.'/'.$file);
}
}
rmdir($directory);
}
function prov($str,$skol=false){
$str=htmlentities(trim($str), ENT_QUOTES, 'UTF-8');
$str=nl2br($str);
$str=strtr($str, array(
chr(0) => '',
chr(1) => '',
chr(2) => '',
chr(3) =>'',
chr(4) => '',
chr(5) => '',
chr(6) => '',
chr(7) => '',
chr(8) => '',
chr(9) => '',
chr(10) => '',
chr(11) => '',
chr(12) => '',
chr(13) => '',
chr(14) => '',
chr(15) => '',
chr(16) => '',
chr(17) => '',
chr(18) => '',
chr(19) => '',
chr(20) => '',
chr(21) => '',
chr(22) => '',
chr(23) => '',
chr(24) => '',
chr(25) => '',
chr(26) => '',
chr(27) => '',
chr(28) => '',
chr(29) => '',
chr(30) => '',
chr(31) => ''));
$str=str_replace("\'","&#39;",$str);
$str=str_replace('\\',"&#92;",$str);
$str=str_replace("|","I",$str);
$str=str_replace("||","I",$str);
$str=str_replace("/\\\$/","&#36;", $str);
if(!empty($skol)){$str=mb_substr($str,0,$skol,'UTF-8');}
return $str;
}
function title($title){
echo '<div class="title">'.$title.'</div>';
}
function err($err){
echo ''.$err.'';
}
function GetFileSize($file){
$array=get_headers($file);
foreach($array AS $key => $value){
if (preg_match('#Content-Length:#sU',$value)){
$res=$array[$key];
}
}
if (!empty($res)){
$size=explode(' ',$res);
return $size[1];
}else{
return '0';
}
}
function chminf($conn, $dir){
$array=ftp_rawlist($conn, verh2(dir_url('/'.$dir)));
for($chm=0; $chm<count($array); $chm++){
if (preg_match('#'.basename($dir).'#sU',$array[$chm])){
$chmod=preg_replace("~([^\s]*).*~m","\\1",$array[$chm]);
}
}
if (!empty($chmod)){
return dechm($chmod);
}else{
return 'error';
}
}
function get_ftp_size($ftp_handle, $dir, $global_size){
$file_list=ftp_rawlist($ftp_handle, $dir);
if (!empty($file_list)){
foreach($file_list as $file){
list($acc, $bloks, $group, $user, $size, $month, $day, $year, $file) = preg_split("/[\s]+/", $file);
if ($acc[0] == 'd' && $file != ".." && $file != "."){
$dir_new=dir_url('/'.$dir.'/'.$file.'/');
$global_size=get_ftp_size($ftp_handle, $dir_new, $global_size);
}else{
$global_size+=$size;
}
}
}
return $global_size;
}
function dirinf($conn, $dir, $inf){
$dirs=dir_url('/'.verh2($dir).'/');
ftp_chdir($conn, $dirs);
$arr=ftp_rawlist($conn, ".");
if ($arr != false){
foreach($arr AS $file){
list($chm, $bloks, $group, $user, $size, $m, $d, $y, $file)=preg_split("/[\s]+/",$file);
if (preg_match('#'.basename($dir).'#sU',$file)){
if ($inf == 'group'){
$ret=prov($group);
}
elseif ($inf == 'user'){
$ret=prov($user);
}
elseif ($inf == 'date'){
$month=array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
$month_r=array('Января', 'Февраля', 'Марта', 'Апреля', 'Мая', 'Июня', 'Июля', 'Августа', 'Сентября', 'Октября', 'Ноября', 'Декабря');
$m=str_replace($month,$month_r,$m);
$ret=prov($d.' '.$m.' '.$y);
}
}
}
}
return $ret;
}
function dircopy($conn, $dir, $put, $dirs){
$dir=dir_url('/'.$dir.'/');
$put=dir_url('/'.$put.'/');
$open=opendir($dir);
while($name=readdir($open)){
if (is_dir(dir_url('/'.$dir.'/'.$name.'/')) && $name != '.' && $name != '..'){
$directory=dir_url('/'.$dir.'/'.$name.'/');
$mkdir=str_replace($dirs,'',$directory);
$mkdir=dir_url('/'.$mkdir.'/');
ftp_mkdir($conn, $put.''.$mkdir);
dircopy($conn, $directory, $put, $dirs);
}
elseif (is_file(dir_url('/'.$dir.'/'.$name))){
$files=dir_url('/'.$dir.'/'.$name);
$mkfiles=str_replace($dirs,'',$files);
$mkfiles=dir_url('/'.$mkfiles);
ftp_put($conn, $put.''.$mkfiles, $files, FTP_BINARY);
}
}
}
function navigator($cnt, $page, $str, $total, $url){
if ($cnt > $str){
if (empty($page) || $page < 1) $page=1;
if ($page > $total) $page=$total;
if ($page-4 > 0){$a='<a href="'.$url.'1">1</a> ... ';}
if ($page-3 > 0){$b='<a href="'.$url.''.($page-3).'">'.($page-3).'</a>';}
if ($page-2 > 0){$c='<a href="'.$url.''.($page-2).'">'.($page-2).'</a>';}
if ($page-1 > 0){$d='<a href="'.$url.''.($page-1).'">'.($page-1).'</a>';}
if ($page+1 <= $total){$e='<a href="'.$url.''.($page+1).'">'.($page+1).'</a>';}
if ($page+2 <= $total){$f='<a href="'.$url.''.($page+2).'">'.($page+2).'</a>';}
if ($page+3 <= $total){$g='<a href="'.$url.''.($page+3).'">'.($page+3).'</a>';}
if ($page+4 <= $total){$h='... <a href="'.$url.''.$total.'">'.$total.'</a>';}
echo '<div class="menu">Стр: '.$a.' '.$b.' '.$c.' '.$d.' <span class="page_selected">'.$page.'</span> '.$e.' '.$f.' '.$g.' '.$h.'</div>';
}
}
function slv($str,$msg1,$msg2,$msg3){
$str = (int)$str;
$str1 = abs($str) % 100;
$str2 = $str % 10;
if ($str1 > 10 && $str1 < 20) return $str.' '.$msg3;
if ($str2 > 1 && $str2 < 5) return $str.' '.$msg2;
if ($str2 == 1) return $str.' '.$msg1;
return $str.' '.$msg3;
}
function MyTime($times=NULL){
$time=time();
if (($time-$times) <= 60){
$timesp=slv((($time-$times)),'sekund','soniyalar','soniya').' orqaga';
return $timesp;
}elseif (($time-$times) <= 3600){
$timesp=slv((($time-$times)/60),'daqiqa','daqiqalar','minut').' orqaga';
return $timesp;
}else{
$today=date('j M Y',$time);
$yesterday=date('j M Y',strtotime('-1 day'));
$timesp=date('j M Y в H:i',$times);
$timesp=str_replace($today,'Сегодня',$timesp);
$timesp=str_replace($yesterday,'Вчера',$timesp);
$timesp=strtr($timesp, array('Jan' => 'Янв', 'Feb' => 'Фев', 'Mar' => 'Марта', 'May' => 'Мая', 'Apr' => 'Апр', 'Jun' => 'Июня', 'Jul' => 'Июля', 'Aug' => 'Авг', 'Sep' => 'Сент', 'Oct' => 'Окт', 'Nov' => 'Ноября', 'Dec' => 'Дек'));
return $timesp;
}
}
function check($text, $brl=false){
$text=htmlspecialchars(trim($text));
if($brl) $text=nl2br($text);
$text=strtr($text,array("\r"=>' ',"\n"=>' '));
return $text;
}
if (isset($_SERVER['HTTP_REFERER']) && !strpos($_SERVER['HTTP_REFERER'], $_SERVER['HTTP_HOST']) && $_SERVER['PHP_SELF'] != '/index.php'){
$title='Стоп!';
include $_SERVER['DOCUMENT_ROOT'].'/system/head.php';
title($title);
echo '<div class="error">Siz saytga noma\'lum manbadan tashrif buyurgansiz. Saytingiz xavfsizligi uchun quyidagi manzilga o\'ting<a href="/?">Bosh menyu</a></div>';
include $_SERVER['DOCUMENT_ROOT'].'/system/foot.php';
exit();
}
$act=(isset($_GET['act'])?$act=prov($_GET['act']):'');
$page=abs(intval($_GET['page']));
$str=abs(intval($_GET['str']));
$id=abs(intval($_GET['id']));

######### Get File Type Function ################# 
function getfiletype($filename) { 
    if(strpos($filename, ".")) { 
        $fname = explode(".", $filename); 
        $filetype = trim($fname[count($fname)-1]); 
    } else { 
        $filetype = "unknown"; // если нет точки в имени, тип = unknown 
    } 
return $filetype; 
} 
######### End of Get File Type Function ########## 
?>