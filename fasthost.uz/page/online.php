<?php
$title = 'Tarmoqda';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if ($adm_id == 5) {

    echo '<div class="title"><b>Tarmoqda</b> <font color="aqua">('.$count_online_user.')</font></div>';

    if ($count_online_user == 0) {
        echo '<div class="menu"><center><font color="red">Tarmoqda hech kim yo\'q!</font></center></div>';
    } else {
$k_post = $count_online_user;
$k_page = k_page($k_post, 10); 
$page = page($k_page);
$start = 10 * $page - 10;
        $data = $connect->prepare("select * from `authlog` where `status` = '1' and `lasttime` > :time group by `uid` order by `lasttime` desc limit :start, 10");
        $data->bindValue(':time', time() - 300, PDO::PARAM_INT);
        $data->bindValue(':start', $start, PDO::PARAM_INT);
        $data->execute();
        $sql = $data->fetchAll();

        foreach ($sql as $row) {
            echo '<div class="menu"><img src="/inc/style/img/user.png" alt="'.filter(ulogin($row['uid'])).'"><a href="/adm/users/id/'.$row['uid'].'" ><font color="yellow">'.filter(ulogin($row['uid'])).'</font></a> '.online($row['uid']).' ('.date('H:i:s', $row['lasttime']).')';
            echo '<div class="st_1"></div><div class="st_2"><b>IP:</b> <font color="aqua">'.filter2($row['ip']).'</font></div></div>';
        }

       if ($k_page > 1) str('?', $k_page, $page);

    }
    echo '<div class="menu">&bull;<a href="/adm/guests/online"> <b>Tarmoqdagi mehmonlar</b> <font color="aqua">('.$count_online_guest.')</font></a></div>';
    echo '<div class="menu">&bull;<a href="/adm"> <b>Orqaga qaytish</b></a></div>';
} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>