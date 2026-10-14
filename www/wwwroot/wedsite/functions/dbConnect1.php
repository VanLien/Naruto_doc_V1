<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/hntntn.php';
try{
	$dsn = "mysql:host={$config['dbHost']};port=3306;dbname={$config['dbName']}";
	$dbh = new PDO($dsn, $config['dbUser'], $config['dbPass'], $config['dbOptions']);
}catch (PDOException $e) {
	$json['status'] = false;
	$json['msg'] = "Unknown error, please report to support!";
	echo json_encode($json);
	die();
}