<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
if(isset($_SESSION['user_id']))
{
	$user_id = $_SESSION['user_id'];
	$result = $dbh->query("SELECT sum(xu) AS tongxu, count(id) AS tongkichhoat FROM `invited_log` WHERE `id_moi` = '{$user_id}' AND `note` IS NULL LIMIT 1")->fetch();
	$result3 = $dbh->query("SELECT sum(xu) AS tongxunapthe FROM `invited_log` WHERE `id_moi` = '{$user_id}' AND `note` = 'payment' LIMIT 1")->fetch();

	$result2 = $dbh->query("SELECT count(id) AS tongmoi FROM `game_account` WHERE `referrer` = '{$user_id}' LIMIT 1")->fetch();
	if ($result == false){
		$json['status'] = false;
		$json['msg'] = "Lỗi lấy thông tin";
		echo json_encode($json);
		exit;
		
	}
	

	$data = array(
		'status' => true,
		'tong_xu' => $result['tongxu'],
		'tong_xu_nap_the' => $result3['tongxunapthe'],
		'tong_kich_hoat' => $result['tongkichhoat'],
		'tong_moi' => $result2['tongmoi'],
		

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