<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php';

$result = array();
if(!isset($_SESSION['user_id'])){
    $msg = "Vui lòng đăng nhập";
} else {
    $check = $dbh->query("SELECT * FROM ws_spin ORDER BY RAND() LIMIT 12")->fetchAll();
    $acc = array();
    $listitem = [];
    $listcount = [];
    $listname = [];
    for($i = 0; $i < count($check); $i++){
        $Place = $i + 1;
        $acc['Place' . $Place] = array(
            'icon' => '<img style="width: 55px;" src="/shop/' . $check[$i]['icon'] . '.png">',
            'count' => $check[$i]['count']
        );
        $listitem[] = $check[$i]['item'];
        $listcount[] = $check[$i]['count'];
        $listname[] = $check[$i]['name'];
    }
    $_SESSION['listitem'] = $listitem;
    $_SESSION['listcount'] = $listcount;
    $_SESSION['listname'] = $listname;
    echo json_encode($acc);
}
