<?php
// sleep(1);

$short_name = 'mtd';
session_name('admin_session');

session_start();


if(!isset($_SESSION['admin'])){
  exit;
}else{
	$admin = $_SESSION['admin'];
}
$json = array();
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
if(isset($_POST['code']) && isset($_POST['items'])&& isset($_POST['subject'])&& isset($_POST['content'])&& isset($_POST['date'])&& isset($_POST['code_limit'])&& isset($_POST['code_limit_num'])&& isset($_POST['server']))
{

	try{
		
		$code = $_POST['code'];
		$items = $_POST['items'];
		$subject = $_POST['subject'];
		$content = $_POST['content'];
		
		$date = $_POST['date'];
		$code_limit = $_POST['code_limit'];
		$code_limit_num = $_POST['code_limit_num'];
		$user = 'all';
		$server = $_POST['server'];
		$date_format = time() + $date*24*60*60;
		$expired_date = date("Y-m-d H:i:s", $date_format);
		$MaxType=0;
		$check = $dbh->query("SELECT MAX(id) as MaxType FROM giftcode_mtd")->fetch();
		$MaxType = $check['MaxType'] +1;
		$result2 =$dbh->prepare("INSERT INTO `giftcode_mtd` (code, expired_date, subject, content, item, server, user, is_limited, limit_number,TypeCode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
	            ->execute(array($code, $expired_date, $subject, $content, $items, $server, $user, $code_limit, $code_limit_num,$MaxType));
		$json['status'] = true;
		$json['msg'] = "Thêm thành công code $code";
		 // Log
          $action = 'Add code'. $code . ' to server: '.$server;
      	try {
        $dbh->prepare("INSERT INTO `admin_log` (username, action, created, ip, game) VALUES (?, ?, NOW(), ?, ?)")
	            ->execute(array($admin, $action, $_SERVER['REMOTE_ADDR'], $short_name));
	      } catch (Exception $e) {
	        $json['status'] = false;
	        $json['msg'] = $e;
		}    
		echo json_encode($json);
		exit;

	}
	catch (Exception $e) {
		$json['status'] = false;
		$json['msg'] = "Failed x0001";
		echo json_encode($json);
		exit;
          }
     

}
else
{
	$json['status'] = false;
		$json['msg'] = "Failed x0002";
		echo json_encode($json);
		exit;

}
