<?php
$title = 'Sayt boshqaruviga kirish';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == true) {
echo '<div class="title">Sayt boshqaruviga kirish</div>';
$stmtcp = $connect->prepare("select count(*) from `users` where `access_cp` = ?");
$stmtcp->execute(array($user['id']));
$numcp = $stmtcp->fetchColumn();
if ($numcp > 0) {
$stmtcpd = $connect->prepare("select * from `users` where `access_cp` = ? limit 1");
$stmtcpd->execute(array($user['id']));
$cpd = $stmtcpd->fetch(PDO::FETCH_LAZY);

echo '<div class="menu">&bull; <a href="/authcp/ok"> Sayt boshqaruvi tizimiga kiring</a></div>';

$asset = $connect->query("select * from `users` where `access_cp` = '$user->id'")->fetchAll();
foreach ($asset as $cpaa) {
    echo '<div class="menu">&bull; <a href="/authcp/access/'.$cpaa['id'].'"> Kirish  <font color="red">'.$cpaa['login'].'</font> Sayt boshqaruvi</a></div>';
}

}elseif (empty($_GET['accesscp'])){
    $kauth = md5(md5(time()));
    $auth = $connect->prepare("insert into `mgr_sessions` set `key_auth` = ?, `id_user` = ?, `time` = ?, `ip` = ?, `ua` = ?, `activ` = ?, `id_enter` = ?");
    if ($auth->execute(array($kauth, $user['id'], time(), $ip, $ua, 1, $user['id']))){
        header('Location: https://mgr.fasthost.uz/authcp?key='.$kauth.'&id_user='.$user['id']);
    }
}

if ($_GET['mycp'] == 'ok') {
    $kauth = md5(md5(time()));
    $auth = $connect->prepare("insert into `mgr_sessions` set `key_auth` = ?, `id_user` = ?, `time` = ?, `ip` = ?, `ua` = ?, `activ` = ?, `id_enter` = ?");
    if ($auth->execute(array($kauth, $user['id'], time(), $ip, $ua, 1, $user['id']))){
    header('Location: https://mgr.fasthost.uz/authcp?key='.$kauth.'&id_user='.$user['id']);
    }
}
if (isset($_GET['accesscp'])) {
    $acid = (int) $_GET['accesscp'];
    $debas = $connect->prepare("select count(*) from `users` where `access_cp` = ? and `id` = ?");
    $debas->execute(array($user['id'], $acid));
    $deb = $debas->fetchColumn();
    if ($deb) {
    $kauth = md5(md5(time()));
    $auth = $connect->prepare("insert into `mgr_sessions` set `key_auth` = ?, `id_user` = ?, `time` = ?, `ip` = ?, `ua` = ?, `activ` = ?, `id_enter` = ?");
    if ($auth->execute(array($kauth, $acid, time(), $ip, $ua, 1, $user['id']))){
    header('Location: https://mgr.fasthost.uz/authcp?key='.$kauth.'&id_user='.$acid);
    }else{
        echo '<div class="err">Iltimos, ushbu xatoni @UzKoDeR yozing!</div>';
    }
    }else{
        echo '<div class="err">Oh! siz mening hisob-kitobimni buzdingiz :)  (Powered By UzKoDeR)</div>';
    }
}

} else {header('Location: /auth');}
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>