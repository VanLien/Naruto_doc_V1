<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
if(isset($_SESSION['user_id']))
{
	$user_id = $_SESSION['user_id'];
	$result = $dbh->query("SELECT * FROM `game_account` WHERE `uid` = '{$user_id}' LIMIT 1")->fetch();
	if ($result == false){
		$json['status'] = false;
		$json['msg'] = "Lỗi lấy thông tin";
		echo json_encode($json);
		exit;
		
	}
	//kiểm tra xem tài khoản đã xác nhận chưa
	if($result['username'] != '' & $result['oauth_uid'] != '')
		$verify = true;
	else
		$verify = false;
	

	// tên hiển thị
	$niceUsername = $result['userid'];

	if($result['oauth_uid'])
		$avatar = "http://graph.facebook.com/".$result['oauth_uid']."/picture?type=large&redirect=true&width=500&height=500";
	else
		$avatar = '';
	$data = array(
		'status' => true,
		'first_name' => $result['first_name'],
		'last_name' => $result['last_name'],
		'email' => $result['email'],
		'phonenumber' => $result['phonenumber'],
		'xu' => number_format($result['xu']),
		'xu2' => number_format($result['spin']),
		'xu_lock' => number_format($result['xu_lock']),
		'avatar' => $avatar,
		'niceUsername' => $niceUsername,
		'verify' => $verify,

	);
	$json = $data;
}
else
{
	$json['status'] = false;
	$json['msg'] = "Vui lòng nhập ít nhất 1 trường";
}
echo json_encode($json);
exit;