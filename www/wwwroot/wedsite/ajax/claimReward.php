<?php
header('Content-Type: application/json');
date_default_timezone_set('Asia/Ho_Chi_Minh');

require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php'; // Đảm bảo bao gồm hàm sendMail
include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php'; // Bao gồm các biến cấu hình như $LinkGm và $PassGm

if (!isset($_SESSION['user_id']) || !isset($_POST['nap']) || !isset($_POST['server'])) {
    echo json_encode(['status' => 'error', 'message' => 'Dữ liệu không hợp lệ.']);
    exit;
}

$nap = (int)$_POST['nap'];
$server = (int)$_POST['server'];
$username = $_SESSION['niceUsername'];

try {
    // Kiểm tra thời gian sự kiện đã kết thúc chưa
    $stmt = $dbh->prepare("
        SELECT CONCAT(year, '-', LPAD(month, 2, '0'), '-', LPAD(day, 2, '0'), ' ', LPAD(hour, 2, '0'), ':', LPAD(minute, 2, '0'), ':', LPAD(second, 2, '0')) AS end_datetime
        FROM ws_bxhtoptuan_time
        ORDER BY id DESC
        LIMIT 1
    ");
    $stmt->execute();
    $eventTime = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$eventTime) {
        echo json_encode(['status' => 'error', 'message' => 'Sự kiện chưa được thiết lập.']);
        exit;
    }

    $endDateTime = new DateTime($eventTime['end_datetime']);
    $currentDate = new DateTime();

    if ($currentDate < $endDateTime) {
        echo json_encode(['status' => 'error', 'message' => 'Sự kiện chưa kết thúc. Vui lòng đợi đến ngày ' . $endDateTime->format('d/m/Y H:i:s') . ' để nhận thưởng.']);
        exit;
    }

    // Kiểm tra đã nhận thưởng trước đó chưa (bất kể server)
    $stmt = $dbh->prepare("
        SELECT 1 
        FROM ws_bxhtoptuan_log 
        WHERE username = :username
        LIMIT 1
    ");
    $stmt->execute(['username' => $username]);

    if ($stmt->rowCount() > 0) {
        echo json_encode(['status' => 'error', 'message' => 'Bạn đã nhận thưởng rồi.']);
        exit;
    }

    // Kiểm tra số tích nạp hợp lệ
    $stmt = $dbh->prepare("
        SELECT toptuan 
        FROM game_account 
        WHERE username = :username
    ");
    $stmt->execute(['username' => $username]);
    $toptuan = $stmt->fetchColumn();

    if ($toptuan === false || $toptuan < $nap) {
        echo json_encode(['status' => 'error', 'message' => 'Bạn chưa đủ điều kiện để nhận thưởng.']);
        exit;
    }

    // Lấy quà cho mốc này
    $stmt = $dbh->prepare("
        SELECT item, count 
        FROM ws_bxhtoptuan 
        WHERE nap = :nap
    ");
    $stmt->execute(['nap' => $nap]);
    $gifts = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (!$gifts) {
        echo json_encode(['status' => 'error', 'message' => 'Không tìm thấy quà cho mốc này.']);
        exit;
    }

    // Gửi quà cho người chơi
    foreach ($gifts as $gift) {
        $Post = [
            'type' => '8',
            'usr' => $username,
            'item' => $gift['item'],
            'num' => $gift['count'],
            'qu' => $server,
            'bao' => 0,
            'sqm' => $PassGm, // Biến cấu hình từ config.php
        ];
        $re = sendmail($LinkGm, $Post); // Sử dụng hàm sendmail giống như trong ajax/bxhtoptuan.php

        if (!$re) {
            error_log("Failed to send gift: " . json_encode($Post));
            echo json_encode(['status' => 'error', 'message' => 'Gửi quà thất bại. Vui lòng thử lại sau.']);
            exit;
        }
    }

    // Ghi log nhận thưởng
    $stmt = $dbh->prepare("
        INSERT INTO ws_bxhtoptuan_log (username, tichnap, serverid, created) 
        VALUES (:username, :nap, :server, NOW())
    ");
    $stmt->execute(['username' => $username, 'nap' => $nap, 'server' => $server]);

    echo json_encode(['status' => 'success', 'message' => 'Nhận thưởng thành công mốc quà tích nạp ' . number_format($nap) . '. Cảm ơn bạn đã ủng hộ Game!']);
} catch (Exception $e) {
    error_log("Exception in claimReward.php: " . $e->getMessage());
    echo json_encode(['status' => 'error', 'message' => 'Đã xảy ra lỗi: ' . $e->getMessage()]);
}
?>
