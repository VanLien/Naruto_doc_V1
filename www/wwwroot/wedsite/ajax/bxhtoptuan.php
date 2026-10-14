<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php';

if (!isset($_SESSION['user_id'])) {
    echo "Vui lòng đăng nhập";
    exit;
}

if (empty($_GET['server']) || !is_numeric($_GET['server']) || empty($_GET['tichnap']) || !is_numeric($_GET['tichnap'])) {
    echo "Vui lòng chọn máy chủ và nhập đúng dữ liệu";
    exit;
}

$server = (int)$_GET['server'];
$tichnap = (int)$_GET['tichnap'];
$user_id = $_SESSION['user_id'];
$username = $_SESSION['niceUsername'];

try {
    $checkEventTime = $dbh->prepare("
        SELECT month, day, year, hour, minute, second
        FROM ws_bxhtoptuan_time
        ORDER BY id DESC
        LIMIT 1
    ");
    $checkEventTime->execute();
    $eventTime = $checkEventTime->fetch(PDO::FETCH_ASSOC);

    if (!$eventTime) {
        echo "Sự kiện chưa được thiết lập.";
        exit;
    }

    $endDateTimeStr = "{$eventTime['year']}-{$eventTime['month']}-{$eventTime['day']} {$eventTime['hour']}:{$eventTime['minute']}:{$eventTime['second']}";
    $endDate = new DateTime($endDateTimeStr);
    $currentDate = new DateTime();

    if ($currentDate < $endDate) {
        echo "Sự kiện chưa kết thúc. Vui lòng đợi đến ngày " . $endDate->format('d/m/Y H:i:s') . " để nhận thưởng.";
        exit;
    }

    $checkRank = $dbh->prepare("
        SELECT username 
        FROM ws_bxhtoptuan_rank 
        WHERE rank = :rank AND username = :username
    ");
    $checkRank->execute(['rank' => $tichnap, 'username' => $username]);

    if ($checkRank->rowCount() === 0) {
        echo "Mốc quà này không thuộc về tài khoản của bạn.";
        exit;
    }

    $checklog = $dbh->prepare("
        SELECT 1 
        FROM ws_bxhtoptuan_log 
        WHERE username = :username AND tichnap = :tichnap
    ");
    $checklog->execute(['username' => $username, 'tichnap' => $tichnap]);

    if ($checklog->rowCount() > 0) {
        echo "Bạn đã nhận thưởng mốc này rồi. Mỗi mốc chỉ được nhận 1 lần.";
        exit;
    }

    $checkitem = $dbh->prepare("SELECT item, count FROM ws_bxhtoptuan WHERE nap = :nap");
    $checkitem->execute(['nap' => $tichnap]);
    $items = $checkitem->fetchAll(PDO::FETCH_ASSOC);

    if (!$items) {
        echo "Không tìm thấy quà cho mốc này.";
        exit;
    }

    foreach ($items as $item) {
        $Post = [
            'type' => '8',
            'usr' => $username,
            'item' => $item['item'],
            'num' => $item['count'],
            'qu' => $server,
            'bao' => 0,
            'sqm' => $PassGm,
        ];
        $re = sendmail($LinkGm, $Post);

        if (!$re) {
            echo "Gửi quà thất bại. Vui lòng thử lại sau.";
            exit;
        }
    }

    $insertLog = $dbh->prepare("
        INSERT INTO ws_bxhtoptuan_log (username, tichnap, serverid, created) 
        VALUES (:username, :tichnap, :serverid, NOW())
    ");
    $insertLog->execute(['username' => $username, 'tichnap' => $tichnap, 'serverid' => $server]);

    echo "Nhận thưởng thành công mốc quà tích nạp " . number_format($tichnap) . ". Cảm ơn bạn đã ủng hộ Game!";
} catch (Exception $e) {
    echo "Đã xảy ra lỗi: " . $e->getMessage();
}
