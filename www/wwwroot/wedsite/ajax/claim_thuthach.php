<?php
// ajax/claim_thuthach.php

date_default_timezone_set('Asia/Ho_Chi_Minh');
header('Content-Type: application/json');

require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php'; // Hàm gửi thông tin tới game server
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php'; // Hàm gửi xu nếu cần
include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php'; // Cấu hình game server

if(!isset($_SESSION['user_id'])){
    echo json_encode(['error' => 'Vui lòng đăng nhập']);
    exit;
}

$username = $_SESSION['niceUsername'];
$challenge_id = isset($_POST['challenge_id']) ? intval($_POST['challenge_id']) : 0;
$server = isset($_POST['server']) ? intval($_POST['server']) : 0;

// CSRF Protection
if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
    echo json_encode(['error' => 'CSRF token không hợp lệ']);
    exit;
}

if ($challenge_id <= 0) {
    echo json_encode(['error' => 'Thử thách không hợp lệ']);
    exit;
}

if ($server <= 0) {
    echo json_encode(['error' => 'Máy chủ không hợp lệ']);
    exit;
}

try {
    // Lấy thông tin thử thách
    $stmt = $dbh->prepare("
        SELECT 
            c.id, 
            c.milestone, 
            c.item AS reward_item, 
            c.reward_count, 
            c.reward_name, 
            c.reward_icon 
        FROM ws_noel_thuthach c
        WHERE c.id = ?
    ");
    $stmt->execute([$challenge_id]);
    $challenge = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$challenge) {
        echo json_encode(['error' => 'Thử thách không tồn tại']);
        exit;
    }
    
    // Lấy trạng thái thử thách của người dùng
    $stmtUser = $dbh->prepare("
        SELECT 
            spins_completed, 
            reward_claimed 
        FROM ws_noel_thuthach_log 
        WHERE username = ? AND challenge_id = ?
    ");
    $stmtUser->execute([$username, $challenge_id]);
    $userChallenge = $stmtUser->fetch(PDO::FETCH_ASSOC);
    
    if (!$userChallenge) {
        echo json_encode(['error' => 'Bạn chưa tham gia thử thách này']);
        exit;
    }
    
    if ($userChallenge['spins_completed'] < $challenge['milestone']) {
        echo json_encode(['error' => 'Bạn chưa hoàn thành thử thách này']);
        exit;
    }
    
    if ($userChallenge['reward_claimed']) {
        echo json_encode(['error' => 'Bạn đã nhận thưởng cho thử thách này']);
        exit;
    }
    
    // Bắt đầu giao dịch
    $dbh->beginTransaction();
    
    try {
        // Gửi phần thưởng cho người dùng
        if ($challenge['reward_item'] === '0') { // Giả sử '0' là xu
            $xu = intval($challenge['reward_count']);
            $stmtCoin = $dbh->prepare("
                UPDATE game_account 
                SET xu = xu + ? 
                WHERE username = ?
            ");
            $stmtCoin->execute([$xu, $username]);
        } else {
            // Gửi item qua hệ thống game
            $Post = [
                'type'=> '8',
                'usr'=> $username,
                'item'=> $challenge['reward_item'],
                'num'=> $challenge['reward_count'],
                'qu'=> $server,
                'bao'=> 0,
                'sqm'=> $PassGm, // Đảm bảo biến $PassGm đã được khai báo và an toàn
            ];
            $sendResult = sendMail($LinkGm, $Post); // Hàm gửi thông tin tới game server
            if(!$sendResult){
                throw new Exception('Gửi phần thưởng thất bại.');
            }
        }
        
        // Cập nhật trạng thái đã nhận thưởng
        $stmtUpdate = $dbh->prepare("
            UPDATE ws_noel_thuthach_log 
            SET reward_claimed = 1 
            WHERE username = ? AND challenge_id = ?
        ");
        $stmtUpdate->execute([$username, $challenge_id]);
        
        // Ghi log phần thưởng thử thách vào ws_noel_log
        $stmtLog = $dbh->prepare("
            INSERT INTO ws_noel_log (Sv, Nickname, Username, Item, Count, Name, Time, IsExit) 
            VALUES (?, ?, ?, ?, ?, ?, NOW(), 1)
        ");
        $stmtLog->execute([
            $server, // Sv: máy chủ đã chọn
            'Challenge', // Nickname: có thể tùy chỉnh
            $username,
            $challenge['reward_item'],
            $challenge['reward_count'],
            $challenge['reward_name']
        ]);
        
        // Commit giao dịch
        $dbh->commit();
        
        echo json_encode(['success' => 'Bạn đã nhận thưởng thử thách thành công!']);
    } catch (Exception $e) {
        // Rollback nếu có lỗi
        $dbh->rollBack();
        error_log('Error: ' . $e->getMessage());
        echo json_encode(['error' => 'Gửi phần thưởng thất bại. Vui lòng thử lại sau.']);
    }
    
} catch (PDOException $e) {
    error_log('Database Error: ' . $e->getMessage());
    echo json_encode(['error' => 'Lỗi máy chủ']);
}
?>
