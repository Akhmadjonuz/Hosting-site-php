<?php
$title = 'Hisob';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if ($adm_id == 5) {

    $row = user($id);

    if ($row) {
        echo '<div class="title">Hisob: '.filter($row['login']).' '.online($id).'  </div>';
        echo '<div class="menu">'.($row['ban'] > time() ? '<font color=red><center><b>Foydalanuvchi blocklangan, blockdan chiqish sanasi: '.date('d.m.Y H:i', $row['ban']).'!</b></center></font>' : '').'
        
        <b>Oxirgi tashrif</b>: '.vremja($row['lasttime']).'<br/>
        <b>Ro\'yxaga olingan sana</b>: '.vremja($row['datereg']).'<br/>
        <b>ID</b>: <font color="aqua">'.$row['id'].'</font>
        </div>';
        echo '<div class="title">INFO</div>';
        echo '<div class="menu">';
$ontarif = $connect->prepare("select * from `tarifs_hosting` where `id` = ?");
$ontarif->execute(array($row['id_tarif']));
$ustarif = $ontarif->fetch(PDO::FETCH_LAZY);
$usm=$row[money];
$tcm=$ustarif['price_day'];
if ($tcm == 0) {$k='0';}else{
for ($k=0;$tcm <=$usm;$k++){
    $usm=$usm-$tcm;
}
}
if ($k >= 1) {
    $allc = 86400 * $k;
}else{$allc='0';}
if ($row['activ'] >= 2) {
echo '<b>Qolgan kunlar</b>: <font color="aqua">'.order_day(($row['time_work'] + $allc)).'</font> (Ushbu sanagacha aktiv: '.vremja(($row['time_work'] + $allc)).' )<br/>
'.(order_day($row['time_work'],true) < 0.01 ? '<font color="red"><b>Hisob o\'chishiga qoldi</b>: '.order_day(($row['time_work'] + (84600 * 7))).' Kun. </font><br/>' : '').' ';}
echo '<b>Tarif: </b>'.$ustarif['name'].' (<font color="aqua">'.$ustarif['price_day'].'</font> So\'m/kun)</b><br/>';
echo '</div>';
if (empty($id==1)) {
            echo '<div class="title"><b>Boshqaruv paneli</b></div>';

            if (isset($_GET['edit'])) {
                if (isset($_POST['cancel'])) {
                    header('Location: /adm/users/id/'.$id);
                }
                elseif (isset($_POST['red'])) {
                    $error = '';
                    if (!is_numeric($_POST['rating'])) {
                        $error.= 'Faoliyat noto\'g\'ri!<br/>';
                    } 
                    if (empty($_POST['email'])) {
                        $error.= 'Elektron pochta satrini kiritish shart!<br/>';
                    }
                    elseif (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                        $error.= 'E-pochta maydoni noto‘g‘ri!<br/>';
                    }elseif ($_POST['accesstos'] < 1 && $_POST['accesstos'] > 2) {
                        $error.= ' '.$_POST['accesstos'].' O\'zgartirish maydoniga kirish tarifi noto\'g\'ri to\'ldirilgan!<br/>';
                    }elseif ($_POST['accesstosm'] < 1 && $_POST['accesstosm'] > 2) {
                        $error.= 'Pul o\'tkazmalariga kirish uchun maydon noto\'g\'ri to\'ldirilgan!<br/>';
                    }
                    if (empty($_POST['wmr'])) {
                        $error.= 'Tasdiqlash kodini kiriting!<br/>';
                    }
                    if (!empty($error)) {
                        echo '<div class="menu"><center><font color="red">'.$error.'</font></center></div>';
                    } else {
                        $stmt = $connect->prepare("update `users` set `test` = ?, `wmr` = ?, `email` = ?, `accesstos` = ?, `accesstosm` = ? where `id` = ?");
                        if ($stmt->execute(array($_POST['rating'], $_POST['wmr'], $_POST['email'], $_POST['accesstos'], $_POST['accesstosm'], $id))) {
                            header('Location: /adm/users/id/'.$id);
                        } else {
                            echo '<div class="menu"><center><font color="red">Xatolik yuzaga keldi!</font></center></div>';
                        }
                    }
                }
                echo '<div class="menu">
                <form action="" method="POST">
                <b>Активность</b>:<br/><input type="text" name="rating" value="'.$row['test'].'"><br/>
                <b>E-mail</b>:<br/><input type="email" name="email" value="'.$row['email'].'"><br/>
                <b>Код Активатция</b>:<br/><input type="text" name="wmr" value="'.$row['wmr'].'"><br/> 
                <b>Доступ к Смена Тариф</b>:<br/><select name="accesstos">';
                if ($row['accesstos'] == 2){
                    echo '<option value="2">Yoniq</option>'; 
                    echo '<option value="1">O\'chirilgan</option>';
                }else{
                    echo '<option value="1">O\'chirilgan</option>';
                    echo '<option value="2">Yoniq</option>';
                }
                echo '</select><br/> 
                <b>Доступ к Передать деньги</b>:<br/><select name="accesstosm">';
                if ($row['accesstosm'] == 2){
                    echo '<option value="2">Yoniq</option>'; 
                    echo '<option value="1">O\'chirilgan</option>';
                }else{
                    echo '<option value="1">O\'chirilgan</option>';
                    echo '<option value="2">Yoniq</option>';
                }
                echo '</select><br/> 
                <input class="btn btn-default" type="submit" name="red" value="Saqlash">
                <input class="btn btn-default" type="submit" name="cancel" value="Bekor qilish">
                </form></div>';
            }
            $accv = true;
            if (isset($_GET['adm']) && $id != $user['id'] && $accv) {
                if (isset($_POST['cancel'])) {
                    header('Location: /adm/users/id/'.$id);
                }
                elseif (isset($_POST['ok'])) {
                    $stmt = $connect->prepare("update `users` set `admin` = ? where `id` = ?");
                    if ($stmt->execute(array($_POST['status'], $id))) {
                        header('Location: /adm/users/id/'.$id);
                    } else {
                        echo '<div class="menu"><center><font color="red"> Xatolik yuzaga keldi!</font></center></div>';
                    }
                }
                echo '<div class="menu">
                <form action="" method="POST">
                <b>Статус</b>:<br/><select name="status">';
                foreach ($admList as $key => $value)
                    echo '<option value="'.$key.'">'.$value.'</option>'; 
                echo '</select><br/> 
                <input class="btn btn-default" type="submit" name="ok" value="Berish(@Akhmadjon\'dan ruxsat oling!)">
                <input class="btn btn-default" type="submit" name="cancel" value="Bekor qilish">
                </form></div>';
            } 
            elseif (isset($_GET['ban']) && $id != $user['id']) {
                $ban = $connect->prepare("update `users` set `ban` = ? where `id` = ?"); 
                if ($row['ban'] > time()) {
                    if (isset($_POST['cancel'])) {
                        header('Location: /adm/users/id/'.$id);
                    }
                    elseif (isset($_POST['ok'])) {
                        if ($ban->execute(array(0, $id))) {
                            header('Location: /adm/users/id/'.$id);
                        } else {
                            echo '<div class="menu"><center><font color="red">Xatolik yuzaga keldi!</font></center></div>';
                        }
                    } 
                    echo '<div class="menu">
                    <form action="" method="POST">
                    <input class="btn btn-default" type="submit" name="ok" value="Hisobni blokdan chiqarish">
                    <input class="btn btn-default" type="submit" name="cancel" value="Bekor qilish">
                    </form></div>';
                } else {
                    if (isset($_POST['cancel'])) {
                        header('Location: /adm/users/id/'.$id);
                    }
                    elseif (isset($_POST['ok'])) {
                        $error = '';
                        if (empty($_POST['col'])) {
                            $error.= 'Soatlar sonini kiriting!<br/>';
                        } 
                        if (!empty($error)) {
                            echo '<div class="menu"><center><font color="red">'.$error.'</font></center></div>';
                        } else {
                            $col = intval(abs($_POST['col']));
                            $time = $col * 3600 + time(); 
                            if ($ban->execute(array($time, $id))) {
                                header('Location: /adm/users/id/'.$id);
                            } else {
                                echo '<div class="menu"><center><font color="red">Xatolik yuzaga keldi!</font></center></div>';
                            }
                        }
                    }
                    echo '<div class="menu">
                    <form action="" method="POST">
                    <b>Количество часов</b>:<br/><input type="text" name="col" maxlength="10"/><br/>
                    <input class="btn btn-default" type="submit" name="ok" value="Hisobni blocklash">
                    <input class="btn btn-default" type="submit" name="cancel" value="Bekor qilish">
                    </form></div>';
                }
            }
            elseif (isset($_GET['del']) && $id != $user['id']) {
                if (isset($_POST['cancel'])) {
                    header('Location: /adm/users/id/'.$id);
                } 
                elseif (isset($_POST['yes'])) {

                    // Удаляем юзера
                    $del = $connect->prepare("delete from `users` where `id` = ?");
                    // Удаляем сообщения
                    $del_mail = $connect->prepare("delete from `note` where `id_user` = :user");
                    // Чистим логи авторизаций
                    $del_authlog = $connect->prepare("delete from `logs_user` where `id_user` = ?");
                    // Чистим плюсы/минусы
                    $del_respect = $connect->prepare("delete from `logs_money` where `id_user` = ?");
                    // Tiket
                    $del_tiket = $connect->prepare("delete from `tickets` where `id_user` = ?");
                    $del_tiket_msg = $connect->prepare("delete from `tickets_msg` where `id_user` = ?");

                    if ($del->execute(array($id)) && $del_mail->execute(array(':user' => $id)) && $del_authlog->execute(array($id)) && $del_respect->execute(array($id)) && $del_tiket->execute(array($id)) && $del_tiket_msg->execute(array($id))) {
                        header('Location: /adm/users');
                    } else {
                        echo '<div class="menu"><center><font color="red">Xatolik yuzaga keldi!</font></center></div>';
                    }
                }

                echo '<div class="menu">
                <form action="" method="POST">
                <input class="btn btn-default" type="submit" name="yes" value="Hisobni o\'chirish"/> 
                <input class="btn btn-default" type="submit" name="cancel" value="Bekor qilish"/>
                </form></div>';
            }
            elseif (isset($_GET['cleartg'])) {
                if (isset($_POST['cancel'])) {
                    header('Location: /adm/users/id/'.$id);
                } 
                elseif (isset($_POST['yes'])) {

                    $infom = user($id);
                    if ($infom[tg_id]) {
                        $sesss=md5($time);
                        $sql122 = $connect->prepare("UPDATE `users` SET `tg_id` = ?, `tg_sess` = ? WHERE `id` = ?");
                        $sql122->execute(array('0', $sesss, $id));
                        header('Location: /adm/users/id/'.$id);
                       }else {
                         echo '<div class="menu"><center><font color="red">Xatolik yuzaga keldi!</font></center></div>';  
                       }
                    
                }

                echo '<div class="menu">
                <form action="" method="POST">
                <input class="btn btn-default" type="submit" name="yes" value="Сброс TG Аккаунт"/> 
                <input class="btn btn-default" type="submit" name="cancel" value="Bekor qilish"/>
                </form></div>';
            }
            elseif (isset($_GET['clearsess'])) {
                if (isset($_POST['cancel'])) {
                    header('Location: /adm/users/id/'.$id);
                } 
                elseif (isset($_POST['yes'])) {
                    $reset = $connect->prepare("update `authlog` set `status` = '0' where `uid` = ?");
                    if ($reset->execute(array($id))) {
                    header('Location: /adm/users/id/'.$id);
                    } else {
                    echo '<div class="err">Xatolik yuzaga keldi!</div>';
                    }
                }

                echo '<div class="menu">
                <form action="" method="POST">
                <input class="btn btn-default" type="submit" name="yes" value="Loginni bekor qilish"/> 
                <input class="btn btn-default" type="submit" name="cancel" value="Bekor qilish"/>
                </form></div>';
            }
            elseif (isset($_GET['authcp'])) {
                if (isset($_POST['cancel'])) {
                    header('Location: /adm/users/id/'.$id);
                } 
                elseif (isset($_POST['yes'])) {
                        header('Location: /authcp/accessadm/'.$id);
                }

                echo '<div class="menu">
                <form action="" method="POST">
                <input class="btn btn-default" type="submit" name="yes" value="Panelga kirish"/> 
                <input class="btn btn-default" type="submit" name="cancel" value="Bekor qilish"/>
                </form></div>';
            }

if ($row[activ]==0) {$c1='<font color="red">Hisob faol emas!</font> (0)';}
if ($row[activ]==1) {$c1='<font color="red">Hisob faol emas!</font>(1)';}
if ($row[activ]==2) {$c1='<font color="aqua">Hisob faol!</font>(2)';}
if ($row[activ]==3) {$c1='<font color="red">Hisob o\'chirilgan!</font>(3)';}
if ($row[activ]==4) {$c1='<font color="red">Hisob blocklangan!</font>(4)';}
if (empty($c1)) {$c1='Error';}
            echo '<div class="menu">
            <b>Balans</b>: <font color="aqua">'.$row['money'].'</font> <b>So\'m</b><br/>
            <b>Holat</b>: ['.$c1.']<br/>
            <b>Tasdiqlash kodi</b>: <font color="aqua">'.$row['wmr'].'</font><br/>
            <b>Pochta holati</b>: '.($row['test'] == 2 ? '<font color=aqua>Faol!</font>' : '<font color=red>Faollashtirilmagan!</font>').'<br/>
            <b>Pochta</b>: <font color="aqua">'.filter2($row['email']).'</font><br/>
            <b>Kirish</b>: <br/>
            <b>Telegram</b>: '.(empty($row['tg_id']) ? 'None' : $row['tg_id']).'<br/>
            <div class="butt2">
            '.($id != $user['id'] ? '<a href="?del"> <font color="red">[O\'chirish]</font> </a>
            <a href="?adm"> <font color="aqua">[Pagon berish]</font> </a> <a href="?ban">'.($row['ban'] > time() ? '<font color="aqua"> [Ochish..]</font> ' : ' <font color="red">[Yopish..]</font> ').'</a>
            ' : '').'
            <a href="?edit"> <font color="yellow">[O\'zgartirish]</font></a>
            '.($row['tg_id'] ? '<a href="?cleartg"> <font color="red">[TG bekor qilish]</font></a>' : '').'
            <a href="?clearsess"> <font color="red">[Sessiya bekor qilish]</font></a>
            <a href="?authcp"> <font color="pink">[Panelga kirish]</font></a>
            </div>
            </div>'; // <a href="?adm"> [Должность] </a>
            
}else{echo '<div class="menu">OOPS</div>';}
echo '<div class="menu">&bull;<a href="/adm/users"> Orqaga</a></div>';
    } else {
        header('Location: /adm/users');
    }
} else {
    header('Location: /?404');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>