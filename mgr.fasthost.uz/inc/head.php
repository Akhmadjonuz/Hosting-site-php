<?php
list($msec,$sec)=explode(chr(32),microtime());
$headtime=$sec+$msec;
// ошибки php
ini_set('error_reporting', 'Off');
ini_set('display_errors', 'off');
ini_set('display_startup_errors', 'off');
// заголовок
$title = empty($title) ? 'Sayt menejeri' : $title; 
echo '<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="theme-color" content="#5d80a6">
<link rel="apple-touch-icon-precomposed" href="/inc/style/img/app-icon.png">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/inc/style/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Hosting, kunlik to\'lov, Fasthost.Uz Mobile Hosting, Mobil xosting, Fasthost.uz, php 7, ffmpeg, GD, (pdo) MySQL (i), sqlite, Curl, IonCube, php versiyasini tanlash"/>
<meta name="description" content="Fasthost.Uz hosting, kechayu-kunduz qo\'llab-quvvatlaydigan yuqori sifatli mobil veb-sayt. Osiyoda ishonchli Linux hosting [By @PCOUZ Team, #Akhmadjon]"/> 
<meta name="author" content="Akhmadjon(UZKODER)"/>
<meta name="copyright" content="By @pcouz!"/>
<meta http-equiv="content-language" content="ru"/>
<title>'.$title.'</title></head><body>';
// системное
session_name('SID') . session_start();
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/function.php");
$id = isset($_GET['id']) ? val($_GET['id'], 1) : false;
$act = isset($_GET['act']) ? $_GET['act'] : false;
$adm_id = isset($user['admin']) ? val($user['admin']) : false;
$search = $_GET['search'] ? $_GET['search'] : false;
$time = time();
$_SESSION['tok'] = rand(1111,9999);
if ($_SERVER['PHP_SELF'] != '/index.php') {
    $hurl='/';
}else{
    $hurl='https://Fasthost.Uz';
}
// работа сайта
if ($set['close'] == 2 && $adm_id == false) exit('<header>
         <table>
            <tr>
               <td class="l_bar">
<a href="'.$hurl.'"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo">Fasthost.Uz - Sayt menejeri</h1>
               </td>
               <td class="r_bar">
<a href="/auth" title="Kirish"><img width="23" src="/img/auth1.png" alt="Kirish"></a>
</td>
            </tr>
         </table>
      </header><div class="mOm"><div class="block first"><div class="title">Texnik ta\'mirda!</div><div class="menu">Saytda texnik ishlar olib borilmoqda!</div>
      </div><footer>
<span>&copy; <b>Fasthost.Uz -</b> '.date('Y').'</span>
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
<a href="'.$hurl.'"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo">Fasthost.uz - Sayt menejeri</h1>
               </td>
            </tr>
         </table>
      </header><div class="mOm"><div class="block first"><div class="menu"><center><h1><font color="red">Error #404</font></h1></center></div></div><footer>
<span>&copy; Fasthost.uz - '.date('Y').'</span>
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
<a href="'.$hurl.'"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1id="logo">Fasthost.uz - Sayt menejeri</h1>
               </td>
            </tr>
         </table>
      </header><div class="mOm"><div class="block first"><div class="menu"><center><h1><font color="red">Error #403</font></h1></center></div></div><footer>
<span>&copy; Fasthost.uz - '.date('Y').'</span>
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
<a href="'.$hurl.'"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo">Fasthost.uz - Sayt menejeri</h1>
               </td>
            </tr>
         </table>
      </header><div class="mOm"><div class="block first"><div class="title"><center><h1><font color="red">Block!</font></h1></center></div><div class="menu">Hisobingiz ushbu sanagacha block holatida '.date('d.m.Y H:i', $user['ban']).'!</div></div><footer>
<span>&copy; Fasthost.uz - '.date('Y').'</span>
         <span>
         </span>
      </footer>
    </div>
   </body>
</html>');

if (isset($active) == false)
{
echo '<header>
         <table>
            <tr>
               <td class="l_bar">
<a href="'.$hurl.'"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo">Fasthost.uz - Sayt menejeri</h1>
               </td>
               <td class="r_bar">
<a href="http://Fasthost.uz/auth" title="Kirish"><img width="23" src="/img/auth1.png" alt="Kirish"></a>
</td>

            </tr>
         </table>
      </header>';
}
else
{

echo '<header>
         <table>
            <tr>
               <td class="l_bar">
<a href="'.$hurl.'"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo"><font color="yellow"><b>Fasthost.Uz - Sayt menejeri</font></b></h1>
               </td>
               <td class="r_bar">
<a href="/user/menu" title="Shaxsiy kabinet"><img width="25" src="/img/us2.png" alt="Shaxsiy kabinet"></a>
</td>';

        echo ' </tr>
         </table>
      </header>';
}

echo '<div class="mOm"><div class="block first">';

?>