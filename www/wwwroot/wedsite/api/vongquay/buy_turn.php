<?php
// sleep(1);
$turn_price = 10000;
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';


$data = array();

if(isset($_POST['turn'])){
	if(is_numeric($_POST['turn'])){
	$num = (int)$_POST['turn'];
		if($num <= 0){
			$data['status'] = false;
			$data['msg'] = "Loi";
			echo json_encode($data);
			exit;
		}
	}else{
		exit;
	}
}else{
	exit;
}
//currency
if(isset($_POST['currency'])){
	if($_POST['currency'] == 'gem'){
		$currency = 'xu_lock';
		$currency_text = 'gem';
	}
	
	else{
		$currency = 'xu';
		$currency_text = 'xu';
	}
}
else
	exit;

if(isset($_SESSION['user_id'])){
	$uid = $_SESSION['user_id'];
}else{
	exit;
}
$sum_price = $turn_price * $num;
$check = $dbh->query("SELECT `{$currency}` FROM `game_account` WHERE `uid` = '{$uid}' LIMIT 1")->fetch();
if($check[$currency] < $sum_price){
	$data['status'] = false;
	$data['msg'] = "Bạn không đủ $currency_text để mua";
}else{
	// trừ xu hoặc gem
	$trutien = $dbh->prepare("UPDATE users SET {$currency} = {$currency} - ? WHERE id = ?")->execute(array($sum_price, $uid));
	if($trutien){
		$addturn = $dbh->prepare("UPDATE vongquay SET luotquay = luotquay + ? WHERE user_id = ?")
		->execute(array($num, $uid));
		$data['status'] = true;
		$data['msg'] = "Mua thành công ".$num." lượt quay!";
	}
	else
	{
		$data['status'] = false;
		$data['msg'] = "Mua thất bại!";
	}
	
}
echo json_encode($data);
exit;
?>
