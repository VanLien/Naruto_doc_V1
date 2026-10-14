
<?php
function checkPaymentByID($gateway, $compareValue){
	include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
	$query = "SELECT * FROM `payment` WHERE status ='2' AND gateway = '{$gateway}'";
	$result = $dbh->query($query)->fetchAll();
	if(!$result === false){
		foreach ($result as $key => $payment) {
		        $pos = strpos($payment['payment_id'], $compareValue);
		          if ($pos !== false) {
		            $checkCode = true;
		          }else{
		          	$checkCode = false;
		          }
		          return $checkCode;
				# code...
			}
	}else{
		return "Lỗi";
	}
}

	