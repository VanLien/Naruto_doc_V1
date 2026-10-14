<?php
include_once 'jni.php';
$url = array(
	'home' => 'http://ninjahokage.com',
	'id' => 'http://ninjahokage.com/user',
	'fb' => 'https://www.facebook.com/hokagedc/',
	'fb_group' => 'https://www.facebook.com/group/hokagedc'
);
// khuyến mãi nạp thẻ 
$promotion = array(
	'momo_bank_rate' => 400, // tỉ lệ cộng thêm khi nạp bằng Momo và ngân hàng 1.2 là 20% ( là 100 x 20 = 2000 => 100k được 2m xu )
	'start' => '12/12/2024 19:00:00',//-------m/d/Y H:i:s
	'end' => '12/12/2025 19:00:00',//-------m/d/Y H:i:s
	'promotion_rate' => 1, //nếu khuyến mãi 100% là 2, 50% là 1.5
	'promotion_normal_rate' => 1 //tỉ lệ bình thường
);
//database
// event tích lũy
$date = array(
	'start' => '2024-06-01 00:00:00', // năm- tháng- ngày giờ
	'end' => '2024-12-30 23:59:59',// năm- tháng- ngày giờ
);
// event nap ngày
$dateday = array(
	'start' => '2021-05-24 09:30:00', // năm- tháng- ngày giờ
	'end' => '2023-12-30 22:00:00',// năm- tháng- ngày giờ
);
//Xu nhận được khi tham gia sự kiện mời bạn
$invite_friend = array(
	'xu' => 2000,
	'ti_le' => 0.1 // 0.1 là 10%, hoa hồng % khi nạp thẻ

);
// Thời gian sự kiện nạp tích lũy
$timenaptichluy = '2023-12-10 21:59:59';
// Thời gian sự kiện nạp hỗ trợ
$timenaphotro = '2023-12-30 23:59:59';
// Thời gian sự kiện khuyến mãi sinh nhật
$timekmsinhnhat = '2023-12-26 23:59:59';
$config = array(
	'dbHost' => 'localhost',
	'dbUser' => 'root',
	'dbPass' => 'Vanlien1503',
	'dbName' => 'sszg_register',
	'dbFbLoginName' => 'oauth_login',
	'dbGame' => 'sszg_symlf_',
	'dbOptions' => array(
        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4',
    )
);
$payment_prefix = 'Hoachi';
define("PAYMENT_PREFIX", "Hoachi");

$dbDetails = array(
    'host' => $config['dbHost'],
    'user' => $config['dbUser'],
    'pass' => $config['dbPass'],
    'db'   => $config['dbName']
);
?>