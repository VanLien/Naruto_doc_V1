<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');

session_start();
error_reporting(0);

include_once $_SERVER['DOCUMENT_ROOT'].'/hntntn.php';

$conn = mysqli_connect($config['dbHost'],$config['dbUser'],$config['dbPass'],$config['dbName']) or die ("Không thể kết nối đến CSDL");
mysqli_set_charset($conn,"UTF8");


if(!isset($_SESSION['user_id'])){
	echo json_encode(array('status' => 1, 'msg' => "Bạn vui lòng đăng nhập trước."));
	exit();
}
if(empty($_POST['card_type_id']) || empty($_POST['seri']) || empty($_POST['pin']) || empty($_POST['price_guest'])){
	echo json_encode(array('status' => 1, 'msg' => "Bạn cần điền đầy đủ thông tin."));
	exit();
}

$user_id = $_SESSION['user_id'];
$provider = $_POST['card_type_id']; // string
$serial = $_POST['seri']; // string
$pin = $_POST['pin']; // string
$amount = $_POST['price_guest']; // interger


require_once('napthe.class.php');

				
$napthe = new napthe();
$note = $user_id;
$time = date('Y-m-d H:i:s');


$charge_result = $napthe->ChargeCard($provider, $serial, $pin, $amount, $note); //thực hiện đẩy thẻ lên hệ thống TrumThe247.Com

if($charge_result == false) { //Có lỗi trong quá trình đẩy thẻ.
	echo json_encode(array('status' => 1, 'msg' => "Có lỗi xảy ra khi nạp thẻ. Xin thử lại."));
	exit();
} else if(is_string($charge_result)) { //Có lỗi trả về của hệ thống TRUMTHE247.COM.
	echo json_encode(array('status' => 1, 'msg' => $charge_result));
	exit();
} else if(is_array($charge_result)) { //Gửi thẻ thành công lên hệ thống.
	$success = 'Gửi thẻ thành công!';

	$trxid = $charge_result["trxid"];

	$qrlog = $conn->query("INSERT INTO `payment` (user_id,amount,gateway,created,seri,code,payment_name, status, trxid, game) VALUES ('".$user_id."', '".$amount."', '0', '".$time."','".$serial."', '".$pin."','".$provider."',0,'".$trxid."','".$short_name."')");
	if(!$qrlog) {
		echo json_encode(array('status' => 1, 'msg' => "Có lỗi xảy ra khi nạp thẻ. Liên hệ ADMIN."));
		exit();
	}
	echo json_encode(array('status' => 0, 'msg' => "Gửi thẻ thành công lên hệ thống, xin đợi xử lý từ 2-5 phút."));
} else {
	echo json_encode(array('status' => 1, 'msg' => "Có lỗi xảy ra khi nạp thẻ. Xin thử lại."));
	exit();
}
?>
