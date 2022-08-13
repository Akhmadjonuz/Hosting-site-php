<?php
$title = 'Pochtani almashtirish';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active)) {
$email_s = $connect->prepare("select count(*) from `users` where `email` = ?");
    echo '<div class="title"><b>Pochtani almashtirish</b></div>';

    if (isset($_SESSION['email']) && isset($_SESSION['email_key'])) {

        // Юзер может быть хитёр :)
        $email_s->execute(array($_SESSION['email']));

        if ($_SESSION['email'] == $user['email'] || $email_s->fetchColumn()) {

            unset($_SESSION['email'], $_SESSION['email_key']);

            header('Location: /user/email');

        } else {

            if (isset($_POST['cancel'])) {

                unset($_SESSION['email'], $_SESSION['email_key']);

                header('Location: /user/email');

            }
            elseif (isset($_POST['email_verify'])) {

                $error = '';

                if (empty($_POST['email_key'])) {
                    $error.= 'Tasdiqlash kodini kiriting!<br/>';
                }
                elseif ($_POST['email_key'] != $_SESSION['email_key']) {
                    $error.= 'Tasdiqlash kodi noto‘g‘ri!<br/>';
                }
                if ($error) {
                    echo '<div class="menu"><center><font color="red">'.$error.'</font></center></div>';
                } else {

                    $stmt = $connect->prepare("update `users` set `email` = ? where `id` = ?");

                    if ($stmt->execute(array($_SESSION['email'], $user['id']))) {

                        unset($_SESSION['email'], $_SESSION['email_key']);

                        header('Location: /user/email');

                    } else {
                        echo '<div class="menu"><center><font color="red">Xatolik yuzaga keldi!</font></center></div>';
                    }

                }

            }

            echo '<div class="menu">
            <form action="" method="POST">
            Pochta: '.$_SESSION['email'].'<br/>#####################<br/>
            Tasdiqlash kodi:<br/><input type="text" name="email_key"><br/>
            <input class="btn btn-default" type="submit" name="email_verify" value="Pochtani tasdiqlash"><input class="btn btn-default" type="submit" name="cancel" value="Bekor qilish">
            <div class="menu"><center><font color="aqua">На <font color="red">'.$user['email'].'</font> Tasdiqlash kodi pochtangizga jo\'natildi.</font></center></div>
            </form></div>';

        }

    } else {

        if (isset($_POST['submit'])) {

            $error = '';

            // Поиск e-mail в базе
            $email_s->execute(array($_POST['email']));

            if (empty($_POST['email'])) {
                $error.= 'Elektron pochta satrini kiritish shart!<br/>';
            }
            elseif (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                $error.= 'E-pochta maydoni noto‘g‘ri!<br/>';
            }
            elseif ($_POST['email'] == $user['email']) {
                $error.= 'Sizda bu elektron pochta xabari bor!<br/>';
            }
            elseif ($email_s->fetchColumn()) {
                $error.= 'Ushbu elektron pochtaga ega foydalanuvchi allaqachon ro\'yxatdan o\'tgan!<br/>';
            }
            if ($error) {
                echo '<div class="menu"><center><font color="red">'.$error.'</font></center></div>';
            } else {

                $_SESSION['email'] = $_POST['email'];

                $_SESSION['email_key'] = random_int(11111, 99999);

                mailto(
                    $user['email'],
                    'Pochtani almashtirish Fasthost.uz (@UzKoDeR)',
                    'Tasdiqlash kodi: '.$_SESSION['email_key'],
                    $set['mail']
                );

                header('Location: /user/email');

            }

        }

        echo '<div class="menu">
        <form action="" method="POST">
        <b>Hozirgi E-mail:</b> '.$user['email'].'<br/>############################<br/>
        <b>Yangi E-mail:</b><br/><input type="email" name="email"><br/>
        <input class="btn btn-default" type="submit" name="submit" value="Davom ettirish">
        </form></div>';

    }


} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>