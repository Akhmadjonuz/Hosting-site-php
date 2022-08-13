<?php
//-----Подключаем функции-----//
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
$server = 'localhost';
if(isset($active) == true && isset($user) && $user['activ'] == 2)
{
$serv=@ftp_connect($server);
$login=@ftp_login($serv,$user['isp_login'],$user['isp_pass']);
if(!$serv){$error='<div class="err">Serverga ulanib bo\'lmadi!</div>';}
elseif(!$login){
    if (isset($_SESSION[err]) && $_SESSION[err] == 2){
        $error='<div class="err">Попробуйте еще раз!</div>';
    }else{
    $qas=array("ssl"=>array("verify_peer"=>false,"verify_peer_name"=>false,),);
    file_get_contents("https://188.165.252.88:1500/ispmgr?authinfo=".urlencode($user['isp_login']).":".urlencode($user['isp_pass'])."&out=xml&func=ftp.user.edit&elid=".urlencode($user['isp_login'])."&passwd=".urlencode($user['isp_pass'])."&sok=yes", false, stream_context_create($qas));
    file_get_contents("https://188.165.252.88:1500/ispmgr?func=ftp.user.resume&elid=".urlencode($user['isp_login'])."&out=xml&authinfo=".urlencode($user['isp_login']).":".urlencode($user['isp_pass']), false, stream_context_create($qas));
    $_SESSION[err] = ($_SESSION[err] + 1);
    header('Location: /mgr/index.php');
    } 
}
if(empty($error)){
$savedir=$server.'-'.$user['isp_login'];
if(!is_dir('tmp/'.$savedir)) mkdir('tmp/'.$savedir,0777); chmod('tmp/'.$savedir,0777);
}else{
if ($_SERVER['PHP_SELF'] != '/mgr/index.php'){
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
title($title);
}
err($error);
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
exit();
}
}else{
if ($_SERVER['PHP_SELF'] != '/mgr/index.php'){
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
title($title);
}
err('<div class="err">Avtorizatsiya xatosi. Hisobingiz faol bo\'lmasligi mumkin!</div>');
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
exit();
}
?>