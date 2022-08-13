<?php
//-----Подключаем функции-----//
include 'system/func.php';
include 'system/ftp_connect.php';
$pad=dir_url('/'.prov(boff($_GET['arh'])));
$title='Arxivni ko\'rish"'.basename($pad).'"';
include 'system/head.php';
title($title);
 $fi=ftprename($pad);
ftp_pasv($serv,true);
$res = ftp_size($serv,$pad);
$d=prov($_GET['d']);
if(empty($d)){
$d=trim('tmp/'.$savedir.'/'.$fi);
}else{
$d=boff(prov($_GET['d']));
}
if ($res != -1) {
 if (ftp_get($serv, 'tmp/'.$savedir.'/'.$fi, $pad, FTP_BINARY)) {
 $path=pathinfo($pad);
if (!preg_match('/tmp\/(.*?)/i',$d)){
err('<div class="err">Xato. keyinroq urinib ko‘ring!</div>');
include 'system/foot.php';
exit();
}
if(!is_file($d)){
err('<div class="err">Fayl mavjud emas!</div>');
include 'system/foot.php';
exit();
}
$zip = new ZipArchive();
if($zip-> open ('tmp/'.$savedir.'/'.$fi) == TRUE){
switch($act){
default:
$array_size=array();
for($as=0; $as<$zip->numFiles; $as++){
$arhi=$zip->statIndex($as);
$array_size[$as]=$arhi['size'];
}
$archsize=array_sum($array_size);
echo '<div class="menu">Jami fayllar: '.$zip->numFiles.'<br/>';
echo 'Ochiqdan keyin hajmi: '.sizer($archsize).'</div><div class="menu">';
$cnt=$zip->numFiles;
if ($cnt > 0){
$total=intval(($cnt-1)/15)+1;
if (empty($page) OR $page < 1) $page=1;
elseif ($page > $total) $page=$total;
$start=$page*15-15;
for ($i=$start; $i <($start+15); $i++) {
$t = $zip-> statIndex($i);
if(preg_match('/\/$/',$t['name']))
echo '<img src="/img/mgr/dir.gif" alt="*"> <b>'.$t['name'].'</b><br/>';
else
echo '<img src="/img/mgr/file.gif" alt="*"> <a href="/mgr/zip.php?act=pre&amp;d='.bon(prov($d)).'&amp;arh='.prov($_GET['arh']).'&amp;page='.$page.'&amp;index='.$t['index'].'">'.$t['name'].'</a> ('.sizer($t['size']).')<br/>';
if ($i == ($cnt-1)) break;
}
echo '</div>';
navigator($cnt, $page, '15', $total, '/mgr/zip.php?arh='.bon($pad).'&amp;page=');
}else{
err('Arxiv bo\'sh');
}
echo '<div class="menu">&laquo; <a href="/mgr/explode.php?d='.bon(verh2($pad)).'">Orqaga</a></div>';
break;
case'pre':
if($info = $zip->statIndex(abs((int)$_GET['index']))){
$highlight=array('php','html','htm');
$astext=array('txt','css','ini','htaccess');
$type=substr($info['name'],strrpos($info['name'],'.')+1);
echo '<div class="menu">Fayl: '.$info['name'].'<br/>Formati: '.$type.'<br/>Hajmi: '.sizer($info['size']).'</div>';
if(in_array($type, $highlight)){
$code=highlight_string($zip->getFromIndex($info['index']), true);
$code=preg_replace('#<code>(.*)</code>#sU','\1',$code);
echo '<div class="menu">'.$code.'</div>';
}elseif(in_array($type, $astext)){
echo '<div class="menu">'.nl2br(htmlspecialchars($zip->getFromIndex($info['index']))).'</div>';
}else{
$code=highlight_string($zip->getFromIndex($info['index']), true);
$code=preg_replace('#<code>(.*)</code>#sU','\1',$code);
echo '<div class="menu">'.$code.'</div>';
}
}else{
err('<div class="err">Faylni yuklashda xato!</div>');
}
echo '<div class="menu">&laquo; <a href="/mgr/zip.php?arh='.bon($pad).'&amp;page='.$page.'">Orqaga</a></div>';
break;
}
$zip->close();
}else{
err('<div class="err">Arxivni ochishda xato!</div>');
}
@unlink('tmp/'.$savedir.'/'.$fi);
} else {
err('<div class="err">Faylni serverga yuklab bo\'lmadi!</div>');
}
}else{
header('Location: /mgr/explode.php');
}
ftp_close($serv);
include 'system/foot.php';
?>