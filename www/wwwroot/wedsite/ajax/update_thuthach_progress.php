<?php
// ajax/update_thuthach_progress.php

date_default_timezone_set('Asia/Ho_Chi_Minh');
header('Content-Type: application/json');

require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

if(!isset($_SESSION['user_id'])){
    echo json_encode(['error' => 'Vui lòng đăng nhập']);
    exit;
}

$username = $_SESSION['niceUsername'];
$times = isset($_POST['times']) ? intval($_POST['times']) : 1;

if ($times < 1) {
    echo json_encode(['error' => 'Số lần quay không hợp lệ']);
    exit;
}

try {
    // Lấy tất cả các thử thách
    $stmt = $dbh->prepare("SELECT id, milestone FROM ws_noel_thuthach");
    $stmt->execute();
    $challenges = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    foreach ($challenges as $challenge) {
        // Cập nhật tiến trình thử thách
        $stmtUpdate = $dbh->prepare("
            UPDATE ws_noel_thuthach_log 
            SET spins_completed = spins_completed + ? 
            WHERE username = ? AND challenge_id = ?
        ");
        $stmtUpdate->execute([$times, $username, $challenge['id']]);
    }
    
    echo json_encode(['status' => 'success']);
} catch (PDOException $e) {
    error_log('Database Error: ' . $e->getMessage());
    echo json_encode(['error' => 'Lỗi máy chủ']);
}
?>
