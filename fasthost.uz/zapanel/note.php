<?php
$title = 'Bildirishnomalar | Fasthost.Uz';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {

$note = $connect->query("select count(`id`) from `note` where `id_user` = '$user->id'")->fetchColumn();
$k_post = $note;
$k_page = k_page($k_post, 10);
$page = page($k_page);
$start = 10 * $page - 10;
if ($note == 0) {
echo '<div class="menu"><center><font color="red">Bildirishnomalar mavjud emas !</font></center></div>';
} else {
$data = $connect->query("select * from `note` where `id_user` = '$user->id' order by `id` desc limit ".$start.", 10")->fetchAll();
foreach ($data as $row) {
    if ($row['readmsg']==0) {$newn='<font color=Yellow>Yangi</font>';}else{$newn='';}
echo '<div class="menu"><img src="/img/sys.png" alt="'.$row['name'].'"> <a>'.$row['name'].'</a> ('.vremja($row['time']).') '.$newn.'<div class="st_1"></div><div class="st_2">'.nl2br(smiles(bb(bblinks($row['text'])))).'</div></div>';

$connect->query("UPDATE `note` SET `readmsg` = '1' WHERE `id` = '".$row['id']."'");    
}
if ($k_page > 1) str('/user/inor?',$k_page, $page);
}

} else {
header('Location: /auth');}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
 ?>