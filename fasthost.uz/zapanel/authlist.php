<?php
$title = 'Avtorizatsiya tarixi | Fasthost.Uz';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active)) {
$stmt_auth = $connect->prepare("select count(*) from `authlog` where `uid` = ?");
$stmt_auth->execute(array($user['id']));
$count_auth = $stmt_auth->fetchColumn();
    echo '<div class="title"><b>Avtorizatsiya tarixi</b> <font color="aqua">('.$count_auth.')</font></div>';

    $stmt_count = $connect->prepare("select count(*) from `authlog` where `uid` = ? and `id` = ? and `key` != ?");

    // старые авторизации
    $stmt_old = $connect->prepare("select count(*) from `authlog` where `status` = ? and `uid` = ?");
    $stmt_old->execute(array(0, $user['id']));
    $old_auth = $stmt_old->fetchColumn();

    if (isset($_GET['exit'])) {
        if (isset($_POST['cancel'])) {
            header('Location: /user/listauth');
        }
        elseif (isset($_POST['ok'])) {
            $reset = $connect->prepare("update `authlog` set `status` = '0' where `uid` = ? and `key` != ?");
            if ($reset->execute(array($user['id'], $authash))) {
                header('Location: /user/listauth');
            } else {
                echo '<div class="err">Xatolik yuzaga keldi!</div>';
            }
        }
        echo '<div class="menu">
        <form action="" method="POST">
        <input type="submit" class="btn btn-default" name="ok" value="Barcha qurilmalardan chiqishni tasdiqlang!">
        <input type="submit" class="btn btn-default" name="cancel" value="Bekor qilish">
        </form></div>';
    }
    elseif (isset($_GET['reset'])) {
        $stmt_count->execute(array($user['id'], $_GET['reset'], $authash));
        if ($stmt_count->fetchColumn()) {
            if (isset($_POST['cancel'])) {
                header('Location: /user/listauth');
            }
            elseif (isset($_POST['ok'])) {
                $reset_auth = $connect->prepare("update `authlog` set `status` = '0' where `uid` = ? and `id` = ?");
                if ($reset_auth->execute(array($user['id'], $_GET['reset']))) {
                    header('Location: /user/listauth');
                } else {
                    echo '<div class="err">Xatolik yuzaga keldi!</div>';
                }
            }
            echo '<div class="menu">
            <form action="" method="POST">
            <input type="submit" class="btn btn-default" name="ok" value="Aftorizatsiyani bekor qilish ('.intval($_GET['reset']).')">
            <input type="submit" class="btn btn-default" name="cancel" value="Bekor qilish">
            </form></div>';
        } else {
            header('Location: /user/listauth');
        }
    }
    elseif (isset($_GET['clear'])) {
        if ($old_auth) {
            if (isset($_POST['cancel'])) {
                header('Location: /user/listauth');
            }
            elseif (isset($_POST['ok'])) {
                $error = '';
                if (empty($_POST['pass'])) {
                    $error.= 'Parolni kiriting!<br/>';
                }
                elseif ($user['pass'] != md5(md5($_POST['pass']))) {
                    $error.= 'Parol xato!<br/>';
                }
                if ($error) {
                    echo '<div class="err">'.$error.'</div>';
                } else {
                    $del_old = $connect->prepare("delete from `authlog` where `status` = ? and `uid` = ?");
                    if ($del_old->execute(array(0, $user['id']))) {
                        header('Location: /user/listauth');
                    } else {
                        echo '<div class="err">Xatolik yuzaga keldi!</div>';
                    }
                }
            }
            echo '<div class="menu">
            <form action="" method="POST">
            Hisobingiz parolini kiriting:<br/><input type="password" name="pass"><br/>
            <input type="submit" class="btn btn-default" name="ok" value="Eski avtorizatsiyani tozalash">
            <input type="submit" class="btn btn-default" name="cancel" value="Bekor qilish">
            </form></div>'; 
        } else {
            header('Location: /user/listauth');
        }
    }

    echo '<div class="menu">
    <a href="?exit">[Barcha qurilmalardan chiqish]</a> |
    '.($old_auth ? '<a href="?clear">[Eski avtorizatsiyani tozalash]</a>' : '').'
    </div>';

    if ($user['captcha'] && $user['attempts']) {

        echo '<div class="menu">
        <div class="err">Ehtimol, ular sizni xakerlik qilmoqchi bo\'lishgan!<br/>
            Vaqt: '.daytime($user['captcha']).'<br/>
            Parolni kiritishda xatolik: '.$user['attempts'].'
        
        </div>
        </div>';

    }

    if ($count_auth == 0) {
        echo '<div class="err">Hech qanday yozuv yo\'q!</div>';
    } else {

        $max = 10;
        $k_post = $connect->prepare("SELECT COUNT(*) FROM `authlog` WHERE `uid` = ?");
        $k_post->execute(array($user->id));
        $k_post = $k_post->fetchColumn(0);
        $k_page = k_page($k_post, $max);
        $page = page($k_page);
        $start = $max*$page-$max;

        $data = $connect->prepare("select * from `authlog` where `uid` = :uid order by `id` desc limit :start, 10");
        $data->bindValue(':uid', $user['id'], PDO::PARAM_INT);
        $data->bindValue(':start', $start, PDO::PARAM_INT);
        $data->execute();
        $sql = $data->fetchAll();
//deviceIcon($row['ua']).
        foreach ($sql as $row) {
            echo '<div class="menu">
            <b>Vaqt:</b> '.date('d.m.Y H:i', $row['time']).'<br/>
            <b>Oxirgi tashrif:</b> '.date('d.m.Y H:i', $row['lasttime']).'<br/>
            '.($row['attempts'] ? '<b>Noto\'g\'ri parol urinishlari:</b> '.$row['attempts'].'<br/>' : '').'
            <b>IP:</b> '.$row['ip'].'<br/>
            <b>UA:</b> '.$row['ua'].
            ($row['status'] == 1 ? ($authash == $row['key'] ? '<div class="good">Hozirgi avtorizatsiya!</div>' : '<div><a class="btn btn-default" href="?reset='.$row['id'].'">Tiklash</a></div>') : '<div class="forbidden">Avtorizatsiya tiklandi!</div>').'
            </div>';
        }

        if ($k_page  > 1) str('/user/listauth?', $k_page,  $page);

    }


} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>
