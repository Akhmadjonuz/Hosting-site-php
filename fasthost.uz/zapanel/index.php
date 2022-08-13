<?php
$title='Kirish | Fasthost.Uz';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active) == false) {
echo '<div class="title">Kirish</div>';

    if (isset($_POST['auth'])) {

        $user = user($_POST['login'], 1);

        $error = '';

        if (isset($_SESSION['attempts']) && $_SESSION['attempts'] >= 3) {
            if (empty($_POST['code'])) {
                $error.= 'Capt\'chani kiriting!<br/>';
            }
            elseif ($_SESSION['code'] != $_POST['code']) {
                $error.= 'Capt\'chani xato!<br/>';
            }
        }
        if (!$error) {
            if (empty($_POST['login'])) {
                $error.= 'Loginni kiriting!<br/>';
            }
            elseif (!$user) {
                $error.= 'Ushbu login bilan foydalanuvchi ro\'yxatdan o\'tmagan!<br/>';
            }
            elseif ($user['ban'] > time()) {
                $error.= 'Ushbu hisob blocklangan!<br/>';
            }
            elseif (!isset($_SESSION['attempts']) && $user['attempts'] >= 3 && $user['captcha'] > time() - 3600 * 30) {
                $_SESSION['attempts'] = $user['attempts']; // включаем капчу
                $error.= 'Siz robotmisiz ?<br/>';
            }
            elseif (empty($_POST['pass'])) {
                $error.= 'Parolni kiriting!<br/>';
            }
            elseif ($user['pass'] != md5(md5($_POST['pass']))) {
                $_SESSION['attempts'] = isset($_SESSION['attempts']) ? $_SESSION['attempts'] + 1 : 1; // включаем капчу
                CaptchaAuth($user[id]); // учёт
                $authlogs = '-------------------------
                Login: '.$_POST['login'].'
                Paswd: '.$_POST['pass'].'
                IP: '.$ip.'
                ';
                $fauth=fopen($_SERVER["DOCUMENT_ROOT"].'/inc/logs/logsauths.txt','a+');
                fputs($fauth,''.$authlogs.' ');
                fclose($fauth);
                $error.= 'Noto\'g\'ri parol!<br/>';
            }
        }
        if ($error) {
            echo '<div class="err">'.$error.'</div>';
        } else {

            $auth = bin2hex(random_bytes(64)); // ключ авторизации

            if ($authlog->execute(array(time(), $user['id'], $ip, $ua, md5(md5($auth)), $_SESSION['attempts'] ?? 0))) {

                /* авторизация */

                $expire = isset($_POST['save']) ? time() + 3600 * 24 * 365 : 0;

                setcookie('user_id', $user['id']);
                setcookie('user_id', $user['id'], $expire, '/');
                setcookie('pass', $user['pass']);
                setcookie('pass', $user['pass'], $expire, '/');
                setcookie('auth', $auth);
                setcookie('auth', $auth, $expire, '/');

                /* отключаем капчу */

                CaptchaAuth($user, true);

                unset($_SESSION['attempts']);

                header('Location: /');

            } else {
                echo '<div class="err">Xatolik yuz berdi!</div>';
            }
        }
    }

    echo '<div class="menu">
    <form action="" method="POST">
    <b>Loginingiz:</b><br/><input type="text" name="login"><br/>
    <b>Parolingiz:</b><br/><input type="password" name="pass"><br/>
    '.(isset($_SESSION['attempts']) && $_SESSION['attempts'] >= 3 ? '
    <b>Capt\'cha:</b><img id="captcha" src="/inc/code.php" alt="check" onClick="UpCaptcha()"><br/>
    <input type="text" name="code"><br/>' : '').'
    <input type="checkbox" name="save" value="1"><b>Eslab qolish</b> <br/><br/>
    <input type="submit" class="btn btn-default" name="auth" value="Kirish">
    </form></div>
<div class="title"><b>Parolni unutdingizmi ?</b></div>';
echo '<div class="menu">&bull; <a href="/user/repass">Parolni tiklash</a></div>';
    
} else {
header('Location: /user/vxod');
}

include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>