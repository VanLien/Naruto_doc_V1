<?php
session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
	echo "Please login first";
  exit;
}else{
	if(isset($_POST['uid']))
		$id = $_POST['uid'];
	else{
		echo "Empty data";
		exit;
	}
}
$data = array();

include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$result = $dbh->query("SELECT username FROM users WHERE id = $id LIMIT 1")->fetch();
if($result){
$data = array(
	'status'=> true,
	'msg' => 'Success!',
	'this_username' => $result['username'],

);
}
else{
	$data = array(
	'status'=> false,
	'msg' => "Wrong ID",

);
}
echo json_encode($data);
exit;