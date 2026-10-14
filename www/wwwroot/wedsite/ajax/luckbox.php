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
		if($_POST['server'] == '' || is_numeric($_POST['id']) ==false || is_numeric($_POST['server']) ==false){
			$msg = "Vui lòng chọn máy chủ"; 
		}else{
			$sum_cost =5000; // Giá mở hộp
			$server = $_POST['server'];
			$id = $_POST['id'];
			if($id==1)
			{
				$sum=1;
			}
			elseif($id==2)
			{
				$sum=10;
			}
			else
			{
				exit();
			}
			$sum_cost = $sum_cost*$sum;
			$user_id = $_SESSION['user_id'];
			$dbh2 = connectGame($server, $dbh);
			$uid  = encryptUserID($user_id, $server);
			$username = $_SESSION['niceUsername'];
			$random = rand(0,100);
			$check = $dbh ->query("SELECT * FROM game_account WHERE uid = '$user_id' LIMIT 1")->fetch();
					if($check['xu'] >= $sum_cost){
						$checkitem = $dbh ->query("SELECT * FROM ws_luckybox where random >= $random ORDER BY RAND() LIMIT 1")->fetch();
						$dbh ->query("Update game_account set xu = xu- '$sum_cost' WHERE uid = '$user_id'")->fetch();
						$Post = ['type'=> '8','usr'=> $username,'item'=> $checkitem['item'],'num'=> $checkitem['count']*$sum,'qu'=> $server,'bao'=> 0,'sqm'=> $PassGm,];
						$re=sendmail($LinkGm,$Post);
						$dbh->prepare("
							 INSERT INTO `ws_luckybox_log` (`username`, `item`, `count`, `serverid`, `name`, `num`,`created`) VALUES (?, ?, ?, ?, ?, ?, NOW())
						")->execute(array($username, $checkitem['item'], $checkitem['count']*$sum, $server ,$checkitem['name'],$sum));
						$msg = 'Chúc mừng bạn nhận được '.$checkitem['name'].' x('.$checkitem['count']*$sum.')';
					}
					else
					{
						$msg = "Bạn không đủ ".number_format($sum_cost)." xu để đập trứng!";
					}
		}
}
echo $msg;