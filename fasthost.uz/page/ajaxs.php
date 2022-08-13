<?php
$title = 'AJAX Qidiruv';
require_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if ($adm_id == 5) {
    
    ?>
 <script type='text/javascript'> 
$(document).ready(function(){ 
$("#search_results").slideUp(); 
    $("#search_button").click(function(e){ 
        e.preventDefault(); 
        ajax_search(); 
    }); 
    $("#search_term").keyup(function(e){ 
        e.preventDefault(); 
        ajax_search(); 
    }); 
 
});
function ajax_search(){ 
  $("#search_results").show(); 
  var search_val=$("#search_term").val(); 
  $.post("/ajaxsearch", {search_term : search_val}, function(data){
   if (data.length>0){ 
     $("#search_results").html(data); 
   } 
  }) 
} 
</script>

<div class="title"><b>AJAX Qidiruv</b></div> 
<div class="menu">
    <form id="searchform" method="post"> 
<div> 
        <label for="search_term">Foydalanuvchi logini:</label> 
        <input type="text" name="search_term" id="search_term" /> 
<input class="btn btn-default" type="submit" type="submit" value="Qidirish" id="search_button" /> 
</div> 
    </form> </div>
    <div class="menu">
    <div id="search_results"></div> 
    </div>

<?
echo '<div class="menu">&bull;<a href="/adm/users"> <b>Orqaga</b></a></div>';
} else {
    header('Location: /');
}

require($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>