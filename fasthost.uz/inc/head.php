<?php
list($msec,$sec)=explode(chr(32),microtime());
$headtime=$sec+$msec;
// ошибки php
ini_set('error_reporting', 'Off');
ini_set('display_errors', 'off');
ini_set('display_startup_errors', 'off');
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/function.php");
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/CSRF-secure.php");
// заголовок
$title = empty($title) ? 'Fasthost.Uz | Kabinet' : $title; 
echo '<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="theme-color" content="#5d80a6">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="apple-touch-icon-precomposed" href="/inc/style/img/app-icon.png">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="google-site-verification" content="ndT7J9Btq1oXi7JXCdbBO7oS9GKuEIbSpalVhLmrD20" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/inc/style/style.css" rel="stylesheet">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/function.js"></script>
<script src="/js/jquery.ajaxRequest.js"></script>
<script src="/js/jquery.timers.min.js"></script>
<script src="/js/jquery.plugins.js"></script>
<script src="/js/function.js"></script>
<script src="/js/main.ajaxRequest.js"></script>';
?>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-7682173561474212",
    enable_page_level_ads: true
  });
</script>
<?
echo '<meta name="keywords" content="Hosting, kunlik to\'lov, Fasthost.Uz Mobile Hosting, Mobil xosting, Fasthost.Uz , php 7, ffmpeg, GD, (pdo) MySQL (i), sqlite, Curl, IonCube, php versiyasini tanlash!"/>
<meta name="description" content="Fasthost.Uz hosting, kechayu-kunduz qo\'llab-quvvatlaydigan yuqori sifatli mobil veb-sayt. Osiyoda ishonchli Linux hosting [By @PCOUZ Team, #Akhmadjon]"/> 
<meta name="author" content="Dadabayev Akhmadjon"/>
<meta name="copyright" content="Telegram @pcouz!"/>
<meta http-equiv="content-language" content="ru"/>
<title>'.$title.'</title></head><body>';
// системное


