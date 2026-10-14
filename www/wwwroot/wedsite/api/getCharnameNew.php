<?php
header('Content-Type: text/html; charset=utf-8');


include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';

if(!isset($_SESSION['user_id']))
	exit;
else{
	if(!isset($_GET['sid']))
		exit;
	$user_id = $_SESSION['user_id'];
	$server_id = $_GET['sid'];
	$accountname = $_SESSION['niceUsername'];
	$dbh2 = connectGame($server_id, $dbh);
	$result = $dbh2->query("SELECT name, game_fzb, gold, lev FROM role WHERE account = '$accountname'");
	$data = array();
	if($result->rowCount() >0)
	{
		$listnick = $result->fetchAll();
		$i = 0;
		foreach($listnick as $item){
			$data[$i]['ID'] = $item['name'];
			$data[$i]['Nickname'] =  $item['name'];
			$i++;
		}
	}
	else
	{
		$data['ID'] = "";
		$data['Nickname'] =  "Chưa tạo nhân vật";
	}
	echo json_encode($data);
}