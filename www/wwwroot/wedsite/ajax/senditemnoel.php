<?php
// ajax/senditemnoel.php

date_default_timezone_set('Asia/Ho_Chi_Minh');
header('Content-Type: application/json');

require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php';

if(!isset($_SESSION['user_id'])){
    echo json_encode(['error' => 'Vui lòng đăng nhập']);
    exit;
}

$username = $_SESSION['niceUsername'];
$stack = [];

try {
    $stmt = $dbh->prepare("SELECT * FROM ws_noel_log WHERE Username = ? AND IsExit = 0");
    $stmt->execute([$username]);
    $checkitem = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach($checkitem as $item){
        $TemplateID = $item['Item'];
        $count = $item['Count'];
        if($TemplateID == '0'){ // Giả sử '0' là xu
            // Cộng xu
            $updateStmt = $dbh->prepare("UPDATE game_account SET xu = xu + ? WHERE username = ?");
            $updateStmt->execute([$count, $username]);
        }
        else{
            // Gửi item qua hệ thống game
            $Post = [
                'type'=> '8',
                'usr'=> $username,
                'item'=> $item['Item'],
                'num'=> $item['Count'],
                'qu'=> $item['Sv'],
                'bao'=> 0,
                'sqm'=> $PassGm, // Đảm bảo biến $PassGm đã được khai báo và an toàn
            ];
            sendMail($LinkGm, $Post); // Hàm gửi thông tin tới game server
        }
    }

    // Đánh dấu đã gửi phần thưởng
    $updatelog = $dbh->prepare("UPDATE ws_noel_log SET IsExit = 1 WHERE Username = ?");
    $updatelog->execute([$username]);

    echo json_encode(['status' => 'success']);
} catch (PDOException $e) {
    error_log('Database Error: ' . $e->getMessage());
    echo json_encode(['error' => 'Lỗi máy chủ']);
}
?>
