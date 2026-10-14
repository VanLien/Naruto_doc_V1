<?php
session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
	echo "Please login first";
  exit;
}else{
	if(isset($_POST['uname']))
		$uname = $_POST['uname'];
	else{
		echo "Empty data";
		exit;
	}
}
$data = array();

include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';

$result = $dbh->query("SELECT id FROM users WHERE username = '$uname'")->fetch();
if($result){
$data = array(
	'status'=> true,
	'msg' => 'Success!',
	'this_id' => $result['id'],

);
}
else{
	$data = array(
	'status'=> false,
	'msg' => "Wrong username",

);
}
echo json_encode($data);
exit;