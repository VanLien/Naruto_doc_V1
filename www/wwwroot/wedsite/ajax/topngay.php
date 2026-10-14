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
		if($_GET['server'] == '' || is_numeric($_GET['tichnap']) ==false || is_numeric($_GET['server']) ==false){
			$msg = "Vui lòng chọn máy chủ"; 
		}else{
			$server = $_GET['server'];
			$tichnap = $_GET['tichnap'];
			$user_id = $_SESSION['user_id'];
			$dbh2 = connectGame($server, $dbh);
			$uid  = encryptUserID($user_id, $server);
			$username = $_SESSION['niceUsername'];
			$check = $dbh ->query("SELECT * FROM game_account WHERE uid = '$user_id' LIMIT 1")->fetch();
			$checklog = $dbh ->query("SELECT * FROM ws_topngay_log WHERE username = '$username' and tichnap='$tichnap' LIMIT 1")->fetch();
					if(!$checklog){
					if($check['topngay'] >= $tichnap){
						$checkitem = $dbh ->query("SELECT * FROM ws_topngay where nap='$tichnap'")->fetchAll();
						for($i = 0; $i < count($checkitem); $i++){
						$Post = ['type'=> '8','usr'=> $username,'item'=> $checkitem[$i]['item'],'num'=> $checkitem[$i]['count'],'qu'=> $server,'bao'=> 0,'sqm'=> $PassGm,];
						$re=sendmail($LinkGm,$Post);
						}
						$dbh->prepare("
							 INSERT INTO `ws_topngay_log` (`username`, `tichnap`, `serverid`, `created`) VALUES (?, ?, ?, NOW())
						")->execute(array($username, $tichnap, $server));
						$msg = "Nhận thưởng thành công mốc quà tích nạp ".number_format($tichnap).".Cảm ơn bạn đã ủng hộ Game";
					}
					else
					{
						$msg = "Bạn cần nạp đủ ".number_format($tichnap)." để nhận thưởng này!";
					}
					}
					else
					{
						$msg = "Bạn đã nhận thưởng mốc này rồi.Mỗi mốc chỉ được nhận 1 lần";
					}
		}
}
echo $msg;
