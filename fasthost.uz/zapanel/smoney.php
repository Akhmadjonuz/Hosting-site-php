<?php
$title = 'Do\'stlarga ulashish';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
$ack = '1';
if (isset($active) && $ack) {
    echo '<div class="title"><b>Do\'stlarga ulashish</b></div>';
    if ($user['accesstosm'] == 2){

    if (isset($_SESSION['send_summ']) && isset($_SESSION['send_login']) && isset($_SESSION['send_key'])) {

        if ($_SESSION['send_login'] == $user['login']) {

            unset($_SESSION['send_summ'], $_SESSION['send_login'], $_SESSION['send_key']);

            header('Location: /service/sendmoney');

        } else {

            if (isset($_POST['cancel'])) {

                unset($_SESSION['send_summ'], $_SESSION['send_login'], $_SESSION['send_key']);

                header('Location: /service/sendmoney');

            }
            elseif (isset($_POST['send_verify'])) {

                $error = '';

                if (empty($_POST['send_key'])) {
                    $error.= 'Tasdiqlash kodini kiriting!<br/>';
                }
                elseif ($_POST['send_key'] != $_SESSION['send_key']) {
                    $error.= 'Tasdiqlash kodi xato!<br/>';
                }elseif (!preg_match("#^[0-9]{1,15}$#i", $_SESSION['send_summ'])){
                    $error.= 'OOPS! Только Integer!<br/>';
                }
                if ($error) {
                    echo '<div class="menu"><center><font color="red">'.$error.'</font></center></div>';
                } else {
                    if ($user['money'] > $_SESSION['send_summ']){
                    $summ = p($_SESSION['send_summ'], $amx['amx']['procent']);
                    $smm = $connect->prepare("update `users` set `money` = `money` - ? where `login` = ?");
                    $smmh = $connect->prepare("INSERT INTO `logs_money` SET `id_user` = ?, `type` = 'minus', `count` = ?, `action` = ?, `time` = ?");
                    $zaz='Вы передали деньги под логином <b>'.filter2($_SESSION['send_login']).'</b>';
                    if ($smm->execute(array($_SESSION['send_summ'], $user['login'])) && $smmh->execute(array($user['id'], $_SESSION['send_summ'], $zaz, $time))){
                       $smp = $connect->prepare("update `users` set `money` = `money` + ? where `login` = ?");
                       $smph = $connect->prepare("INSERT INTO `logs_money` SET `id_user` = ?, `type` = 'plus', `count` = ?, `action` = ?, `time` = ?");
                       $zazp='Вам перевел деньги <b>'.filter2($user['login']).'</b>';
                       if ($smp->execute(array($summ, $_SESSION['send_login'])) && $smph->execute(array(uid($_SESSION['send_login']), $summ, $zazp, $time))){
                           echo '<div class="menu"><center><font color="aqua"><b>Siz o\'tkamani muvaffaqiyatli amalga oshirdingiz '.filter2($_SESSION['send_summ']).' rubl ushbu loginga jo\'natdingiz '.filter2($_SESSION['send_login']).'!</b></font></center></div>';
                           unset($_SESSION['send_summ'], $_SESSION['send_login'], $_SESSION['send_key']);
                           header('Refresh: 2; url=/service/sendmoney');
                       }else {
                        echo '<div class="menu"><center><font color="red">Xatolik yuzaga keldi! [1]</font></center></div>';
                    }
                    }else {
                        echo '<div class="menu"><center><font color="red">Xatolik yuzaga keldi! [2]</font></center></div>';
                    }
                    
                }else {
                    echo '<div class="menu"><center><font color="red"><h1>Xatolik yuzaga keldi!</h1></font></center></div>';
                           unset($_SESSION['send_summ'], $_SESSION['send_login'], $_SESSION['send_key']);
                           header('Refresh: 2; url=/service/sendmoney');
                }
                }

            }
            echo '<div class="menu">Siz jo\'natdingiz <b>'.filter2($_SESSION['send_summ']).'</b> rubl, ushbu loginga <b>'.filter2($_SESSION['send_login']).'</b></div>';
            echo '<div class="menu"><center><font color="gren">На <font color="aqua">'.filter2($user['email']).'</font> Tasdiqlovchi elektron xat yuborildi!</font></center></div>';
            echo '<div class="menu">
            <form action="" method="POST">
            Tasdiqlash kodi:<br/><input type="text" name="send_key"><br/>
            <input class="btn btn-default" type="submit" name="send_verify" value="Tasdiqlash"><input class="btn btn-default" type="submit" name="cancel" value="Bekor qilish">
            </form></div>';

        }

    } else {

        if (isset($_POST['submit'])) {

            $error = '';

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
            $error.= 'Tizimda bunday login mavjud emas!<br/>';
            }
            elseif ($user['activ'] == 4) {
            $error.= 'Sizning hisobingiz bloklandi! Sizga ruxsat berilmagan!<br/>';
            }
            elseif (mb_strtolower($_POST['login']) == mb_strtolower($user['login'])) {
            $error.= 'Hisobingizga o\'tkazib bo\'lmaydi!<br/>';
            }
            elseif ($user['money'] < $_POST['col']) {
            $error.= 'Hisobdan pul yetmayapti!<br/>';
            }
            elseif (!preg_match("#^[0-9]{1,15}$#i", $_POST['col'])){
                    $error.= 'OOPS! Только Integer!<br/>';
            }
            if ($error) {
                echo '<div class="menu"><center><font color="red">'.$error.'</font></center></div>';
            } else {

                $_SESSION['send_summ'] = $_POST['col'];
                $_SESSION['send_login'] = $_POST['login'];

                $_SESSION['send_key'] = random_int(11111, 99999);

                mailto(
                    $user['email'],
                    'Mablag\' ulashish uchun tasdiqlash kodi Fasthost.Uz',
                    'Tasdiqlash kodi: '.$_SESSION['send_key'],
                    $set['mail']
                );

                header('Location: /service/sendmoney');

            }

        }
        echo '<div class="menu">Ushbu xizmat yordamida aziz do\'stlar, siz o\'zingizning hisobingizdan pul o\'tkazishingiz yoki sotishingiz mumkin.<br/>
        Xizmat foizi <b>'.$amx['amx']['procent'].'%</b> mablag\'dan.</div>';
        echo '<div class="menu"><form action="?" method="post">
        <b>Mablag\':</b><br/><input type="text" name="col" maxlength="10"/><br/>
        <b>Foydalanuvchi:</b><br/><input type="text" name="login" maxlength="15"/><br/>
        <input class="btn btn-default" type="submit" name="submit" value="Jo\'natish"/></form></div>';

    }

}else{
    echo '<div class="menu"><center><font color="red">Sizda pul o\'tkazish imkoniyati yo\'q!</font></center></div>';
    echo '<div class="menu"><a href="/"> Davom ettirish</a></div> ';
}
} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>