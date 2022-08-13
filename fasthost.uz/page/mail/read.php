<?php
$title = 'Yozishmalar';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active)) {

    $row_u = user($id);

    // ЧС
    $inMyBlacklist = in_blacklist($user['id'], $id);
    $inHisBlacklist = in_blacklist($id, $user['id']);
    $eachBlacklist = ($inMyBlacklist || $inHisBlacklist);

    if ($row_u &&
        $id != $user['id'] &&
        !$eachBlacklist) {

        echo '<div class="title">Yozishmalar<span class="white-right-block-txt">'.profileLink($row_u).'</span></div>';

        if (privateMail($row_u, $user['id'])) {

            SmilesAndBB();

            $in_mail = $connect->prepare("insert into `mail` set `time` = ?, `from` = ?, `to` = ?, `text` = ?");
            $strow = $connect->prepare("select * from `mail` where `id` = ?");

            if (isset($_GET['file'])) {
                $strow->execute(array($_GET['file']));
                $row = $strow->fetch();
                $file = GlobFiles::findById($_GET['file'], GlobFiles::Files, GlobFiles::MaskMail);
                if ($row && $row['from'] == $user['id'] && $row['to'] == $id && $file) {
                    if (isset($_POST['yes'])) {
                        unlink($file);
                        header('Location: /mail/read/'.$id);
                    }
                    elseif (isset($_POST['no'])) {
                        header('Location: /mail/read/'.$id);
                    }
                    echo '<div class="menu">
                    <form action="" method="POST">
                    <input type="submit" name="yes" value="Faylni o\'chirish ('.basename($file).')"/>
                    <input type="submit" name="no" value="Bekor qilish"/>
                    </form></div>';
                } else {
                    header('Location: /mail/read/'.$id);
                }
            } 
            elseif (isset($_GET['edit'])) {
                $strow->execute(array($_GET['edit']));
                $row = $strow->fetch();
                if ($row && $row['read'] == 0 && $row['from'] == $user['id'] && $row['to'] == $id) {
                    $file = GlobFiles::findById($_GET['edit'], GlobFiles::Files, GlobFiles::MaskMail);
                    if (isset($_POST['yes'])) {
                        $error = '';
                        if (empty($_POST['text'])) {
                            $error.= 'Habarni kiriting!<br/>';
                        }
                        elseif (mb_strlen($_POST['text']) < 2 || mb_strlen($_POST['text']) > 25000) {
                            $error.= 'Matn kamida 2 ta belgidan iborat bo\'lishi kerak va 25000 belgidan oshmasligi kerak!<br/>';
                        }
                        if (file_exists($_FILES['filename']['tmp_name'])) {
                            if (!BeforeUpload::AttachFile($_FILES['filename'])) {
                                $error.= 'Xato format!<br/>';
                            }
                            if ($_FILES['filename']['size'] > $sys['system']['upload_mail']) {
                                $error.= 'Faylning maksimal hajmi - '.byte_conv($sys['system']['upload_mail']).'!<br/>';
                            }
                        }
                        if ($error) {
                            echo '<div class="menu">'.$error.'</div>';
                        } else {
                            $stmt = $connect->prepare("update `mail` set `text` = ? where `id` = ?");
                            if ($stmt->execute(array($_POST['text'], $_GET['edit']))) {
                                // Загрузка файла
                                if (file_exists($_FILES['filename']['tmp_name'])) {
                                    $files = $_GET['edit']."_mail_".random_int(11111, 99999)."_".$_FILES['filename']['name'];
                                    move_uploaded_file($_FILES['filename']['tmp_name'], $_SERVER["DOCUMENT_ROOT"]."/files/".$files);
                                    if ($file)
                                        unlink($file);
                                }
                                header('Location: /mail/read/'.$id);
                            } else {
                                echo '<div class="menu">Xatolik yuzaga keldi!</div>';
                            }
                        }
                    }
                    elseif (isset($_POST['no'])) {
                        header('Location: /mail/read/'.$id);
                    }
                    echo '<div class="menu">
                    <form action="" method="POST" enctype="multipart/form-data">
                    Сообщение:<br/><textarea id="message" name="text" rows="5" cols="25">'.$row['text'].'</textarea><br/>
                    Прикрепить файл:<br/><input type="file" name="filename"><br/>
                    '.($file ? 'Старый файл: '.iconFile($file).'<a data-noajax href="/files/'.basename($file).'">'.basename($file).'</a> ('.get_filesize($file).')<br/>' : '').'
                    <input type="submit" name="yes" value="Saqlash ('.intval($_GET['edit']).')"/>
                    <input type="submit" name="no" value="Bekor qilish"/>
                    </form></div>';
                } else {
                    header('Location: /mail/read/'.$id);
                }
            }
            elseif (isset($_GET['cit'])) {
                $strow->execute(array($_GET['cit']));
                $row = $strow->fetch();
                if ($row) {
                    $file = GlobFiles::findById($row['id'], GlobFiles::Files, GlobFiles::MaskMail);
                    $cit = str_replace(['[cit]', '[/cit]'], null, '[u]'.($row['from'] == $user['id'] ? $user['login'] : $row_u['login']).'[/u] ('.date('d.m.Y H:i', $row['time']).')'.($row['text'] ? '[br]'.$row['text'] : '').($file ? '[br]Файл: [url='.ROOT.'/files/'.basename($file).']'.basename($file).'[/url] ('.get_filesize($file).')' : ''));
                    if (isset($_POST['yes'])) {
                        $error = '';
                        if ($user['datereg'] > time() - 60 * $sys['system']['fludtime'] && $adm_id == 0) {
                            $error.= 'Ro\'yxatdan o\'tish paytidan boshlab xabarlarni yuborish imkoniyatiga ega bo\'lish uchun: '.restime(60 * $sys['system']['fludtime']).'!<br/>';
                        } else {
                            if (mb_strlen($_POST['text']) > 25000) {
                                $error.= 'Matnda 25000 belgidan oshmasligi kerak!<br/>';
                            }
                            if (file_exists($_FILES['filename']['tmp_name'])) {
                                if (!BeforeUpload::AttachFile($_FILES['filename'])) {
                                    $error.= 'Xato format!<br/>';
                                }
                                if ($_FILES['filename']['size'] > $sys['system']['upload_mail']) {
                                    $error.= 'Faylning maksimal hajmi - '.byte_conv($sys['system']['upload_mail']).'!<br/>';
                                }
                            }
                        }
                        if ($error) {
                            echo '<div class="menu">'.$error.'</div>';
                        } else {
                            $message = '[cit]'.$cit.'[/cit][br]'.$_POST['text'];
                            if ($in_mail->execute(array(time(), $user['id'], $id, $message))) {
                                // Загрузка файла
                                if (file_exists($_FILES['filename']['tmp_name'])) {
                                    $lid = $connect->LastInsertId();
                                    $files = $lid."_mail_".random_int(11111, 99999)."_".$_FILES['filename']['name'];
                                    move_uploaded_file($_FILES['filename']['tmp_name'], $_SERVER["DOCUMENT_ROOT"]."/files/".$files);
                                }
                                // Добавляем в контакты
                                contact_add($user['id'], $id);
                                // Очки дружбы
                                friendPoint($user['id'], $id);
                                header('Location: /mail/read/'.$id);
                            } else {
                                echo '<div class="menu">Xatolik yuzaga keldi!</div>';
                            }
                        }
                    }
                    elseif (isset($_POST['no'])) {
                        header('Location: /mail/read/'.$id);
                    }
                    echo '<div class="menu">
                    <form action="" method="POST" enctype="multipart/form-data">
                    <div class="cit">'.nl2br(smiles(bb(bblinks($cit)))).'</div>
                    Сообщение:<br/><textarea id="message" name="text" rows="5" cols="25"></textarea><br/>
                    Прикрепить файл:<br/><input type="file" name="filename"><br/>
                    <input type="submit" name="yes" value="Iqtibos qilish uchun ('.intval($_GET['cit']).')"/>
                    <input type="submit" name="no" value="Bekor qilish"/>
                    </form></div>';
                } else {
                    header('Location: /mail/read/'.$id);
                }
            } else {
                if (isset($_POST['addmess'])) {
                    $error = '';
                    if ($user['datereg'] > time() - 60 * $sys['system']['fludtime'] && $adm_id == 0) {
                        $error.= 'Ro\'yxatdan o\'tish paytidan boshlab xabarlarni yuborish imkoniyatiga ega bo\'lish uchun: '.restime(60 * $sys['system']['fludtime']).'!<br/>';
                    } else {
                        if (empty($_POST['text']) && !file_exists($_FILES['filename']['tmp_name'])) {
                            $error.= 'Habarni kiriting!<br/>';
                        }
                        elseif (!empty($_POST['text']) && (mb_strlen($_POST['text']) < 2 || mb_strlen($_POST['text']) > 25000)) {
                            $error.= 'Matn kamida 2 ta belgidan iborat bo\'lishi kerak va 25000 belgidan oshmasligi kerak!<br/>';
                        }
                        if (file_exists($_FILES['filename']['tmp_name'])) {
                            if (!BeforeUpload::AttachFile($_FILES['filename'])) {
                                $error.= 'Xato format!<br/>';
                            }
                            if ($_FILES['filename']['size'] > $sys['system']['upload_mail']) {
                                $error.= 'Faylning maksimal hajmi - '.byte_conv($sys['system']['upload_mail']).'!<br/>';
                            }
                        }
                    }
                    if ($error) {
                        echo '<div class="menu">'.$error.'</div>';
                    } else {
                        if ($in_mail->execute(array(time(), $user['id'], $id, $_POST['text']))) {
                            // Загрузка файла
                            if (file_exists($_FILES['filename']['tmp_name'])) {
                                $lid = $connect->LastInsertId();
                                $files = $lid."_mail_".random_int(11111, 99999)."_".$_FILES['filename']['name'];
                                move_uploaded_file($_FILES['filename']['tmp_name'], $_SERVER["DOCUMENT_ROOT"]."/files/".$files);
                            }
                            // Добавляем в контакты
                            contact_add($user['id'], $id);
                            // Очки дружбы
                            friendPoint($user['id'], $id);
                            header('Location: /mail/read/'.$id);
                        } else {
                            echo '<div class="menu">Xabarni qo\'shishda xato!</div>';
                        }
                    }
                }
                echo '<div class="menu">
                <form action="" method="POST" enctype="multipart/form-data">
                Сообщение:<br/><textarea id="message" name="text" rows="5" cols="25"></textarea><br/>
                Прикрепить файл:<br/><input type="file" name="filename"><br />
                <input type="submit" name="addmess" value="Yozish"/>
                </form></div>';
            }
        } else {
            echo '<div class="menu">Ushbu foydalanuvchiga faqat do\'stlar xabar yuborishi mumkin!</div>';
        }

        /* Сообщения */

        echo '<div id="ajaxMail" data-user="'.$id.'" data-page-num="'.($_GET['page'] ?? 1).'">';

            include("data.php");

        echo '</div>';

    } else {
        header('Location: /mail');
    }
} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>