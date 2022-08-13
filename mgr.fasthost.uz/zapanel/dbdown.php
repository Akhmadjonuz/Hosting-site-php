<?php
$title='Ma\'lumotlar bazasi | MySql ochish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
    $ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
    $ontarif->execute(array($user['id_tarif']));
    $ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
    $server = $connect->query("SELECT * FROM `servers` WHERE `id` = '".abs(intval($ustarif[id_server]))."'");
    $server = $server->fetch(PDO::FETCH_LAZY);
  /*header("Location: https://isp.uztan.uz/ispmgr?authinfo=" . $user['isp_login'] . ":" . $user['isp_pass']."&func=db.dump&elid=" . urlencode($_GET['elid']) . "");
*/

$urlsql = "https://".$server->ip."/ispmgr?authinfo=" . $user['isp_login'] . ":" . $user['isp_pass']."&func=db.dump&elid=" . urlencode($_GET['elid']) . "";
$dbname = 'dump_';
try{
    if( ! ( $ch = curl_init() ) ) 
        throw new Exception('Curl init failed');
        $options = [
            CURLOPT_URL            => 'https://bymas.ru/download_file/77013',
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_FAILONERROR => 1,
            CURLOPT_FOLLOWLOCATION => 1,
            CURLOPT_TIMEOUT => 30, 
            CURLOPT_HTTPHEADER     => [
                'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1; rv:34.0) Gecko/20100101 Firefox/34.0',
            ]
        ];
        curl_setopt_array($ch, $options);
        $file = curl_exec( $ch );
        file_put_contents('file.zip',$file);
} catch(Exception $e){
    echo $e->getMessage();
}

header('Location: /db');
} else {
header('Location: /');
}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>