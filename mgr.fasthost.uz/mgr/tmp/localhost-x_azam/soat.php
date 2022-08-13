<?php

if (!file_exists('madeline.php')) {
    copy('https://phar.madelineproto.xyz/madeline.php', 'madeline.php');
}
include 'madeline.php';

$MadelineProto = new \danog\MadelineProto\API('session.madeline');
$MadelineProto->start();

$time=date("H:i",strtotime("0 hour"));
$input = [" | Soat: $time"];
$rand=array_rand($input);
$text="$input[$rand]";
$nik = ["Azam"];
$nikrand=array_rand($nik);
$niktxt="$nik[$nikrand]";
$MadelineProto->account->updateProfile(['first_name'=>"$niktxt | $time ",'about'=>"$text"]);
$MadelineProto->account->updateStatus(['offline' => false, ]);

unlink("MadelineProto.log");
unlink("session.madeline");

?>