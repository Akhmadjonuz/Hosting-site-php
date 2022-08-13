<?php
$title = 'Tariflar';
include_once($_SERVER["DOCUMENT_ROOT"]."/inc/head.php");
if($_GET['type']=='hosting')
{
include_once($_SERVER["DOCUMENT_ROOT"]."/modnn/hosting.php");
}
elseif($_GET['type']=='vds')
{
include_once($_SERVER["DOCUMENT_ROOT"]."/modnn/vds.php");
}
elseif($_GET['type']=='domain')
{
include_once($_SERVER["DOCUMENT_ROOT"]."/modnn/domain.php");
}

include_once($_SERVER["DOCUMENT_ROOT"]."/inc/foot.php");
?>