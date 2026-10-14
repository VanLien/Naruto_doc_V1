<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
header('Content-Type: text/html; charset=utf-8');
date_default_timezone_set('Asia/Ho_Chi_Minh');
set_time_limit(0);
$username = $_SESSION['user_id'];
$CardType = $_POST['card_type_id'];
$Pin = $_POST['pin'];
$Seri = $_POST['seri'];
$menhgia = $_POST['price_guest'];
$Partner_key = '1c2d3acd81e4dcd76b1bf48abfe91651';
$partner_id = '81320367930';
$urlsv= 'https://thesieure.com/chargingws/v2';
$text =('Dữ liệu không hợp lệ');
if($CardType==1){
		$ten = "VIETTEL";
	}
elseif($CardType==2){
		$ten = "VINAPHONE";
	}
elseif($CardType==3){
		$ten = "MOBIFONE";
	}
elseif($CardType==4){
		$ten = "ZING";
	}
else{
		$text = 'Thẻ '.$ten.' đang bảo trì';exit;
}
if($menhgia>1000000 || $menhgia<10000 || is_numeric($menhgia)==False)
{
	$text =('Mệnh giá không hợp lệ');
}
elseif($CardType>3 || $CardType<1 || is_numeric($CardType)==False)
{
	$text =('Loại thẻ không hợp lệ');
}
elseif(is_numeric($Pin)==False){
	$text =('Mã thẻ không hợp lệ');
}
elseif(is_numeric($Seri)==False)
{
	$text =('Seri không hợp lệ');
}
else
{
	$callback_sign = md5($Partner_key.$Pin.$Seri);
	$post = [
			'telco' => $ten,
			'code' => $Pin, 
			'serial' => $Seri,
			'amount'   => $menhgia,
			'request_id' => time(),
			'partner_id' => $partner_id,
			'sign' => $callback_sign,
			'command' => 'charging',
			];
	$return = SendCard($urlsv,$post);
	if($return['status']==99)
	{
		$short_name='pkm';
		$dbh->prepare("INSERT INTO `payment` (`user_id`, `gateway`, `amount`, `status`, `created`, `modified`, `game`, `callback_sign`, `IsExit`, `Seri`, `Code`) VALUES (?, ?, ?, ?, NOW(), NOW(), ?, ?, ?, ?, ?)")->execute(array($username, 0, $menhgia, 1, $short_name,$callback_sign, 0, $Seri, $Pin));
		$text = 'Thẻ '.$ten.' Mệnh giá '.number_format($menhgia).' đang được xử lý vui lòng đợi 2 phút';
	}
	else
	{
		if(isset($return['message']))
		{
			$text =  $return['message'];
		}
		else
		{
			$text =('Hệ thống nạp thẻ đang bảo trì ít phút vui lòng giữ thẻ nạp lại sau hoặc nạp qua chuyển khoản,ví momo');
		}
	}
}
$result = array();
$result['text'] = $text;
echo json_encode($result);
exit;
?>
