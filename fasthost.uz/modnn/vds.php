<?php
if($user['vds_aktiv'] == 1){
    $ur1 = '<a class="okt" href="/user/vds/svds/1">Выбрать</a>';
    $ur2 = '<a class="okt" href="/user/vds/svds/2">Выбрать</a>';
    $ur3 = '<a class="okt" href="/user/vds/svds/3">Выбрать</a>';
}elseif($user['vds_aktiv'] >= 2){
    $ur1 = 'Нельзя выбор тариф';
    $ur2 = 'Нельзя выбор тариф';
    $ur3 = 'Нельзя выбор тариф';
}else{
    $ur1 = 'Для заказа напишите на тикет!';
    $ur2 = 'Для заказа напишите на тикет!';
    $ur3 = 'Для заказа напишите на тикет!';
}
echo '<div class="title">Доп. услуги</div><div class="menu">'; 
echo '<b>ISP Manager 5 Lite 150 руб/мес</b><br/>
<b>ISP Manager 5 Bus 450 руб/мес</b></div>';
echo '<div class="title">  <b>VDS 1</b></div><div class="menu">'; 
echo '<b>CPU:</b> 1x3400 Mhz<br/> 
<b>RAM:</b> 1 Gb DDR3<br/> 
<b>SSD:</b> 20Gb<br/> 
<b>Виртуализация:</b> KVM<br/> 
<b>IP:</b> 1 шт.<br/> 
<b>OS:</b> Linux | Windows <br/>
__________________<br/>
<b>Цена в месяц:</b> 200 руб.<br/> <div class="okt">'.$ur1.'</div></div>';
echo '<div class="title">  <b>VDS 2</b></div><div class="menu">'; 
echo '<b>CPU:</b> 2x3400 Mhz<br/> 
<b>RAM:</b> 2 Gb DDR3<br/> 
<b>SSD:</b> 30Gb<br/> 
<b>Виртуализация:</b> KVM<br/> 
<b>IP:</b> 1 шт.<br/> 
<b>OS:</b> Linux | Windows <br/>
__________________<br/>
<b>Цена в месяц:</b> 250 руб.<br/> <div class="okt">'.$ur2.'</div></div>';
echo '<div class="title">  <b>VDS 3</b></div><div class="menu">'; 
echo '<b>CPU:</b> 2x3400 Mhz<br/> 
<b>RAM:</b> 4 Gb DDR3<br/> 
<b>SSD:</b> 50Gb<br/> 
<b>Виртуализация:</b> KVM<br/> 
<b>IP:</b> 1 шт.<br/> 
<b>OS:</b> Linux | Windows <br/>
__________________<br/>
<b>Цена в месяц:</b> 350 руб.<br/> <div class="okt">'.$ur3.'</div></div>';


?>