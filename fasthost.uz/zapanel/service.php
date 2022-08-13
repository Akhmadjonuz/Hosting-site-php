<?php
$title = 'Xizmatlar | Fasthost.Uz';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if (isset($active)) {
echo '<div class="title"><b>Xizmatlar</b></div>';
//echo '<div class="menu"><center><font color="red">Пусто</font></center></div>';
echo '<div class="menu">&bull; <a href="/service/sendmoney"> Mablag\'ni ulashish</a></div>';
if ($adm_id == 5){

}
} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>