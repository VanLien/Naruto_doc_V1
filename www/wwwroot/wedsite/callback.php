<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
header('Content-Type: text/html; charset=utf-8');
date_default_timezone_set('Asia/Ho_Chi_Minh');
set_time_limit(0);
$ketQua = json_decode(file_get_contents('php://input'));
$id=$ketQua->callback_sign;
$menhgia=$ketQua->value;
$sql = $dbh -> query("SELECT * FROM payment where callback_sign='$id' and IsExit=0"); // quá nhọ sai cái tên mà nhìn mãi ko ra ô hay nhỉ cái code này trước tôi code mà sao ông đã có rồi nhỉ ^^ có sẵn ở đây mà k xài nhìn cái đoặn này mới nhớ ra là code của tôi :)
$r = $sql->fetch(PDO::FETCH_ASSOC);
if($r['IsExit'] == 0)
{
		$amount = $menhgia;
		$user = $r['user_id'];
		switch($amount) {
			case 10000:  $xu = 40000; break;// Chỉnh số xu nhận được
			case 20000:  $xu = 80000; break; 
			case 30000:  $xu = 120000; break;
			case 50000:  $xu = 200000; break; // chiết khấu 20%
			case 100000: $xu = 400000; break; // chiết khấu 15%
			case 200000: $xu = 800000; break;
			case 300000: $xu = 1200000; break;
			case 500000: $xu = 2000000; break;
			case 1000000: $xu = 4000000; break;
		}
		// Xu ly thong tin tai day
        //require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
		//$file = "carddung.log";
		//$fh = fopen($file,'a') or die("cant open file");
		//fwrite($fh,"Tai khoan: ".$user.", Loai the: ".$ten.", Menh gia: ".$amount.", Thoi gian: ".$time);
		//fwrite($fh,"\r\n");
		//fclose($fh);
		$dbh->prepare("UPDATE `game_account` SET `xu` = `xu` + ?,`tichnap` = `tichnap` + ?,`topngay` = `topngay` + ?,`toptuan` = `toptuan` + ? WHERE `uid` = ?")->execute(array($xu, $amount, $amount, $amount, $user));
		$dbh->prepare("UPDATE `payment` SET IsExit = ? where callback_sign= ?")->execute(array(1,$id));
		//$dbh->prepare("INSERT INTO `payment` (`user_id`, `gateway`, `amount`, `status`, `created`, `modified`, `game`) VALUES (?, ?, ?, ?, NOW(), NOW(), ?)")->execute(array($user, 0, $amount, 1, $short_name));
		//$thanhcong = 'Bạn đã thanh toán thành công thẻ '.$ten.' Mệnh giá '.number_format($amount);
		//echo '{"code":0,"msg":'.json_encode($thanhcong).'}';
		//echo $xu.$user;
}else{ 
//	$error = $result['msg'];
		//$file = "cardsai.log";
		//$fh = fopen($file,'a') or die("cant open file");
	//	fwrite($fh,"Tài khoản: ".$user.", Mã thẻ: ".$sopin.", Seri: ".$seri.", Mệnh giá: ".number_format($card_value).", Nội dung lỗi: ".$error.", Thời gian: ".$time);
	//	fwrite($fh,"\r\n");
	//	fclose($fh);
	//	echo '{"code":1,"msg":'.json_encode($error).'}';	
		exit;	
}

