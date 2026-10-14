<?php
// File: ajax/loadAuctionEvent.php

require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

try {
    // Đặt múi giờ cho thời gian hệ thống
    date_default_timezone_set('Asia/Ho_Chi_Minh');

    $auctions = $dbh->query("
        SELECT t.auction_id, t.end_time, t.starting_bid,
               (SELECT MAX(total_bid) FROM ws_daugia_log WHERE auction_id = t.auction_id) AS current_bid,
               (SELECT username FROM ws_daugia_log WHERE auction_id = t.auction_id ORDER BY total_bid DESC, last_bid_time ASC LIMIT 1) AS last_bidder
        FROM ws_daugia_time t
        GROUP BY t.auction_id
    ")->fetchAll(PDO::FETCH_ASSOC);

    if (empty($auctions)) {
        echo '<div class="alert alert-warning">Không có đấu giá nào đang diễn ra.</div>';
        exit;
    }

    $currentTime = new DateTime(); // Thời gian hiện tại của máy chủ

    foreach ($auctions as $auction) {
        $auctionId = $auction['auction_id'];
        $endTime = new DateTime($auction['end_time'], new DateTimeZone('Asia/Ho_Chi_Minh')); // Lấy thời gian kết thúc sự kiện
        $isAuctionEnded = $currentTime >= $endTime;

        $itemsStmt = $dbh->prepare("SELECT item, count, name FROM ws_daugia_item WHERE auction_id = :auction_id");
        $itemsStmt->execute(['auction_id' => $auctionId]);
        $items = $itemsStmt->fetchAll(PDO::FETCH_ASSOC);

        $currentBid = $auction['current_bid'] ?? $auction['starting_bid'];
        $lastBidder = $auction['last_bidder'] ?? '---';

        $userHasBid = false;
        $existingBid = 0;
        if (isset($_SESSION['niceUsername'])) {
            $stmt = $dbh->prepare("SELECT total_bid FROM ws_daugia_log WHERE auction_id = :auction_id AND username = :username");
            $stmt->execute(['auction_id' => $auctionId, 'username' => $_SESSION['niceUsername']]);
            $existingBid = $stmt->fetchColumn();
            if ($existingBid !== false) {
                $userHasBid = true;
            } else {
                $existingBid = 0;
            }
        }

        echo '<div class="auction-group" data-end-time="' . htmlspecialchars($auction['end_time'], ENT_QUOTES, 'UTF-8') . '">';
        echo '<h3>Gói Thầu Đấu Giá: ' . htmlspecialchars($auctionId, ENT_QUOTES, 'UTF-8') . '</h3>';
        echo '<p>Thời gian kết thúc: ' . $endTime->format('Y-m-d H:i:s') . '</p>'; // Hiển thị thời gian kết thúc
        // Thêm dòng đếm ngược
        echo '<p class="countdown-timer">Đang đếm ngược...</p>';

        echo '<div class="group-items">';
        foreach ($items as $item) {
            echo '<div class="group-item">';
            echo '<img class="item-image" src="/shop/' . htmlspecialchars($item['item'], ENT_QUOTES, 'UTF-8') . '.png" alt="' . htmlspecialchars($item['name'], ENT_QUOTES, 'UTF-8') . '">';
            echo '<div class="item-name">' . htmlspecialchars($item['name'], ENT_QUOTES, 'UTF-8') . '</div>';
            echo '<div class="item-count">x' . $item['count'] . '</div>';
            echo '</div>';
        }
        echo '</div>';

        echo '<div class="group-bid">';
        echo '<p>Giá khởi điểm: ' . number_format($auction['starting_bid']) . ' Xu</p>';
        echo '<p>Giá cao nhất hiện tại: ' . number_format($currentBid) . ' Xu</p>';
        echo '<p>Người đặt giá cao nhất: ' . htmlspecialchars($lastBidder, ENT_QUOTES, 'UTF-8') . '</p>';

        if ($isAuctionEnded) {
            if (isset($_SESSION['niceUsername']) && $_SESSION['niceUsername'] === $lastBidder) {
                $stmt = $dbh->prepare("
                    SELECT 1 FROM ws_daugia_rewards 
                    WHERE auction_id = :auction_id AND username = :username
                ");
                $stmt->execute([
                    'auction_id' => $auctionId,
                    'username' => $_SESSION['niceUsername']
                ]);
                $hasClaimed = $stmt->fetchColumn();

                if ($hasClaimed) {
                    echo '<button class="btn btn-secondary" disabled>Bạn đã nhận thưởng</button>';
                } else {
                    echo '<button class="btn btn-success" onclick="showSelectServerModal(' . $auctionId . ')">Nhận Thưởng</button>';
                }
            } else {
                echo '<button class="btn btn-secondary" disabled>Đấu giá đã kết thúc</button>';
            }
        } else {
            if ($userHasBid) {
                echo '<button class="btn btn-primary" onclick="placeBid(' . $auctionId . ', ' . $currentBid . ', ' . $existingBid . ')">Đặt Tiếp</button>';
            } else {
                echo '<button class="btn btn-primary" onclick="placeBid(' . $auctionId . ', ' . $currentBid . ', 0)">Đặt Giá</button>';
            }
        }
        echo '</div>';

        echo '<div class="auction-log">';
        echo '<h4>Log Đấu Giá</h4>';
        $logStmt = $dbh->prepare("
            SELECT username, total_bid, last_bid_time 
            FROM ws_daugia_log 
            WHERE auction_id = :auction_id 
            ORDER BY total_bid DESC, last_bid_time ASC
        ");
        $logStmt->execute(['auction_id' => $auctionId]);
        $logs = $logStmt->fetchAll(PDO::FETCH_ASSOC);

        if ($logs) {
            echo '<table class="auction-log-table">';
            echo '<thead><tr><th>Người dùng</th><th>Tổng Xu Đã Đặt</th><th>Thời Gian Đặt Giá</th></tr></thead>';
            echo '<tbody>';
            foreach ($logs as $log) {
                echo '<tr>';
                echo '<td>' . htmlspecialchars($log['username'], ENT_QUOTES, 'UTF-8') . '</td>';
                echo '<td>' . number_format($log['total_bid']) . '</td>';
                echo '<td>' . htmlspecialchars($log['last_bid_time'], ENT_QUOTES, 'UTF-8') . '</td>';
                echo '</tr>';
            }
            echo '</tbody></table>';
        } else {
            echo '<p>Chưa có ai đặt giá.</p>';
        }
        echo '</div>';

        echo '</div>';
    }
} catch (Exception $e) {
    echo '<div class="alert alert-danger">Lỗi hệ thống: ' . $e->getMessage() . '</div>';
    error_log($e->getMessage());
}
?>

















<style>
.auction-package {
    margin-bottom: 20px;
    padding: 15px;
    border: 1px solid #FFD700;
    background-color: #333;
    color: #FFF;
    border-radius: 10px;
}

.package-items {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
}

.package-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    width: 120px;
}

.item-image {
    width: 80px;
    height: 80px;
    margin-bottom: 5px;
    background-color: #E0FFFF;
    border: 1px solid cyan;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.item-name {
    color: lime;
    font-size: 14px;
}

.item-count {
    color: yellow;
    font-size: 12px;
}



</style>