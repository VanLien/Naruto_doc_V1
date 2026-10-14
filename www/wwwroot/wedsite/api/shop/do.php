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
		$result['msg'] = "Please log in";
		echo json_encode($result);
		exit;
	}
	else{
		if($_POST['server'] == '' || !isset($_POST['pack']) || !isset($_POST['num'])){
			$result['msg'] = "Please enter all fields"; 
			echo json_encode($result);
			exit;
		}else{
			$pack = $_POST['pack'];
			$num = $_POST['num'];
			if(!is_numeric($num) || $num <= 0 || $num > 999){
				$result['msg'] = "Invalid quantity";
				echo json_encode($result);
				exit;
			}

		}
		if(isset($_POST['action']))
			if($_POST['action'] == 'send'){
				if(isset($data[$pack])){
					$server = $_POST['server'];
					$actorname = $_POST['actorname'];
					$user_id = $_SESSION['user_id'];
					$item = $data[$pack];
					$sum_cost = $item['cost'] * $num;
					$sum_count = $item['count'] * $num;
					//$dbh2 = connectGame($server, $dbh);
					//$uid  = encryptUserID($user_id, $server);
					$username = $_SESSION['niceUsername'];
					//$subject = "[Webshop] Successfully purchase";
					//$content = "You have successfully purchased {$item['name']}, ID: {$item['id']}, SL: {$num}, unit price {$item['cost']}total coin {$sum_cost}coin from webshop, wish you happy gaming";
					$check = $dbh ->query("SELECT * FROM users WHERE acc_id = '$user_id' LIMIT 1")->fetch();
					if($check['xu2'] >= $sum_cost){
						$dbh ->query("Update users set xu2 = xu2- '$sum_cost' WHERE acc_id = '$user_id'")->fetch();
						$check_sv = $dbh->query("SELECT * FROM `ip_web_sv` WHERE `id` = '$server' LIMIT 1")->fetch();
						$current_sv = $check_sv['id'];
						$title = "Successfully purchase";
						$content = "You have successfully purchased on Webshop
						[b]{$item['name']}[/b]
						Unit price: {$item['cost']} Tickets 
						Total Tickets Spended:[/b] {$sum_cost} Tickets
						Wish you happy gaming. 
						[b]The Rise of Legends Staff[/b]";
						$Post = ['type'=> 'mail','name'=> $actorname,'item'=> $item['id'],'num'=> $sum_count,'qu'=> $current_sv,'pass' =>$PassGm,'content' =>$content];
						$LinkGm = 'LinkGm'.$current_sv;
						$re=sendmail($$LinkGm,$Post);
						$dbh->prepare("
							 INSERT INTO `ws_shop_log` (`username`, `nickname`, `content`, `price`, `count`, `ip`, `time`) VALUES (?, ?, ?, ?, ?, ?, NOW())
						")->execute(array($username, $actorname, $item['name'], $item['cost'], $sum_count, getIP()));
						$result['msg'] = $content;
						echo json_encode($result);
						exit;
					}
					else
					{
						$result['msg'] = "You are not enough, Need ".number_format($sum_cost)." tickets to buy!";
						echo json_encode($result);
						exit;
					}
				}
				else{
					$result['msg'] = "Item error";
					echo json_encode($result);
				}
			}
 /*if(isset($_POST['action']))
	 if($_POST['action'] == 'send'){
		 $send = sendMail($uid, $data[0]['id'], $item_detail['num'], $item_detail['type'], $serverId, $dbh2, $subject, $content);
	 }*/
}