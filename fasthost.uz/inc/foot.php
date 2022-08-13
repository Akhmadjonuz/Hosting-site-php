<?php
list($msec,$sec)=explode(chr(32),microtime());

if ($_SERVER['PHP_SELF'] != '/index.php') {
echo '</div>';
echo '<div class="menu"><a href="/"><img src="/inc/style/img/up.png"> <b>Bosh menyuga qaytish</b></a></div> '; 
}

echo '</div><footer>';

?>
<span>&copy; <font color="yellow"><b>Fasthost.Uz</b> - <?=date('Y</font>');?></span>

      </footer>
    </div>
<div class="center"><font color="aqua">Tezlik - <?=round(($sec+$msec)-$headtime,3)?> soniyasiga!</font></div>
<script>
window.replainSettings = { id: 'c551b941-f122-4e49-aeae-2aae8e902f0e' };
(function(u){var s=document.createElement('script');s.type='text/javascript';s.async=true;s.src=u;
var x=document.getElementsByTagName('script')[0];x.parentNode.insertBefore(s,x);
})('https://widget.replain.cc/dist/client.js');
</script>
   </body>
</html>