$id = isset($_GET['id']) ? val($_GET['id'], 1) : false;
$act = isset($_GET['act']) ? $_GET['act'] : false;
$adm_id = isset($user['admin']) ? val($user['admin']) : false;
$search = $_GET['search'] ? $_GET['search'] : false;
$time = time();
$_SESSION['tok'] = rand(1111,9999);
// работа сайта
if ($set['close'] == 2 && $adm_id == false) exit('<header>
         <table>
            <tr>
               <td class="l_bar">
<a href="/"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo"><font color="yellow"><b>
                 Fasthost.Uz </b></font></h1>
               </td>
               <td class="r_bar">
<a href="/auth" title="Kirish"><img width="23" src="/img/auth1.png" alt="Kirish | Fasthost.Uz "></a>
</td>
<td class="r_bar">
<a href="/reg" title="Ro\'yxatdan o\'tish"><img width="23" src="/img/reg1.png" alt="Ro\'yxatdan o\'tish | Fasthost.Uz "></a>
               </td>
            </tr>
         </table>
      </header><div class="mOm"><div class="block first"><div class="title">Texnik ta\'mirlash!</div><div class="menu">На сайте ведутся технические работы!</div>
      </div><footer>
<span>&copy; <b>Fasthost.Uz </b> - '.date('Y').'</span>
         <span>
         </span>
      </footer>
    </div>
   </body>
</html>');
// 404
if (isset($_GET['404'])) exit('<header>
         <table>
            <tr>
               <td class="l_bar">
<a href="/"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo">
                 Fasthost.Uz </h1>
               </td>
            </tr>
         </table>
      </header><div class="mOm"><div class="block first"><div class="menu"><center><h1><font color="red">Error #404</font></h1></center></div></div><footer>
<span>&copy; Fasthost.Uz - '.date('Y').'</span>
         <span>
         </span>
      </footer>
    </div>
   </body>
</html>'.header( 'Refresh: 2; url=/' ).'');
if (isset($_GET['403'])) exit('<header>
         <table>
            <tr>
               <td class="l_bar">
<a href="/"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo"><font color="yellow">
                 Fasthost.Uz </font></h1>
               </td>
            </tr>
         </table>
      </header><div class="mOm"><div class="block first"><div class="menu"><center><h1><font color="red">Error #403</font></h1></center></div></div><footer>
<span>&copy; Fasthost.Uz - '.date('Y').'</span>
         <span>
         </span>
      </footer>
    </div>
   </body>
</html>'.header( 'Refresh: 2; url=/' ).'');
// бан
if (isset($active) && $user['ban'] > time() && $adm_id != 5)
exit('<header>
         <table>
            <tr>
               <td class="l_bar">
<a href="/"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo"><font color="yellow">
                 Fasthost.Uz <font></h1>
               </td>
            </tr>
         </table>
      </header><div class="mOm"><div class="block first"><div class="title"><center><h1><font color="red">Block!</font></h1></center></div><div class="menu">Sizning hisobingiz ushbu sangacha blockda '.date('d.m.Y H:i', $user['ban']).'!</div></div><footer>
<span>&copy; <font color="yellow">Fasthost.Uz - '.date('Y</font>').'</span>
         <span>
         </span>
      </footer>
    </div>
   </body>
</html>');

if (isset($active) == false)
{ /*@akhmadjon*/
echo '<header>
         <table>
            <tr>
               <td class="l_bar">
<a href="/"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo"><font color="yellow">
                 Fasthost.Uz <font color="red, blue">|</font> <font color="Aqua"><b>Uyda qoling!</b></font></font></h1>
               </td>
               <td class="r_bar">
<a href="/auth" title="Kirish"><img width="23" src="/img/auth1.png" alt="Kirish | Fasthost.Uz "></a>
</td>
<td class="r_bar">
<a href="/reg" title="Ro\'yxatdan o\'tish"><img width="23" src="/img/reg1.png" alt="Ro\'yxatdan o\'tish | Fasthost.Uz "></a>
               </td>
            </tr>
         </table>
      </header>';
}
else
{
$new_tickets = $connect->query("SELECT COUNT(*) FROM `tickets` WHERE `id_user` = '$user->id' AND `read_user` = '0'")->fetchColumn();
$new_note = $connect->query("SELECT COUNT(*) FROM `note` WHERE `id_user` = '$user->id' AND `readmsg` = '0'")->fetchColumn();
if ($new_note==0) {$newn='';}
if ($new_note==1) {$newn='1';}
if ($new_note==2) {$newn='2';}
if ($new_note==3) {$newn='3';}
if ($new_note==4) {$newn='4';}
if ($new_note==5) {$newn='5';}
if ($new_note>=6) {$newn='e';}

if ($new_tickets==0) {$newt='';}
if ($new_tickets==1) {$newt='1';}
if ($new_tickets==2) {$newt='2';}
if ($new_tickets==3) {$newt='3';}
if ($new_tickets==4) {$newt='4';}
if ($new_tickets==5) {$newt='5';}
if ($new_tickets >= 6) {$newt='e';}
echo '<header>
         <table>
            <tr>
               <td class="l_bar">
<a href="/"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo"><font color="yellow"><b>
                 Fasthost.Uz </b></font></h1>
               </td>
               <td class="r_bar">
<a href="/user/menu" title="Shaxsiy kabinet"><img width="25" src="/img/us2.png" alt="Shaxsiy kabinet | Fasthost.Uz "></a>
</td>
<td class="r_bar">
<a href="/user/inor" title="Bildirishnomalar"><img width="23" src="/img/n'.$newn.'.png" alt="Bildirishnomalar | Fasthost.Uz "></a>
               </td>
               <td class="r_bar">

               </td>';
    
if ($adm_id == 5) { 
$newadmt = $connect->query("SELECT COUNT(*) FROM `tickets` WHERE `read_adm` = '0'")->fetchColumn();
if ($newadmt >= 1) {$v1='n';}else{$v1='';}
    echo '<td class="r_bar">
               </td>';
    echo '<td class="r_bar">
<a href="/adm" title="Administrator paneli! | Fasthost.Uz "><img width="23" src="/img/adms.png" alt="Administrator paneli!"></a>
               </td>';
}

        echo ' </tr>
         </table>
      </header>';
}

echo '<div class="mOm"><div class="block first">';

?>
