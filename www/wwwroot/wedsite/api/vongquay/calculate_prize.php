<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';

require_once $_SERVER['DOCUMENT_ROOT'].'/api/vongquay/config.php';

if(!isset($_SESSION['user_id'])){
	$data = array(
		'status' => false,
		'msg' => "Vui lòng đăng nhập",
	);	
	echo json_encode($data);
	exit;
}

else
{
	if(is_numeric($_GET['sid'])){
		$sid = $_GET['sid'];
		$check_sv = $dbh->query("SELECT * FROM `ip_web_sv` WHERE `id` = '$sid' LIMIT 1")->fetch();
		if(!$check_sv){
			$data = array(
			'status' => false,
			'msg' => "Sai server",
			);	
		echo json_encode($data);
		exit;
		}
		
	}
		
		

	else
	{
		$data = array(
		'status' => false,
		'msg' => "Nhập server",
		);	
		echo json_encode($data);
		exit;
	}
	
	$dbh2 = connectGame($sid, $dbh);
	$uid = $_SESSION['user_id'];
	$username = $_SESSION['niceUsername'];
	//Kiem tra luot quay
	$check = $dbh->query("SELECT * FROM `vongquay` WHERE `user_id` = '$uid' LIMIT 1")->fetch();
	if($check){
		if($check['luotquay'] <= 0){
			$data = array(
			'status' => false,
			'msg' => "Bạn đã hết lượt quay, tham gia event hoặc mua thêm để tiếp tục",
			);	
			echo json_encode($data);
			exit;
		}
	}else{
		$dbh->prepare("INSERT INTO `vongquay`(user_id) VALUES(?)")->execute(array($user_id));
			$data = array(
			'status' => false,
			'msg' => "Vui lòng thử lại",
			);
			
			echo json_encode($data);
			exit;

	}
	
	$prize_rate = array();
	foreach($prize as $item){

		$prize_rate[] = $item['rate'];
	}
	// print_r($prize_rate);exit;

	$random = array();
	foreach($prize_rate as $key => $value) {
		for($i = 0; $i < $value; $i++) {
			$random[] = $key+1;
		}
	}
	shuffle($random);
	// print_r($random);exit;
	
	$resultRand = $random[0];
	
	if($resultRand){
		
		$prize_type = $prize[$resultRand-1]['type'];
		$prize = (int)$prize[$resultRand-1]['prize'];
		if($prize_type == 'xu'){
			$sendXu = sendXu($prize, $uid, $dbh, $action='+');
			$msg = "Chúc mừng bạn nhận được ".$prize." xu";
			//update data
			$dbh->prepare("UPDATE `vongquay` SET xu = xu + ?, luotquay = luotquay - 1 WHERE `user_id` = ?")->execute(array($prize, $uid));
			
		}elseif($prize_type == 'knb'){
			$uid_encrypted = encryptUserID($uid, $sid);
			
			$subject = "[VQNP] Vòng Quay Nhân Phẩm";
			$content = "Chúc mừng bạn! h5private.com";
			//lay real server id
			$check_sv = $dbh->query("SELECT * FROM `ip_web_sv` WHERE `id` = '$sid' LIMIT 1")->fetch();
			$current_sv = $check_sv['sid'];
			$sendMail = sendMail($uid_encrypted, 2, $prize, 0, $current_sv, $dbh2, $subject, $content);
			$msg = "Chúc mừng bạn nhận được ".$prize." knb";
			// function sendMail($encrypt_user_id, $itemid, $num, $type = 1, $srvid, $dbh2, $mail_title ="Thư hệ thống", $mail_content="Bạn nhận được 1 thư từ hệ thống"){

			//update data
			$dbh->prepare("UPDATE `vongquay` SET knb = knb + ?, luotquay = luotquay - 1 WHERE `user_id` = ?")->execute(array($prize, $uid));
		}elseif($prize_type == 'mayman'){
			$msg = "Chúc mừng bạn may mắn lần sau";
			//update data
			$dbh->prepare("UPDATE `vongquay` SET luotquay = luotquay - 1 WHERE `user_id` = ?")->execute(array($uid));
		}elseif($prize_type == 'themluot'){
			$msg = "Thêm lượt";
		
		}else{
			$the = $prize.",";
			$msg = "Chúc mừng bạn nhận được thẻ cào {$prize} vui lòng liên hệ admin để nhận";
			//update data
		$dbh->prepare("UPDATE `vongquay` SET `thecao` = CONCAT(`thecao`, '{$the}'), luotquay = luotquay - 1 WHERE `user_id` = ?")->execute(array($uid));
		}
		//log
			$dbh->prepare("INSERT INTO `vongquay_log`(`username`, `user_id`, `type`, `prize`, `created`) VALUES(?, ?, ?, ?, NOW())")->execute(array($username, $uid, $prize_type, $prize));
		$data = array(
		'status' => true,
		'result' => $resultRand,
		'msg' => $msg,
	);	
		echo json_encode($data);
	}
}

