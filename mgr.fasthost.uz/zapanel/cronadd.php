<?php
$title='Rejalashtiruvchi (CRON)';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
echo '<div class="title">Yangi CRON qo\'shish</div>';	
//echo 'https://'.$server->ip.'/ispmgr?func=scheduler.edit&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass'].' ';
    $content = api_query('https://'.$server->ip.'/ispmgr?func=scheduler.edit&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
    $parse_xml1 = simplexml_load_string($content);
    if (empty($_POST['submit'])) {
        echo '<div class="menu"><form action="/cron/add" method="post">' . "\n";

  echo '<input placeholder="URL manzil" name="command" type="text"> (Namuna: http://admin.fasthost.uz/pcouz.php)<br/>'; 
  echo '<input  placeholder="Ta\'rif" name="description" type="text"> (Namuna: Mening cronim 1)<br/>'; 
  echo '<b>Cron vaqtini tanlang (har safar kirish uchun)</b>:<br/><select size="1" name="pro">
        <option value="5">Har 1 minutda</option>
        <option value="6">Har 5 minutda</option>
        <option value="7">Har 7 minutda</option>
        <option value="8">Har 8 minutda</option>
        <option value="1">Har 1 soatda</option>
        <option value="2">Har 24 soatda</option>
        <option value="3">Har hafta</option>
        <option value="4">Har oy</option>
        </select><br/>';
        echo '<input class="btn btn-default" name="submit" type="submit" value="Qo\'shish" />' . "\n";
        echo '</form></div>' . "\n";
        echo '<div class="menu"><a href="/cron">&laquo; Orqaga</a></div>' . "\n";
       
     } else {
         $cmmon='/usr/bin/wget -O /dev/null '. $_POST['command'];
         if (filter($_POST['pro']==1)) {$mm='every_hour';}
         elseif (filter($_POST['pro']==2)) {$mm='every_day';}
         elseif (filter($_POST['pro']==3)) {$mm='every_week';}
         elseif (filter($_POST['pro']==4)) {$mm='every_month';}
         elseif (filter($_POST['pro']==5)) {$mm='*/1';}
         elseif (filter($_POST['pro']==6)) {$mm='*/5';}
         elseif (filter($_POST['pro']==7)) {$mm='*/15';}
         elseif (filter($_POST['pro']==8)) {$mm='*/30';}
         $m1='*';
         $m2='*';
         $m3='*';
         $m4='*';
		// Фильтрация
		$mailto = filter($_POST['mailto']);
		if($_POST['pro'] >= 5){
		$content = api_query('https://'.$server->ip.'/ispmgr?func=scheduler.edit&schedule_type=type_expert&mailto='.$mailto.'&input_hour=' . $m1 . '&input_min=' . $mm . '&input_dmonth=' . $m2 . '&input_month=' . $m3 . '&input_dweek=' . $m4 . '&command=' . urlencode($cmmon) . '&description=' . urlencode($_POST['description']) . '&out=xml&sok=ok&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
		}else{
        $content = api_query('https://'.$server->ip.'/ispmgr?func=scheduler.edit&schedule_type=type_basic&command='.urlencode($cmmon).'&mailto='.$mailto.'&run_every='.$mm.'&description=' . urlencode($_POST['description']) . '&out=xml&sok=ok&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
		}
		$parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="aqua">CRON vazifasi muvaffaqiyatli qo\'shildi!</font></center>' . "\n";
			echo '</div>' . "\n";
            echo '<div class="menu"><a href="/cron">Davom ettirish</a></div>' . "\n";
        } else {
            echo '<div class="menu">' . "\n";
            //echo print_r($content);
		    echo '<center><font color="red">CRON vazifasini qo\'shishda xato!</font></div>' . "\n";
			echo '</div>' . "\n";
            echo '<div class="menu"><a href="/cron">Davom ettirish</a></div>' . "\n";
        }
    }
	  
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>