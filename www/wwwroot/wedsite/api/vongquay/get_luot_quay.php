<?php
error_reporting(0);
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
if(isset($_SESSION['user_id']))
{
	$user_id = $_SESSION['user_id'];
	$result = $dbh->query("SELECT * FROM `vongquay` WHERE `user_id` = '{$user_id}' LIMIT 1")->fetch();
	$joined = $dbh->query("SELECT count(id) AS `tong` FROM `vongquay`")->fetch();
	$luotquay = $result['luotquay'];
	if ($result == false){
		
		$dbh->prepare("INSERT INTO `vongquay`(user_id) VALUES(?)")->execute(array($user_id));
		$result2 = $dbh->query("SELECT * FROM `vongquay` WHERE `user_id` = '{$user_id}' LIMIT 1")->fetch();
		$luotquay = $result2['luotquay'];
		
	}
	$data = array(
		'status' => true,
		'luotquay' => $luotquay,
		'dathamgia' => number_format($joined['tong']+12065),

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