<?php
header('Content-Type: text/html; charset=utf-8');


include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';

if(!isset($_SESSION['user_id']))
	exit;
else{
	if(!isset($_GET['sid']))
		exit;
	$user_id = $_SESSION['user_id'];
	$server_id = $_GET['sid'];
	$accountname = $_SESSION['niceUsername'];
	$dbh2 = connectGame($server_id, $dbh);
	$result = $dbh2->query("SELECT name, game_fzb, gold, lev,max_power FROM role WHERE account = '$accountname'")->fetch();
	if($result){
	$data = array(
		'status'=> true,
		'msg' => $result['name'].' (Lv: '.$result['lev'].' + Power: '.$result['max_power'].' + Coin Game: '.number_format($result['game_fzb']).' )',

	);
	}
	else{
		$data = array(
		'status'=> false,
		'msg' => "Chưa có nhân vật hoặc máy chủ chưa mở",

	);
	}
	echo json_encode($data);
	exit;
}