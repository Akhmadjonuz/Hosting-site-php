<?php 
$k_post = $connect->query("SELECT * FROM `tarifs_hosting` WHERE `activ`='1' AND `id_server` = '1'");
$k_post = $k_post->fetchColumn();
$k_page = k_page($k_post, 10);
$page = page($k_page);
$start = 10*$page-10;

if ($k_post==0) {
    echo '<div class="menu"><center><font color="red">Тарифы нету</font></center></div>';
}

$q = $connect->query("SELECT * FROM `tarifs_hosting` WHERE `activ`='1' AND `id_server` = '1' ORDER BY `sort` ASC LIMIT $start, 10")->fetchAll();

foreach ($q as $hosting){ 

echo '<div class="title">  <font color="aqua"><b>'.filter($hosting[name]).'</font></b></div><div class="menu">'; 


echo '<b>Diskdagi joy:</b> <font color="aqua">'.filter($hosting[hdd]).' MB</font><br/> 
<b>Trafik:</b> <font color="aqua">'.filter($hosting[trafic]).' Gb</font><br/> 
<b>Domenlar/subdomenlar:</b> <font color="aqua">'.filter($hosting[domain]).' ta.</font><br/> 
<b>FTP-hisoblar:</b> <font color="aqua">'.filter($hosting[ftp]).' ta.</font><br/> 
<b>POP3-qutilar:</b> <font color="aqua">'.filter($hosting[mail]).' ta.</font><br/> 
<b>Ma\'lumotlar bazasi:</b> <font color="aqua">'.filter($hosting[mysql]).' ta.</font><br/>
__________________<br/>
<b>Kunlik narx:</b> <font color="aqua">'.filter($hosting[price_day]).' So\'m.</font><br/> 
<b>Oylik narx:</b> <font color="aqua">'.filter($hosting[price_month]).' So\'m.</font><br/> 
<b>Yillik narx:</b> <font color="aqua">'.filter($hosting[price_year]).' So\'m.</font><br/>';
if ($user) {   
    if ($user[id_tarif] == $hosting[id]){
        $url = '<div class="okt"><font color="aqua">Siz xozir shu tariftasiz!</font></div></div>';
    }else {
       $url = '<a href="/user/smenat/'.$hosting[id].'"><center> <input class="btn btn-default" type="submit" value="'.filter($hosting[name]).' tarifiga o\'tish"></center></a></div>';
    }
}else{
    $url = '<a href="/reg"><center> <input class="btn btn-default" type="submit" value="Buyurtma berish"></center></a></div>';
}
echo ' '.$url.'';
} 
if ($k_page > 1) navigation($k_page, $page); 
?>