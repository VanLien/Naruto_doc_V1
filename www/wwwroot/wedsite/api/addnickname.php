<?php
$json = array();
date_default_timezone_set('Asia/Ho_Chi_Minh');
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/xssClean.php';
if(empty($_POST['security']) || empty($_POST['server']) || empty($_POST['actorname'])){
$json['status'] = false;
$json['text'] = 'Vui lòng nhập đủ các trường';
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
	$json['text'] =  "Vui lòng đăng nhập";
	echo json_encode($json);
	exit;
}
$security = trim(xssClean($_POST['security']));
$actorname = trim(xssClean($_POST['actorname']));
$serverId = trim($_POST['server']);
$username = $_SESSION['niceUsername'];
$checknick = $dbh->query("SELECT * FROM `ws_nickname` WHERE `nickname` = '$actorname' AND `sv` = '$serverId'");
if($checknick->rowCount() >0)
{
	$json['status'] = false;
	$json['text'] = "[Server $serverId] Character name already exists";
	echo json_encode($json);
	exit;
}
$checknick = $dbh->query("SELECT * FROM `ws_nickname` WHERE `username` = '$username' AND `sv` = '$serverId'");
if($checknick->rowCount() >0)
{
	$infoacc = $checknick->fetchAll();
	for($i = 0; $i < count($infoacc); $i++){
		if($infoacc[$i]['Security'] <> $security)
		{
			$json['status'] = false;
			$json['text'] = "Please enter the correct security code";
			echo json_encode($json);
			exit;
		}
	}
	
}
if($checknick->rowCount() >=5)
{
	$json['status'] = false;
	$json['text'] = "You have run out of characters. Each account can only add up to 5 characters";
	echo json_encode($json);
	exit;
}
$checknick = $dbh->query("SELECT * FROM `ws_nickname` WHERE `username` = '$username' AND `nickname` = '$actorname' AND `sv` = '$serverId'");
if($checknick->rowCount() >0)
{
	$json['status'] = false;
	$json['text'] = "Character name already exists";
	echo json_encode($json);
	exit;
}
$dbh->prepare("INSERT INTO `ws_nickname` (`username`, `nickname`, `ip`, `security`, `sv`, `time`) VALUES (?,?,?,?,?,NOW())
")->execute(array($username, $actorname, getIP(), $security, $serverId));
$luotthem = $dbh->query("SELECT * FROM `ws_nickname` WHERE `username` = '$username' AND `sv` = '$serverId'");
$json['text'] = "[Server $serverId] Add successful character name you still ".(5-$luotthem->rowCount()." in turn");
}
$json['status'] = true;
echo json_encode($json);

