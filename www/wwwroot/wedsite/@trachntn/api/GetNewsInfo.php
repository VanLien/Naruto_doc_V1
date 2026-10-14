<?php
session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
	echo "Please login first";
  exit;
}else{
	if(isset($_POST['id']))
		$id = $_POST['id'];
	else{
		echo "Empty data";
		exit;
	}
}
$data = array();

include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$result = $dbh->query("SELECT * FROM news WHERE id = $id LIMIT 1")->fetch();
if($result){
$data = array(
	'status'=> true,
	'msg' => 'Success!',
	'title' => $result['title'],
	'thumbnail' => $result['thumbnail'],
	'content' => $result['content'],
	'type' => $result['type'],

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