<?php
// sleep(1);
error_reporting(0);
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

if(isset($_GET['uid'])){
	if(is_numeric($_GET['uid'])){
		$type = $_GET['uid'];
	$uid = $_SESSION['user_id'];
	$condition = "WHERE `user_id` = '{$uid}'";
	$limit = 100;
	}else{
		exit;
	}
}else{
	$uid = '';
	$condition = '';
	$limit = 20;
}
if($type == 2){
	$log = $dbh->query("SELECT * FROM `vongquay_log` WHERE `type` = 'thecao' OR `prize` >= 500000 ORDER BY `id` DESC ")->fetchAll();


}
else{
$log = $dbh->query("SELECT * FROM `vongquay_log` $condition ORDER BY `id` DESC LIMIT $limit")->fetchAll();

}
?>

<?php foreach ($log as $item){
	$date = date_create($item['created']);
	$date_f = date_format($date, 'H:i d-m-Y');
	if($item['type'] == 'xu')
		$type = 'XU';
	elseif($item['type'] == 'knb')
		$type = 'KNB';
	elseif($item['type'] == 'thecao')
		$type = 'K thẻ';
	else
		$type = 'mayman';
	if($type != 'mayman')
	echo '<li class="list-group-item"><strong class="text-primary">'.$item['username'].'</strong> <span class="text-muted">nhận được</span> <strong class="text-success">'.number_format($item['prize']).$type.'</strong> <span class="text-muted">vào lúc</span> '.$date_f.'
				</li>';
}
?>
