<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$json = array();
if(isset($_POST['username']) && isset($_POST['email'])){
	$username = strtolower(trim($_POST['username']));
	$email = trim($_POST['email']);
}else{
	$json['status'] = false;
	$json['msg'] = "Vui lòng nhập đủ tên tài khoản và mật khẩu";
	echo json_encode($json);exit;
}

if (empty($username) || empty($email)) {
    $json['status'] = false;
    $json['msg'] = 'Tên đăng nhập hoặc email không thể bỏ trống!';
} else {
	
    $result = $dbh->query("SELECT `uid`, `status` FROM `game_account` WHERE `username` = '{$username}' AND `email` = '{$email}' LIMIT 1")->fetch();
    if ($result !== false) {
        if ($result['status'] == '1') {
            $uniqidStr = md5(uniqid(mt_rand()));;
            $resetPassLink = 'http://codexworld.com/resetPassword.php?fp_code='.$uniqidStr;
            //send reset password email
            

            $json['status'] = true;
            //do something

        } else {
            $json['status'] = false;
            $json['msg'] = 'Tài khoản đã bị khóa!';
        }
    } else { 
        $json['status'] = false;
        $json['msg'] = 'Tên tài khoản hoặc email không chính xác';
    }
}
echo json_encode($json);
$dsn = null;
$dbh = null;
?>