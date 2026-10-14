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
if(!isset($_SESSION['username'])){
        $json['status'] = false;
        $json['msg'] = "Vui lòng đăng nhập";
        echo json_encode($json);
        die();
    }else{
        $username = $_SESSION['username'];
}



// /fullname:fullname,email:email,address:address,phonenumber:phonenumber,idcard:idcard,gender:gender,birthday:birthday
if(isset($_POST['fullname']) || isset($_POST['email']) || isset($_POST['address']) || isset($_POST['phonenumber'])|| isset($_POST['idcard']) || isset($_POST['gender']) || isset($_POST['birthday'])){
    $fullname = $_POST['fullname'];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $phonenumber = $_POST['phonenumber'];
    $idcard = $_POST['idcard'];
    $gender = $_POST['gender'];
    $birthday = $_POST['birthday'];
    $password = md5($_POST['currentPassword']);

}else{
    $json['status'] = false;
    $json['msg'] = "Vui lòng nhập ít nhất 1 trường";
    echo json_encode($json);exit;
}
    //validation
    $result = $dbh->query("SELECT * FROM `game_account` WHERE `username` = '{$username}' AND `password` = '{$password}' LIMIT 1")->fetch();
    if ($result == false){
        $json['status'] = false;
        $json['msg'] = "Sai mật khẩu hiện tại";
        echo json_encode($json);exit;
    }
    
    try {
        $query = "UPDATE `game_account` SET 
            `fullname` = ?,
            `email` = ?,
            `address` = ?,
            `idcard` = ?,
            `gender` = ?,
            `birthday` = ?,
            `phonenumber` = ?
         WHERE `username` = ?";
        $result = $dbh->prepare($query)
            ->execute(array($fullname, $email, $address, $idcard, $gender, $birthday, $phonenumber, $username));

        $json['status'] = true;
        $json['msg'] = $query;
    } catch (Exception $e) {
        $json['status'] = false;
        $json['msg'] = 'Đăng ký lỗi!';
    }
    echo json_encode($json);
    $dbh ="";

    