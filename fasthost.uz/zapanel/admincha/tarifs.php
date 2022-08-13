<?php

$title = 'Hosting | Tarif';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if ($adm_id == 5) {

if(isset($_GET['edit']))
{
    $q1 = $connect->prepare("SELECT * FROM `tarifs_hosting` WHERE `id` = ? LIMIT 1");
$q1->execute(array(val($_GET['edit'])));
}
if(isset($_GET['del']))
{
    $q2 = $connect->prepare("SELECT * FROM `tarifs_hosting` WHERE `id` = ? LIMIT 1");
$q2->execute(array(val($_GET['del'])));
}
// редактирование <b>Tarif</b>а
if(isset($_GET['edit']) && $q1->rowCount()>0)
{
$hosting = $connect->prepare("SELECT * FROM `tarifs_hosting` WHERE `id` = ?");
$hosting->execute(array(val($_GET['edit'])));
$hosting = $hosting->fetch(PDO::FETCH_LAZY);
if(isset($_POST['submit']))
{
$name = filter($_POST['name']);
$template = filter($_POST['template']);
$panel = filter($_POST['panel']);
$hdd = filter($_POST['hdd']);
$trafic = filter($_POST['trafic']);
$domain = filter($_POST['domain']);
$ftp = filter($_POST['ftp']);
$mail = filter($_POST['mail']);
$mysql = filter($_POST['mysql']);
$ram = filter($_POST['ram']);
$cpu = filter($_POST['cpu']);
$cpu_user = filter($_POST['cpu_user']);
$io = filter($_POST['io']);
$activ = abs(intval($_POST['activ']));
$server = $connect->prepare("SELECT * FROM `servers` WHERE `id` = ?");
$server->execute([$_POST['server']]);
$server = $server->fetch(PDO::FETCH_OBJ);
$price_day = filter($_POST['price_day']);
$price_month = filter($_POST['price_month']);
$price_year = filter($_POST['price_year']);

$resa = $connect->prepare("UPDATE `tarifs_hosting` SET `name` = ?, `template` = ?, `panel` = ?, `hdd` = ?, `trafic` = ?, `domain` = ?, `ftp` = ?, `mail` = ?, `mysql` = ?, `ram` = ?, `cpu` = ?, `cpu_user` = ?, `io` = ?, `activ` = ?, `id_server` = ?, `price_day` = ?, `price_month` = ?, `price_year` = ? WHERE `id` = ?");
$resa->execute(array($name,$template,$panel,$hdd,$trafic,$domain,$ftp,$mail,$mysql,$ram,$cpu,$cpu_user,$io,$activ,$server->id,$price_day,$price_month,$price_year,$hosting->id));
header('Location:/adm/tarifs');
}
else
{
echo '<div class = "title">Tarifni o\'zgartirish</div>';
echo '<div class="menu">';
echo '<form method="post">';
echo '<font color = "black">Tarif nomi: <br /><input type="text" name="name" value="'.$hosting->name.'" required/><br/>';
echo 'Shablon ismi: <br /><input type="text" name="template" value="'.$hosting->template.'" required/><br/>';
echo 'Boshqaruv paneli: <br /><input type="text" name="panel" value="'.$hosting->panel.'" required/><br/>';
echo 'Diskdagi joy: <br /> <input type="text" name="hdd" value="'.$hosting->hdd.'" required/><br/>';
echo 'Trafik: <br /> <input type="text" name="trafic" value="'.$hosting->trafic.'" required/><br/>';
echo 'Domenlar/poddomenlar: <br /> <input type="text" name="domain" value="'.$hosting->domain.'" required/><br/>';
echo 'FTP-kirish imkoniyati: <br /> <input type="text" name="ftp" value="'.$hosting->ftp.'" required/><br/>';
echo 'POP3-quti: <br /> <input type="text" name="mail" value="'.$hosting->mail.'" required/><br/>';
echo 'Ma\'lumotlar ba\'zasi: <br /> <input type="text" name="mysql" value="'.$hosting->mysql.'" required/><br/>';
echo 'RAM (1ta amalda): <br /> <input type="text" name="ram" value="'.$hosting->ram.'" required/><br/>';
echo 'CPU (1ta amalda): <br /> <input type="text" name="cpu" value="'.$hosting->cpu.'" required/><br/>';
echo 'CPU (Akaunt yadrosi): <br /> <input type="text" name="cpu_user" value="'.$hosting->cpu_user.'" required/><br/>';
echo 'I/O (Disk kuchlanishi): <br /> <input type="text" name="io" value="'.$hosting->io.'" required/><br/>';
echo 'Holati: <br /> <select name="activ">
<option value="0" '.($hosting->activ==0?'selected':'').'>Yo\'q</option>
<option value="1" '.($hosting->activ==1?'selected':'').'>Ha</option>
</select></br>';
echo '<br>Server: <br /> <select name="server">';
$q = $connect->query("SELECT * FROM `servers` ORDER BY `id` DESC");
while ($server = $q->fetch(PDO::FETCH_LAZY))
{
echo '<option value="'.$server->id.' '.($hosting->id_server==$server->id?'selected':'').'">'.$server->ip.'</option>';
}
echo '</select></br>';
echo '<br>Kunlik narxi: <br /><input type="text" name="price_day" value="'.$hosting->price_day.'" required/><br/>';
echo 'Oylik narxi: <br /><input type="text" name="price_month" value="'.$hosting->price_month.'" required/><br/>';
echo 'Yillik narxi: <br /><input type="text" name="price_year" value="'.$hosting->price_year.'" required/><br/>';

echo '<br/></font><input class="btn btn-default" type="submit" name="submit" value="Taxrirlash"/>';
echo '<div align="right"><a href="/adm/tarifs?del='.$hosting->id.'">Tarifni o\'chirish</a></div>';
echo '</div>';
}
}
// удаление <b>Tarif</b>а
elseif(isset($_GET['del']) && $q2->rowCount()>0)
{
$hosting = $connect->prepare("SELECT * FROM `tarifs_hosting` WHERE `id` = ?");
$hosting->execute(array(val($_GET['del'])));
$hosting = $hosting->fetch(PDO::FETCH_LAZY);
if(isset($_GET['save']))
{
if(isset($_POST['yes']))
{
$q3 = $connect->prepare("SELECT * FROM `orders_hosting` WHERE `id_tarif` = ? LIMIT 1");
$q3->execute(array($hosting->id));
if($q3->rowCount()==0)
{
$connect->query("DELETE FROM `tarifs_hosting` WHERE `id` = '". $hosting->id ."'");
header('Location:/adm/tarifs');
}
else
{
header( 'Refresh: 5; url=/adm/tarifs' );
echo '<div class="err">Ushbu tarifni o\'chirib bo\'lmaydi.!</div>';
}
}
else header('Location:/adm/tarifs');
}
else
{
echo '<div class="title"><b>Tarif</b>ni o\'chirish</div>';
echo '<div class="menu">';
echo '<form method="post" action="/adm/tarifs?del='.$hosting->id.'&save">';
echo '<b>Tarif</b>ni o\'chirish'.$hosting->name.'?<br/>';
echo '<br/><input class="btn btn-default" type="submit" name="no" value="Yo\'q, qolsin"/>  <input class="btn btn-default" type="submit" name="yes" value="Ha, o\'chirilsin"/>';
echo '</div>';
}
}
//  создание <b>Tarif</b>а
elseif(isset($_GET['add']))
{
if(isset($_GET['save']))
{
$name = filter($_POST['name']);
$template = filter($_POST['template']);
$panel = filter($_POST['panel']);
$hdd = filter($_POST['hdd']);
$trafic = filter($_POST['trafic']);
$domain = filter($_POST['domain']);
$ftp = filter($_POST['ftp']);
$mail = filter($_POST['mail']);
$mysql = filter($_POST['mysql']);
$ram = filter($_POST['ram']);
$cpu = filter($_POST['cpu']);
$cpu_user = filter($_POST['cpu_user']);
$io = filter($_POST['io']);
$activ = abs(intval($_POST['activ']));
$server = $connect->prepare("SELECT * FROM `servers` WHERE `id` = ?");
$server->execute([$_POST['server']]);
$server = $server->fetch(PDO::FETCH_LAZY);
$price_day = filter($_POST['price_day']);
$price_month = filter($_POST['price_month']);
$price_year = filter($_POST['price_year']);

$resb = $connect->prepare("INSERT INTO `tarifs_hosting` SET `name` = ?, `template` = ?, `panel` = ?, `hdd` = ?, `trafic` = ?, `domain` = ?, `ftp` = ?, `mail` = ?, `mysql` = ?, `ram` = ?, `cpu` = ?, `cpu_user` = ?, `io` = ?, `activ` = ?, `id_server` = ?, `price_day` = ?, `price_month` = ?, `price_year` = ?");
$resb->execute(array($name,$template,$panel,$hdd,$trafic,$domain,$ftp,$mail,$mysql,$ram,$cpu,$cpu_user,$io,$activ,$server->id,$price_day,$price_month,$price_year));
header('Location:/adm/tarifs');

}
else
{
echo '<div class="title">Yangi tarif</div>';
echo '<div class="menu">';
echo '<form method="post" action="/adm/tarifs?add&save">';
echo 'Tarif ismi: <br /><input type="text" name="name" required/><br/>';
echo 'Shablob ismi (ISP): <br /> <input type="text" name="template" required/><br/>';
echo 'Boshqaruv paneli: <br /> <input type="text" name="panel" required/><br/>';
echo 'Diskdagi joy: <br /> <input type="text" name="hdd" required/><br/>';
echo 'Trafik: <br /> <input type="text" name="trafic" required/><br/>';
echo 'Domenlar/poddomenlar: <br /> <input type="text" name="domain" required/><br/>';
echo 'FTP-kirish imkoniyati: <br /> <input type="text" name="ftp" required/><br/>';
echo 'POP3-qutilar: <br /> <input type="text" name="mail" required/><br/>';
echo 'Ma\'lumotlar bazasi: <br /> <input type="text" name="mysql" required/><br/>';
echo 'RAM (1ta amalda): <br /> <input type="text" name="ram" required/><br/>';
echo 'CPU (1ta amalda): <br /> <input type="text" name="cpu" required/><br/>';
echo 'CPU (akaunt yadrosi): <br /> <input type="text" name="cpu_user" required/><br/>';
echo 'I/O (Disk zagruskasi) : <br /> <input type="text" name="io" required/><br/>';
echo 'Активен : <br /> <select name="activ">
<option value="0">YO\'q</option>
<option value="1">Ha</option>
</select></br>';
echo '<br>Server: <br /> <select name="server">';
$q = $connect->query("SELECT * FROM `servers` ORDER BY `id` DESC");
while ($server = $q->fetch(PDO::FETCH_LAZY))
{
echo '<option value="'.$server->id.'">'.$server->ip.'</option>';
}
echo '</select></br>';
echo '<br>Kunlik narx: <br /><input type="text" name="price_day" required/><br/>';
echo 'Oylik narx: <br /><input type="text" name="price_month" required/><br/>';
echo 'Yillik narx: <br /><input type="text" name="price_year" required/><br/>';

echo '<br/><input class="btn btn-default" type="submit" name="submit" value="Ochish"/>';
echo '</div>';
}
}
// просмотр <b>Tarif</b>ов
else
{
$k_post = $connect->query("SELECT * FROM `tarifs_hosting`");
$k_post = $k_post->rowCount();
$k_page = k_page($k_post, 10);
$page = page($k_page);
$start = 10*$page-10;
if ($k_post==0) {
    echo '<div class="menu"><center><font color="red"></font></center></div>';
}
$q = $connect->query("SELECT * FROM `tarifs_hosting` ORDER BY `sort` ASC LIMIT $start, 10");
while ($tarif = $q->fetch(PDO::FETCH_LAZY))
{
echo '<div class="title"><b>Tarif</b>: '.$tarif->name.' </div>';
echo '<div class="menu">';
$hos = $connect->prepare("SELECT * FROM `users` WHERE `activ` = '2' AND`id_tarif` = ?");
$hos->execute(array($tarif->id));
$hos = $hos->rowCount();
echo '<font color = "#344d61">Buyurtma qilingan -('.$hos.')'.($tarif->activ==1?' [<font color="aqua">Faol!</font>]':'[<font color="red">O\'chirilgan!</font>]').'<br/><br/></font>';
echo '<a href="/adm/tarifs?edit='.$tarif->id.'">O\'zgartirish</a>';
echo '</div>';
}

echo '<div class="menu">&bull;<a href="/adm/tarifs?add""> Qo\'shish</a></div>';
echo '<div class="menu">&bull;<a href="/adm"> Orqaga qaytish</a></div>';
if ($k_page  > 1)str('/adm/tarifs?', $k_page, $page);
}
} else {
header ('location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>