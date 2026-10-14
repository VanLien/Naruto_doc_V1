<?php
// sleep(1);
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';

$check = $dbh->query("SELECT `xu` FROM `game_account` WHERE `uid` = '{$uid}' LIMIT 1")->fetch();
if($check['xu'] < $sum_price){
	$data['status'] = false;
	$data['msg'] = "Bạn không đủ xu để mua";
}else{
	$truxu = sendXu($sum_price, $uid, $dbh, $action='-');
	$addturn = $dbh->prepare("UPDATE vongquay SET luotquay = luotquay + ? WHERE user_id = ?")
	->execute(array($num, $uid));
	$data['status'] = true;
	$data['msg'] = "Mua thành công ".$num." lượt quay!";
	
}
echo json_encode($data);
?>
