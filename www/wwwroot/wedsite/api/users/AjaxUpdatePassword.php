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
if(!isset($_SESSION['niceUsername'])){
        $json['status'] = false;
        $json['text'] = "Vui lòng đăng nhập";
        echo json_encode($json);
        die();
    }else{
        $username = $_SESSION['niceUsername'];
}


function emailValid($string) 
{
    if (preg_match ("/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@gmail.com$/", $string))
    return true;
}
// /fullname:fullname,email:email,address:address,phonenumber:phonenumber,idcard:idcard,gender:gender,birthday:birthday
    if (isset($_POST['password']) || isset($_POST['newPassword']) || isset($_POST['reNewPassword'])) {
    $password = trim($_POST['password']); 
    $newPassword = trim($_POST['newPassword']); 
    $reNewPassword = trim($_POST['reNewPassword']); 
} else {
    $json['status'] = false;
    $json['text'] = "Vui lòng nhập đầy đủ các trường";
    echo json_encode($json);
    exit;
}

$result = $dbh->query("SELECT * FROM `game_account` WHERE `username` = '{$username}' AND `password` = '{$password}' LIMIT 1")->fetch();
if ($result == false) {
    $json['status'] = false;
    $json['text'] = "Mật khẩu cũ không đúng";
    echo json_encode($json);
    exit;
}

if ($newPassword != $reNewPassword) {
    $json['status'] = false;
    $json['text'] = "Xác nhận mật khẩu sai";
    echo json_encode($json);
    exit;
}

if ($password == $newPassword) {
    $json['status'] = false;
    $json['text'] = "Mật khẩu mới không được giống mật khẩu cũ";
    echo json_encode($json);
    exit;
}

try {
    $query = "UPDATE `game_account` SET `password` = ?, `modified` = ? WHERE `username` = ?";
    $stmt = $dbh->prepare($query);
    $stmt->execute([
        $newPassword,
        date('Y-m-d H:i:s'), 
        $username,
    ]);

    $json['status'] = true;
    $json['text'] = "Đổi mật khẩu thành công!";
} catch (Exception $e) {
    $json['status'] = false;
    $json['text'] = 'Có lỗi xảy ra!';
}

echo json_encode($json);
    $dbh ="";

    