<?php
$title = 'Master chat | Fasthost.Uz';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
$guest = $connect->prepare("insert into `guest` set `date` = ?, `user` = ?, `text` = ?");
echo '<div class="title"><b>Suxbat</b></div><div class="menu"><div class="butt2"><a href="/info/bb"><b>BB-kodlar</b></a> | <a  href="/info/sm"><b>Smayliklar</b></a></div></div>';
if ($user['activ'] == 2){
if (val($user['ban']) == 0) {
if (isset($_POST['refresh'])) {
header('location: /user/chat');
}
elseif (isset($_POST['text'])) {
$error = '';
if (empty($_POST['text'])) {
$error.= 'Xabarni kiriting!<br/>';
}
elseif (mb_strlen($_POST['text']) < 2) {
$error.= 'Matn kamida 2 ta belgidan iborat bo\'lishi kerak!<br/>';
}
elseif (mb_strlen($_POST['text']) > 1000) {
$error.= 'Matn 1000 belgidan oshmasligi kerak!<br/>';
}
elseif (isset($_SESSION['guest_add'])) {
if ($_SESSION['guest_add'] > time() - '5') {
$_SESSION['guest_add'] = time() + 10;
$error.= 'Antispam! 5 soniyani cheklandingiz! agar hanuzgacha spam bo\'lsa + 10 sek<br/>';
}
}
if ($error) {
echo '<div class="menu"><center><font color="red">'.$error.'</font></center></div>';
} else {
if ($guest->execute(array(time(), $user['login'], $_POST['text']))) {
$_SESSION['guest_add'] = time();
if ($js) {
    
}else{
header('Location: /user/chat');}
} else {
echo '<div class="menu"><center><font color="red">Xabar qo\'shishda xato!</font></center></div>';
}
}
}
include($_SERVER["DOCUMENT_ROOT"]."/inc/smiles_bb.php");
echo '<div class="menu"><form name="form" action="'.$ul.'" method="post"><b>Habar</b>:<br/><textarea name="text" id="mess_to_send" rows="3" cols="20">'.(isset($_GET['otv']) ? '[b]'.$_GET['otv'].'[/b], ' : '').'</textarea><br/><input class="btn btn-default" type="submit" value="Yozish"/><input class="btn btn-default" type="submit" name="refresh" value="Yangilash"></form></div>';
} else {
echo '<div class="menu"><center><font color="red">Siz bilan suhbatlashish huquqi yo\'q!</font></center></div>';
}
}else{
    echo '<div class="err">Siz bilan suhbatlashish huquqi yo\'q!</div>';
}
if ($user['admin'] == 5) {
if (isset($_GET['del'])) {
$stmt = $connect->prepare("select count(`id`) from `guest` where `id` = ?");
$stmt->execute(array($_GET['del']));
$num = $stmt->fetchColumn();
if ($num > 0) {
if (isset($_POST['yes'])) {
$stmt = $connect->prepare("delete from `guest` where `id` = ? limit 1");
$stmt->execute(array($_GET['del']));
header('Location: /user/chat?');
}
elseif (isset($_POST['no'])) {
header('Location: /user/chat?');
}

echo '<div class="menu"><form action="" method="post"><input class="btn btn-default" type="submit" name="yes" value="O\'chirish"/><input class="btn btn-default" type="submit" name="no" value="Bekor qilish"/></form></div>';
} else {
header('Location: /user/chat');
}
}
}

$k_post = $ch;
$k_page = k_page($k_post, 10); 
$page = page($k_page);
$start = 10 * $page - 10;

$sql = $connect->query("select * from `guest` order by `id` desc limit ".$start.", 10")->fetchAll();
if ($k_post == 0) {
echo '<div class="menu"><center><font color="red">Habarlar yo\'q!</font></center></div>';
} else {
$count = '';
foreach ($sql as $row) {
$count ++;
if ($adm_id == 5) {$s1='<a href="/adm/users/id/'.uid($row['user']).'">';$s2='</a>';}else{$s1='<a>';$s2='</a>';}
$sds=user(uid($row['user']));
if ($sds['admin'] >= 1) {$c1='adm';}else{$c1='user';}
echo '<div class="menu"><img src="/inc/style/img/'.$c1.'.png" alt="'.filter($row['user']).'"> '.$s1.' <font color="yellow"><b>'.filter($row['user']),' '.$s2.' '.online(uid($row['user'])).'<b><font>  ('.vremja($row['date']).') '.(($row['user'] != $user['login']) && $user['ban'] == 0 ? ' [<a href="?otv='.$row['user'].'"><font color="aqua"><b>Javob berish</b></font></a>]' : '').' '.(($adm_id == 5) ? '[<a href="?del='.$row['id'].'"><font color="red"><b>O\'chirish</b> </font></a>]' : '').'<div class="st_1"></div><div class="st_2">'.nl2br(smiles(bb(bblinks($row['text'])))).'</div></div>';
}
if ($k_page > 1) str('/user/chat?', $k_page, $page);
}


} else {header('Location: /auth');}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>