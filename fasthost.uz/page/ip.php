<?php
$title = 'Foydalanuvchi (IP orqali qidirish)';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if ($adm_id == 5) {

    echo '<div class="title"><b>Foydalanuvchi (IP orqali qidirish)</b></div>
    <div class="menu">
    <form action="" method="GET">
    <input type="text" name="search" value="'.$search.'">
    <input class="btn btn-default" type="submit" value="Qidirish">
    </form></div>';

    $keywords = preg_replace("/[\s,]+/", "|", $search);

    $stmt_num = $connect->prepare("select count(*) from `logs_user` where `ip` rlike :keywords");
    $stmt_num->bindValue(':keywords', $keywords);
    $stmt_num->execute();
    $count_res = $stmt_num->fetchColumn();

    if ($count_res == 0) {
        echo '<div class="menu"><center><font color="red">Bo\'m - bo\'sh</font></center></div>';
    } else {
        $k_post = $count_res;
$k_page = k_page($k_post, 20); 
$page = page($k_page);
$start = 20 * $page - 20;

        
        $data = $connect->prepare("select * from `logs_user` where `ip` rlike :keywords order by `id` desc limit :start, 10");
        $data->bindValue(':keywords', $keywords);
        $data->bindValue(':start', $start, PDO::PARAM_INT);
        $data->execute();
        $sql = $data->fetchAll();
        foreach ($sql as $row) {
            $lgus=ulogin($row['id_user']);
            echo '<div class="menu"><img src="/inc/style/img/user.png" alt="'.filter($lgus).'"><a href="/adm/users/id/'.$row['id_user'].'"> '.filter($lgus).'</a> '.online($row['id_user']).' ('.vremja($row['time']).')';
            echo '<div class="st_1"></div><div class="st_2">
            <b>Sessiya holati</b>: '.($row['sess'] ? '<font color=gren>Faol!</font>' : '<font color=red>Faol emas!</font>').'<br/>';
            $s = ($row['success'] ==1 ? '<b><font color="green">Xa</font></b>':'<b><font color="red">Yo\'q</font></b>');
            echo "<span style='color:#000000'>Bajarildi:</span> $s<br/>";
            $meth = [1 => 'Автологин', 2 => 'Форма входа', 3 => 'COOKIE'];
         echo '<span style="color:#000000;">Kirish qo\'llanmasi:</span> '.$meth[$row['method']].' <br/>';
         echo '<b>IP</b>: '.filter2($row['ip']).'<br/> ';
            echo '<b>UA</b>: '.filter2($row['browser']).'</div></div>';
        }

        if ($k_page > 1) str('?search='.$search, $k_page, $page);

    }
    echo '<div class="menu">&bull;<a href="/adm/users"> <b>Login orqali qidirish</b></a></div><div class="menu">&bull;<a href="/adm"> <b>Boshqaruv paneli</b></a></div>';
} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>