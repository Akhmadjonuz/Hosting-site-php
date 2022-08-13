<?php
$title = 'Sayt boshqaruviga kirish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if ($adm_id == 5) {
echo '<div class="title"><b>Sayt boshqaruviga kirish</B></div>';

if (isset($_GET['accesscp'])) {
    $acid = (int) $_GET['accesscp'];
    $debas = $connect->prepare("select count(*) from `users` where `id` = ?");
    $debas->execute(array($acid));
    $deb = $debas->fetchColumn();
    if ($deb && $acid !=1) {
    $kauth = md5(md5(time()));
    $auth = $connect->prepare("insert into `mgr_sessions` set `key_auth` = ?, `id_user` = ?, `time` = ?, `ip` = ?, `ua` = ?, `activ` = ?, `id_enter` = ?");
    if ($auth->execute(array($kauth, $acid, time(), $ip, $ua, 1, $user['id']))){
    header('Location: https://mgr.fasthost.uz/authcp?key='.$kauth.'&id_user='.$acid);
    }else{
        echo '<div class="err">Iltimos, ushbu xatoni @UzKoDeR yozing!</div>';
    }
    }else{
        echo '<div class="err">error 404</div>';
    }
}

} else {header('Location: /');}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>