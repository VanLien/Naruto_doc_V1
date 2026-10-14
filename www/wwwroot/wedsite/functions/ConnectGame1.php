<?php
function connectGame($server, $dbh){
	$server_data = $dbh->query("SELECT `data` FROM `ip_web_sv` WHERE `uid` = '$server' LIMIT 1")->fetch();
	$dbName = $server_data['data'];
	
	$config = array(
		'dbHost' => 'localhost',
		'dbUser' => 'root',
		'dbPass' => '123456',
		'dbName' => $dbName,
		'dbOptions' => array(
	        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
	    )
	);
	
	try{
	$dsn = "mysql:host={$config['dbHost']};port=3306;dbname={$config['dbName']}";
	$dbh = new PDO($dsn, $config['dbUser'], $config['dbPass'], $config['dbOptions']);
	}catch (PDOException $e) {
		$json['status'] = false;
		$json['msg'] = "Please enter the character creation game!" . $e;
		echo json_encode($json);
		die();
	}
	return $dbh;
}
?>