<?php
$json = array();
date_default_timezone_set('Asia/Ho_Chi_Minh');
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/xssClean.php';
if(empty($_POST['security']) || empty($_POST['server']) || empty($_POST['actorname']) || empty($_POST['actornamenew'])){
$json['status'] = false;
$json['msg'] = 'Please enter all fields';
echo json_encode($json);
exit;
}
else
{
if(isset($_SESSION['user_id']))
	$user_id = $_SESSION['user_id'];
else
{
	$json['status'] = false;
	$json['msg'] =  "Vui lòng đăng nhập";
	echo json_encode($json);
	exit;
}
$security = trim(xssClean($_POST['security']));
$actorname = trim(xssClean($_POST['actorname']));
$actornamenew = trim(xssClean($_POST['actornamenew']));
$serverId = intval(xssClean($_POST['server']));
$username = $_SESSION['niceUsername'];
$checknick = $dbh->query("SELECT * FROM `ws_nickname` WHERE `username` = '$username' AND `sv` = '$serverId' and Nickname ='$actorname'");
if($checknick->rowCount() >0)
{
	$infoacc = $checknick->fetch();
	if($infoacc['Security'] <> $security)
	{
			$json['status'] = false;
			$json['msg'] = "The security code is incorrect";
			echo json_encode($json);
			exit;
	}
	$dbh->prepare("Update `ws_nickname` Set Nickname = ? WHERE `username` = '$username' AND `sv` = '$serverId' and Nickname ='$actorname' 
	")->execute(array($actornamenew));
}
else
{
	$json['status'] = false;
	$json['msg'] = "The data you entered is incorrect";
	echo json_encode($json);
	exit;
}
}
$json['status'] = true;
echo json_encode($json);

