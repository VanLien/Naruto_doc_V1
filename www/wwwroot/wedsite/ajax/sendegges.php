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
			$sum_cost =5000; // Giá đập trứng
			$server = $_POST['server'];
			$id = $_POST['id'];
			$user_id = $_SESSION['user_id'];
			$dbh2 = connectGame($server, $dbh);
			$uid  = encryptUserID($user_id, $server);
			$username = $_SESSION['niceUsername'];
			$random = rand(0,100);
			$check = $dbh ->query("SELECT * FROM game_account WHERE uid = '$user_id' LIMIT 1")->fetch();
					if($check['xu'] >= $sum_cost){
						$checkitem = $dbh ->query("SELECT * FROM ws_eggs where random >= $random ORDER BY RAND() LIMIT 1")->fetch();
						$dbh ->query("Update game_account set xu = xu- '$sum_cost' WHERE uid = '$user_id'")->fetch();
						$Post = ['type'=> '8','usr'=> $username,'item'=> $checkitem['item'],'num'=> $checkitem['count'],'qu'=> $server,'bao'=> 0,'sqm'=> $PassGm,];
						$re=sendmail($LinkGm,$Post);
						$dbh->prepare("
							 INSERT INTO `ws_eggs_log` (`username`, `item`, `count`, `serverid`, `name`, `created`) VALUES (?, ?, ?, ?, ?, NOW())
						")->execute(array($username, $checkitem['item'], $checkitem['count'], $server ,$checkitem['name']));
						$msg = '
						<span style="float: left;text-align: center;width: 100%;margin-top: -31px;padding: 5px;"><b style="color: white;
							background: red;
							padding: 5px;
							border-radius: 50px;">'.$checkitem['name'].'</b></span>
						<img name="image'.$id.'" src="/images/dap-trung/out/'.$id.'.png" height="100px" width="80px">
						';
					}
					else
					{
						$msg = "Bạn không đủ ".number_format($sum_cost)." xu để đập trứng!";
					}
		}
}
echo $msg;