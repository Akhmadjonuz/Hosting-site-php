<?
$title = 'Admin | Mablag\'lar harakati';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if ($adm_id == 5) {
echo '<div class="title">Admin | Mablag\'lar harakati</div>';
echo '<div class="menu"><font color="yellow">[<a href="?"><font color="yellow"><b>Hammasi</b></font></a>]</font><font color="aqua"> [<a href="?sort=1"><font color="aqua"><b>Faqat +</b></font></a>]</font> <font color="red">[<a href="?sort=2"><font color="red"><b>Faqat -</a></b>]</font></font></div>';
if ($_GET['sort']==1) {
    $xx1='1';
    $k_post = $connect->query("SELECT * FROM `logs_money` WHERE `type` = 'plus'");
}
if ($_GET['sort']==2) {
    $xx1='1';
    $k_post = $connect->query("SELECT * FROM `logs_money` WHERE `type` = 'minus'");
}
if (empty($xx1)) {
$k_post = $connect->query("SELECT * FROM `logs_money`");
}
$k_post = $k_post->rowCount();
$k_page = k_page($k_post, 10);
$page = page($k_page);
$start = 10*$page-10;
if ($_GET['sort']==1) {
    $xx1='1';
    $q = $connect->query("SELECT * FROM `logs_money` WHERE `type` = 'plus' ORDER BY `time` DESC LIMIT $start, 10");
}
if ($_GET['sort']==2) {
    $xx1='1';
    $q = $connect->query("SELECT * FROM `logs_money` WHERE `type` = 'minus' ORDER BY `time` DESC LIMIT $start, 10");
}
if (empty($xx1)) {
$q = $connect->query("SELECT * FROM `logs_money` ORDER BY `time` DESC LIMIT $start, 10");
}
while($f = $q->fetch(PDO::FETCH_LAZY))
{
echo '<div class="title">';
echo '<a href="/adm/users/id/'.$f->id_user.'"><font color = "white">'.ulogin($f->id_user).' '.online($f->id_user).' ('.vremja($f->time).')</font></a></div><div class="menu">';
if ($f->type=='plus')$s='<b><font color="aqua">+'.$f->count.' ₱</font></b>';
else $s='<b><font color="red">-'.$f->count.' ₱</font></b>';
echo '<b>Miqdor</b>: '.$s.' <br/><b>Harakat</b>: '.nl2br(smiles(bb(bblinks($f->action)))).' ';
echo '</div>';
}
if ($_GET['sort']) {$xz='sort='.$_GET['sort'];}else{$xz='';}
if ($k_page  > 1) str('/adm/history?'.$xz, $k_page, $page);
echo '<div class="menu"><a href="/adm">&bull; Boshqaruv paneli</a></div>';
} else {
header ('location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>