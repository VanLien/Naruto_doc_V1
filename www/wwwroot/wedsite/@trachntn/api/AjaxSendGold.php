<?php
// sleep(1);

session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
  exit;
}else{
	$admin = $_SESSION['admin'];
}
$json = array();
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
if(isset($_POST['uid']) && isset($_POST['gold']))
{
	//User checker
	$id = $_POST['uid'];
	$gold = $_POST['gold'];
	$username = $_POST['uname'];
	$result = $dbh->query("SELECT * FROM `game_account` WHERE `uid` = '{$id}' LIMIT 1")->fetch();
	if (!$result == true){
		$json['status'] = false;
		$json['msg'] = "Wrong User ID" .$id.$gold;
		echo json_encode($json);
		exit;		
	}

	try{
		$result2 = $dbh->prepare("UPDATE game_account SET xu = xu + ? WHERE uid = ?")
	->execute(array($gold, $id));
		$json['status'] = true;
		$json['msg'] = 'Thêm thành công '.number_format($gold).' xu cho tài khoản ' .$username.', chúc bạn chơi game vui vẻ!';
		 // Log
          $action = "Add ". $gold . " to ID:".$id;
      	try {
        $dbh->prepare("INSERT INTO `admin_log` (username, action, created, ip) VALUES (?, ?, NOW(), ?)")
	            ->execute(array($admin, $action, $_SERVER['REMOTE_ADDR']));
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
