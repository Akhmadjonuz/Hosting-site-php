<?php
//-----Подключаем функции-----//
    include 'system/func.php';
    include 'system/ftp_connect.php';


    $d=dir_url('/'.boff(prov($_GET['d'])));
    $title='Dampni yuklash: '.basename($d).'"';
    include 'system/head.php';
    title($title);
    if(empty($d)){ 
    header('Location: /mgr/explode.php');
    }else{
    ftp_pasv($serv,true);
    $res = ftp_size($serv,$d);
    if ($res == '-1') {
    header('Location: /mgr/explode.php');
    }else{
    $path=pathinfo(ftprename($d));
    $rf=mb_strtolower($path['extension'],'UTF-8');
    /// ok
    if(isset($_REQUEST['submit'])) {
        
    if (ftp_get($serv, 'tmp/'.$savedir.'/'.basename($d), $d, FTP_BINARY)){
    $filename = 'tmp/'.$savedir.'/'.basename($d).'';
    $mysql_host = 'localhost';
    $mysql_username = '' . $_POST['db'] . '';
    $pass = $_POST['pass'];	
    $mysql_password = ''.$pass.'';
    $mysql_database = '' . $_POST['db'] . '';
    mysql_connect($mysql_host, $mysql_username, $mysql_password) or die('<div class="err">MySQL serveriga ulanishda xato: ' . mysql_error().'</div> ');
    mysql_select_db($mysql_database) or die('<div class="err">MySQL ma\'lumotlar bazasini tanlashda xato: ' . mysql_error().'</div>');
    $templine = '';
    $lines = file($filename);
    foreach ($lines as $line)
    {
    if (substr($line, 0, 2) == '--' || $line == '')
    continue;
    $templine .= $line;
    if (substr(trim($line), -1, 1) == ';')
    {
    mysql_query($templine) or print('<div class="err">So‘rovni bajarishda xatolik yuz berdi \'<strong>' . $templine . '\': ' . mysql_error() . '<br /><br /></div>');
    $templine = '';
    }
    }
    echo "<div class='ok'>Jadvallar muvaffaqiyatli import qilindi!</div>";
    unlink('tmp/'.$savedir.'/'.basename($d));
    }
    }
    }
    }
    echo '<div class="menu"><form action="" method="POST">';
    echo '<div class="menu">Malumotlar bazasi: <select name="db">' . "\n";
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
$ontarif->execute(array($user['id_tarif']));
$ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
    $qas=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
    $content = file_get_contents("https://".$server->ip."/ispmgr?func=db&out=xml&authinfo=".$user[isp_login].":".$user[isp_pass], false, stream_context_create($qas));
    $parse_xml_domain = simplexml_load_string($content);
    foreach($parse_xml_domain->elem as $var) {
    echo '<option value="' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . '">' . htmlentities((string)$var->name, ENT_QUOTES, 'UTF-8') . '</option>' . "\n";
    }
    echo '</select><br /></div>' . "\n";    
    echo '<div class="menu">Ma\'lumotlar bazasi paroli: <input type="text" name="pass"/> <br /></div>
    <input class="btn btn-default" type="submit" name="submit" value="Import" />
     </form></div>';
    echo '<div class="menu">&laquo; <a href="/mgr/file.php?d='.prov($_GET['d']).'">Orqaga</a></div>';

    include 'system/foot.php';
?>