<?php
error_reporting(0);
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
$username = $_SESSION['niceUsername'];
if($username == 'bantayvangdsfsdfsdf324234ASDEAS'){
$prize = [
    ['prize_id' => 1, 'rate' => 0, 'prize' => 10000, 'type' => 'xu', 'text' => '10,000xu', 'msg' => 'Chúc mừng bạn nhận được 10,000xu',  'color' =>'#d77967'],
    ['prize_id' => 2, 'rate' => 0, 'prize' => 20000, 'type' => 'knb', 'text' => '20,000KNB', 'msg' => 'Chúc mừng bạn nhận được 20,000KNB',  'color' =>'#d77367'],
    ['prize_id' => 3, 'rate' => 0, 'prize' => 50000, 'type' => 'knb', 'text' => '50,000KNB', 'msg' => 'Chúc mừng bạn nhận được 50,000KNB', 'color' =>'#977271'],
    ['prize_id' => 4, 'rate' => 0, 'prize' => 1000, 'type' => 'xu', 'text' => '1000xu', 'msg' => 'Chúc mừng bạn nhận được 1,000xu','color' =>'#c17430'],
    ['prize_id' => 5, 'rate' => 0, 'prize' => 20000, 'type' => 'xu', 'text' => '20,000xu', 'msg' => 'Chúc mừng bạn nhận được 2,000xu','color' =>'#c98f2a'],
    ['prize_id' => 6, 'rate' => 0, 'prize' => 5000, 'type' => 'xu', 'text' => '5000xu', 'msg' => 'Chúc mừng bạn nhận được 10,000xu','color' =>'#898e36'],
    ['prize_id' => 7, 'rate' => 0, 'prize' => 0, 'type' => 'mayman', 'text' => 'Mất lượt', 'msg' => 'Chúc bạn may mắn lần sau!','color' =>'#18191b'],
	['prize_id' => 10, 'rate' => 0, 'prize' => 0, 'type' => 'themluot', 'text' => 'Thêm lượt', 'msg' => 'Thêm lượt','color' =>'#577271'],
	['prize_id' => 11, 'rate' => 0, 'prize' => 10000, 'type' => 'xu', 'text' => '10,000xu', 'msg' => 'Thêm lượt','color' =>'#d54227'],
	['prize_id' => 12, 'rate' => 0, 'prize' => 50000, 'type' => 'xu', 'text' => '50,000xu', 'msg' => 'Thêm lượt','color' =>'#d54227'],
	['prize_id' => 13, 'rate' => 1, 'prize' => 100000, 'type' => 'xu', 'text' => '100,000xu', 'msg' => 'Thêm lượt','color' =>'#da1b60'],
	['prize_id' => 14, 'rate' => 0, 'prize' => 50000, 'type' => 'knb', 'text' => '50,000KNB', 'msg' => 'Thêm lượt','color' =>'#d54227'],
	['prize_id' => 15, 'rate' => 0, 'prize' => 1000000, 'type' => 'knb', 'text' => '1,000,000KNB', 'msg' => 'Thêm lượt','color' =>'#da1b60'],
];
}else{
$prize = [
    ['prize_id' => 1, 'rate' => 10, 'prize' => 10000, 'type' => 'xu', 'text' => '10,000xu', 'msg' => 'Chúc mừng bạn nhận được 10,000xu',  'color' =>'#d77967'],
    ['prize_id' => 2, 'rate' => 70, 'prize' => 20000, 'type' => 'knb', 'text' => '20,000KNB', 'msg' => 'Chúc mừng bạn nhận được 20,000KNB',  'color' =>'#d77367'],
    ['prize_id' => 3, 'rate' => 30, 'prize' => 50000, 'type' => 'knb', 'text' => '50,000KNB', 'msg' => 'Chúc mừng bạn nhận được 50,000KNB', 'color' =>'#977271'],
    ['prize_id' => 4, 'rate' => 10, 'prize' => 1000, 'type' => 'xu', 'text' => '1000xu', 'msg' => 'Chúc mừng bạn nhận được 1,000xu','color' =>'#c17430'],
    ['prize_id' => 5, 'rate' => 10, 'prize' => 20000, 'type' => 'xu', 'text' => '20,000xu', 'msg' => 'Chúc mừng bạn nhận được 2,000xu','color' =>'#c98f2a'],
    ['prize_id' => 6, 'rate' => 10, 'prize' => 5000, 'type' => 'xu', 'text' => '5000xu', 'msg' => 'Chúc mừng bạn nhận được 10,000xu','color' =>'#898e36'],
	['prize_id' => 10, 'rate' => 30, 'prize' => 0, 'type' => 'themluot', 'text' => 'Thêm lượt', 'msg' => 'Thêm lượt','color' =>'#577271'],
	['prize_id' => 11, 'rate' => 50, 'prize' => 10000, 'type' => 'xu', 'text' => '10,000xu', 'msg' => 'Thêm lượt','color' =>'#d54227'],
	['prize_id' => 12, 'rate' => 0, 'prize' => 50000, 'type' => 'xu', 'text' => '50,000xu', 'msg' => 'Thêm lượt','color' =>'#d54227'],
	['prize_id' => 13, 'rate' => 0, 'prize' => 100000, 'type' => 'xu', 'text' => '100,000xu', 'msg' => 'Thêm lượt','color' =>'#da1b60'],
	['prize_id' => 14, 'rate' => 1, 'prize' => 500000, 'type' => 'knb', 'text' => '500,000KNB', 'msg' => 'Thêm lượt','color' =>'#d54227'],
	['prize_id' => 15, 'rate' => 0, 'prize' => 1000000, 'type' => 'knb', 'text' => '1,000,000KNB', 'msg' => 'Thêm lượt','color' =>'#da1b60'],
];	
}

$segments = array();
foreach($prize as $segment){
	$segments[] = "{'fillStyle' : '".$segment['color']."','strokeStyle' : '#eae6d0','textFillStyle' : '#eae6d0', 'text' : '".$segment['text']."'}";
}
$config = array(
	'numSegments' => count($segments),
	'segments'=> $segments,
	'outerRadius' => 170,
	'duration' => 5,
	'spins' =>  count($prize),

);
function showSegments($array){
	foreach($array as $key=>$value){
      echo $value . ',';
    }
}