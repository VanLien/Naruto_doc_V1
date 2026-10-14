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
		$result['text'] = "Please log in";
		echo json_encode($result);
		exit;
	}
	else{
		if($_POST['server'] == '' || !isset($_POST['pack']) || !isset($_POST['num'])){
			$result['text'] = "Vui lòng điền đầy đủ thông tin"; 
			echo json_encode($result);
			exit;
		}else{
			$pack = $_POST['pack'];
			$num = $_POST['num'];
			if(!is_numeric($num) || $num <= 0 || $num > 999){
				$result['text'] = "Nhập số lượng nhỏ hơn 999";
				echo json_encode($result);
				exit;
			}

		}
		$data = $dbh ->query("SELECT * FROM ws_shop_item3 where id='$pack'")->fetchAll();
		if(isset($_POST['type_buy']))
			if($_POST['type_buy'] == 'buyitem'){
				foreach ($data as $item){
					if(isset($item['id'])){
						$server = $_POST['server'];
						$actorname = $_POST['actorname'];
						$user_id = $_SESSION['user_id'];
						//$item = $data[$pack];
						$sum_cost = $item['cost'] * $num;
						$sum_count = $item['count'] * $num;
						//$dbh2 = connectGame($server, $dbh);
						//$uid  = encryptUserID($user_id, $server);
						$username = $_SESSION['niceUsername'];
						$subject = "[Webshop] Mua thành công hãy nhận trong thư trò chơi hãy nhận trong thư trò chơi";
						$content = "Bạn đã Mua thành công hãy nhận trong thư trò chơi {$item['name']}, ID: {$item['id']}, SL: {$num}, đơn giá {$item['cost']}xu tổng cộng {$sum_cost}xu từ webshop, chúc bạn chơi game vui vẻ";
						$check = $dbh ->query("SELECT * FROM game_account WHERE uid = '$user_id' LIMIT 1")->fetch();
						if($check['xu'] >= $sum_cost){
							$dbh ->query("Update game_account set xu = xu- '$sum_cost' WHERE uid = '$user_id'")->fetch();
							$check_sv = $dbh->query("SELECT * FROM `ip_web_sv` WHERE `id` = '$server' LIMIT 1")->fetch();
							$current_sv = $check_sv['sid'];
							$Post = ['type'=> '8','usr'=> $username,'item'=> $item['id'],'num'=> $sum_count,'qu'=> $current_sv,'bao'=> 0,'sqm'=> $PassGm,];
							$re=	sendmail($LinkGm,$Post);
							$dbh->prepare("
								 INSERT INTO `shop_log` (`userid`, `item`, `uid`, `serverid`, `num`, `name`, `cost`, `created`) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())
							")->execute(array($user_id, $item['id'], $uid, $server, $sum_count, $item['name'], $item['cost']));
							$result['text'] = "Mua thành công hãy nhận trong thư trò chơi";
							echo json_encode($result);
							exit;
						}
						else
						{
							$result['text'] = "Bạn không đủ ".number_format($sum_cost)." xu để mua!";
							echo json_encode($result);
							exit;
						}
					}
					else{
						$result['text'] = "Vật phẩm này chưa bày bán";
						echo json_encode($result);
					}
				}
			}
}