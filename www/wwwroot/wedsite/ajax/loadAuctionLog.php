<?php
// File: ajax/loadAuctionLog.php

require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';

try {
    $logs = $dbh->query("
        SELECT auction_id, username, total_bid, last_bid_time 
        FROM ws_daugia_log 
        ORDER BY auction_id ASC, total_bid DESC
    ")->fetchAll(PDO::FETCH_ASSOC);

    if (empty($logs)) {
        echo '<div class="alert alert-warning">Không có log đấu giá nào.</div>';
        exit;
    }

    echo '<table class="auction-log-table">';
    echo '<thead>';
    echo '<tr>';
    echo '<th>Gói Thầu</th>';
    echo '<th>Tài Khoản</th>';
    echo '<th>Tổng Đặt Giá</th>';
    echo '<th>Thời Gian Đặt Giá</th>';
    echo '</tr>';
    echo '</thead>';
    echo '<tbody>';

    foreach ($logs as $log) {
        echo '<tr>';
        echo '<td>' . htmlspecialchars($log['auction_id'], ENT_QUOTES, 'UTF-8') . '</td>';
        echo '<td>' . htmlspecialchars($log['username'], ENT_QUOTES, 'UTF-8') . '</td>';
        echo '<td>' . number_format($log['total_bid']) . ' Xu</td>';
        echo '<td>' . htmlspecialchars($log['last_bid_time'], ENT_QUOTES, 'UTF-8') . '</td>';
        echo '</tr>';
    }

    echo '</tbody>';
    echo '</table>';
} catch (Exception $e) {
    echo '<div class="alert alert-danger">Lỗi hệ thống: ' . $e->getMessage() . '</div>';
    error_log($e->getMessage());
}
?>
