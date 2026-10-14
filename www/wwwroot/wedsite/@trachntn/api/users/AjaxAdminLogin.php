<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/xssClean.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$json = array();
if(isset($_POST['username']) && isset($_POST['password'])){
	$username = strtolower(trim($_POST['username']));
	$password = trim($_POST['password']);
}else{
	$json['status'] = false;
	$json['msg'] = "Vui lòng nhập đủ tên tài khoản và mật khẩu";
	echo json_encode($json);exit;
}
if (function_exists('xss_clean')) {
    $username = xss_clean($username);
    $password = xss_clean($password);
}
if (empty($username) || empty($password)) {
    $json['status'] = false;
    $json['msg'] = 'Tên đăng nhập hoặc mật khẩu không thể bỏ trống!';
} else {
	
    $md5Password = md5($password);
    $result2 = $dbh->prepare("SELECT `username` FROM `admin` WHERE `username` =? AND `password` = ? LIMIT 1");
	$result2->execute(array($username,$md5Password));
	$result = $result2->fetchAll();
    if (!empty($result)) {
			$result = $result[0];
            $json['status'] = true;
            session_name('admin_session');
            session_set_cookie_params(time() + (10 * 365 * 24 * 60 * 60));
            session_start();

            $_SESSION['admin'] = $result['username'];
            $_SESSION['is_login'] = true;
    } else { 
        $json['status'] = false;
        $json['msg'] = 'Sai tên tài khoản hoặc mật khẩu';
    }
}
echo json_encode($json);
$dsn = null;
$dbh = null;
?>