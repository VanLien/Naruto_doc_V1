<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/api/task/config.php';

if(!isset($_SESSION['user_id'])){
		echo "Vui lòng đăng nhập";
		exit;
	}
	else{
		if(!isset($_GET['server']) || !isset($_GET['pack']) || !isset($_GET['packID']) ){
			echo "Vui lòng nhập đủ các trường"; exit;
		}
		if(strtotime($date['start']) > time())
		{
			echo "Sự kiện chưa bắt đầu";
			exit;
		}
		else if(strtotime($date['end']) < time())
		{	
			echo "Sự kiện đã kết thúc";
			exit;
		}
		$server = $_GET['server'];
		$pack = $_GET['pack'];
		$packid = $_GET['packID'];
		$user_id = $_SESSION['user_id'];
		$dbh2 = connectGame($server, $dbh);
		$uid  = encryptUserID($user_id, $server);




function sendItemPackage($data, $danap, $pack, $pack_id, $dbh, $dbh2, $uid, $serverId, $user_id, $date){
	$is_right = false;
	foreach($data as $item1){
		if($item1['required'] == (int)$pack){
			$pack = $item1['required'];
			$pack_id = $item1['id'];
			$is_right = true;
			break;
		}
	}
	if(!$is_right){
		echo "Goi khong ton tai";
		return;
	}
	$start_day = $date['start'];
	$end_day = $date['end'];
	$check = $dbh ->query("SELECT * FROM tichnap_log WHERE `user_id` = '$user_id' AND `pack` = '$pack' AND `created` >= '$start_day' AND `created` <= '$end_day'")->fetch();
	foreach($data as $item){
		if($item['required'] == $pack)
			if($danap >= $item['required']){
				if($check)
					echo 'Bạn đã nhận gói này rồi';
				else
				{
					$subject = 'Quà tích lũy '.$pack.'VNĐ';
					$content = 'Quà tích lũy '.$pack.'VNĐ';
					$status = false;
					//lay real server id
					$check_sv = $dbh->query("SELECT * FROM `ip_web_sv` WHERE `id` = '$serverId' LIMIT 1")->fetch();
					$current_sv = $check_sv['sid'];
					foreach ($item['item'] as $item_detail){
							
							$send = sendMail($uid, $item_detail['id'], $item_detail['num'], $item_detail['type'], $current_sv, $dbh2, $subject, $content);
							
							if($send)
								$status = true;
						
					}
					if($status){
						///
						$dbh->prepare("
							 INSERT INTO `tichnap_log` (`user_id`, `pack`, `uid`, `server`, `pack_id`, `created`) VALUES (?, ?, ?, ?, ?, NOW())
						")->execute(array($user_id, $pack, $uid, $serverId, $pack_id));
						echo 'Nhận thành công gói tích lũy';
						exit;
					}
					
				}
			}
			else
			{
				echo 'Bạn chưa đạt đủ điều kiện';
				exit;
			}
	}
	
}
$danap = checkSumPay($user_id, $dbh, $date['start'], $date['end']);
if(isset($_GET['action']))
	if($_GET['action'] == 'send'){
		sendItemPackage($data, $danap, $pack, $packid, $dbh, $dbh2, $uid, $server, $user_id, $date);
	}
}