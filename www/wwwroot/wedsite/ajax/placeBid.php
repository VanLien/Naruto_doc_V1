<?php
// File: ajax/placeBid.php

require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

header('Content-Type: application/json');

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (!isset($_SESSION['user_id']) || !isset($_POST['auction_id']) || !isset($_POST['bid_amount'])) {
    echo json_encode(['error' => 'Dữ liệu không hợp lệ.']);
    exit;
}

$auctionId = (int)$_POST['auction_id'];
$bidAmount = (int)$_POST['bid_amount'];
$username = $_SESSION['niceUsername'];

try {
    // Lấy thông tin đấu giá
    $stmt = $dbh->prepare("SELECT starting_bid, end_time FROM ws_daugia_time WHERE auction_id = :auction_id");
    $stmt->execute(['auction_id' => $auctionId]);
    $auction = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$auction) {
        echo json_encode(['error' => 'Đấu giá không tồn tại hoặc đã kết thúc.']);
        exit;
    }

    $currentTime = new DateTime();
    $endTime = new DateTime($auction['end_time']);
    if ($currentTime >= $endTime) {
        echo json_encode(['error' => 'Đấu giá đã kết thúc.']);
        exit;
    }

    $startingBid = (int)$auction['starting_bid'];

    // Lấy giá thầu cao nhất hiện tại
    $stmt = $dbh->prepare("SELECT MAX(total_bid) FROM ws_daugia_log WHERE auction_id = :auction_id");
    $stmt->execute(['auction_id' => $auctionId]);
    $currentHighestBid = $stmt->fetchColumn();

    if ($currentHighestBid === null) {
        $currentHighestBid = $startingBid;
    }

    // Lấy giá thầu hiện tại của người dùng (nếu đã đặt trước đó)
    $stmt = $dbh->prepare("SELECT total_bid FROM ws_daugia_log WHERE auction_id = :auction_id AND username = :username");
    $stmt->execute(['auction_id' => $auctionId, 'username' => $username]);
    $existingBid = $stmt->fetchColumn();

    if ($existingBid !== false) {
        // Người dùng đã đặt giá trước đó
        $newTotalBid = $existingBid + $bidAmount;
        $minimumBid = $currentHighestBid + 5000000;

        if ($newTotalBid < $minimumBid) {
            $requiredAdditional = $minimumBid - $existingBid;
            echo json_encode(['error' => 'Bạn đã đặt ' . number_format($existingBid) . ' Xu. Cần đặt thêm ít nhất ' . number_format($requiredAdditional) . ' Xu để vượt giá cao nhất hiện tại.']);
            exit;
        }

        if ($bidAmount < 1) {
            echo json_encode(['error' => 'Số Xu đặt thêm phải lớn hơn 0.']);
            exit;
        }
    } else {
        // Người dùng chưa đặt giá trước đó
        $minimumBid = $currentHighestBid + 5000000;

        if ($bidAmount < $minimumBid) {
            echo json_encode(['error' => 'Giá hiện tại là ' . number_format($currentHighestBid) . ' Xu. Bạn cần đặt ít nhất ' . number_format($minimumBid) . ' Xu.']);
            exit;
        }
    }

    // Kiểm tra số Xu của người dùng
    $stmt = $dbh->prepare("SELECT xu FROM game_account WHERE username = :username");
    $stmt->execute(['username' => $username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user || $user['xu'] < $bidAmount) {
        echo json_encode(['error' => 'Bạn không đủ Xu để đặt giá thầu.']);
        exit;
    }

    // Bắt đầu giao dịch
    $dbh->beginTransaction();

    // Trừ Xu từ tài khoản người dùng
    $stmt = $dbh->prepare("UPDATE game_account SET xu = xu - :bid_amount WHERE username = :username");
    $stmt->execute(['bid_amount' => $bidAmount, 'username' => $username]);

    if ($existingBid !== false) {
        // Cập nhật giá thầu hiện tại của người dùng
        $stmt = $dbh->prepare("
            UPDATE ws_daugia_log 
            SET total_bid = total_bid + :bid_amount, last_bid_time = NOW()
            WHERE auction_id = :auction_id AND username = :username
        ");
        $stmt->execute(['bid_amount' => $bidAmount, 'auction_id' => $auctionId, 'username' => $username]);
    } else {
        // Thêm log đặt giá mới
        $stmt = $dbh->prepare("
            INSERT INTO ws_daugia_log (auction_id, username, total_bid, last_bid_time) 
            VALUES (:auction_id, :username, :total_bid, NOW())
        ");
        $stmt->execute([
            'auction_id' => $auctionId,
            'username' => $username,
            'total_bid' => $bidAmount
        ]);
    }

    // Hoàn thành giao dịch
    $dbh->commit();

    echo json_encode(['success' => 'Đặt giá thầu thành công!']);
} catch (PDOException $e) {
    if ($dbh->inTransaction()) {
        $dbh->rollBack();
    }
    echo json_encode(['error' => 'Lỗi cơ sở dữ liệu: ' . $e->getMessage()]);
    error_log($e->getMessage());
} catch (Exception $e) {
    if ($dbh->inTransaction()) {
        $dbh->rollBack();
    }
    echo json_encode(['error' => 'Lỗi hệ thống: ' . $e->getMessage()]);
    error_log($e->getMessage());
}
?>
