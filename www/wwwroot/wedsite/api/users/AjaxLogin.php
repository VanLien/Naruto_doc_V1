<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
$json['time_show'] = 3000;
if(isset($_SESSION['is_login'])){
    $json['status'] = false;
    $json['text'] = 'Bạn đã đăng nhập rồi';
	$json['location'] = '/user/panel';
    echo json_encode($json);
    exit;
}
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/xssClean.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$json = array();
if(isset($_POST['username']) && isset($_POST['password'])){
	$username = strtolower(trim($_POST['username']));
	$password = trim($_POST['password']);
}else{
	$json['status'] = false;
	$json['text'] = "Please enter your full username and password";
	echo json_encode($json);exit;
}
if (function_exists('xss_clean')) {
    $username = xss_clean($username);
    $password = xss_clean($password);
}
if (empty($username) || empty($password)) {
    $json['status'] = false;
    $json['text'] = 'Username or password cannot be left blank!';
} else {
	
    $md5Password = md5($password);// vào navicat ông lag vl vậy
   $result = $dbh->query("SELECT `uid`, `status` FROM `game_account` WHERE `username` = '{$username}' AND `password` = '{$password}' LIMIT 1")->fetch();
    if ($result !== false) {
        $acc_id = $result['uid'];
			$_SESSION['niceUsername'] = $username;
			$_SESSION['user_id'] = $acc_id;
			$_SESSION['pass'] = $md5Password;
			$_SESSION['security'] = md5($username.$acc_id.$md5Password.$security);
			$_SESSION['is_login'] = true;
			$dbh->prepare("INSERT INTO `ws_login_ip` (`username`, `ip`, `time`) VALUES (?, ?,NOW())")->execute(array($username, getIP()));
			$json['status'] = true;
			$json['location'] = '/panel';
    } else { 
        $json['status'] = false;
        $json['text'] = 'Wrong username or password';
    }
}
echo json_encode($json);
$dsn = null;
$dbh = null;
?>