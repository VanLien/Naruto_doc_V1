<?php
session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
  exit;
}
$data = array();

include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
//lấy tháng, năm hiện tại
$this_month =  date("m");
$this_year = date("Y");
//lấy amount tháng
$result_month = $dbh->query("SELECT sum(amount) AS sum FROM payment WHERE MONTH(modified) = $this_month AND YEAR(modified) = $this_year AND status = 1")->fetch();
//lấy amount toàn thời gian
$result_alltime = $dbh->query("SELECT sum(amount) AS sum FROM payment WHERE status = 1")->fetch();
if($result_month && $result_alltime){
$data = array(
	'status'=> true,
	'this_month' => number_format($result_month['sum']),
	'alltime' => number_format($result_alltime['sum']),

);
}
else{
	$data['status'] = false;
}
echo json_encode($data);
exit;