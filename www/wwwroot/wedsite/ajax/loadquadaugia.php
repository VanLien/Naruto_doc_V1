<?php
// File: ajax/loadquadaugia.php

// Enable error reporting for debugging (Disable in production)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php';

if (!isset($_SESSION['user_id']) || !isset($_POST['auction_id']) || !isset($_POST['server'])) {
    echo json_encode(['error' => 'Dữ liệu không hợp lệ.']);
    exit;
}

$auctionId = (int)$_POST['auction_id'];
$server = (int)$_POST['server'];
$username = $_SESSION['niceUsername'];

try {
    // Kiểm tra nếu đấu giá đã kết thúc
    $stmt = $dbh->prepare("SELECT end_time FROM ws_daugia_time WHERE auction_id = :auction_id");
    $stmt->execute(['auction_id' => $auctionId]);
    $endTime = $stmt->fetchColumn();

    if (!$endTime) {
        echo json_encode(['error' => 'Đấu giá không tồn tại.']);
        exit;
    }

    $currentTime = new DateTime();
    $auctionEndTime = new DateTime($endTime);

    if ($currentTime < $auctionEndTime) {
        echo json_encode(['error' => 'Đấu giá chưa kết thúc.']);
        exit;
    }

    // Kiểm tra người thắng
    $stmt = $dbh->prepare("
        SELECT username 
        FROM ws_daugia_log 
        WHERE auction_id = :auction_id 
        ORDER BY total_bid DESC, last_bid_time ASC LIMIT 1
    ");
    $stmt->execute(['auction_id' => $auctionId]);
    $topBidder = $stmt->fetchColumn();

    if ($username !== $topBidder) {
        echo json_encode(['error' => 'Bạn không phải người chiến thắng.']);
        exit;
    }

    // Kiểm tra đã nhận thưởng chưa
    $stmt = $dbh->prepare("
        SELECT 1 
        FROM ws_daugia_rewards 
        WHERE auction_id = :auction_id AND username = :username AND server = :server
    ");
    $stmt->execute(['auction_id' => $auctionId, 'username' => $username, 'server' => $server]);

    if ($stmt->rowCount() > 0) {
        echo json_encode(['error' => 'Bạn đã nhận thưởng cho đấu giá này trên server này rồi.']);
        exit;
    }

    // Bắt đầu giao dịch
    $dbh->beginTransaction();

    // Hoàn trả Xu cho người thua
    $stmt = $dbh->prepare("
        SELECT username, total_bid 
        FROM ws_daugia_log 
        WHERE auction_id = :auction_id AND username != :winner_username
    ");
    $stmt->execute(['auction_id' => $auctionId, 'winner_username' => $username]);
    $losers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($losers as $loser) {
        // Hoàn trả Xu
        $stmtRefund = $dbh->prepare("
            UPDATE game_account 
            SET xu = xu + :refund_amount 
            WHERE username = :username
        ");
        $stmtRefund->execute(['refund_amount' => $loser['total_bid'], 'username' => $loser['username']]);
    }

    // Gửi vật phẩm cho người thắng
    $stmt = $dbh->prepare("SELECT item, count FROM ws_daugia_item WHERE auction_id = :auction_id");
    $stmt->execute(['auction_id' => $auctionId]);
    $rewards = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($rewards)) {
        $dbh->rollBack();
        echo json_encode(['error' => 'Không tìm thấy vật phẩm đấu giá.']);
        exit;
    }

    // Gửi từng vật phẩm
    foreach ($rewards as $reward) {
        $Post = [
            'type' => '8',
            'usr' => $username,
            'item' => $reward['item'],
            'num' => $reward['count'],
            'qu' => $server,
            'bao' => 0,
            'sqm' => $PassGm,
        ];
        $success = sendmail($LinkGm, $Post);

        if (!$success) {
            $dbh->rollBack();
            echo json_encode(['error' => 'Gửi quà thất bại cho vật phẩm: ' . $reward['item']]);
            exit;
        }
    }

    // Ghi log nhận thưởng
    $stmt = $dbh->prepare("
        INSERT INTO ws_daugia_rewards (auction_id, username, server, claimed_time) 
        VALUES (:auction_id, :username, :server, NOW())
    ");
    $stmt->execute(['auction_id' => $auctionId, 'username' => $username, 'server' => $server]);

    // Xóa log đấu giá để tránh hoàn trả nhiều lần
    $stmt = $dbh->prepare("DELETE FROM ws_daugia_log WHERE auction_id = :auction_id");
    $stmt->execute(['auction_id' => $auctionId]);

    // Hoàn thành giao dịch
    $dbh->commit();

    echo json_encode(['success' => 'Nhận thưởng thành công! Xu đã được hoàn trả cho những người không thắng.']);
} catch (Exception $e) {
    // Rollback transaction if active
    if ($dbh->inTransaction()) {
        $dbh->rollBack();
    }
    echo json_encode(['error' => 'Lỗi hệ thống: ' . $e->getMessage()]);
    error_log($e->getMessage());
}
exit;
?>
