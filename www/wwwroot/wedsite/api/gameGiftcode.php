<?php

$json = array();

date_default_timezone_set('Asia/Ho_Chi_Minh');

include_once $_SERVER['DOCUMENT_ROOT'] . '/functions/dbConnect.php';

$lv = trim($_POST['lv']);
$no = trim($_POST['no']);
$sign = trim($_POST['sign']);
$account = trim($_POST['account']);
$role_id = trim($_POST['role_id']);
$date_time = trim($_POST['date_time']);
$role_name = trim($_POST['role_name']);
$product_name = trim($_POST['product_name']);
$channel_name = trim($_POST['channel_name']);
$platform_name = trim($_POST['platform_name']);
$game_server_no = trim($_POST['gameserver_no']);

$giftCode = $no;
$serverId = $game_server_no;

$giftCodeQuery = $dbh->query("SELECT * FROM giftcode_mtd WHERE `code` = '{$giftCode}' LIMIT 1")->fetch();

if ($giftCodeQuery === false) {
	$json['success'] = false;
	$json['message'] =  "Giftcode không hợp lệ!";
	echo json_encode($json);
	exit;
}

if ($giftCodeQuery['is_limited'] == 1 && $giftCodeQuery['limit_number'] <= 0) {
	$json['success'] = false;
	$json['message'] =  "Giftcode đã được dùng quá số lần cho phép";
	echo json_encode($json);
	exit;
}

if (!empty($giftCodeQuery['expired_date']) && strtotime($giftCodeQuery['expired_date']) < time()) {
	$json['success'] = false;
	$json['message'] =  "Giftcode đã hết hạn";
	echo json_encode($json);
	exit;
}

if ($giftCodeQuery['server'] != $serverId && $giftCodeQuery['server'] != 'all') {
	$json['success'] = false;
	$json['message'] =  "Giftcode không dành cho máy chủ này!";
	echo json_encode($json);
	exit;
}

$giftCodeId = $giftCodeQuery['id'] . "_" . $serverId;
$checkUsedCode = $dbh->query("SELECT * FROM `used_code_mtd` WHERE (`username` = '" . $account . "' AND `gift_code` = '" . $giftCodeId . "') LIMIT 1")->fetch();

if ($checkUsedCode !== false) {
	$json['success'] = false;
	$json['message'] =  "Bạn đã dùng giftcode này rồi";
	echo json_encode($json);
	exit;
}

$items_list = $giftCodeQuery['item'];
$subject = $giftCodeQuery['subject'];
$content = $giftCodeQuery['content'];
$items_list_converted = explode("&", $items_list);

//lay real server id
$check_sv = $dbh->query("SELECT * FROM `ip_web_sv` WHERE `id` = '$serverId' LIMIT 1")->fetch();
$current_sv = $check_sv['sid'];

try {
	$status = false;

	foreach ($items_list_converted as $value) {
		$item = json_decode($value, true);

		$post = [
			'qu' => $serverId,
			'gb' => '',
// 			'sqm' => 'Vanlien1503',
			'usr' => $account,
			'pay' => '',
			'bao' => '',
			'num' => $item['num'],
			'item' => $item['id'],
			'gnxz'   => 3,
		];

		$ch = curl_init('http://ninjahokage.com:84/Gap@951adminhnt/api.php');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
		$response = curl_exec($ch);
		curl_close($ch);
		if ($post)
			$status = true;
	}

	if ($status != true) {
		$json['success'] = false;
		$json['message'] =  "Lỗi không xác định #421, nhớ tạo nhân vật trước khi nhận nhé!";
		echo json_encode($json);
		exit;
	}

	if ($giftCodeQuery['is_limited'] == 1 && $giftCodeQuery['limit_number'] > 0) {
		$dbh->prepare("UPDATE `giftcode_mtd` SET limit_number = limit_number - 1 WHERE `code` = ?")
		    ->execute(array($giftCode));
	}

	$dbh->prepare("INSERT INTO `used_code_mtd` (`username`, `gift_code`) VALUES (?, ?)")
	    ->execute(array($account, $giftCodeId));

	$json['success'] = true;
	
	$message = array();
	
	$message["title"] = "Nhập gift code thành công!";
	$message["content"] = "Nhập gift code thành công!";
	
	$json['message'] = $message;

	echo json_encode($json); exit;
} catch (Exception $e) {
	die($e->getMessage());
	exit;
}
