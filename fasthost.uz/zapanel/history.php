<?
$title = 'Mablag\'lar harakati | Fasthost.Uz';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
echo '<div class="title"><b>Mablag\'lar harakati</b></div>';
echo '<div class="menu"><a href="?"><font color="yellow"><b>[Barcha operatsiyalar]</b></a> <a href="?sort=1"><font color="aqua"><b>[Foyda]</b></font></a> <a href="?sort=2"><font color="red"><b>[Harajat]</b></font></a></div>';
if ($_GET['sort']==1) {
    $xx1='1';
    $k_post = $connect->prepare("SELECT * FROM `logs_money` WHERE `id_user` = ? AND `type` = 'plus'");
}
if ($_GET['sort']==2) {
    $xx1='1';
    $k_post = $connect->prepare("SELECT * FROM `logs_money` WHERE `id_user` = ? AND `type` = 'minus'");
}
if (empty($xx1)) {
$k_post = $connect->prepare("SELECT * FROM `logs_money` WHERE `id_user` = ?");
}
$k_post->execute(array($user->id));
$k_post = $k_post->rowCount();
$k_page = k_page($k_post, 10);
$page = page($k_page);
$start = 10*$page-10;
if ($_GET['sort']==1) {
    $xx1='1';
    $q = $connect->prepare("SELECT * FROM `logs_money` WHERE `id_user` = ? AND `type` = 'plus' ORDER BY `time` DESC LIMIT $start, 10");
}
if ($_GET['sort']==2) {
    $xx1='1';
    $q = $connect->prepare("SELECT * FROM `logs_money` WHERE`id_user` = ? AND `type` = 'minus' ORDER BY `time` DESC LIMIT $start, 10");
}
if (empty($xx1)) {
$q = $connect->prepare("SELECT * FROM `logs_money` WHERE `id_user` = ? ORDER BY `time` DESC LIMIT $start, 10");
}
$q->execute(array($user->id));
if($q->rowCount()==0)
{
echo '<div class="menu">';
echo 'Bo\'sh!';
echo '</div>';
}
while ($f=$q->fetch(PDO::FETCH_LAZY))
{
echo '<div class="title"><b>Vaqt: '.vremja($f['time']).'</b></div>';
echo '<div class="menu">';

echo '<span style="color:#000000">Mablag\':</span> '.($f['type']=='plus' ? '<b><font color="aqua">+'.$f['count'].' ₱</font></b>' : '<b><font color="red">-'.$f['count'].' ₱</font></b>').'<br/><font color = "black">';
echo "Amal: ".nl2br(smiles(bb(bblinks($f['action']))))."";
echo '</div></font>';
}
if ($_GET['sort']) {$xz='sort='.$_GET['sort'];}else{$xz='';}
if ($k_page  > 1) str('/user/moneyhistory?'.$xz,$k_page, $page);
} else {
header('Location: /auth');}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>