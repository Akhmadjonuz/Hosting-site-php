<?php
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/function.php");
if ($user['admin'] >= 1) {
$search = $_POST['search_term'] ? $_POST['search_term'] : false;
$keywords = preg_replace("/[\s,]+/", "|", $search);
$stmt_num = $connect->prepare("select count(*) from `users` where `login` rlike :keywords");
    $stmt_num->bindValue(':keywords', $keywords);
    $stmt_num->execute();
    $count_res = $stmt_num->fetchColumn();

    if ($count_res == 0) {
        echo '<center><font color="red">Bunday Login yo\'q</font></center>';
    }else{

        $data = $connect->prepare("select * from `users` where `login` rlike :keywords order by `id` desc");
        $data->bindValue(':keywords', $keywords);
        //$data->bindValue(':start', $start, PDO::PARAM_INT);
        $data->execute();
        $sql = $data->fetchAll();
        foreach ($sql as $row) {
            echo  '<img src="/inc/style/img/user.png" alt="'.filter($row['login']).'"><a href="/adm/users/id/'.$row['id'].'"> <font color="aqua"><b>'.filter($row['login']).' </b></font> '.online($row['login']).'</a><br/>';
        }
}
}else{
    echo 'Error';
}
?>