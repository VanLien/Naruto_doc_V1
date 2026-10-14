<?php
// ajax/get_thuthach.php

date_default_timezone_set('Asia/Ho_Chi_Minh');
header('Content-Type: application/json');

require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

if(!isset($_SESSION['user_id'])){
    echo json_encode(['error' => 'Vui lòng đăng nhập']);
    exit;
}

$username = $_SESSION['niceUsername'];

try {
    // Lấy tất cả các thử thách
    $stmt = $dbh->prepare("
        SELECT 
            c.id, 
            c.milestone, 
            c.item AS reward_item, 
            c.reward_count, 
            c.reward_name, 
            c.reward_icon
        FROM ws_noel_thuthach c
        ORDER BY c.milestone ASC
    ");
    $stmt->execute();
    $challenges = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Lấy trạng thái thử thách của người dùng
    $stmtUser = $dbh->prepare("
        SELECT 
            challenge_id, 
            spins_completed, 
            reward_claimed 
        FROM ws_noel_thuthach_log 
        WHERE username = ?
    ");
    $stmtUser->execute([$username]);
    $userChallenges = $stmtUser->fetchAll(PDO::FETCH_ASSOC);
    
    $userChallengesMap = [];
    foreach ($userChallenges as $uc) {
        $userChallengesMap[$uc['challenge_id']] = $uc;
    }
    
    // Kết hợp thông tin thử thách với trạng thái của người dùng
    foreach ($challenges as &$challenge) {
        if (isset($userChallengesMap[$challenge['id']])) {
            // Đảm bảo rằng spins_completed và reward_claimed được chuyển đổi thành số nguyên
            $challenge['spins_completed'] = intval($userChallengesMap[$challenge['id']]['spins_completed']);
            $challenge['reward_claimed'] = intval($userChallengesMap[$challenge['id']]['reward_claimed']);
        } else {
            // Nếu người dùng chưa có thử thách này, thêm vào
            $challenge['spins_completed'] = 0;
            $challenge['reward_claimed'] = 0;
            
            // Tạo bản ghi mới cho thử thách này
            $stmtInsert = $dbh->prepare("
                INSERT INTO ws_noel_thuthach_log (username, challenge_id, spins_completed, reward_claimed) 
                VALUES (?, ?, 0, 0)
            ");
            $stmtInsert->execute([$username, $challenge['id']]);
        }
    }
    
    echo json_encode(['challenges' => $challenges]);
} catch (PDOException $e) {
    error_log('Database Error: ' . $e->getMessage());
    echo json_encode(['error' => 'Lỗi máy chủ']);
}
?>
