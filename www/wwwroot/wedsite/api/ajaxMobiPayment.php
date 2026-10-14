<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');

	require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
	require_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';
	require_once $_SERVER['DOCUMENT_ROOT'].'/functions/securimage/securimage.php';
	//error_reporting(E_ALL^E_NOTICE);
	//error_reporting(E_ERROR);
	$now = time();
	$promotion_start = strtotime($promotion['start']);
	$promotion_end = strtotime($promotion['end']);
	if($now >= $promotion_start && $now <= $promotion_end){
	  $promotion_rate = $promotion['promotion_rate'];
	}
	else
 	  $promotion_rate = $promotion['promotion_normal_rate'];
	include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
	if(!isset($_SESSION['user_id'])){
		$json['msg'] = "Vui lòng đăng nhập";
		exit;
	}
	else
	{
		$user_id = $_SESSION['user_id'];

	//Lấy thông tin từ Gamebank tại https://sv.gamebank.vn/user/tich-hop-the-cao
	$merchant_id = '71338'; // interger
	$api_user = "5ed9374e3bdac"; // string
	$api_password = "847ae07148424a5c17f323fde046359d"; // string

	//Truyền dữ liệu thẻ
	$pin = $_POST['pin']; // string
	$seri = $_POST['seri']; // string

	$price_guest = $_POST['price_guest']; // interger
	$card_type = $_POST['card_type_id']; // interger
	$note = $user_id;
	$captcha = $_POST['ma_bao_mat'];

	/**
	 * Card_type = 1 => Viettel
	 * Card_type = 2 => Mobiphone
	 * Card_type = 3 => Vinaphone
	 * Card_type = 4 => Gate
	 * Card_type = 5 => VTC (vcoin)
	 * Card_type = 6 => Vietnammobile
	 * Card_type = 7 => Zing
	 * Card_type = 8 => Bit
	 * Card_type = 9 => Megacard
	 * Card_type = 10 => Oncash
	 
	**/

	$securimage = new Securimage();

	if ($securimage->check($captcha) == false) {
	     echo json_encode(array('code' => 1, 'msg' => "Sai mã bảo mật"));
	     exit();
	}

	$return = cardCharging($seri,$pin,$card_type,$price_guest,$note,$merchant_id,$api_user,$api_password);

	// nap the thanh cong
	if($return['code'] === 0 && $return['info_card'] >= 10000) {
		$uid = $user_id;
		$amount = $return['info_card']*$promotion_rate;
		try{
		$update = $dbh->prepare("UPDATE users SET xu = xu + ? WHERE id = ?")->execute(array($amount, $uid));
		} catch (Exception $e) {
			echo json_encode(array('code' => 1, 'msg' => "Lỗi kết nối data"));
	    	 exit();
		}
		// lưu log
		try 
        	{
        		$ip = $_SERVER['REMOTE_ADDR'];
				$dbh->prepare("INSERT INTO `payment` (user_id, amount, gateway, ip, status, created, modified) VALUES (?, ?, ?, ?, ?, NOW(), NOW())")
	                ->execute(array($uid, $return['info_card'], 0, $ip, 1));
	        } catch (Exception $e) {
			    $json['status'] = false;
			    $json['msg'] = 'Lỗi dữ liệu!';
                exit;
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
	    echo json_encode(array('code' => 0, 'msg' => "Nạp thẻ thành công mệnh giá " .  $return['info_card']));
	}
	else {
	    // get thong bao loi
	    echo json_encode(array('code' => 1, 'msg' => $return['msg']));
	}
}
function _isCurl()
{
	return function_exists('curl_version');
}

function cardCharging($seri,$pin,$card_type,$price_guest,$note,$merchant_id,$api_user,$api_password)
{
	if (_isCurl()) {
		$fields = array(
			'merchant_id' => $merchant_id,
			'pin' => $pin,
			'seri' => $seri,
			'price_guest' => $price_guest,
			'card_type' => $card_type,
			'note' => $note
		);
		$ch = curl_init("https://sv.gamebank.vn/api/card");
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_DIGEST);
		curl_setopt($ch, CURLOPT_TIMEOUT, 120);
		curl_setopt($ch, CURLOPT_USERPWD, $api_user . ":" . $api_password);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
		$result = curl_exec($ch);
		$result = json_decode($result);

		$return = array(
			'code' => $result->code,
			'msg' => $result->msg,
			'info_card' => $result->info_card,
			'transaction_id' => $result->transaction_id,
		);
		
	} else {
		//Trường hợp máy chủ chưa bật cURL
		$result =  file_get_contents("http://sv.gamebank.vn/api/card2?merchant_id=".$merchant_id."&api_user=".trim($api_user)."&api_password=".trim($api_password)."&pin=".trim($pin)."&seri=".trim($seri)."&card_type=".intval($card_type)."&price_guest=".$price_guest."&note=".urlencode($note)."");   
		$result = str_replace("\xEF\xBB\xBF",'',$result); 
		$result = json_decode($result);
		$return = array(
			'code' => $result->code,
			'msg' => $result->msg,
			'info_card' => $result->info_card,
			'transaction_id' => $result->transaction_id,
		);
	}
	return $return;
}
