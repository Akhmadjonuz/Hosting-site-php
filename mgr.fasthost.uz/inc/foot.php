<?php
list($msec,$sec)=explode(chr(32),microtime());

if ($_SERVER['PHP_SELF'] != '/index.php') {
echo '</div>';
echo '<div class="menu"><a href="/"><img src="/inc/style/img/up.png"> Bosh menyuga qaytish</a></div> '; 
}
echo '</div><footer>';

?>
<span>&copy; <font color="yellow"><b>Fasthost.Uz</b> - <?=date('Y </font>');?></span>
      </footer>
    </div>
<?
/*if ($_SERVER['PHP_SELF'] != '/index.php') {
    
    echo '<center><a href="http://statok.net/go/17270"><img src="//statok.net/imageOther/17270" alt="Statok.net" /></a></center>';
}else{
    echo '<center><a href="http://statok.net/go/17270"><img src="//statok.net/image/17270" alt="Statok.net" /></a></center>';
}*/
?>
<div class="center"><font color="Aqua">Tezlik - <?=round(($sec+$msec)-$headtime,3)?> Soniyasiga!</font></div>
   </body>
</html>