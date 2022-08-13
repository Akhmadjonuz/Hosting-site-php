<?php
$title='Cron vazifasini o\'zgartirish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
echo '<div class="title">Cron vazifasini o\'zgartirish</div>';	
    $ap = htmlspecialchars(trim($_GET['elid']));
    $content = api_query('https://'.$server->ip.'/ispmgr?func=scheduler.edit&elid=' .urlencode(decode($ap)). '&out=xml&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
    $parse_xml1 = simplexml_load_string($content);
    if (empty($_POST['submit'])) {
        echo '<div class="menu"><form action="/cron/edit/'.urlencode($_GET['elid']).'" method="post">' . "\n";
$mm = array(
    '/usr/bin/wget -O /dev/null ' => ''
    ); 
  echo '<input placeholder="URL manzil" name="command" type="text" value="' . htmlentities(strtr((string)$parse_xml1->command, $mm), ENT_QUOTES, 'UTF-8') . '"><br/>'; 
  echo '<input  placeholder="Tarifi" name="description" type="text" value="' . htmlentities((string)$parse_xml1->description, ENT_QUOTES, 'UTF-8') . '"><br/>'; 
  echo '<b>Qanchada bajarilishi</b>:<br/><select size="1" name="pro">
        <option value="1">1 Minut</option>
        <option value="7">2 Minut</option>
        <option value="8">3 Minut</option>
        <option value="9">4 Minut</option>
        <option value="2">5 Minut</option>
        <option value="3">10 Minut</option>
        <option value="4">30 Minut</option>
        <option value="5">1 Soat</option>
        <option value="6">24 Soat</option>
        </select><br/>';
        echo '<input class="btn btn-default" name="submit" type="submit" value="Qo\'shish" />' . "\n";
        echo '</form></div>' . "\n";
        echo '<div class="menu"><a href="/cron">&laquo; Orqaga</a></div>' . "\n";
       
     } else {
         $cmmon='/usr/bin/wget -O /dev/null '. $_POST['command'];
         if (filter($_POST['pro']==1)) {$mm='*/1';}
         elseif (filter($_POST['pro']==7)) {$mm='*/2';}
         elseif (filter($_POST['pro']==8)) {$mm='*/3';}
         elseif (filter($_POST['pro']==9)) {$mm='*/4';}
         elseif (filter($_POST['pro']==2)) {$mm='*/5';}
         elseif (filter($_POST['pro']==3)) {$mm='*/10';}
         elseif (filter($_POST['pro']==4)) {$mm='*/30';}
         elseif (filter($_POST['pro']==5)) {$mm='*/60';}
         elseif (filter($_POST['pro']==6)) {$mm='*/1440';}
         $m1='*';
         $m2='*';
         $m3='*';
         $m4='*';
		// Фильтрация
		$mailto = filter($_POST['mailto']);	
        $ap = htmlspecialchars(trim($_GET['elid']));		
        $content = api_query('https://'.$server->ip.'/ispmgr?func=scheduler.edit&elid=' .urlencode(decode($ap)). '&schedule_type=type_expert&mailto='.$mailto.'&input_hour=' . $m1 . '&input_min=' . $mm . '&input_dmonth=' . $m2 . '&input_month=' . $m3 . '&input_dweek=' . $m4 . '&command=' . urlencode($cmmon) . '&description=' . urlencode($_POST['description']) . '&out=xml&sok=ok&authinfo=' . $user['isp_login'] . ':' . $user['isp_pass']);
		$parse_xml = simplexml_load_string($content);
        if (isset($parse_xml->ok)) {
            echo '<div class="menu">' . "\n";
            echo '<center><font color="aqua">CRON vazifasi muvaffaqiyatli o\'zgartirildi!</font></center>' . "\n";
			echo '</div>' . "\n";
            echo '<div class="menu"><a href="/cron">Davom ettirish</a></div>' . "\n";
        } else {
            echo '<div class="menu">' . "\n";
		    echo '<center><font color="red">Cron qilishda xatolik!</font></center>' . "\n";
			echo '</div>' . "\n";
           echo '<div class="menu"><a href="/cron">Davom ettirish</a></div>' . "\n";
        }
    }
	  

} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>