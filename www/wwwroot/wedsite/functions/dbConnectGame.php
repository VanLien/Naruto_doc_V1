<?php


function connectDb($server, $config){
	switch ($server) {
		case '1':
			$dbname = 'sszg_symlf_1';// đổi lai cho đúng db
			break;
		case '2':
			$dbname = 'sszg_symlf_2';
			break;
		case '3':
			$dbname = 'sszg_symlf_3';
			break;
		case '4':
			$dbname = 'sszg_symlf_4';
			break;
		case '5':
			$dbname = 'sszg_symlf_5';
			break;
		case '6':
			$dbname = 'sszg_symlf_6';
			break;
			case '7':
			$dbname = 'sszg_symlf_7';
			break;
			case '8':
			$dbname = 'sszg_symlf_8';
			break;
			case '9':
			$dbname = 'sszg_symlf_9';
			break;
		case '7':
			$dbname = 'sszg_symlf_10';
			break;	
		default:
			# code...
			break;
	}
	// $dbname = $config['dbGame'].$db;
	try{
	$dsn2 = "mysql:host={$config['dbHost']};port=3306;dbname={$dbname}";
	$dbh2 = new PDO($dsn2, $config['dbUser'], $config['dbPass'], $config['dbOptions']);
}catch (PDOException $e) {
	$json['status'] = false;
	$json['msg'] = "Vui lòng vào game tạo nhân vật!";
	echo json_encode($json);
	die();
}
return $dbh2;
}