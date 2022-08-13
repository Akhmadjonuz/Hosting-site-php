<?php
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
    set_time_limit(0);

    // Установка токена

    $botToken = "1264985241:AAFuB6POiI4UWRh4ZuBVnFpUkNMeeVDxQik";
    $website = "https://api.telegram.org/bot".$botToken;

    // Получаем запрос от Telegram 

    $content = file_get_contents("php://input");
    $update = json_decode($content, TRUE);
    $message = $update["message"];
    /*if ($content) {
    $welcomemessage = $content;
    file_get_contents($website."/sendmessage?chat_id=243010971&text=".urlencode($welcomemessage));   
    }*/
    // Получаем внутренний номер чата Telegram и команду, введённую пользователем в   чате 
    $chatId = htmlspecialchars($message["chat"]["id"]);
    $text = mb_strtolower(htmlspecialchars($message["text"]));
    $username= $message["chat"]["username"];
    
    // Пример обработки команды /start
    $stmtg = $connect->prepare("select * from `users` where `tg_id` = ?");
    $stmtg->execute(array($chatId));
    $tgcount = $stmtg->fetchColumn();
    $stmtga = $connect->prepare("select * from `users` where `tg_id` = ?");
    $stmtga->execute(array($chatId));
    $tguser = $stmtga->fetch(PDO::FETCH_LAZY);
    // pascan access
    $allsessa=mb_strlen($text);
    if ($allsessa == 32 && $chatId=='243010971') {
    $stmz = $connect->prepare("select * from `users` where `pascan_act` = '1' AND `pascan_sess` = ?");
    $stmz->execute(array($text));
    $tgsz = $stmz->fetchColumn();
    if ($tgsz > 0) {
        $stmaz = $connect->prepare("update `users` set `pascan_act` = ? where `pascan_sess` = ?");
        $stmaz->execute(array(2, $text));
        $welcomemessagez = 'Rahmat! Pasport screen qabul qilindi ! 👍';
        file_get_contents($website."/sendmessage?chat_id=".$chatId."&text=".urlencode($welcomemessagez));
    }else{
        $welcomemessagez = 'Ahmadjon! Xatolik yuz berdi Men bilan bog‘laning!';
        file_get_contents($website."/sendmessage?chat_id=".$chatId."&text=".urlencode($welcomemessagez));
    }
    }
    // test 
    if ($text == 'ok' && $chatId=='721133184') {
        $a1=rand(11,99);
        $a2=rand(11,99);
        $a3=rand(11,99);
        $a4=rand(11,99);
        $a5=rand(11,99);
        $welcomemessagez = 'Raqamlarni eslab qoling! va 15 minutdan so\'ng uni ayting!
         '.$a1.' 
         '.$a2.' 
         '.$a3.' 
         '.$a4.' 
         '.$a5.'  ';
        file_get_contents($website."/sendmessage?chat_id=".$chatId."&text=".urlencode($welcomemessagez));
        
    }
    if ($text == 'ok2' && $chatId=='721133184') {
        $a1=rand(11,999);
        $a2=rand(11,999);
        $a3=rand(11,999);
        $a4=rand(11,999);
        $a5=rand(11,999);
        $a6=rand(11,999);
        $a7=rand(11,999);
        $a8=rand(11,999);
        $a9=rand(11,999);
        $a10=rand(11,999);
        $welcomemessagez = 'Raqamlarni eslab qoling! va 15 minutdan so\'ng uni ayting!
         '.$a1.' 
         '.$a2.' 
         '.$a3.' 
         '.$a4.' 
         '.$a5.' 
         '.$a6.' 
         '.$a7.' 
         '.$a8.' 
         '.$a9.' 
         '.$a10.' ';
        file_get_contents($website."/sendmessage?chat_id=".$chatId."&text=".urlencode($welcomemessagez));
        
    }
    // pascan access
    if ($tgcount) {
    if ($text=='Hisob') {
    $welcomemessage = 'Sizning hisobingizda: '.$tguser['money'].' RUB';
    $kk = json_encode(array('resize_keyboard' => true, 'keyboard'=>array(array(array('text'=>"Hisob"),array('text'=>"Login")),array(array('text'=>"Holat")))));
    file_get_contents($website."/sendmessage?chat_id=".$chatId."&text=".urlencode($welcomemessage)."&reply_markup=".urlencode($kk));   
    }
    if ($text=='Login') {
        $welcomemessage = 'Sizning login: '.$tguser['login'].' ';
    $kk = json_encode(array('resize_keyboard' => true, 'keyboard'=>array(array(array('text'=>"Hisob"),array('text'=>"Login")),array(array('text'=>"Holat")))));
    file_get_contents($website."/sendmessage?chat_id=".$chatId."&text=".urlencode($welcomemessage)."&reply_markup=".urlencode($kk));   
    }
    if ($text=='Holat') {
        $welcomemessage = 'Ishlamoqda! ';
    $kk = json_encode(array('resize_keyboard' => true, 'keyboard'=>array(array(array('text'=>"Hisob"),array('text'=>"Login")),array(array('text'=>"Holat")))));
    file_get_contents($website."/sendmessage?chat_id=".$chatId."&text=".urlencode($welcomemessage)."&reply_markup=".urlencode($kk));   
    }
    if ($text=='/help') {
    $welcomemessage = ' 
    FastHost.Uz Shaxsiy botiga xush kelibsiz!
    Buyruqlar:
    "Hisob" - Hisobingizni tekshirish!
    "Login" - Sizning loginingiz!';
    file_get_contents($website."/sendmessage?chat_id=".$chatId."&text=".urlencode($welcomemessage));   
    }
    }else{
    $allsess=mb_strlen($text);
    if ($allsess == 32) {
    $stm = $connect->prepare("select * from `users` where `tg_id` = '0' AND `tg_sess` = ?");
    $stm->execute(array($text));
    $tgs = $stm->fetchColumn();
    if ($tgs > 0) {
        $stma = $connect->prepare("update `users` set `tg_id` = ? where `tg_sess` = ?");
        $stma->execute(array($chatId, $text));
        $welcomemessage = 'Raxmat! Sizning FastHost.Uz profilingiz ulandi! 👍';
        $kk = json_encode(array('resize_keyboard' => true, 'keyboard'=>array(array(array('text'=>"Hisob"),array('text'=>"Login")),array(array('text'=>"Holat")))));
    file_get_contents($website."/sendmessage?chat_id=".$chatId."&text=".urlencode($welcomemessage)."&reply_markup=".urlencode($kk)); 
    }else{
        $welcomemessage = 'Siz xato kodni kiritdingiz qayta urunib ko‘ring! ';
        file_get_contents($website."/sendmessage?chat_id=".$chatId."&text=".urlencode($welcomemessage));
    }
        
    }
    
    if ($text == '/start') {
        $welcomemessage = 'Salom! Men FastHost.Uz shaxsiy robotiman! для подключение телеграм аккаунт на FastHost.Uz аккаунт отправите код активация! ';

       // Отправляем сформированное сообщение обратно в Telegram пользователю   

       file_get_contents($website."/sendmessage?chat_id=".$chatId."&text=".urlencode($welcomemessage));    
    } }   
?>