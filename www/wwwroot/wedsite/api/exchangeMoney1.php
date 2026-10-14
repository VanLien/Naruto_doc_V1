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
	$json['msg'] = "Please enter all fields";
}
else
{
	//k
	
	//lấy session ID

	if(!isset($_SESSION['user_id']))
		$json['msg'] = "Please log in again";

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
			$json['msg'] = "The balance is not enough, please top up to continue!";
			echo json_encode($json);
			exit;
	 	}

		//gán giá trị
		$game = $_POST['game'];
		$game_server = $_POST['server'];
		$num = $_POST['money'];
		//rate nạp
		switch($num){
			case 1:
				$xu = 1;
				break;
			case 2:
				$xu = 20;
				break;
			case 3:
				$xu = 50;
				break;
			case 4:
				$xu = 100;
				break;
			case 5:
				$xu = 200;
				break;
			case 6:
				$xu = 500;
				break;
			case 7:
				$xu = 50;
				break;
			default:
			break;
		}
		$type = 'charge';
		$urlsv= 'http://127.0.0.1:88/recharge/user/gmquery.php';
		$post = [
		'type' => $type,
		'uid' => $username,
		'qu' => $game_server,				
		'num' => $num,
		'sqm'   => 123456,
		];
		//config api url
		//$config_api_url = "http://web.hoachi.xyz/api/charge_game/nap.php";
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
					$ch = curl_init('http://hoachi.xyz:84/ht1/gzs.php');
					curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
					curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
					$response = curl_exec($ch);
					curl_close($ch);
					*/
					
					
					$datapost = sendmail($urlsv,$post);
					$dbh->prepare("UPDATE `game_account` SET xu = xu - ? WHERE uid = ?")->execute(array($xu, $user_id));
	 				$json['msg'] = "Success";
		 			$json['status'] = true;
		 		}
		 		else
		 		{
		 			$json['status'] = false;
		 			$json['msg'] = "False";
	 			}
	 	}
 	}
	

}
echo json_encode($json);
exit;