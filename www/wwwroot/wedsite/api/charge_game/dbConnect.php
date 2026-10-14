<?php
function connectGame($server){
	switch ($server) {
		case '1':
			$dbName = 'sszg_symlf_1';
			break;
		case '2':
			$dbName = 'sszg_symlf_2';
			break;
		case '3':
			$dbName = 'sszg_symlf_3';
			break;
		case '4':
			$dbName = 'sszg_symlf_4';
			break;
		case '5':
			$dbName = 'sszg_symlf_5';
			break;
		case '6':
			$dbName = 'sszg_symlf_6';
			break;
		case '7':
			$dbName = 'sszg_symlf_7';
			break;
		case '8':
			$dbName = 'sszg_symlf_8';
			break;
		case '9':
			$dbName = 'sszg_symlf_9';
		break;
		case '10':
			$dbName = 'sszg_symlf_10';
		break;
		
		default:
			$dbName = 'sszg_symlf_1';
			break;
	}
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
		$json['msg'] = "Lỗi không xác định, vui lòng báo với hỗ trợ viên!";
		echo json_encode($json);
		die();
	}
	return $dbh;
}
?>