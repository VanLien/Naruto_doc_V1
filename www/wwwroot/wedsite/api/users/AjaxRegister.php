<?php
//error_reporting(0);
function _s_has_special_chars( $string ) {
    return preg_match('/[^a-zA-Zd0-9]/', $string);
}
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/xssClean.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$json = array();
$username = $password = "";

if(isset($_POST['username']) && isset($_POST['password']) && isset($_POST['repassword'])){
    $username = strtolower(trim($_POST['username']));
    $password = trim($_POST['password']);
    $rePassword = trim($_POST['repassword']);
    if(is_numeric($_POST['referrer']))
        $referrer = $_POST['referrer'];
    else
        $referrer = "none";
}else{
    $json['status'] = false;
    $json['text'] = "Vui lòng nhập đủ các trường";
    echo json_encode($json);exit;
}
//XSS cleaner
if (function_exists('xssClean')) {
    $username = xssClean($username);
}
if($password != $rePassword) {
    $json['status'] = false;
    $json['text'] = "Xác nhận mật khẩu sai";
    echo json_encode($json);exit;
}
if(_s_has_special_chars($username) == 1){
    $json['status'] = false;
    $json['text'] = "Tên tài khoản không được chứa ký tự đặc biệt";
    echo json_encode($json);exit;
}
if(_s_has_special_chars($password) == 1){
    $json['status'] = false;
    $json['text'] = "Mật khẩu không được chứa ký tự đặc biệt";
    echo json_encode($json);exit;
}
if(strlen($username) < 4 || strlen($username) >  18){
    $json['status'] = false;
    $json['text'] = "Tài khoản phải từ 4 - 18 ký tự";
    echo json_encode($json);exit;
}
if(strlen($password) < 4 || strlen($password) >  18){
    $json['status'] = false;
    $json['text'] = "Mật khẩu phải từ 4 - 18 ký tự";
    echo json_encode($json);exit;
}

if (empty($username) || empty($password)) {
    $json['status'] = false;
    $json['text'] = 'Tên đăng nhập hoặc mật khẩu không thể bỏ trống!';
} else {
    date_default_timezone_set("Asia/Ho_Chi_Minh");
    $md5Password = md5($password);
    $result = $dbh->query("SELECT uid FROM `game_account` WHERE `username` = '{$username}' LIMIT 1")->fetch();
    if (!$result) {
        try {
            $dbh->prepare("INSERT INTO `game_account` (username, password, created, ip_address, referrer) VALUES (?, ?, NOW(), ?, ?)")
                ->execute(array($username, $password, $_SERVER['REMOTE_ADDR'], $referrer));
          } catch (Exception $e) {
            $json['status'] = false;
            $json['text'] = 'Đăng ký lỗi!'.$e;
        }      
            $json['status'] = true;
            include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
            // lấy thông tin để tự động đăng nhập
            $getinfo = $dbh->query("SELECT uid FROM `game_account` WHERE `username` = '{$username}' LIMIT 1")->fetch();
            $_SESSION['niceUsername'] = $username;
            $_SESSION['user_id'] = $getinfo['uid'];
            $_SESSION['is_login'] = true;
			$json['location'] = '/panel';
        
    } else {
        $json['status'] = false;
        $json['text'] = 'Tên tài khoản đã được sử dụng!';
    }
}
echo json_encode($json);
?>