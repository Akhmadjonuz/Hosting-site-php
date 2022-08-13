<?php
$title = 'Foydalanuvchilar';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if ($adm_id == 5) {

    echo '<div class="title"><b>Foydalanuchilar</b></div>
    <div class="menu">
    <form action="" method="GET">
    <input type="text" name="search" value="'.$search.'">
    <input class="btn btn-default" type="submit" value="Qidirish">
    </form></div>';

    $keywords = preg_replace("/[\s,]+/", "|", $search);

    $stmt_num = $connect->prepare("select count(*) from `users` where `login` rlike :keywords");
    $stmt_num->bindValue(':keywords', $keywords);
    $stmt_num->execute();
    $count_res = $stmt_num->fetchColumn();

    if ($count_res == 0) {
        echo '<div class="menu"><center><font color="red">Bo\'sh</font></center></div>';
    } else {

         $k_post = $count_res;
$k_page = k_page($k_post, 10); 
$page = page($k_page);
$start = 10 * $page - 10;


        $data = $connect->prepare("select * from `users` where `login` rlike :keywords order by `id` desc limit :start, 10");
        $data->bindValue(':keywords', $keywords);
        $data->bindValue(':start', $start, PDO::PARAM_INT);
        $data->execute();
        $sql = $data->fetchAll();

        foreach ($sql as $row) {
            if ($row[activ]==0) {$c1='<font color="red">Hisob faollashtirilmagan!</font> (0)';}
if ($row[activ]==1) {$c1='<font color="red">Hisob faollashtirilmagan!</font>(1)';}
if ($row[activ]==2) {$c1='<font color="aqua">Hisob faol!</font>(2)';}
if ($row[activ]==3) {$c1='<font color="red">Hisob o\'chirilgan!</font>(3)';}
if ($row[activ]==4) {$c1='<font color="red">Hisob blocklangan!</font>(4)';}
if (empty($c1)) {$c1='Error';}
            echo '<div class="menu"><img src="/inc/style/img/user.png" alt="'.filter($row['login']).'"><a href="/adm/users/id/'.$row['id'].'"><font color="yellow">'.filter($row['login']).'</font></a> '.online($row['id']).' ('.vremja($row['lasttime']).')';
            echo '<div class="st_1"></div><div class="st_2">
            <b>Hisob</b>: <font color="aqua">'.filter($row['money']).'</font> <b>So\'m</b> <br/>
            <b>Holat</b>: '.$c1.'<br/>
            <b>Ro\'yxatga olingan sana</b>: '.vremja($row['datereg']).'</div></div>';
        }

        if ($k_page > 1) str('?search='.$search, $k_page, $page);

    }
    echo '<div class="menu">&bull;<a href="/adm/users/mail"> <b>Pochta orqali qidirish</b></a></div>
    <div class="menu">&bull;<a href="/adm/users/ajaxs"> <b>Login orqali qidirish (Ajax)</b></a></div>
    <div class="menu">&bull;<a href="/adm/users/ip"> <b>IP orqali qidirish</b></a></div>
    <div class="menu">&bull;<a href="/adm"> <b>Boshqaruv paneli</b></a></div>';
} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>