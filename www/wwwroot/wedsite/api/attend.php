<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
include_once($_SERVER['DOCUMENT_ROOT'] . '/functions/dbConnect.php');
/*
$json['status'] = 0;	
  	$json['msg'] = "Event đã kết thúc";
  	echo json_encode($json);
	exit;
*/ 
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';
$json = array();
$xu = array(

	'1' =>  1000,
	'2' =>  1000,
	'3' =>  2000,
	'4' =>  3000,
	'5' =>  1000,
	'6' =>  1000,
	'7' =>  2000,
	'8' =>  1000,
	'9' =>  2000,
	'10' =>  1000,
	'11' =>  1000,
	'12' =>  3000,
	'13' =>  1000,
	'14' =>  2000,
	'15' =>  1000,
	'16' =>  1000,
	'17' =>  3000,
	'18' =>  1000,
	'19' =>  1000,
	'20' =>  3000
);
$random = rand(1,20);
$lucky_xu = $xu[$random];
$is_active = 0; // bật tắt chức năng này 0: tắt, 1: mở
if(isset($_SESSION['user_id'])){
	$user_id = $_SESSION['user_id'];
}else{
	$json['status'] = 0;	
  	$json['msg'] = "Vui lòng đăng nhập";
  	echo json_encode($json);
	exit;
}
//check is active account
$check_acc = $dbh->query("SELECT `oauth_uid` FROM users WHERE id ='{$user_id}' LIMIT 1")->fetch();
/*if($check_acc['oauth_uid'] ==''){
	$json['status'] = 0;	
  	$json['msg'] = "Tài khoản phải đăng nhập bằng facebook hoặc liên kết với facebook mới được tham gia điểm danh";
  	echo json_encode($json);
	exit;
}*/
$check = $dbh->query("SELECT * FROM attendance WHERE user_id ='{$user_id}' ORDER BY `id` DESC")->fetch();
$today = date('Y-m-d');

$month = date('m');
$year = date('Y');

if($check){
	$last_day = $check['date'];
}else{
	$last_day = '2018-10-01 23:52:35';
}
$date_attend = date_format(date_create($last_day), 'Y-m-d');

if((strtotime($today) - strtotime($date_attend)) == 0){
  $json['status'] = 0;	
  $json['msg'] = "Hôm nay bạn đã điểm danh rồi! T_T";
}else{
$dbh->prepare("INSERT INTO `attendance` (`user_id`, `date`, `xu`, `ip_address`) VALUES (?, ?, ?, ?)")
            ->execute(array($user_id, date('Y-m-d H:i:s'), $lucky_xu, $_SERVER["REMOTE_ADDR"]));
$send = sendXu($lucky_xu, $user_id, $dbh);
$json['status'] = 1;	
$json['msg'] = $lucky_xu;	
}			
$result = $dbh->query("SELECT COUNT(*) as `count` FROM attendance WHERE user_id ='{$user_id}' AND MONTH(date) = {$month} AND YEAR(date) = {$year}")->fetch();	
$json['attendance'] = $result['count'];
$json['attenactive'] = $is_active;
echo json_encode($json);
exit;
