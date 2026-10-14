<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
$username = $_GET['username'];
$money = $_GET['buyitem'];
$server = $_GET['sv'];
$server = explode("_",$_GET['sv']);
$type = 10;
		$urlsv= 'http://ninjahokage.com:84/gmhntadm/gzs.php';
			$post = [
			'type' => $type,
			'usr' => $username,
			'qu' => $server[1],				
			'bao' => $money,
			'item' => 0,
			'pay' => '',
			'num' => '',
			'sqm'   => 99,
			'bid'   => 0,
			'gb'   => '',
			];
			$datapost = sendmail($urlsv,$post);
			//echo ''.$username.'----'.$money.'----'.$server.'';
?>