<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/promotionChecker.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';
try{
// Tìm các ID có status = 3 (đã thanh toán)
$result = $dbh->query("SELECT amount, user_id, id FROM payment WHERE status = 3")->fetchAll();
} catch (Exception $e) {
		echo 'Lỗi'.$e;
}

foreach ($result as $key => $item) {

	// Set status = 1 (hoàn thành)
	$payment_id = $item['id'];
	try{
	$update2 = $dbh->prepare("UPDATE payment SET status =  ? WHERE id = ?")->execute(array(1, $payment_id));
	} catch (Exception $e) {
		echo 'Lỗi'.$e;
	}
	
	// Set gold theo amount 

	$uid = $item['user_id'];
	$amount = $item['amount'] * $promotion['momo_bank_rate'] * $promotion_rate;
	$sovongquay = $amount/12000;
	try{
	if($sovongquay > 0){
		$update = $dbh->prepare("UPDATE vongquay SET luotquay = luotquay + ? WHERE user_id = ?")->execute(array($sovongquay, $uid));
	}
	$update = $dbh->prepare("UPDATE game_account SET xu = xu + ?,tichnap = tichnap + ?,toptuan = toptuan + ?,topngay = topngay + ?, modified = NOW()  WHERE uid = ?")->execute(array($amount/100,$item['amount'],$item['amount'],$item['amount'], $uid));
	} catch (Exception $e) {
		echo 'Lỗi'.$e;
	}
	//Gửi xu cho người giới thiệu
    // Lấy ID giới thiệu
    $getQuery = "SELECT `referrer` FROM game_account WHERE uid = '".$uid."'";

    $get = $dbh->query($getQuery)->fetch();
    $referrer = $get['referrer'];
    // Thực hiện gửi xu
    if($referrer != "none" && is_numeric($referrer))
    {
    	$send = sendXu($amount*$invite_friend['ti_le'], $referrer, $dbh);
    	if($send)
    		logInviteFriend($referrer, $uid, $amount*$invite_friend['ti_le'], $dbh, "payment");
    }
	
}
?>