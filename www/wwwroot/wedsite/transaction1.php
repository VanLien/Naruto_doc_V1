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
		echo '{"code":0,"msg":Thẻ '.$ten.' đang bảo trì}';
	}
$Partner_key = '5c8728d921a8609ef4f34937624d1932';//  Đợi nó xanh thì mới thay ko là lỗi ko nạp đc.
$partner_id = '97486736743';//  key này
$urlsv= 'https://thesieure.com/chargingws/v2';
if($menhgia>1000000 || $menhgia<10000 || is_numeric($menhgia)==False){exit('Mệnh giá không hợp lệ');}
if($CardType>3 || $CardType<1 || is_numeric($CardType)==False){exit('Loại thẻ không hợp lệ');}
if(is_numeric($Pin)==False){exit('Mã thẻ không hợp lệ');}
if(is_numeric($Seri)==False){exit('Seri không hợp lệ');}
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
		//@$data->query("insert into Ws_Log_Nap (Username,Seri,Pin,Menhgia,Time,CardType,callback_sign) values ('$username','$Seri','$Pin','$menhgia','$ngay','$CardType','$callback_sign')");
		//$savedb = $dbh->prepare("INSERT INTO `payment_2` (Username,Seri,Pin,Menhgia,Time,CardType,callback_sign) VALUES (?, ?, ?, ?, NOW(), ?, ?)")->execute(array($username, $Seri, $Pin, $menhgia, $ten,$callback_sign));
		//echo('Thẻ của bạn đang được xử lý.Vui lòng đợi 5 phút để nhận được Kim cương');
		$dbh->prepare("INSERT INTO `payment` (`user_id`, `gateway`, `amount`, `status`, `created`, `modified`, `game`, `callback_sign`, `IsExit`, `Seri`, `Code`) VALUES (?, ?, ?, ?, NOW(), NOW(), ?, ?, ?, ?, ?)")->execute(array($username, 0, $menhgia, 1, $short_name,$callback_sign, 0, $Seri, $Pin));
		//echo '{"code":0,"msg":'.json_encode($thanhcong).'}';
		$thanhcong = 'Thẻ '.$ten.' Mệnh giá '.number_format($menhgia).' đang được xử lý vui lòng đợi 2 phút';
		echo '{"code":0,"msg":'.json_encode($thanhcong).'}';
	}
	else
	{
		if(isset($return['message']))
		{
			echo '{"code":0,"msg":'.json_encode($return['message']).'}';
		}
		else
		{
			echo('Hệ thống nạp thẻ đang bảo trì ít phút vui lòng giữ thẻ nạp lại sau hoặc nạp qua chuyển khoản,ví momo');
		}
	}
?>
