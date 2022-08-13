<?php
// -1001383362542
$title = 'Yangiliklar';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");

$c_news = $connect->prepare("select count(`id`) from `news` where `id` = ?");
if (isset($_GET['del']) && $adm_id == 5) {
$c_news->execute(array($_GET['del']));
$num = $c_news->fetchColumn();
if ($num > 0) {
if (isset($_POST['ok'])) {
$stmt = $connect->prepare("delete from `news` where `id` = ?");
if ($stmt->execute(array($_GET['del']))) {
header ('location: /news');
} else {
echo '<div class="menu"><font color="red">Xatolik yuzaga keldi!</font></div>';
}
}
elseif (isset($_POST['cancel'])) {
header ('location: /news');
}
echo '<div class="menu"><form action="" method="post"><input class="btn btn-default" type="submit" name="ok" value="Удалить ('.val($_GET['del']).')"><input class="btn btn-default" type="submit" name="cancel" value="Отмена"></form></div>';
} else {
header ('location: /news');
}
}
$k_post = $count_news;
$k_page = k_page($k_post, 10);
$page = page($k_page);
$start = 10 * $page - 10;
if ($count_news == 0) {
echo '<div class="menu"><center><font color="red">Нет новостей.</font></center></div>';
} else {
$data = $connect->query("select * from `news` order by `id` desc limit ".$start.", 10")->fetchAll();
foreach ($data as $row) {
echo '<div class="title">'.$row['name'].' ('.vremja($row['time']).') '.($adm_id == 5 ? ' [<a href="?del='.$row['id'].'"><font color="aqua">O\'chirish</font></a>]' : '').'</div><div class="menu"><div class="st_1"></div><div class="st_2">'.nl2br(smiles(bb(bblinks($row['text'])))).'</div></div>';
}
if ($k_page > 1) str('/news?', $k_page, $page);

}
if ($adm_id == 5) {
echo '<div class="title"><b>Yangilik kiritish</b></div>';
if (isset($_POST['submit'])) {
$error = '';
if (empty($_POST['name'])) {
$error.= 'Yangilik mavzusini kiriting!<br/>';
}
elseif (mb_strlen($_POST['name']) < 5) {
$error.= '<font color="red">Mavzu matni kamida 5 ta belgidan iborat bo\'lishi kerak!</font><br/>';
}
if (empty($_POST['text'])) {
$error.= 'Yangilik matnini kiriting!<br/>';
}
elseif (mb_strlen($_POST['text']) < 10) {
$error.= 'Yangiliklar matni kamida 10 ta belgidan iborat bo\'lishi kerak!<br/>';
}
if ($error) {
echo '<div class="menu">'.$error.'</div>';
} else {
$stmt = $connect->prepare("insert into `news` set `name` = ?, `text` = ?, `time` = ?");
$sql = $connect->query("select * from `users`")->fetchAll();

foreach ($sql as $row) {
 $text='Assalom alaykum, '.$row['login'].' 
 Hostingimizda yangilik mavjud: 
  Mavzu: '.filteroff($_POST['name']).'
  Matn: '.filteroff($_POST['text']);
if (!empty($row['tg_id'])) {
    tgmsg($row['tg_id'], $text, '');
}
}
$textg='Assalomu alaykum xurmatli Fasthost.Uz azolari, hostingimizda yangilik! 
  Mavzu: '.filteroff($_POST['name']).'
  Matn: '.filteroff($_POST['text']);
    tg('-1001383362542', $textg);
if ($stmt->execute(array($_POST['name'], $_POST['text'], time()))) {
echo '<div class="menu">Yangilik qo\'shildi!</div><meta http-equiv="Refresh" content="1; "/>';
} else {
echo '<div class="menu">Xatolik yuzaga keldi!</div>';
}
}
}
echo '<form action="" method="post"><div class="menu">Mavzu:<br/><input type="text" name="name">';
include($_SERVER["DOCUMENT_ROOT"]."/inc/smiles_bb.php");
echo 'Matn:<br/><textarea name="text" rows="3" cols="20"></textarea><br/><input class="btn btn-default" type="submit" name="submit" value="Добавить"/></form></div>';
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>