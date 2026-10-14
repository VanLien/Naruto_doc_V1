<?php
$json = array();
date_default_timezone_set('Asia/Ho_Chi_Minh');
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
// nhận thông tin
if(empty($_POST['giftcode']) || empty($_POST['server'])){
$json['status'] = false;
$json['text'] = 'Vui lòng nhập đủ các trường';
echo json_encode($json);
exit;
}
else
{

$giftCode = trim($_POST['giftcode']);
$serverId = trim($_POST['server']);

if(isset($_SESSION['user_id']))
	$user_id = $_SESSION['user_id'];
else
{
	$json['status'] = false;
	$json['text'] =  "Vui lòng đăng nhập";
	echo json_encode($json);
	exit;
}
//phan custom
/*$check_ngay_dang_ky = $giftCodeQuery = $dbh->query("SELECT `created` FROM users WHERE `id` = '{$user_id}' LIMIT 1")->fetch();
$code500check = explode('-', $giftCode);
$open_day = strtotime('2019-12-06 10:00:00');
$created_day = strtotime($check_ngay_dang_ky['created']);
if($code500check[0] == 'KHAIMOTRAMYEU'){
	if(($created_day < $open_day) && $code500check[1] == $user_id){
		$giftCode = 'vnagame500KSQW';
	}
	
	
}
*/
$giftCodeQuery = $dbh->query("SELECT * FROM giftcode_mtd WHERE `code` = '{$giftCode}' LIMIT 1")->fetch();
if ($giftCodeQuery === false) {
	$json['status'] = false;
	$json['text'] =  "Giftcode không hợp lệ!";
	echo json_encode($json);
	exit;
}

if ($giftCodeQuery['is_limited'] == 1 && $giftCodeQuery['limit_number'] <= 0) {

	$json['status'] = false;
	$json['text'] =  "Giftcode đã được dùng quá số lần cho phép";
	echo json_encode($json);
	exit;
}

if (!empty($giftCodeQuery['expired_date']) && strtotime($giftCodeQuery['expired_date']) < time()) {
	$json['status'] = false;
	$json['text'] =  "Giftcode đã hết hạn";
	echo json_encode($json);
	exit;
}

if ($giftCodeQuery['server'] != $serverId && $giftCodeQuery['server'] != 'all') {
	$json['status'] = false;
	$json['text'] =  "Giftcode không dành cho máy chủ này!";
	echo json_encode($json);
	exit;
}

$giftCodeId = $giftCodeQuery['id'] . "_" . $serverId;
$TypeCode = $giftCodeQuery['TypeCode'];
$checkUsedCode = $dbh->query("SELECT * FROM `used_code_mtd` WHERE (`username` = '". $_SESSION['user_id'] ."' AND `sv` = '". $serverId ."' AND `TypeCode` = '". $TypeCode ."') LIMIT 1")->fetch();
if ($checkUsedCode !== false) {
	$json['status'] = false;
	$json['text'] =  "Bạn đã dùng giftcode này rồi";
	echo json_encode($json);
	exit;
}


$items_list = $giftCodeQuery['item'];
$subject = $giftCodeQuery['subject'];
$content = $giftCodeQuery['content'];
$items_list_converted = explode("&",$items_list);

//lay real server id
$check_sv = $dbh->query("SELECT * FROM `ip_web_sv` WHERE `id` = '$serverId' LIMIT 1")->fetch();
$current_sv = $check_sv['sid'];
// nếu thành công
try {
	$dbh2 = connectGame($serverId, $dbh);
	$uid  = encryptUserID($user_id, $serverId);
	$status = false;
	$username=$_SESSION['niceUsername'];
	foreach ($items_list_converted as $value){
		$item = json_decode($value, true);
		//$send = sendMail($uid, $item['id'], $item['num'], $item['type'], $current_sv, $dbh2, $subject, $content);
		//if($send)
		$Post = ['type'=> '8','usr'=> $username,'item'=> $item['id'],'num'=> $item['num'],'qu'=> $serverId,'bao'=> 0,'sqm'=> $PassGm,];
		$datapost=	sendmail($LinkGm,$Post);
		$status = true;
	}
	if($status == true){
		
		if ($giftCodeQuery['is_limited'] == 1 && $giftCodeQuery['limit_number'] > 0) {
					$dbh->prepare("
						UPDATE `giftcode_mtd` SET limit_number = limit_number - 1 WHERE `code` = ?
					")->execute(array($giftCode));
				}
				$dbh->prepare("
					 INSERT INTO `used_code_mtd` (`username`, `gift_code`, `TypeCode`, `sv`) VALUES (?, ?, ?, ?)
				")->execute(array($_SESSION['user_id'], $giftCodeId, $TypeCode,$serverId));
				$json['status'] = true;
				$json['text'] = 'Nhận thưởng thành công vui lòng kiểm tra hộp thư game';
		echo json_encode($json);
		exit;
	}else{
		$json['status'] = false;
		$json['text'] =  "Lỗi không xác định #421, nhớ tạo nhân vật trước khi nhận nhé!".$TypeCode."";
		echo json_encode($json);
		exit;
	}
	
	
    
} catch (Exception $e) {
    die($e->getMessage());
	exit;
}
}


