<?php
// Настройки сайта
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/dbfrean.php");
// Фильтр кукисов
if (isset($_COOKIE)) {
    foreach ($_COOKIE as $key => $value) {
        $_COOKIE[$key] = trim(stripslashes(htmlspecialchars($value, ENT_QUOTES)));
    }
}
function api_query($url) {
    $qas=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
    $sf = file_get_contents($url, false, stream_context_create($qas));
    return $sf;
}
// Ручной фильтр
function filter($str) {
    $str = trim(stripslashes(htmlspecialchars($str, ENT_QUOTES)));
    return $str;
}
// Ручной фильтр
function filteroff($str) {
    $str = trim(stripslashes(htmlspecialchars_decode($str, ENT_QUOTES)));
    return $str;
}
// Proverka IP
function ip_check($network, $ip) { 
     $ip_arr = explode('/', $network); 
     $network_long = ip2long($ip_arr[0]); 
     $x = ip2long($ip_arr[1]); 
     $mask =  long2ip($x) == $ip_arr[1] ? $x : 0xffffffff << (24 - $ip_arr[1]); 
     $ip_long = ip2long($ip); 
     return ($ip_long & $mask) == ($network_long & $mask); 
} 

// Узнаем id по логину
function uid($login) {

    global $connect;

    $strow = $connect->prepare("select * from `users` where `login` = ?");
    $strow->execute(array($login));
    $row = $strow->fetch(PDO::FETCH_LAZY);

    return $row['id'] ? $row['id'] : 0;

}

// Узнаем логин по id
function ulogin($uid) {

    global $connect;

    $strow = $connect->prepare("select * from `users` where `id` = ?");
    $strow->execute(array($uid));
    $row = $strow->fetch(PDO::FETCH_LAZY);

    return $row['login'] ? $row['login'] : false;

}
// Инфо о юзере
function user($user, $type = 0) {
    global $connect;
    if ($type == 1)
        $sql = "select * from `users` where `login` = ?";
    else
        $sql = "select * from `users` where `id` = ?";
    $result = $connect->prepare($sql);
    $result->execute(array($user));
    $row = $result->fetch(PDO::FETCH_LAZY);
    return $row ? $row : [];
}

