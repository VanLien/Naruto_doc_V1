<?php
	date_default_timezone_set('Asia/Ho_Chi_Minh');
	error_reporting(0);

	include_once $_SERVER['DOCUMENT_ROOT'].'/hntntn.php';

	$conn = mysqli_connect($config['dbHost'],$config['dbUser'],$config['dbPass'],$config['dbName']) or die ("Không thể kết nối đến CSDL");

	mysqli_set_charset($conn,"UTF8");
	
	require_once('napthe.class.php');
	$napthe = new napthe();
	$validate = $napthe->ValidateCallback();
	$napthe->WriteLog('napthe_callback.txt', json_encode($validate)); 
	/*$validate = [
	 'Code' => '1',
	 'Mess' => 'ok',
	 'Reason' => '1',
	 'CardValue' => '1000',
	 'TrxID' => '03FFC664-C866-4A8B-9A51-C374B15B5FC5',
	 'CardSeri' => '59000021337236',
	 'CardCode' => '87034635282299',
	]; cái này test thẻ vẫn hoạt động ok*/
	if($validate != false) { //Nếu xác thực callback đúng thì chạy vào đây.
		$status = $validate['Code']; //Trạng thái thẻ nạp, thẻ thành công = 1, thẻ thất bại != 1, xem bảng mã lỗi.
		$desc = $validate['Mess']; //Mô tả chi tiết lỗi.
		$Reason= $validate['Reason'];
		$CardValue= $validate['CardValue'];
		$TrxID= $validate['TrxID'];
		
		$serial = $validate['CardSeri']; //Số serial của thẻ.
		$pin = $validate['CardCode']; //Mã pin của thẻ.
		// $card_type = $validate['card_type']; //Loại thẻ. vd: VTT, VMS, VNP.
		//$amount = $card['amount']; //Mệnh giá của thẻ.
		$amount = $CardValue;
		// $content = $validate['username']; //Nội dung quý khách đã đẩy lên ở phần nạp thẻ.
		
		$time = date('Y-m-d H:i:s');

		$queryUser = "SELECT * FROM `payment` WHERE `seri` = '$serial' AND `code` = '$pin' AND `status` = 0 AND `trxid` = '$TrxID'";
		$user = mysqli_fetch_assoc($conn->query("$queryUser"));
		if($user['user_id']=='' || empty($user['user_id'])){
			$napthe->WriteLog('napthe_callback_failed.txt', json_encode($validate));
			die("Không tìm thấy card");
		}

		// $amount = $user['amount'];

		$user_id = $user['user_id'];
		
		if($status == 1 || $status == 2) {
			//Xử lý nạp thẻ thành công tại đây.
			$money = $amount * 0.8; //ti le nap
			$money1 = $amount * 1.0; //ti le nap
										   
			if(!$conn->query("UPDATE `payment` SET `status` = 1, `modified` = '$time' WHERE `seri` = '$serial' AND `code` = '$pin' AND `trxid` = '$TrxID'"))
				die("Cannot update status card.");
			if(!$conn->query("UPDATE `game_account` SET xu = xu + $money WHERE uid = $user_id"))
				die("Cannot update xu users.");
			if(!$conn->query("UPDATE `game_account` SET tichnap = tichnap + $money1 WHERE uid = $user_id"))
				die("Cannot update tichnap users.");
			if(!$conn->query("UPDATE `game_account` SET topngay = topngay + $money1 WHERE uid = $user_id"))
				die("Cannot update topngay users.");
			if(!$conn->query("UPDATE `game_account` SET toptuan = toptuan + $money1 WHERE uid = $user_id"))
				die("Cannot update toptuan users.");
			echo "UPDATE `game_account` SET xu = xu + $money WHERE uid = $user_id";
			echo "UPDATE `game_account` SET tichnap = tichnap + $money1 WHERE uid = $user_id";		
			echo "UPDATE `game_account` SET topngay = topngay + $money1 WHERE uid = $user_id";
			echo "UPDATE `game_account` SET toptuan = toptuan + $money1 WHERE uid = $user_id";
			$napthe->WriteLog('napthe_callback_success.txt', json_encode($validate)); //Ghi log để debug.
		} else {
			//Xử lý nạp thẻ thất bại tại đây.
			if(!$conn->query("UPDATE `payment` SET `status` = 2, `modified` = '$time' WHERE `trxid` = '$TrxID'"))
				die("Cannot update status card.");
			echo "Cancel.!";
			$napthe->WriteLog('napthe_callback_failed.txt', json_encode($validate)); //Ghi log để debug.
		}
	}else{
		exit;
		$napthe->WriteLog('napthe_callback_validate.txt', json_encode($validate));
	}
?>