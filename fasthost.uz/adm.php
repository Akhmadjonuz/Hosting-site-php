<?php
$title = 'Boshqaruv paneli | Fasthost.Uz';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) && $adm_id == 5) {
switch ($act) {
default:
    //tg('243010971', 'salom');
    $q11 = $connect->query("SELECT COUNT(*) FROM `orders_hosting`")->fetchColumn();
    $q1 = $connect->query("SELECT COUNT(*) FROM `users` WHERE `activ` = '2'")->fetchColumn();
    $q12 = $connect->query("SELECT COUNT(*) FROM `users` WHERE `error` = '2'")->fetchColumn();
    $q2 = $connect->query("SELECT COUNT(*) FROM `users` WHERE `activ` = '1'")->fetchColumn();
    $q3 = $connect->query("SELECT COUNT(*) FROM `users` WHERE `activ` = '3'")->fetchColumn();
    $q4 = $connect->query("SELECT COUNT(*) FROM `users` WHERE `activ` = '4'")->fetchColumn();
    $q5 = $connect->query("SELECT sum(count) FROM `logs_money` WHERE `type` = 'plus'")->fetchColumn();
    $q6 = $connect->query("SELECT sum(count) FROM `logs_money` WHERE `type` = 'minus'")->fetchColumn();
    $q55 = $connect->query("SELECT sum(count) FROM `logs_money` WHERE `type` = 'plus' AND `time` > ".mktime(0, 0, 0)."")->fetchColumn();
    $q66 = $connect->query("SELECT sum(count) FROM `logs_money` WHERE `type` = 'minus' AND `time` > ".mktime(0, 0, 0)."")->fetchColumn();
    $q7 = $connect->query("SELECT COUNT(*) FROM `logs_money` ")->fetchColumn();
    $q8 = $connect->query("SELECT COUNT(*) FROM `tickets` ")->fetchColumn();
    $q9 = $connect->query("SELECT COUNT(*) FROM `tarifs_hosting` WHERE `activ`='1'")->fetchColumn();
    $allon=$count_online_user + $count_online_guest;
    $stmt_day = $connect->prepare("select count(distinct `uid`) from `authlog` where `lasttime` > :time");
$stmt_day->bindValue(':time', mktime(0, 0, 0), PDO::PARAM_INT);
$stmt_day->execute();
$count_day_user = $stmt_day->fetchColumn();
echo '<div class="title">Assalom alaykum, <b><font color="yellow">'.$user->login.'!</b></font></div>';
echo '<div class="menu">Tarmoqda: <font color="aqua">['.$allon.'] ('.$count_online_user.'/'.$count_online_guest.')</font><br/>
Bugungi yangi hisoblar: <font color="aqua">'.$count_users_new.'</font> ta<br/>
Bugun keldi: <font color="aqua">['.$count_day_user.']</font> <br/>
Faol balans: <font color="aqua">'.($cbm ? $cbm : '0.00').'</font> So\'m</div><div class="menu">
Xatolar: <font color="red">['.$q12.']</font><br/>
Faol hisoblar: <font color="aqua">['.$q1.']</font><br/>
Faollashtirilmagan hisoblar: <font color="red">['.$q2.']</font><br/>
O\'chirilgan: <font color="aqua">['.$q3.']</font><br/>
Blocklangan: <font color="aqua">['.$q4.']</font></div><div class="menu">
Bugun to\'ldirildi: <font color="aqua">'.($q55 ? $q55 : '0.00').'</font> So\'m<br/>
Bugun yechib olindi: <font color="aqua">'.($q66 ? $q66 : '0.00').'</font> So\'m<br/>
Barcha hisobni to\'dirganlar: <font color="aqua">'.($q5 ? $q5 : '0.00').'</font> So\'m<br/>
Barcha yechib olinganlar: <font color="aqua">'.($q6 ? $q6 : '0.00').'</font> So\'m</div>';
echo '<div class="title">Adminstrator boshqaruvi!</b></div>';
echo '<div class="menu">&bull;<a href="/adm/users/sms"> Berilgan foydalanuvchiga habar jo\'natish</a></div>';
echo '<div class="menu">&bull;<a href="/adm/users/online"> Tarmoqdagi foydalanuvchilar </a><font color="aqua">['.$count_online_user.']</font></div>';
echo '<div class="menu">&bull;<a href="/adm/info"> Foydalanuvchilar </a><font color="aqua">['.$count_users.']</font></div>';
echo '<div class="menu">&bull;<a href="/adm/users"> Foydalanuvchilarni qidirish</a></div>';
echo '<div class="menu">&bull;<a href="/adm/users/allsms"> Barcha foydalanuvchilarga habar jo\'natish</a></div>';
echo '<div class="menu">&bull;<a href="/adm/style"> Logotipni sozlash</a></div>';
echo '<div class="menu">&bull;<a href="/adm/money"> Foydalanuvchi hisobini to\'ldirish</a></div>';
echo '<div class="menu">&bull;<a href="/adm/moneyback"> Foydalanuvchi hisobidan yechib olish</a></div>';
echo '<div class="menu">&bull;<a href="/adm/history"> Hisoblarni to\'ldirish tarixi </a><font color="aqua">['.$q7.']</font></div>';
echo '<div class="menu">&bull;<a href="/adm/tarifs"> Tariflar </a><font color="aqua">['.$q9.']</font></div>';
break;
case 'style':
echo '<div class="title">Logotipni yuklash</div>';
if (isset($_POST['logo'])) {
$err = '';
$size = $_FILES['filename']['size'];
$filetype = array('jpg', 'gif', 'png', 'jpeg', 'ico'); 
$upfiletype = substr($_FILES['filename']['name'],  strrpos( $_FILES['filename']['name'], ".")+1); 
if (!@file_exists($_FILES['filename']['tmp_name'])) {
$err.= 'Siz faylni tanlamadingiz!<br/>';
}
elseif (!in_array($upfiletype,$filetype)) {
$err.= 'Kechirasiz bu taqiqlangan format!<br/>';
}
if ($size > 204800) {
$err.= 'Faylning maksimal hajmi - 25 Kb!<br/>';
}
if ($err) {
echo '<div class="menu">'.$err.'</div>';
} else {
$files = 'logo.png'; 
move_uploaded_file($_FILES['filename']['tmp_name'], $_SERVER["DOCUMENT_ROOT"]."/img/".$files); 
echo '<div class="menu">Logotip yuklandi!</div><meta http-equiv="Refresh" content="1; "/>';
}
}
echo '<div class="menu"><form method="post" enctype="multipart/form-data" name="message">Faylni tanlash:<br/><input type="file" name="filename"><br /><input type="submit" name="logo" value="Загрузить"></div>';
echo '<div class="title">Faviconni yuklash</div>';
if (isset($_POST['favicon'])) {
$err = '';
$size = $_FILES['filename2']['size'];
$filetype = array('jpg', 'gif', 'png', 'jpeg', 'ico'); 
$upfiletype = substr($_FILES['filename2']['name'],  strrpos( $_FILES['filename2']['name'], ".")+1); 
if (!@file_exists($_FILES['filename2']['tmp_name'])) {
$err.= 'Siz faylni tanlamadingiz!<br/>';
}
elseif (!in_array($upfiletype,$filetype)) {
$err.= 'Kechirasiz bu taqiqlangan fayl!<br/>';
}
if ($size > 16384) {
$err.= 'Faylning maksimal hajmi - 2 Mb!<br/>';
}
if ($err) {
echo '<div class="menu">'.$err.'</div>';
} else {
$files = 'favicon.ico'; 
move_uploaded_file($_FILES['filename2']['tmp_name'], $_SERVER["DOCUMENT_ROOT"]."/".$files); 
echo '<div class="menu">Iconka yuklandi!</div><meta http-equiv="Refresh" content="1; "/>';
}
}
echo '<div class="menu"><form method="post" enctype="multipart/form-data" name="message">Faylni tanlash:<br/><input type="file" name="filename2"><br /><input type="submit" name="favicon" value="Загрузить"></div>';
for ($i = 1; $i <= count(glob('img/smiles/*.gif')); $i++) {
$name = $i + 1;
}
echo '<div class="title">Yangi smaylik yuklash</div>';
if (isset($_POST['smile'])) {
$err = '';
$size = $_FILES['filename3']['size'];
$filetype = array('jpg', 'gif', 'png', 'jpeg', 'ico'); 
$upfiletype = substr($_FILES['filename3']['name'],  strrpos( $_FILES['filename3']['name'], ".")+1); 
if (!@file_exists($_FILES['filename3']['tmp_name'])) {
$err.= 'siz fayl tanlamadingiz!<br/>';
}
elseif (!in_array($upfiletype,$filetype)) {
$err.= 'Kechirasiz bu taqiqlangan format!<br/>';
}
if ($size > 40960) {
$err.= 'Faylning en yuqori hajmi- 5 Kb!<br/>';
}
if ($err) {
echo '<div class="menu">'.$err.'</div>';
} else {
$files = $name.'.gif'; 
move_uploaded_file($_FILES['filename3']['tmp_name'], $_SERVER["DOCUMENT_ROOT"]."/img/smiles/".$files); 
echo '<div class="menu">Smaylik yuklandi!</div><meta http-equiv="Refresh" content="1; "/>';
}
}
echo '<div class="menu"><form method="post" enctype="multipart/form-data" name="message">Faylni tanlash:<br/><input type="file" name="filename3"><br /><input class="btn btn-default" type="submit" name="smile" value="Загрузить"></div>';
echo '<div class="menu">&bull;<a href="/adm"> Orqaga</a></div>';
break;
case 'info':
echo '<div class="title">Turli xil</div>';
echo '<div class="menu"><div class="butt2">[<a href="?ac=1">Hammasi</a>] [<a href="?ac=2">Faollar</a>] [<a href="?ac=3">O\'chirilgan</a>] [<a href="?ac=4">Blocklangan</a>] [<a href="?ac=5">Adminstratorlar</a>]  [<a href="?ac=6">Pul</a>] [<a href="?ac=7">Xato</a>]</div></div>';
echo '<div class="title">Foydalanuvchilar</div>';
$num_u = $connect->prepare("select count(`id`) from `users` where `id` = ?");
$strow = $connect->prepare("select * from `users` where `id` = ?");
if (isset($_GET['lred'])) {
    $s1=uid($_GET['lred'],$connect);
    header('Location: /adm/users/id/'.$s1.'');
}
if (isset($_GET['ban'])) {
$num_u->execute(array($_GET['ban']));
$num = $num_u->fetchColumn();
if ($num > 0) {
$strow->execute(array($_GET['ban']));
$row = $strow->fetch(PDO::FETCH_LAZY);
if (isset($_POST['yes'])) {
$val = ($row['ban'] == 1) ? '0' : '1';
$stmt = $connect->prepare("update `users` set `ban` = ? where `id` = ? limit 1");
if ($stmt->execute(array($val, $_GET['ban']))) {
header('Location: /adm/info');
} else {
echo '<div class="menu">Xatolik yuzaga keldi!</div>';
}
}
elseif (isset($_POST['no'])) {
header('Location: /adm/info');
}

echo '<div class="menu">
<form action="" method="post"><input class="btn btn-default" type="submit" name="yes" value="'.($row['ban'] == 1 ? 'Разбанить в чате' : 'Забанить в чате').' ('.val($_GET['ban']).')"/> 
<input class="btn btn-default" type="submit" name="no" value="Отмена"/></form></div>';
} else {
header('Location: /adm/info');
}
}
elseif (isset($_GET['red'])) {
$num_u->execute(array($_GET['red']));
$num = $num_u->fetchColumn();
if ($num > 0) {
$strow->execute(array($_GET['red']));
$row = $strow->fetch(PDO::FETCH_LAZY);
if (isset($_POST['cancel'])) {
header ('location: /adm/info');
exit();
}
if (isset($_POST['red'])) {
$err = '';
if (empty($_POST['login'])) {
$err.= 'Loginni kiriting!';
}
if (empty($_POST['wmr'])) {
$err.= 'Aktivatsiya kodini kiriting!';
}
if (empty($_POST['email'])) {
$err.= 'Введите e-mail!';
}
if ($err) {
echo '<div class="menu">'.$err.'</div>';
} else {
$stmt = $connect->prepare("update `users` set `login` = ?, `wmr` = ?, `email` = ? where `id` = ?");
if ($stmt->execute(array($_POST['login'], $_POST['wmr'], $_POST['email'], $_POST['id']))) {
header ('location: /adm/info');
} else {
echo '<div class="menu">Xatolik yuzaga keldi!</div>';
}
}
}
echo '<div class="menu"><form action="" method="post">Login:<br/><input type="text" name="login" value="'.filter($row['login']).'"><br/>Faollashtirish kodi:<br/><input type="text" name="wmr" value="'.$row['wmr'].'"><br/>Pochta:<br/><input type="text" name="email" value="'.filter($row['email']).'"><br/><input type="text" name="id" value="'.$_GET['red'].'"><input class="btn btn-default" type="submit" name="red" value="Saqlash ('.val($_GET['red']).')"><input class="btn btn-default" type="submit" name="cancel" value="Bekor qilish"></form></div>';
} else {
header ('location: /adm/info');
}
}
elseif (isset($_GET['del'])) {
$num_u->execute(array($_GET['del']));
$num = $num_u->fetchColumn();
if ($num > 0) {
if (isset($_POST['yes'])) {
$stmt = $connect->prepare("delete from `users` where `id` = ? limit 1");
$stmt2 = $connect->prepare("delete from `mail` where `who` = ? or `user` = ?");
if ($stmt->execute(array($_GET['del'])) && $stmt2->execute(array($_GET['del'], $_GET['del']))) {
header('Location: /adm/info');
} else {
echo '<div class="menu">Xatolik yuzaga keldi!</div>';
}
}
elseif (isset($_POST['no'])) {
header('Location: /adm/info');
}

echo '<div class="menu">
<form action="" method="post"><input class="btn btn-default" type="submit" name="yes" value="O\'chirish ('.val($_GET['del']).')"/> 
<input class="btn btn-default" type="submit" name="no" value="Bekor qilish"/></form></div>';
} else {
header('Location: /adm/info');
}
}
if (isset($_GET['ac'])) {
    if ($_GET['ac'] == 5) {
        $k_post = $connect->query("select count(`id`) from `users` where `admin` >= '1'")->fetchColumn();
    }elseif ($_GET['ac'] == 6) {
        $k_post = $connect->query("select count(`id`) from `users` ")->fetchColumn();
    }elseif($_GET['ac'] == 7){
        $k_post = $connect->query("select count(`id`) from `users` where `error` = '2'")->fetchColumn();
    }else{
    $k_post = $connect->query("select count(`id`) from `users` where `activ` = '".val($_GET['ac'], 1)."'")->fetchColumn(); }
}else{
$k_post = $connect->query("select count(`id`) from `users`")->fetchColumn(); }
$k_page = k_page($k_post, 10); 
$page = page($k_page); 
$start = 10 * $page - 10;
if (isset($_GET['ac'])) {
    $un='ac='.val($_GET['ac'], 1);
    if ($_GET['ac'] == 5) {
       $sql = $connect->query("select * from `users` where `admin` >= '1' order by `id` desc limit ".$start.", 10")->fetchAll(); 
    }elseif ($_GET['ac'] == 6) {
        $sql = $connect->query("select * from `users` order by `money` desc limit ".$start.", 10")->fetchAll();
    }elseif($_GET['ac'] == 7){
        $sql = $connect->query("select * from `users` where `error` = '2' order by `money` desc limit ".$start.", 10")->fetchAll();
        }else{
    $sql = $connect->query("select * from `users` where `activ` = '".val($_GET['ac'], 1)."' order by `id` desc limit ".$start.", 10")->fetchAll(); }
}	else {	
    $un='';
    // where `error` = '2'
$sql = $connect->query("select * from `users` order by `id` desc limit ".$start.", 10")->fetchAll();
}
if ($k_post == 0) {
echo '<div class="menu"><center>NONE</center></div>';
} else {
foreach ($sql as $row) {

if ($row['id']==1) {$c1='adm';}else{$c1='user';}
echo '<div class="menu"><img src="/inc/style/img/'.$c1.'.png" alt="'.filter($row['login']).'"><a href="/adm/users/id/'.$row['id'].'"> '.filter($row['login']).'</a> '.online($row['id']).' (ID:'.$row['id'].')  <div class="st_1"></div><div class="st_2"> E-mail: '.filter($row['email']).'<br/> Код активатция: '.$row['wmr'].'<br/> Баланс: '.$row['money'].'</font> So\'m.<br/> Дата регистрации: '.vremja($row['datereg']).'</div></div>';
}
if ($k_page > 1) str('/adm/info?'.$un,$k_page, $page);
}
echo '<div class="menu">&bull;<a href="/adm"> Orqaga</a></div>';
break;
case 'money':
echo '<div class="title">Hisobni to\'ldirish | Fasthost.Uz</div>';
$error = '';
if (isset($_POST['col']) && isset($_POST['login'])) {
if (empty($_POST['col'])) {
$error.= 'Summani kiriting!<br/>';
}
elseif (!is_numeric($_POST['col'])) {
$error.= 'Noto‘g‘ri miqdor kiritildi!<br/>';
}
$stnum = $connect->prepare("select count(`id`) from `users` where `login` = ?");
$stnum->execute(array($_POST['login']));
$num = $stnum->fetchColumn();
if (empty($_POST['login'])) {
$error.= 'Qabul qiluvchi loginini kiriting!<br/>';
}
elseif ($num == 0) {
$error.= 'Kechirasiz, bunday login tizimimizda topilmadi!<br/>';
}
if ($error) {
echo '<div class="menu">'.$error.'</div>';
} else {
$stmt = $connect->prepare("update `users` set `money` = `money` + ? where `login` = ?");
$stmte = $connect->prepare("INSERT INTO `logs_money` SET `id_user` = ?, `type` = 'plus', `count` = ?, `action` = ?, `time` = ?");
if (empty($_POST['text'])) {
$zaz='Hisobingiz to\'ldirildi, Adminstrator ('.$user['login'].')';
}else{
$zaz=$_POST['text'];}
$time=time();
if ($stmt->execute(array($_POST['col'], $_POST['login'])) && $stmte->execute(array(uid($_POST['login'],$connect),$_POST['col'],$zaz,$time))){
echo '<div class="menu">Mablag\' muvaffaqiyatli jo\'natildi '.val($_POST['col'], 1).' rubl foydalanuvchi '.$_POST['login'].'!</div><meta http-equiv="Refresh" content="2; "/>';
} else {
echo '<div class="menu">Mablag\'ni hisoblashda xato!</div>';
}
}
}
echo '<div class="menu"><form action="" method="post">
Mablag\'<br/><input type="text" name="col" maxlength="10"/><br/>Foydalanuvchi:<br/><input type="text" name="login" maxlength="15"/><br/>Matn(Caption):<br/><input type="text" name="text" maxlength="50"/><br/><input class="btn btn-default" type="submit" value="Jo\'natish"/></form></div>';
echo '<div class="menu">&bull;<a href="/adm"> Orqaga</a></div>';
break;
case 'moneyback':
echo '<div class="title">Hisobdan yechish | Fasthost.Uz</div>';
$error = '';
if (isset($_POST['col']) && isset($_POST['login'])) {
if (empty($_POST['col'])) {
$error.= 'Summani kiriting!<br/>';
}
elseif (!is_numeric($_POST['col'])) {
$error.= 'Noto‘g‘ri miqdor kiritildi!<br/>';
}
$stnum = $connect->prepare("select count(`id`) from `users` where `login` = ?");
$stnum->execute(array($_POST['login']));
$num = $stnum->fetchColumn();
if (empty($_POST['login'])) {
$error.= 'Kimni hisobidan summani ayrib tashlashni hohlaysiz, loginni kiriting!<br/>';
}
elseif ($num == 0) {
$error.= 'Kechirasiz, tizimda bunday foydalanuvchi mavjud emas!<br/>';
}
if ($error) {
echo '<div class="menu">'.$error.'</div>';
} else {
$stmt = $connect->prepare("update `users` set `money` = `money` - ? where `login` = ?");
$stmte = $connect->prepare("INSERT INTO `logs_money` SET `id_user` = ?, `type` = 'minus', `count` = ?, `action` = ?, `time` = ?");
if (empty($_POST['text'])) {
$zaz='Hisobingizdan mablag\' ayrildi, Adminstrator ('.$user['login'].')';
}else{
$zaz=$_POST['text'];}
$time=time();
if ($stmt->execute(array($_POST['col'], $_POST['login'])) && $stmte->execute(array(uid($_POST['login'],$connect),$_POST['col'],$zaz,$time))){
echo '<div class="menu">Ayrish muvaffaqiyatli amalga oshirildi '.val($_POST['col'], 1).' rubl foydalanuvchi '.$_POST['login'].'!</div><meta http-equiv="Refresh" content="2; "/>';
} else {
echo '<div class="menu">Xato yuzaga chiqdi!</div>';
}
}
}
echo '<div class="menu"><form action="" method="post">
Mablag\'<br/><input type="text" name="col" maxlength="10"/><br/>Foydalanuvchi:<br/><input type="text" name="login" maxlength="15"/><br/>Matn(caption):<br/><input type="text" name="text" maxlength="50"/><br/><input class="btn btn-default" type="submit" value="Balansidan yechish"/></form></div>';
echo '<div class="menu">&bull;<a href="/adm"> Orqaga</a></div>';
break;
case 'wm':
    
echo '<div class="title">Настройки способов оплаты</div>';
if(!isset($_POST['ok'])){
echo '<form action="" method="post" name="form"><div class="menu">R-кошелек (WebMoney Merchant):<br/><input type="text" name="wmr" value="'.$wmr3.'"/><br/>Hash (WebMoney Merchant):<br/><input type="text" name="hash" value="'.$whash.'"/><br/></div><div class="menu">ID площадки (WorldKassa):<br/><input type="text" name="wk_id" value="'.$id_shop.'"/><br/>Hash (WorldKassa):<br/><input type="text" name="wk_hash" value="'.$hash.'"/><br/></div><div class="menu">ID площадки (WapKassa):<br/><input type="text" name="wpk_id" value="'.$wpkid.'"/><br/>Hash (WapKassa):<br/><input type="text" name="wpk_hash" value="'.$wpkh.'"/><br/></div><div class="menu"><input name="ok" class="btn btn-default" type="submit" value="Сохранить" /></form></div><div class="title">Информация</div><div class="menu"><u>WebMoney Merchant</u>:<br/>Result URL - '.ROOT.'/modnn/result.php<br/>Success URL - '.ROOT.'/pay/success<br/>Fail URL - '.ROOT.'/pay/fail</div><div class="menu"><u>WorldKassa</u>:<br/>Result URL - '.ROOT.'/modnn/result.php?act=1<br/>Success URL - '.ROOT.'/pay/success<br/>Fail URL - '.ROOT.'/pay/fail</div><div class="menu"><u>WapKassa</u>:<br/>Result URL - '.ROOT.'/modnn/result.php?act=2<br/>Success URL - '.ROOT.'/pay/success<br/>Fail URL - '.ROOT.'/pay/fail</div>';
} else {
$wkid = $_POST['wk_id'];
$wkh = $_POST['wk_hash'];
$wmr = $_POST['wmr'];
$wh = $_POST['hash'];
$wpkid = $_POST['wpk_id'];
$wpkh = $_POST['wpk_hash'];
if(empty($wkid)) $wkid = 0;
if(empty($wkh)) $wkh = 0;
if(empty($wpkid)) $wpkid = 0;
if(empty($wpkh)) $wpkh = 0;
if(empty($wmr)) $wmr = 0;
if(empty($wh)) $wh = 0;
$data = array(
'wmr' => $wmr,
'hash' => $wh,
'wk_id' => $wkid,
'wk_hash' => $wkh,
'wpk_id' => $wpkid,
'wpk_hash' => $wpkh
);
$stmt = $connect->prepare("UPDATE `settings` SET `value` = ? WHERE `name` = ?");
foreach ($data as $name => $value) {
$stmt->bindParam(1, $value);
$stmt->bindParam(2, $name);
$stmt->execute();
}
echo '<div class="menu">Sozlamalar o\'rnatildi!</div><meta http-equiv="Refresh" content="1; "/>';
}
echo '<div class="menu">&bull;<a href="/adm"> Orqaga</a></div>';
break;
case 'sett':
echo '<div class="title">Tizim sozlamalari</div>';

if(!isset($_POST['ok'])){
echo '<div class="menu"><form action="" method="post" name="form">Pochta:<br/><input type="text" name="mail" maxlength="50" value="'.$set['mail'].'"/><br/>Время антифлуда:<br/><input type="text" name="antiflud" maxlength="4" value="'.$set['antiflud'].'"/><br/>Время перехода:<br/><input type="text" name="sec" maxlength="4" value="'.$set['sec'].'"/><br/>Стоимость перехода:<br/><input type="text" name="cena" maxlength="4" value="'.$set['cena'].'"/><br/>Минимальная сумма для вывода средств:<br/><input type="text" name="cash" maxlength="4" value="'.$set['cash'].'"/><br/>Комиссия на вывод (Проценты):<br/><input type="text" name="kom" maxlength="4" value="'.$set['kom'].'"/><br/>Участников лотереи:<br/><input type="text" name="loto" maxlength="4" value="'.$set['loto'].'"/><br/>Бонусные переходы:<br/><input type="text" name="bonus" maxlength="4" value="'.$set['bonus'].'"/><br/>Регистрация:<br/><select name="registration">';
if ($set['registration'] == 2){
echo '<option value="2">O\'chirilgan.</option><br/><option value="1">Yoniq.</option><br/>';
}else{
echo '<option value="1">Yoniq.</option><br/><option value="2">O\'chirilgan.</option><br/>';
}
echo '</select><br/>Saytning ishi:<br/><select name="rab">';
if ($set['close'] == 2){
echo '<option value="2">O\'chirilgan.</option><br/><option value="1">Вкл.</option><br/>';
}else{
echo '<option value="1">Yoniq.</option><br/><option value="2">Откл.</option><br/>';
}
echo '</select><br/><input name="ok" class="btn btn-default" type="submit" value="Saqlash" /></form></div>';
} else {
$registration = val($_POST['registration']);
$rab = val($_POST['rab']);
$cash = val($_POST['cash']);
$kom = val($_POST['kom']);
$loto = val($_POST['loto']);
$sec = val($_POST['sec']);
$bonus = val($_POST['bonus']);
$antiflud = val($_POST['antiflud']);
$cena = $_POST['cena'];
$mail = $_POST['mail'];

$error = '';
if(!preg_match('|^([a-z0-9_\.\-]{1,20})@([a-z0-9\.\-]{1,20})\.([a-z]{2,4})$|ius', $mail)) {
$error.= 'Pochda xato kiritildi! <br/>';
} 
if(empty($sec) || empty($cena) || empty($cash) || empty($mail) || empty($loto) || empty($antiflud) || empty($registration) || empty($rab)){
$error.= 'Maydonlardan biri bo\'sh!<br/>';
}
if($error) {
echo '<div class="menu">'.$error.'</div><meta http-equiv="Refresh" content="1; "/>';
} else {
$data = array(
'mail' => $mail,
'loto' => $loto,
'cash' => $cash,
'kom' => $kom,
'bonus' => $bonus,
'registration' => $registration,
'close' => $rab,
'antiflud' => $antiflud,
'sec' => $sec,
'cena' => $cena
);
$stmt = $connect->prepare("UPDATE `settings` SET `value` = ? WHERE `name` = ?");
foreach ($data as $name => $value) {
$stmt->bindParam(1, $value);
$stmt->bindParam(2, $name);
$stmt->execute();
}
echo '<div class="menu">Sozlamalar kiritildi!</div><meta http-equiv="Refresh" content="1; "/>';
}
}
echo '<div class="menu">&bull;<a href="/adm"> Назад</a></div>';
break;
case 'smsto':
echo '<div class="title">Bildirishnoma jo\'natish</div>';
$error = '';
if (isset($_POST['sms']) && isset($_POST['login'])) {
if (empty($_POST['sms'])) {
$error.= 'Matinni kiriting!<br/>';
}
$stnum = $connect->prepare("select count(`id`) from `users` where `login` = ?");
$stnum->execute(array($_POST['login']));
$num = $stnum->fetchColumn();
if (empty($_POST['login'])) {
$error.= 'Qabul qiluvchi loginini kiriting!<br/>';
}
elseif ($num == 0) {
$error.= 'Bunday foydalanuvchi tizimda mavjud emas!<br/>';
}
if ($error) {
echo '<div class="menu">'.$error.'</div>';
} else {
$stmt = $connect->prepare("update `users` set `money` = `money` + ? where `login` = ?");
$stmte = $connect->prepare("INSERT INTO `logs_money` SET `id_user` = ?, `type` = 'plus', `count` = ?, `action` = ?, `time` = ?");
if (empty($_POST['text'])) {
$zaz='Hisobingiz to\'ldirildi! Adminstrator ('.$user['login'].')';
}else{
$zaz=$_POST['text'];}
$time=time();
if ($stmt->execute(array($_POST['sms'], $_POST['login'])) && $stmte->execute(array(uid($_POST['login'],$connect),$_POST['col'],$zaz,$time))){
echo '<div class="menu">Вы успешно начислили '.val($_POST['col'], 1).'</font> So\'m пользователю '.$_POST['login'].'!</div><meta http-equiv="Refresh" content="2; "/>';
} else {
echo '<div class="menu">Mablag\'ni jo\'natishda xato!</div>';
}
}
}
echo '<div class="menu"><form action="" method="post">
Text:<br/><input type="text" name="sms" maxlength="1000"/><br/>Пользователь:<br/><input type="text" name="login" maxlength="15"/><br/>Text:<br/><input type="text" name="text" maxlength="50"/><br/><input class="btn btn-default" type="submit" value="Начислить"/></form></div>';
echo '<div class="menu">&bull;<a href="/adm"> Назад</a></div>';
break;
}
} else {
header ('location: /?404');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>