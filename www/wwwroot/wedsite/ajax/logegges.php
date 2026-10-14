<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php';
$result = array();
if(!isset($_SESSION['user_id'])){
		$msg = "Vui lòng đăng nhập";
	}
	else{
		$stack = array();
			$check = $dbh ->query("SELECT * FROM ws_eggs_log order by id desc Limit 10")->fetchAll();
			for($i = 0; $i < count($check); $i++){
			$items= '<li class="list-group-item"><strong class="text-primary">
			'.$check[$i]['username'].'</strong> <span class="text-muted">đập trứng may mắn nhận được</span> <strong class="text-success">'.$check[$i]['name'].' (x'.$check[$i]['count'].')</strong> <span class="text-muted">vào lúc</span> '.$info['Time'].'
	   </li>';
	   array_push($stack, $items);
			}
			$json['status']='true';
	$json['dathamgia']=count($check);
	$json['lichsu']=$stack;
	echo json_encode($json);
					}
					
					