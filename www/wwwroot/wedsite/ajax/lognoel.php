<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
header('Content-Type: application/json');
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
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
    $stmt = $dbh->prepare("SELECT * FROM ws_noel_log WHERE Username = ? ORDER BY ID DESC LIMIT 10");
    $stmt->execute([$username]);
    $check = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    foreach($check as $log){
        $items = '<li class="list-group-item"><strong class="text-primary">'.
        htmlspecialchars($log['username'], ENT_QUOTES, 'UTF-8').'</strong> <span class="text-muted"><b>'.
        htmlspecialchars($log['Nickname'], ENT_QUOTES, 'UTF-8').'</b> Đã bốc được </span> <strong class="text-success">'.
        htmlspecialchars($log['Name'], ENT_QUOTES, 'UTF-8').' x('.intval($log['Count']).')</strong> <span class="text-muted">Time:</span> '.
        htmlspecialchars($log['Time'], ENT_QUOTES, 'UTF-8').'</li>';
        array_push($stack, $items);
    }

    $json = [
        'status' => 'true',
        'dathamgia' => count($check),
        'lichsu' => $stack
    ];
    echo json_encode($json);
} catch (PDOException $e) {
    error_log('Database Error: ' . $e->getMessage());
    echo json_encode(['error' => 'Đã xảy ra lỗi trên máy chủ. Vui lòng thử lại sau.']);
}
?>
