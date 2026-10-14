<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');

require_once 'dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';

if(!isset($_GET['key']) || !isset($_GET['money']) || !isset($_GET['server']) || !isset($_GET['time']) || !isset($_GET['id']))
	exit;
else{
	// get info
	$user_id = $_GET['id'];
	$encryptLoginKey = 'sdhfjhdsftrach12s#$';
	$loginKey      = md5(sha1($user_id) . $encryptLoginKey);	
	// get thong tin
	$key = $_GET['key'];
	$money = $_GET['money'];
	$game_server = $_GET['server'];
	$time = $_GET['time'];
	$dbh2 = connectGame($game_server);
}
//tao key nap
$encryptRechargeKey = 'dfsf32dfcgdfg3bhgf65656dd';
$rechargeKey      = md5(sha1($game_server . $user_id . $time) . $encryptRechargeKey);

// goodsid
switch($money){
case 1000:
	$goodsid = 3;
	break;
case 2000:
	$goodsid = 4;
	break;
case 3000:
	$goodsid = 5;
	break;
case 5000:
	$goodsid = 6;
	break;
case 10000:
	$goodsid = 7;
	break;
case 20000:
	$goodsid = 8;
	break;
case 30000:
	$goodsid = 9;
	break;
case 50000:
	$goodsid = 10;
	break;
case 100000:
	$goodsid = 11;
	break;
case 200000:
	$goodsid = 12;
	break;
case 300000:
	$goodsid = 13;
	break;
case 500000:
	$goodsid = 14;
	break;
//thẻ trọn đời
case 1:
	$goodsid = 1;
	break;
//thẻ tháng
case 2:
	$goodsid = 2;
	break;
	
}
// kiem tra key
$result = array();
if($rechargeKey == $key){
	//check if user is exists
	$check = $dbh2->query("SELECT * FROM players WHERE account LIKE '{$loginKey}' LIMIT 1")->fetch();
	//get dbid
	$roleid = $check['dbid'];
	$oid = time();
	$trach = $dbh2->prepare("INSERT INTO `pay` (dbid, playerid, serverid, goodsid) VALUES (?, ?, ?, ?)")
                ->execute(array($oid, $roleid, $game_server, $goodsid));
	
	// check nạp lần đầu
	$check_first_recharge = $dbh->query("SELECT * FROM pay_log WHERE playerid LIKE '{$roleid}' LIMIT 1")->fetch();
	if(!$check_first_recharge){
		$dbh2->prepare("INSERT INTO `pay` (dbid, playerid, serverid, goodsid) VALUES (?, ?, ?, ?)")
                ->execute(array($oid+1, $roleid, $game_server, 23));
	}
	// lưu log nạp thẻ
	$log = $dbh->prepare("INSERT INTO `pay_log` (created, playerid, serverid, goodsid, userid, xu) VALUES (NOW(), ?, ?, ?, ?, ?)")
                ->execute(array($roleid, $game_server, $goodsid, $user_id, $money));			
	$result['status'] = true;
	//$result['msg'] = "Success";
}else{
	$result['status'] = false;
	//$result['msg'] = "Fail";
}
echo json_encode($result);

