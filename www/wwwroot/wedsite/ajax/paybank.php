<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$user_id = $_SESSION['user_id'];
$json = array();
$json['time_show'] = 3000;
if (!isset($_POST['sotien']) || !isset($_POST['mySelect']) || intval($_POST['sotien']) ==0 || intval($_POST['mySelect'])==0) {
	$json['status'] = false;
	$json['text'] = 'Vui lòng nhập dữ liệu';
}

else{
	$result = $dbh->query("SELECT * FROM `game_account` WHERE `uid` = '{$user_id}' LIMIT 1")->fetch();
	if ($result == false){
	    $json['status'] = false;
	    $json['text'] = "Lỗi xác minh thông tin";
	}
	else
	{
		$money = $_POST['sotien'];
		$gateway = $_POST['mySelect'];
		$ip = $_SERVER['REMOTE_ADDR'];
        	try 
        	{
				$dbh->prepare("INSERT INTO `payment` (user_id, amount, gateway, ip, status, created) VALUES (?, ?, ?, ?, ?, NOW())")
	                ->execute(array($user_id, $money, $gateway, $ip, 2));
	        } catch (Exception $e) {
			    $json['status'] = false;
			    $json['text'] = 'Lỗi dữ liệu!';
                exit;
			}
        $inserted = $dbh->query("SELECT * FROM `payment` WHERE `user_id` = '{$user_id}' AND `status` = 2 ORDER BY created DESC LIMIT 1 ")->fetch();
        $payment_id = str_pad($inserted['id'], 4, '0', STR_PAD_LEFT);
        $json['status'] = true;
        $json['payment_id'] = $payment_id;
        $json['amount'] = $money;
		$json['text'] = 'Tạo lệnh nạp tiền thành công vui lòng đợi Admin kiểm tra';
	}
}
echo json_encode($json);exit;