// Определение реального браузера
$ua = $_SERVER['HTTP_USER_AGENT'];
$ip = $_SERVER['REMOTE_ADDR'];
// Определение бота по UA
if (stristr($ua, 'bot')) $bot = true;
// Подключение к БД
try {
$connect = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset=utf8', DB_USER, DB_PASS);
} catch (PDOException $e) {
die('<header>
         <table>
            <tr>
               <td class="l_bar">
<a href="/"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 style="color: white;">ZaDC.Ru</h1>
               </td>
               <td class="r_bar">
<a href="/auth" title="Kirish"><img width="23" src="/img/auth1.png" alt="Kirish | Fasthost.Uz"></a>
</td>
<td class="r_bar">
<a href="/reg" title="Ro\'yxatdan o\'tish"><img width="23" src="/img/reg1.png" alt="Ro\'yxatdan o\'tish"></a>
               </td>
            </tr>
         </table>
      </header><div class="mOm"><div class="block first"><div class="title">Texnik ta\'mirda!</div><div class="menu">На сайте ведутся технические работы!</div>
      </div><footer>
<span>&copy; Fasthost.Uz - '.date('Y').'</span>
         <span>
         </span>
      </footer>
    </div>
   </body>
</html>');
}
// Корневая папка
define('ROOT', 'http://'.$_SERVER['HTTP_HOST']);
iconv_set_encoding('internal_encoding', 'UTF-8');

// Функция фильтровки чисел
function val($str, $abs = null) {
if ($abs == null) {
return intval($str);
} else {
return abs(intval($str));
}
}

// Ссылки
function url_replace($m) {
if (!isset($m[3])) {
return '<a href="'.$m[1]. '">'.$m[2].'</a>';
} else {
return '<a href="'.$m[3].'">'.$m[3].'</a>';
}
}
// Дата и время
date_default_timezone_set('Asia/Tashkent');
// Обработка времени
function daytime($var) {
if ($var == NULL) $var = time();
$full_time = date('d.m.Y в H:i', $var);
$date = date('d.m.Y', $var);
$time = date('H:i', $var);
if ($date == date('d.m.Y')) $full_time = date('Сегодня в H:i', $var);
if ($date == date('d.m.Y', time()-60*60*24)) $full_time = date('Вчера в H:i', $var);
return $full_time;
}
// Функция отправки почты на email
function mailto($mail, $theme, $text, $str) {

    $adt = 'From: ' . $str . PHP_EOL;
    $adt .= 'X-sender: < ' . $str . ' >' . PHP_EOL;
    $adt .= 'Content-Type: text/html; charset=utf-8' . PHP_EOL;

    return mail($mail, $theme, $text, $adt);

}
// Функция генерации пароля
function gen_pass($col = 6) {
$row = 'abcdefghijklmnopqrstuvwxvzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
$str = '';
for($i= 0 ; $i < $col; $i++) {
$str.= $row[rand(0, 61)];
}
return $str;
}
// Функции извлечения настроек с базы
$systema = $connect->query("SELECT * FROM `settings`")->fetchAll();
$set = array();
foreach ($systema as $query) {
$set[$query[0]] = $query[1];
}
// Статус онлайн
function online($user){
    global $connect;
$result = $connect->prepare("SELECT * FROM `users` WHERE `login` = ?");
$result->execute(array($user));
$row = $result->fetch(PDO::FETCH_LAZY);
if ($row['lasttime'] < time() - 300) {
$online = '<img src="/img/off.png" width="13px">';
} else {
$online = '<img src="/img/on.png" width="13px">';
}
if($row['admin'] == '0'){ $dol  = ''; }
    elseif($row['admin'] == '1'){ $dol = '<font color="gren">[Тех.Подд (UZ)]</font>'; }
	elseif($row['admin'] == '2'){ $dol = '<font color="gren">[Тех.Поддежка (RU)]</font>'; }
	elseif($row['admin'] == '3'){ $dol = '<font color="red">[Соз]</font>'; }
	elseif($row['admin'] == '4'){ $dol = '<font color="red">[Соз]</font>'; }
	elseif($row['admin'] == '5'){ $dol = '<font color="red">[Соз]</font>'; }
return (empty($row)?'[On]':' '.$online.' '.$dol.'');
}

// Функция авторизации
if (isset($_COOKIE['login']) && isset($_COOKIE['pass']) && isset($_COOKIE['sess'])) {
// Proverka IP
$user = user($_COOKIE['login'], 1);
$authcheck1 = $connect->prepare("select * from `logs_user` where `sess` = ? and `browser` = ? and `id_user` = ?");
$authcheck1->execute(array($_COOKIE['sess'], $ua, $user['id']));
$logauth = $authcheck1->fetch(PDO::FETCH_LAZY);
// sess
$authcheck = $connect->prepare("select count(*) from `logs_user` where `sess` = ? and `browser` = ?");
$authcheck->execute(array($_COOKIE['sess'], $ua));

if ($logauth['ss'] == 1) {
$ipauth=ip_check($logauth['ip'].'/16', $ip);
$uauth=$authcheck->fetchColumn();
}
if ($logauth['ss'] == 2) {
$ipauth='1';
$uauth=$authcheck->fetchColumn();
}

if ($logauth['ss'] == 3) {
$ipauth='1';
$uauth='1';
}
if (empty($logauth['ss'])) {
    $ipauth='0';
    $uauth='0';
}
// auth
if ($user && $user['pass'] == $_COOKIE['pass'] && $uauth && $ipauth) {
$active = true;
// log auth
if ($logauth['ip']){
if ($logauth['ip']!=$ip) {
    if ($user['ip']!=$ip) {
$notauth=$connect->prepare("INSERT INTO `logs_user` (`id_user`, `ip`, `browser`, `time`, `success`, `method`) values (?, ?, ?, ?, ?, ?)");
$notauth->execute(array($user[id],filter($ip),filter($ua),time(),'1','3'));  
    }
}}
// Онлайн
$stmt = $connect->prepare("update `users` set `lasttime` = ?, `ip` = ?, `ua` = ?, `url` = ? where `id` = ? limit 1");
$stmt->execute(array(time(), filter($ip), filter($ua), $_SERVER['REQUEST_URI'], $user['id']));
} else {
$notauth=$connect->prepare("INSERT INTO `logs_user` (`id_user`, `ip`, `browser`, `time`, `success`, `method`) values (?, ?, ?, ?, ?, ?)");
$notauth->execute(array($user[id],filter($ip),filter($ua),time(),'0','3'));
unset($user);
session_destroy();
setcookie('login', null, time() - 3600, '/');
setcookie('pass', null, time() - 3600, '/');
setcookie('sess', null, time() - 3600, '/');

}
}
// Функции постраничной навигации
function page($k_page = 1) {
$page = 1;
if (isset($_GET['page'])) {
if ($_GET['page'] == 'end') {
$page = intval($k_page);
}
elseif(is_numeric($_GET['page'])) {
$page = intval($_GET['page']);
}
if ($page < 1) {
$page = 1;
}
if ($page > $k_page) {
$page = $k_page;
}
}
return $page;
}
function k_page($k_post = 0, $k_p_str = 10) {
if ($k_post != 0) {
$v_pages = ceil($k_post / $k_p_str);
return $v_pages;
} else {
return 1;
}
}
function navigation1($k_page = 1, $page = 1, $link = '?') {
if ($page < 1) {
$page = 1;
}
echo '<div class="menu">';
if ($page != 1) {
echo '<span class="page_ot"><a href="'.$link.'page=1">1 </a></span>';
} else {
echo '<span class="page">1 </span>';
}
for ($i =- 3; $i <= 3; $i++) {
if ($page + $i > 1 && $page + $i < $k_page) {
if ($i ==- 3 && $page + $i > 2) {
echo '<span class="page">...</span>';
}
if ($i != 0) {
echo '<span class="page_ot"><a href="'.$link.'page='.($page + $i).'"> '.($page + $i).' </a></span>';
} else {
echo '<span class="page"> '.($page + $i).' </span>';
}
if ($i == 3 && $page + $i < $k_page - 1) {
echo '<span class="page">...</span>';
}
}
}
if ($page != $k_page) {
echo '<span class="page_zh"><a href="'.$link.'page=end"> '.$k_page.' </a></span>';
}
elseif ($k_page > 1) {
echo '<span class="page"> '.$k_page.' </span>';
}
echo '</div>';
}
// Favicon
function favicon($str) {
$str = 'http://www.google.com/s2/favicons?domain='.$str;
return $str;
}


// Цены и способы оплаты
$id_shop = $set['wk_id']; // wk
$hash = $set['wk_hash']; //wk
$wpkid = $set['wpk_id']; // wpk
$wpkh = $set['wpk_hash']; //wpk
$whash = $set['hash']; // wm
$wmr3 = $set['wmr']; // wm
$su = $set['su']; // переход
$gold = $set['gold']; // gold
$color = $set['color']; // цвет

// Кол-во новостей
$count_news = $connect->query("select  count(`id`) from `news`")->fetchColumn();
// Кол-во сообщений чата
$ch = $connect->query("select count(`id`) from `guest`")->fetchColumn();


function generate_password()
  {
    $arr = array('a','b','c','d','e','f',
                 'g','h','i','j','k','l',
                 'm','n','o','p','r','s',
                 't','u','v','x','y','z',
                 'A','B','C','D','E','F',
                 'G','H','I','J','K','L',
                 'M','N','O','P','R','S',
                 'T','U','V','X','Y','Z',
                 '1','2','3','4','5','6',
                 '7','8','9','0');
    // Генерируем пароль
    $pass = "";
    for($i = 0; $i < 12; $i++)
    {
      // Вычисляем случайный индекс массива
      $index = rand(0, count($arr) - 1);
      $pass .= $arr[$index];
    }
    return $pass;
  }
  function ptime($time = NULL) {
    ini_set('date.timezone', 'Europe/Moscow');
    if ($time == NULL) $time = time();
    $full_time = date('d.m.Y', $time);
    $date = date('d.m.Y', $time);
    $timep = date('H:i', $time);
    if ($date == date('d.m.Y')) $full_time = date('H:i', $time);
    if ($date == date('d.m.Y', time()-60*60*24)) $full_time = date('Вчера, H:i', $time);
    return $full_time;
}
function str($link = '?', $k_page = 1, $page = 1) {
    if ($page < 1) $page = 1;
    echo '<div class="menu">';
    if ($page > 1) echo '<a href="'. $link .'page='. ($page - 1) .'"> &laquo; Назад</a> ';
    if ($page > 1 && $page < $k_page) echo '<span style="color:#000;">|</span>';
    if ($page < $k_page) echo ' <a href="'. $link .'&page='. ($page + 1) .'">Вперед &raquo;</a>';
    echo '<br>';
    if ($page != 1) echo '<a href="'. $link .'&page=1"><span class="unsel"> [1] </span></a>';
    else echo '<span class="sel"> [1] </span>';
    for ($ot = -3; $ot <= 3; $ot++) {
        if ($page + $ot > 1 && $page + $ot < $k_page) {
            if ($ot == -3 && $page + $ot > 3) echo " ..";
            if ($ot != 0) echo ' <a href="'. $link .'&page='. ($page + $ot) .'"><span class="unsel"> ['. ($page + $ot) .'] </span></a>';
            else echo ' <span class="sel"> ['. ($page + $ot) .'] </span>';
            if ($ot == 3 && $page + $ot < $k_page - 1) echo ' ..';
        }
    }
    if ($page != $k_page) echo ' <a href="'. $link .'&page=end"><span class="unsel"> ['. $k_page .'] </span></a>';
    elseif ($k_page > 1) echo ' <span class="sel"> ['. $k_page .'] </span>';
    echo '</div>';
}
function order_day($work,$return_number = false)
{
$f = ($work-time())/(3600*24);
if($f<0)$day='<span style="color:red">0</span>';
elseif($f<1)$day='<span style="color:red">'.round($f,2).'</span>';
else $day='<span style="color:green">'.round($f,2).'</span>';

if ($return_number === true) {
    return round($f,2);
}
return $day;
}
function vremja($time = NULL) {
if(!$time) $time = time();
$data = date('j.n.y', $time);
if($data == date('j.n.y')) $res = 'Сегодня в '. date('G:i', $time);
elseif($data == date('j.n.y', time() - 86400)) $res = 'Вчера в '. date('G:i', $time);

else {
$m = array('0','Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн', 'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек');
$res = date('j '. $m[date('n', $time)] .' Y в G:i', $time);
}
return $res;
}

// Reg logs!
if($user){
$zap1 = '-------------------------
US: '.$user['login'].'
IP: '.$_SERVER['REMOTE_ADDR'].'
ZA: '.$_SERVER['REQUEST_URI'].'
';
$f=fopen($_SERVER["DOCUMENT_ROOT"].'/inc/logs/logsusers.txt','a+');
fputs($f,''.$zap1.' ');
fclose($f);
}else{
    if ($ip!='163.172.10.213') {
    $zap1 = '-------------------------
IP: '.$_SERVER['REMOTE_ADDR'].'
ZA: '.$_SERVER['REQUEST_URI'].'
';
$f=fopen($_SERVER["DOCUMENT_ROOT"].'/inc/logs/logsguests.txt','a+');
fputs($f,''.$zap1.' ');
fclose($f);
}}
// Parolni tiklash sessiyalarni 20 menutdan keyin o'chirish!
$connect->query("DELETE FROM `forgot` WHERE `time`+'1200' < '".time()."'");

$connect->query("DELETE FROM `guests` WHERE `time`+'259200' < '".time()."'");
/*if(!$user){
$strow1 = $connect->prepare("select * from `guests` where `ip` = ? and `browser` = ?");
$strow1->execute(array($_SERVER['REMOTE_ADDR'], filter2($_SERVER['HTTP_USER_AGENT'])));
$guest = $strow1->fetch(PDO::FETCH_LAZY);

//System Guests
if($guest){
$stmtnan = $connect->prepare("update `guests` set `time` = ?, `url` = ? where `ip` = ? and `browser` = ?");
$stmtnan->execute(array(time(), filter2($_SERVER['REQUEST_URI']), $_SERVER['REMOTE_ADDR'], filter2($_SERVER['HTTP_USER_AGENT'])));
}else{
$stmtvd = $connect->prepare("insert into `guests` set `ip` = ?, `time` = ?, `browser` = ?, `url` = ?");
$stmtvd->execute(array($_SERVER['REMOTE_ADDR'], time(), filter2($_SERVER['HTTP_USER_AGENT']), filter2($_SERVER['REQUEST_URI'])));
}
}*/
function encode($var){
	return base64_encode(urlencode($var));
}
function decode($var){
	return htmlspecialchars(urldecode(base64_decode($var)),ENT_QUOTES,'UTF-8');
}

?>