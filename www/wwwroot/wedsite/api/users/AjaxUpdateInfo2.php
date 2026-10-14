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
        $json['msg'] = "Vui lòng đăng nhập";
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
    if(isset($_POST['password']) ||  isset($_POST['newPassword'])){
        $email = trim($_POST['password']);
        $phone = $_POST['newPassword'];
    }else{
        $json['status'] = false;
        $json['msg'] = "Vui lòng nhập ít đầy đủ các trường";
        echo json_encode($json);exit;
    }
    //validation
    if (emailValid($email) == false || strlen($email)<4 || strlen($email)>100){
        $json['status'] = false;
        $json['msg'] = "Email không đúng định dang.Vui lòng chỉ nhập đia chỉ Gmail";
        echo json_encode($json);exit;
    }
	 if (strlen($phone)>15 || strlen($phone)<10){
        $json['status'] = false;
        $json['msg'] = "SĐT không đúng vui lòng kiểm tra lại";
        echo json_encode($json);exit;
    }
    $result = $dbh->query("SELECT email FROM `game_account` WHERE `username` = '{$username}'")->fetch();
    if(strlen($result['email']) >=4){
        $json['status'] = false;
        $json['msg'] = "Tài khoản của bạn đã cập nhật Email rồi.Không cần cập nhật lại";
        echo json_encode($json);exit;
    }
    try {
        $query = "UPDATE `game_account` SET `email` = ?,`phonenumber` = ? WHERE `username` = ?";
        $result = $dbh->prepare($query)
            ->execute(array($email, $phone, $username));

        $json['status'] = true;
        $json['msg'] = "Thành công!";
    } catch (Exception $e) {
        $json['status'] = false;
        $json['msg'] = 'Lỗi!';
    }
    echo json_encode($json);
    $dbh ="";

    