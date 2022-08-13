<?php
$title = 'Yangi Habar';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active)) {

    $in_mail = $connect->prepare("insert into `mail` set `time` = ?, `from` = ?, `to` = ?, `text` = ?");

    echo '<div class="title">Yangi habar</div>';

    SmilesAndBB();

    if (isset($_POST['submit'])) {

        $row = user($_POST['who'], 1);

        $error = '';

        if ($user['datereg'] > time() - 60 * $sys['system']['fludtime'] && $adm_id == 0) {
            $error.= 'Ro\'yxatdan o\'tish paytidan boshlab xabarlarni yuborish imkoniyatiga ega bo\'lish uchun ro\'yxatdan o\'tish kerak: '.restime(60 * $sys['system']['fludtime']).'!<br/>';
        } else {
            if (empty($_POST['who'])) {
                $error.= 'Qabul qiluvchini loginini kiriting!<br/>';
            }
            elseif (!$row) {
                $error.= 'Bunday foydalanuvchi tizimda mavjud emas!<br/>';
            }
            elseif ($_POST['who'] == $user['login']) {
                $error.= 'Siz o\'zingizga xabar yubora olmaysiz!<br/>';
            }
            elseif (!privateMail($row, $user['id'])) {
                $error.= 'Ushbu foydalanuvchiga faqat do\'stlari xabar yuborishi mumkin.!<br/>';
            }
            elseif (in_blacklist($user['id'], $row['id']) || in_blacklist($row['id'], $user['id'])) {
                $error.= 'Siz ushbu foydalanuvchiga yoza olmaysiz!<br/>';
            }
            if (empty($_POST['text'])) {
                $error.= 'Habarni kiriting!<br/>';
            }
            elseif (mb_strlen($_POST['text']) < 2 || mb_strlen($_POST['text']) > 25000) {
                $error.= 'Matn kamida 2 ta belgidan iborat bo\'lishi kerak va 25000 belgidan oshmasligi kerak!<br/>';
            }
            if (file_exists($_FILES['filename']['tmp_name'])) {
                if (!BeforeUpload::AttachFile($_FILES['filename'])) {
                    $error.= 'Noto\'g\'ri format!<br/>';
                }
                if ($_FILES['filename']['size'] > $sys['system']['upload_mail']) {
                    $error.= 'Faylning maksimal hajmi - '.byte_conv($sys['system']['upload_mail']).'!<br/>';
                }
            }
        }
        if ($error) {
            echo '<div class="menu">'.$error.'</div>';
        } else {
            if ($in_mail->execute(array(time(), $user['id'], $row['id'], $_POST['text']))) {
                // Загрузка файла
                if (file_exists($_FILES['filename']['tmp_name'])) {
                    $lid = $connect->LastInsertId();
                    $files = $lid."_mail_".random_int(11111, 99999)."_".$_FILES['filename']['name'];
                    move_uploaded_file($_FILES['filename']['tmp_name'], $_SERVER["DOCUMENT_ROOT"]."/files/".$files);
                }
                // Добавляем в контакты
                contact_add($user['id'], $row['id']);
                // Очки дружбы
                friendPoint($user['id'], $row['id']);
                header('Location: /mail/read/'.$row['id']);
            } else {
                echo '<div class="menu">Xatolik yuzaga keldi!</div>';
            }
        }
    }

    echo '<div class="menu">
    <form action="" method="POST" enctype="multipart/form-data">
    Логин получателя:<br/><input type="text" name="who"><br/>
    Сообщение:<br/><textarea data-select-range id="message" name="text" rows="5" cols="25"></textarea><br/>
    Прикрепить файл:<br/><input type="file" name="filename"><br/>
    <input type="submit" name="submit" value="Jo\'natish"/>
    </form></div>';

} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>