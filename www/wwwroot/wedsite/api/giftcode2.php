<?php
$json = array();
date_default_timezone_set('Asia/Ho_Chi_Minh');
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
//include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/@trach/pages/3826item.php';
//$Post = ['type'=> 'findacc','name'=> 'demo01','pswd'=>'123456'];
$Post = ['type'=> 'findacc','name'=> 'hello2','num'=> 0,'qu'=> 1,'pswd' =>123456,'content' =>123,'pass' =>123456,'checknum' =>123456,'uid' =>1];
$json=sendmail($LinkAd2,$Post);
$obj = json_decode($json);
echo $obj->{'info'};
print_r($json);