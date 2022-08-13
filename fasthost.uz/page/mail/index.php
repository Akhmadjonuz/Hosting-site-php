<?php
$title = 'Habar';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active)) {

    echo '<div class="title">Habar ('.$count_mail . $new_mail.')</div>
    <div class="forlink"><a href="/mail/write" class="links"><img src="/img/write.png" alt="">Новое сообщение</a></div>';

    $stmt_new = $connect->prepare("select count(*) from `mail` where `to` = ? and `from` = ? and `read` = '0'");

    if (isset($_GET['del']) && user($_GET['del']) && $_GET['del'] != $user['id']) {
        if (isset($_POST['cancel'])) {
            header('location: /mail');
        }
        elseif (isset($_POST['submit'])) {
           if (contact_del($user['id'], $_GET['del'])) {
                header('location: /mail');
            } else {
                echo '<div class="menu">Xatolik yuzaga keldi!</div>';
            }
        } else {
            echo '<div class="menu">
            <form action="" method="POST">
            <input type="submit" name="submit" value="Kantaktni o\'chirish ('.intval($_GET['del']).')">
            <input type="submit" name="cancel" value="Отмена">
            </form></div>';
        }
    }

    if ($count_mess == 0) {
        echo '<div class="menu">Kantaktlar mavjud emas!</div>';
    } else {

        $page = new Pagination($count_mess, 10);

        $data = $connect->prepare("select * from `contacts` where `from` = :uid or `to` = :uid order by `time` desc limit :start, 10");
        $data->bindValue(':uid', $user['id'], PDO::PARAM_INT);
        $data->bindValue(':start', $page->start, PDO::PARAM_INT);
        $data->execute();
        $sql = $data->fetchAll();

        foreach ($sql as $row) {

            // Kontakt
            $contact = $row['from'] == $user['id'] ? $row['to'] : $row['from'];
            // новые сообщения
            $stmt_new->execute(array($user['id'], $contact));
            $mail = $stmt_new->fetchColumn();

            echo '<div class="menu">
            Kontakt: '.profileLink($contact).'<br/>
            Yangi habar: '.$mail.'<br/>
            <div class="butt2">
            <a href="/mail/read/'.$contact.'">O\'qish</a>
            <a href="?del='.$contact.'">O\'chirish</a>
            </div>
            </div>';

        }

        $page->navigation();

    }

} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>