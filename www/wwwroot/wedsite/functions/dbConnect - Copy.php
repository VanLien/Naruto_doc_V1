<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/hntntn.php';
function getIP()
{
	if (!empty($_SERVER['HTTP_CLIENT_IP']))
	{
		$ip=$_SERVER['HTTP_CLIENT_IP'];
	}
	elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   
	{
		$ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
	}
	else
	{
		$ip=$_SERVER['REMOTE_ADDR'];
	}
	return $ip;
}
function checktxt($text)
{
	$checktxt = preg_match("/^([a-zA-Z0-9\-\_.]*)$/",$text);
	if($checktxt==true)
	{
		return true;
	}
	else
	{
		return false;
	}
}
try{
	$dsn = "mysql:host={$config['dbHost']};port=3306;dbname={$config['dbName']}";
	$dbh = new PDO($dsn, $config['dbUser'], $config['dbPass'], $config['dbOptions']);
}catch (PDOException $e) {
	$json['status'] = false;
	$json['msg'] = "Unknown error, please report to support!";
	echo json_encode($json);
	die();
}
$security = 'A21AAPzQD5ctDAU7biV8XTS0kavkl6g7FZ';// anti hack login
$token = "A21AAPzQD5ctDAU7biV8XTS0kavkl6g7FZ-csoHxKOVkUKsNKjzHIhvoYp0kM8EXeHIvFXJTWluKSucoApSHrul54fUyfTqtw";