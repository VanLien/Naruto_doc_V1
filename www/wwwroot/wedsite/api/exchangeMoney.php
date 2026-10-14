<?php
$json = array();
date_default_timezone_set('Asia/Ho_Chi_Minh');
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';

// kiểm tra dữ liệu vào: tên game, server, số xu

if(!isset($_POST['game']) || !isset($_POST['server'])|| !isset($_POST['money'])){
	$json['status'] = false;
	$json['msg'] = "Vui lòng nhập đủ các trường";
}
else
{
	//k
	
	//lấy session ID

	if(!isset($_SESSION['user_id']))
		$json['msg'] = "Vui lòng đăng nhập lại";

	else
	{
		$user_id = $_SESSION['user_id'];
		$username = $_SESSION['niceUsername'];
		//kiểm tra session ID
		include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
		$check = $dbh ->query("SELECT * FROM game_account WHERE uid = '$user_id' LIMIT 1")->fetch();
		//kiểm tra số dư tài khoản
		if ($check['xu'] <= 0) {
			$json['status'] = false;
			$json['msg'] = "Số dư không đủ, vui lòng nạp tiền để tiếp tục!";
			echo json_encode($json);
			exit;
	 	}

		//gán giá trị
		$game = $_POST['game'];
		$game_server = $_POST['server'];
		$money = $_POST['money'];
		//rate nạp
		switch($money){
			case 1:
				$gold  = 2000000;
				$xu = 200000;
				$item = 1;
				break;
			case 2:
				$gold  = 5000000;
				$xu = 500000;
				$item = 1;
				break;
			case 3:
				$gold  = 10000000;
				$xu = 1000000;
				$item = 1;
				break;
			case 4:
				$gold  = 20000000;
				$xu = 2000000;
				$item = 1;
				break;
			case 5:
				$gold  = 50000000;
				$xu = 5000000;
				$item = 1;
				break;
			case 6:
				$gold  = 100000000;
				$xu = 10000000;
				$item = 1;
				break;
			case 7:
				$gold  = 1000;
				$xu = 1000000;
				$item = 1;
				break;
			case 8:
				$gold  = 2000;
				$xu = 2000000;
				$item = 1;
				break;
			case 9:
				$gold  = 3000;
				$xu = 3000000;
				$item = 1;
				break;
			case 10:
				$gold  = 4000;
				$xu = 5000000;
				$item = 1;
				break;
			case 11:
				$gold  = 5000;
				$xu = 5000000;
				$item = 1;
				break;
			case 12:
				$gold  = 10000;
				$xu = 10000000;
				$item = 1;
				break;
			case 13:
				$gold  = 1;
				$xu = 1;
				$item = 1;
				break;
			case 14:
				$gold  = 5;
				$xu = 5;
				$item = 1;
				break;
			default:
			break;
		}
		$type = ($money<=6)?'7':'9';
		$urlsv= 'http://ninjahokage.com:84/@adminhlno1/gzs.php';
		$post = [
		'type' => $type,
		'usr' => $username,
		'qu' => $game_server,				
		'item' => $item,
		'pay' => $gold,
		'num' => 100,
		'sqm'   => 1,
		'bid'   => 0,
		'gb'   => $gold,
		];
		//config api url
		//$config_api_url = "http://ninjahokage.com/api/charge_game/nap.php";
		//encrypt
		$time = time();
		$encryptRechargeKey = 'dfsf32dfcgdfg3bhgf65656dd';
		$rechargeKey      = md5(sha1($game_server . $user_id . $time) . $encryptRechargeKey);
		$money = $gold;
		// echo $time;exit;
		//kiểm tra số dư tài khoản
		if ($xu > $check['xu']) {
			$json['status'] = false;
			$json['msg'] = "Số dư không đủ $xu";
	 	}
	 	else
	 		//Nếu đủ điều kiện
	 	{
			
	 		if ($time >1 ) {
			/*			$post = [
					'qu' => 1,
					'sqm' => '123456',
					'usr' => 'kiendt19',
					'type'   => 7,
					'pay' => '10000',
					];
					$ch = curl_init('http://ninjahokage.com:84/ht1/gzs.php');
					curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
					curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
					$response = curl_exec($ch);
					curl_close($ch);
					*/
					
					
					$datapost = sendmail($urlsv,$post);
					$dbh->prepare("UPDATE `game_account` SET xu = xu - ? WHERE uid = ?")->execute(array($xu, $user_id));
	 				$json['msg'] = "Thành công";
		 			$json['status'] = true;
		 		}
		 		else
		 		{
		 			$json['status'] = false;
		 			$json['msg'] = "Thất bại";
	 			}
	 	}
 	}
	

}
echo json_encode($json);
exit;