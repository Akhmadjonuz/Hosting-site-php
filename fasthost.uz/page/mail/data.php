<?php

require_once($_SERVER["DOCUMENT_ROOT"]."/inc/function.php");

$row_u = $row_u ?? user($id);

// ЧС
$inMyBlacklist = $inMyBlacklist ?? in_blacklist($user['id'], $id);
$inHisBlacklist = $inHisBlacklist ?? in_blacklist($id, $user['id']);
$eachBlacklist = ($inMyBlacklist || $inHisBlacklist);

if (!isset($active)
    || !$row_u
    || $id == $user['id']
    || $eachBlacklist)
    die('ERR: YOU DO NOT HAVE ACCESS TO THIS CORRESPONDENCE!');

// Авторизация
$auth = authlog($id);
$online = online($auth);

if (!$online && $auth)
    echo '<div class="menu">Oxirgi kirish: '.daytime($auth['lasttime']).deviceIcon($auth['ua']).'</div>';

/* Сообщения */

$stmt_new_count = $connect->prepare("select count(*) from `mail` where `to` = ? and `from` = ? and `read` = ?");

// Входящие непрочитанные
$stmt_new_count->execute(array($user['id'], $id, 0));
$in_new_count = $stmt_new_count->fetchColumn();

/* Помечаем как прочитанное */

$this_page = $_GET['page'] ?? 1;

$read = $connect->prepare("update `mail` set `read` = ? where `to` = ? and `from` = ?");

if ($in_new_count) {
    if ($this_page == 1)
        $read->execute(array(1, $user['id'], $id));
    else
        echo '<div class="menu"><div class="information">Sizga xat bor! Uni o\'qish uchun birinchi sahifaga qayting.</div></div>';
}

/* Сообщения */

$stmt_count = $connect->prepare("select count(*) from `mail` where (`to` = :who and `from` = :user) or (`to` = :user and `from` = :who)");
$stmt_count->bindValue(':who', $user['id'], PDO::PARAM_INT);
$stmt_count->bindValue(':user', $id, PDO::PARAM_INT);
$stmt_count->execute();
$count = $stmt_count->fetchColumn();

if ($count == 0) {
    echo '<div class="menu"> Habar yo\'q!</div>';
} else {

    $page = new Pagination($count, 10);

    $data = $connect->prepare("select * from `mail` where `to` = :who and `from` = :user or `to` = :user and `from` = :who order by `id` desc limit :start, 10");
    $data->bindValue(':who', $user['id'], PDO::PARAM_INT);
    $data->bindValue(':user', $id, PDO::PARAM_INT);
    $data->bindValue(':start', $page->start, PDO::PARAM_INT);
    $data->execute();
    $sql = $data->fetchAll();

    foreach ($sql as $row) {

        $file = GlobFiles::findById($row['id'], GlobFiles::Files, GlobFiles::MaskMail);

        $check = ($row['from'] == $user['id']);

        $user_mail = $check ? $user : $row_u;

        $user_online = $check ? $user_auth : $auth;

        echo '<div class="menu">'.profileLink($user_mail).' ('.daytime($row['time']).') '.($row['read'] == 0 ? '<img src="/img/visibility-off.png" alt="visibility-off">' : '').'<span class="online">'.online($user_online).'</span>
        <div class="butt1">
        <a href="?cit='.$row['id'].'">Цит.</a>'.($check && $row['read'] == 0 ? '<a href="?edit='.$row['id'].'">Ред.</a>' : '').'
        </div>
        '.(!$row['text'] && !$file ? '<div class="forbidden">Bo\'sh habar!</div>' : '').
        ($row['text'] ? '<hr/>'.nl2br(smiles(bb(bbyoutube(bblinks($row['text']))))) : '').
        ($file ? previewAttachFile($file).($check ? '<a href="?file='.$row['id'].'"><img src="/img/delete.png" alt="delete"></a>' : '') : '').'
        </div>';

    }

    $page->navigation();

}