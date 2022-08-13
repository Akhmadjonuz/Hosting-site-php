<?php
$title = 'Tarmoqdagi mehmonlar';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if ($adm_id == 5) {

    echo '<div class="title"><b>Tarmoqdagi mehmonlar</b> <font color="aqua">('.$count_online_guest.')</font></div>';

    if ($count_online_guest == 0) {
        echo '<div class="menu"><center><font color="red">Tarmoqda hech kim yo\'q!</font></center></div>';
    } else {
$k_post = $count_online_guest;
$k_page = k_page($k_post, 10); 
$page = page($k_page);
$start = 10 * $page - 10;

        $data = $connect->prepare("select * from `guests` where `time` > :time group by `id` order by `time` desc limit :start, 10");
        $data->bindValue(':time', time() - 900, PDO::PARAM_INT);
        $data->bindValue(':start', $start, PDO::PARAM_INT);
        $data->execute();
        $sql = $data->fetchAll();

        foreach ($sql as $row) {
            echo '<div class="menu"><img src="/inc/style/img/user.png" alt="'.filter($row['login']).'"><a><font color="aqua">'.filter($row['ip']).'</font></a> ('.date('H:i:s', $row['time']).')';
            echo '<div class="st_1"></div><div class="st_2"><b>UA:</b> '.filter($row['browser']).'<br/>
<b>Qaysi havolada: ?</b> <font color="yellow">'.filter($row['url']).'</font></div></div>';
        }

        if ($k_page > 1) str('?', $k_page, $page);

    }
    echo '<div class="menu">&bull;<a href="/adm/users/online"> <b>Orqaga</b></a></div>';
} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>