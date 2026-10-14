<?php
//error_reporting(0);
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
date_default_timezone_set("Asia/Ho_Chi_Minh");
function _s_has_special_chars( $string ) {
    return preg_match('/[^a-zA-Zd1-9]/', $string);
}
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/xssClean.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$json = array();
// Kiểm tra dữ liệu có được nhập chưa
if(isset($_POST['username']) || isset($_POST['password']) || isset($_POST['rePassword'])){
    $username = $_POST['username'];
    $password = $_POST['password'];
    $rePassword = $_POST['rePassword'];

}else{
    $json['status'] = false;
    $json['msg'] = "Vui lòng nhập ít nhất 1 trường";
    echo json_encode($json);exit;
}

// kiểm tra xem đã đăng nhập chưa
if(!isset($_SESSION['user_id'])){
        $json['status'] = false;
        $json['msg'] = "Vui lòng đăng nhập";
        echo json_encode($json);
        die();
    }else{
        $user_id = $_SESSION['user_id'];
}
// Kiểm tra liệu tài khoản đã có username chưa?

    $result = $dbh->query("SELECT * FROM `game_account` WHERE `uid` = '{$user_id}' LIMIT 1")->fetch();
    if (!$result){
        $json['status'] = false;
        $json['msg'] = "Xác thực thông tin sai";
        echo json_encode($json);exit;
    }
    if ($result['username'] != ''){
        $json['status'] = false;
        $json['msg'] = "Tên tài khoản đã được cập nhật rồi!";
        echo json_encode($json);exit;
    }
    // kiểm tra có trùng tên tài khoản ko
    $result2 = $dbh->query("SELECT * FROM `game_account` WHERE `username` = '{$username}' LIMIT 1")->fetch();
     if ($result2){
        $json['status'] = false;
        $json['msg'] = "Tên tài khoản đã có người sử dụng!";
        echo json_encode($json);exit;
    }

    //validation
    if($password != $rePassword) {
    $json['status'] = false;
    $json['msg'] = "Xác nhận mật khẩu sai";
    echo json_encode($json);exit;
    }

    if(_s_has_special_chars($username) == 1){
        $json['status'] = false;
        $json['msg'] = "Tên tài khoản không được chứa ký tự đặc biệt";
        echo json_encode($json);exit;
    }
    if(strlen($username) < 4 || strlen($username) >  18){
        $json['status'] = false;
        $json['msg'] = "Tài khoản phải từ 4 - 18 ký tự";
        echo json_encode($json);exit;
    }
    if(strlen($password) < 4 || strlen($password) >  18){
        $json['status'] = false;
        $json['msg'] = "Mật khẩu phải từ 4 - 18 ký tự";
        echo json_encode($json);exit;
    }
    
    $md5pass = md5($password);
    
    try {
        $query = "UPDATE `game_account` SET 
            `username` = ?,
            `password` = ?
         WHERE `id` = ?";
        $result = $dbh->prepare($query)
            ->execute(array($username, $md5pass, $user_id));

        $json['status'] = true;
        $json['msg'] = "Cập nhật thông tin thành công";
    } catch (Exception $e) {
        $json['status'] = false;
        $json['msg'] = 'Đăng ký lỗi!'. $e;
    }
    echo json_encode($json);
    $dbh ="";

    