<?php
$title = 'Ma\'lumotlar | Fasthost.Uz';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
switch ($act){
default:
echo '<div class="title"><b>To\'lov turlari | Fasthost.Uz</b></div><div class="menu">To\'lash uchun telegramdan yozing @Akhmajdon</div><div class="title">Цены</div><div class="menu">Стоимость перехода: '.$su.' руб.<br />Цвет ссылки: '.$color.' руб.<br/>Статус GOLD: '.$gold.' руб.<br /></div><div class="title">Контакты</div><div class="menu">E-mail: '.$set['mail'].'</div><div class="title">Статус GOLD</div><div class="menu">Статус GOLD включает в себя показ рекламы на всех страницах сайта.</div><div class="forlink"><a href="/info/rules" class="links">Правила сайта</a></div>';
break;
case 'rules':
echo '<div class="title"><b>Qoidalari</b></div>';
echo '<div class="menu">
<b>1. Xostingda quyidagilar taqiqlanadi:</b><br>
1.1. MDH qonunlariga zid bo\'lgan har qanday materiallarni joylashtirish.<br>
1.2. Keraksiz skriptlarni ishga tushirish<br>
1.3. Vayron qiluvchi xatti-harakatlarga olib keladigan resurslarni ko\'p sarflaydigan skriptlarni ishga tushirish (Winders / spamerlar / toshqin - skriptlar va boshqalar)<br>
1.4. Mualliflik huquqini buzadigan materiallarni joylashtirish (bunga Crack, keygen, nulled / contrz dasturlari kiradi)<br>
1.5. Spamni har qanday usulda yuboring.<br>
1.6. DDoS / DoS hujumlarini<br>
1.7  Soxta narsalarni joylashtirish!<br>
1.8. Erotik tarkibdagi har qanday materiallarni joylashtirish<br>

<b>2. Mijoz:</b><br>
2.1. Ushbu qoidalarga qat\'iy rioya qiling.<br>
2.2. Buyurtmalar uchun o\'z vaqtida to\'lang, aks holda buyurtma bekor qilinadi.<br>
2.3. O\'zingiz haqingizda ishonchli ma\'lumotlarni kiriting.<br>
2.4. Hisob egasini sotish va / yoki almashtirish to\'g\'risida Ma\'muriyatni xabardor qiling.<br>

<b>3. Mijoz quyidagi huquqlarga ega:</b><br>
3.1. Ko\'rsatilgan xizmatlarni to\'liq qabul qiling.<br>
3.2. Murojaat qilingan kundan boshlab 24 soat ichida texnik yordam oling (fors-major holatlari bundan mustasno).<br>
3.3. Istalgan vaqtda xosting xizmatlaridan voz keching (bu holda ishlatilgan davr uchun pul qaytarilmaydi [!]).<br>

<b>4. Ma\'muriyat quyidagilarni o\'z zimmasiga oladi:</b><br>
4.1. Foydalanuvchilarga reglamentdagi o\'zgarishlar, texnik va tashkiliy jihatlar to\'g\'risida ma\'lumot berish.<br>
4.2. Server apparatida "buyurtma" ni kuzatib boring.<br>
4.3. Maxfiylikni saqlash, mijoz tomonidan taqdim etilgan barcha ma\'lumotlarni, uni ruxsatsiz shaxslarga bermasdan (kerak bo\'lganda, huquqni muhofaza qilish idoralari bundan mustasno).<br>
4.4. To\'lanmagan buyurtmalarni 7 kundan ortiq bo\'lmagan muddatda saqlang (agar mavjud bo\'lsa, bepul tariflardan tashqari).<br>
4.5. Texnik qo\'llab-quvvatlash xizmatining jadvaliga muvofiq chipta buyurtmalariga javob bering.<br>

<b>5. Ma\'muriyat:</b>
5.1. Agar foydalanuvchi biron sababga ko\'ra buni qila olmasa, skriptlarni o\'rnating.<br>
5.2. Mijozning ehtiyojlariga mos ravishda serverni sozlang.<br>
5.3. Mijozni xosting bilan ishlashga o\'rgating.<br>
5.4. Agar mijoz beparvolik tufayli fayllarni yo\'qotsa, zaxira ma\'lumotlarini oching.<br>
5.5. Agar qo\'ng\'iroq xosting doirasidan tashqarida bo\'lsa, turmush o\'rtoq, tahdid va hk bo\'lsa, texnik yordamni taqdim eting.<br>

<b>6. Ma\'muriyat quyidagi huquqlarga ega:</b><br>
6.1. Mijozlarga xizmat ko\'rsatishni tushuntirishsiz rad eting.<br>
6.2. Backupa-ni taqdim qilmasdan ushbu qoidalarni buzgan foydalanuvchining hisobini to\'sib qo\'ying.<br>
6.3. Agar mijoz Rossiya Federatsiyasi va MDH mamlakatlarining qonunlarini buzgan bo\'lsa, huquqni muhofaza qilish organlariga murojaat qiling.<br>

<b>7. Ma\'muriyat javobgar emas:<br></b>
7.1. O\'chirishlarni qabul qilish uchun.<br>
7.2. Uskunalar uchun; Ushbu uskunada o\'rnatilgan dasturiy ta\'minot.<br>
7.3. Xaker hujumlaridan zarar uchun.<br>


</div>';
echo '<div class="err">Diqqat! Ushbu qoidalarni bilmaslik javobgarlikdan ozod qilmaydi! <br>Saytda ro\'yxatdan o\'tishingiz bilan siz avtomatik ravishda ushbu qoidalarga rozilik bildirasiz!<br><br>Xurmat bilan Fasthost.Uz ma\'muriyati !</div>';
break;
case 'support':
echo '<div class="title"><b>Qo\'llab-quvvatlash</b></div>';
echo '<div class="menu">Qo\'llab-quvvatlash xizmati barcha savollaringizga (xosting bilan bog\'liq) javob berishdan mamnun bo\'ladi.
Ayni paytda mijozlar bilan bog\'lanishning bir necha usullari mavjud.
Asosiy kanal bu bizning billing tizimimizga o\'rnatilgan chiptalar.
Shuningdek, biz bilan quyidagi aloqa ma\'lumotlari orqali bog\'lanishingiz mumkin:
 <br>====== Texnik ma\'murlar =====
 <br><b>Asosiy admin:</b></br> <font color="aqua">Aᴋʜᴍᴀᴅᴊᴏɴ🖤🌿</font>
 <br><b>Tizimga kirish:</b></br> <font color="aqua">admin</font>
 <br><b>Elektron pochta:</b></br> <font color="aqua">rasmiypcouz@gmail.com</font>
 <br><b>Telegram:</b></br> <font color="aqua">@Akhmadjon<br></font>
 ====================================================
<br>Texnik ta\'minot jadvali.
<br>Dushanba - juma (soat 12.00 dan
22.00 gacha),
Shanba (18.00 dan 22.00 gacha)
Yakshanba - (soat 20.00 dan 22.00 gacha)
Sizning chiptangizga kafolatlangan javob vaqti - 24 soat (fors-major holatlari bundan mustasno)
Shuningdek, sizning chiptalaringiz / so\'rovlaringiz xodimlarning ish yuklamasiga qarab boshqa vaqtlarda ham ko\'rib chiqilishi mumkin.</div>';
break;
case 'server':
echo '<div class="title"><b>Server | Fasthost.Uz</b></div>';
echo '<div class="menu"># <a>Server №1 [Ru]</a><div class="st_1"></div><div class="st_2"><b>Joylashuvi:</b> <font  color="aqua">Russia<br></font>
<b>Protsessor:</b> <font  color="aqua">Intel  Core I7 3.2 GHz<br></font>
<b>Qattiq disk:</b> <font  color="aqua">SSD<br></font>
<b>Hotira:</b> <font  color="aqua">cheksiz DDR3<br></font>
<b>Operatsion tizimi:</b> <font  color="aqua">CentOS 7<br></font>
<b>Aloqa porti:</b> <font  color="aqua">1 Gbps/soniyasiga (cheksiz)<br></font>
<b>IP manzil:</b> <font  color="aqua">91.121.68.5<br></font>
<b>NS1:</b> <font  color="aqua">ns1.fasthost.uz<br></font>
<b>NS2:</b> <font  color="aqua">ns2.fasthost.uz<br></font>
<b>PHPInfo:</b> <a href="http://fasthost.uz/phpinfo.php"><font  color="aqua">[Ko\'rish]</font></a> </div>
</div>';
break;
case 'sm':
echo '<div class="title">Smilylarga yordam! | Fasthost.Uz</div><div class="menu">';
for ($i = 1; $i <= count(glob($_SERVER["DOCUMENT_ROOT"]."/img/smiles/*.gif")); $i++) {
echo '<img src="/img/smiles/'.$i.'.gif" alt=""/>:'.$i.':</a>';
}
echo '</div>';
break; 
case 'pay':
echo '<div class="title"><b>To\'lov usullari | Fsthost.Uz</b></div>';
echo '<div class="menu">
Assalomu alaykum xurmatli Fasthost.uz foydalanuvchisi biz saytimizda hisobingizni <br>to\'ldirishingiz uchun afto to\'lov hizmatini o\'chirib qo\'ydik <br>endilikda qo\'lbola shaklida hisobingizni to\'ldirishingiz kerak, siz qiwi orqali mening qiwi <br>raqamimga kerakli rublni jo\'natasiz comentariyasiga loginingizni yozib qo\'yasiz, <br>click orqali esa plastik raqamimga esa kerakli pul mablag\'ini jo\'natasiz keyin <br>@fasthost_uz telegram guruhiga screenshotni jo\'nating, paynet orqali kerakli summani <br>raqamimga tashlang va sms orqali loginingizni<br> yozib jo\'nating, raqamlarni pastda yozib qoldiraman!<br><br><br><br>QIWI: +998 90 222 43 11<br>CLICK: 8600 1204 1977 8769<br>PAYNET: +998 90 222 43 11
</div>';

break;
case 'bb':
echo '<div class="title"><b>BB-Kodlarga yordam! | Fasthost.Uz</b></div>';
echo '<div class="menu"><b>Qalin shrift</b> - [b]matn[/b]<br/>
<i>Tiltlangan shrift</i> - [i]matn[/i]<br/>
<u>Belgilangan shrift</u> - [u]matn[/u]<br/>
Enter - [br]<br/>
Iqtibos - [cit]matn[/cit]<br/>
<del>Chizib tashlangan shrift</del> - [del]matn[/del]<br/>
<small>Kichik shrift</small> - [small]matn[/small]<br/>
<span style="color:red">Rangli shrift</span> - [color=rang]matn[/color]</div>';
break;
} 
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>