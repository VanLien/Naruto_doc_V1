<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/api/curl.php';

session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
  exit;
}
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
if(isset($_POST['pid']))
{
	$id = $_POST['pid'];
	$result = $dbh->query("SELECT * FROM `payment` WHERE `id` = '{$id}' LIMIT 1")->fetch();
	if (!$result == true){
		echo "Sai ID";
		exit;		
	}
	if($_POST['action'] == 'approve'){
		$status_id = 3;
	}else
	{
		$status_id = 0;
	}
	if($result['status'] !== '2'){
		echo "Sorry!, only pending payment can be update!";
		echo $result['status'];
		exit;
	}
	//Kiểm tra xem đơn hàng đã hoàn thành chưa
			// 0: hủy
            // 1: hoàn thành
            // 2: đang xử lý
            // 3: đã thanh toán
	
	
	// Thực hiện
	//$result = $dbh->prepare($query)->execute(array($fullname, $email, $address, $idcard, $gender, $birthday, $phonenumber, $username));
	try{
		$result2 = $dbh->prepare("UPDATE payment SET status=? WHERE ID = ?")
	->execute(array($status_id, $id));
		if($result2){
			$curl = new cURL(FALSE, 'cookie');
			$api_url = $url['home'].'/api/curl/sendGold.php';
			$html = $curl->get($api_url);
		}
		echo "Success";

	}
	catch (Exception $e) {
        echo 'Failed x0001';  
          }

}
else
{
	echo 'Failed x0002';  

}
