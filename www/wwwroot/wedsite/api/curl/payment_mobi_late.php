<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');

	require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';

	session_start();
	error_reporting(E_ALL^E_NOTICE);
	error_reporting(E_ERROR);

	$now = time();
	$promotion_start = strtotime($promotion['start']);
	$promotion_end = strtotime($promotion['end']);
	if($now >= $promotion_start && $now <= $promotion_end){
	  $promotion_rate = $promotion['promotion_rate'];
	}
	else
 	  $promotion_rate = $promotion['promotion_normal_rate'];
	/*
	echo "<pre>";
	print_r($_REQUEST);
	echo "</pre>";
	*/
	
	if(isset($_GET['status']) && isset($_GET['seri']) && isset($_GET['pin']) && isset($_GET['price']) && isset($_GET['tran_id']) && isset($_GET['inote']))
	{
		$status = $_GET['status'];
		$seri = $_GET['seri'];
		$pin = $_GET['pin'];
		$tran_id = $_GET['tran_id'];
		$price = (int) $_GET['price'];
		$note =  urlencode($_GET['inote']);
		$checksum = $_GET['checksum'];
		$key = 'gp5bf211d92d3801542590937'; //Key Gamebank cung cấp cho mỗi tài khoản      

		
		
		$checksum_gb = hash('sha256',$status . $seri . $pin .  $price . $tran_id . $note . $key);
		//echo "<br />";
		
		if($checksum ==  $checksum_gb){
			if($status == '0'){
				//Thẻ nạp thành công

				$uid = $note;
				$amount = $price*$promotion_rate;
				try{
				$update = $dbh->prepare("UPDATE users SET xu = xu + ? WHERE id = ?")->execute(array($amount, $uid));
				} catch (Exception $e) {
					echo json_encode(array('code' => 1, 'msg' => "Lỗi kết nối data"));
			    	 exit();
				}
				//Gửi xu cho người giới thiệu
				    // Lấy ID giới thiệu
				    $getQuery = "SELECT `referrer` FROM users WHERE id = '".$uid."'";

				    $get = $dbh->query($getQuery)->fetch();
				    $referrer = $get['referrer'];
				    // Thực hiện gửi xu
				    if($referrer != "none" && is_numeric($referrer))
				    {
				    	$send = sendXu($amount*$invite_friend['ti_le'], $referrer, $dbh);
				    	if($send)
				    		logInviteFriend($referrer, $uid, $amount*$invite_friend['ti_le'], $dbh, "payment");
				    }
				// lưu log
				try 
		        	{
		        		$ip = $_SERVER['REMOTE_ADDR'];
						$dbh->prepare("INSERT INTO `payment` (user_id, amount, gateway, ip, status, created, modified) VALUES (?, ?, ?, ?, ?, NOW(), NOW())")
			                ->execute(array($uid, $price, 0, $ip, 1));
			        } catch (Exception $e) {
					    $json['status'] = false;
					    $json['msg'] = 'Lỗi dữ liệu!';
		                exit;
					}
				echo "Trạng thái đúng";
				exit();
			} else {
				//thẻ nạp không thành công
				echo "Trạng thái đúng, nhưng thẻ lỗi";
				exit();	
			}


		}else {
			//Sai mã bảo mật
			echo "Sai mã bảo mật";
			exit();
		}
		
	} else {
			//Gamebank truyền không đủ tham số
			echo "Không đủ tham số";
			exit();
	}