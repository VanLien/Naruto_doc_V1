<?php
// ajax/spinnoel.php

date_default_timezone_set('Asia/Ho_Chi_Minh');
header('Content-Type: application/json');

require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php'; // Hàm gửi thông tin tới game server
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php'; // Hàm gửi xu nếu cần
include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php'; // Cấu hình game server

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['error' => 'Vui lòng đăng nhập']);
    exit;
}

// CSRF Protection
if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
    echo json_encode(['error' => 'CSRF token không hợp lệ']);
    exit;
}

try {
    $username = $_SESSION['niceUsername'];
    $actorname = isset($_POST['actorname']) ? trim($_POST['actorname']) : 'Unknown';
    $server = isset($_POST['server']) ? intval($_POST['server']) : 0;
    $times = isset($_POST['times']) ? intval($_POST['times']) : 1;

    // Kiểm tra số lần quay hợp lệ
    if ($times < 1 || $times > 100) {
        echo json_encode(['error' => 'Số lần quay không hợp lệ']);
        exit;
    }

    // Kiểm tra danh sách phần thưởng trong session
    if(!isset($_SESSION['listitem']) || !isset($_SESSION['listcount']) || !isset($_SESSION['listname']) || !isset($_SESSION['probability']) || !isset($_SESSION['item_ids'])){
        echo json_encode(['error' => 'Không có danh sách phần thưởng']);
        exit;
    }

    $listitem = $_SESSION['listitem'];
    $listcount = $_SESSION['listcount'];
    $listname = $_SESSION['listname'];
    $probability = $_SESSION['probability'];
    $item_ids = $_SESSION['item_ids'];

    // Lấy xu hiện tại
    $stmt = $dbh->prepare("SELECT xu FROM game_account WHERE username = ? LIMIT 1");
    $stmt->execute([$username]);
    $check = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$check) {
        echo json_encode(['error' => 'Người dùng không tồn tại']);
        exit;
    }

    $total_cost = 1000000 * $times;
    if ($check['xu'] < $total_cost) {
        echo json_encode(['error' => 'Bạn không đủ xu để quay ' . $times . ' lần']);
        exit;
    }

    // Giảm xu
    $stmt = $dbh->prepare("UPDATE game_account SET xu = xu - ? WHERE username = ?");
    $stmt->execute([$total_cost, $username]);

    $prizes = [];

    // Bắt đầu giao dịch để đảm bảo tính toàn vẹn dữ liệu
    $dbh->beginTransaction();

    try {
        for ($t = 0; $t < $times; $t++) {
            $random_value = mt_rand(1, 100); 
            $cumulative_probability = 0;
            $selected_index = null;

            for ($i = 0; $i < count($probability); $i++) {
                $cumulative_probability += $probability[$i];
                if ($random_value <= $cumulative_probability) {
                    $selected_index = $i;
                    break;
                }
            }

            if ($selected_index === null) {
                $selected_index = count($probability) - 1;
            }

            $item = $listitem[$selected_index];
            $name = $listname[$selected_index];
            $count = $listcount[$selected_index];
            $item_id = $item_ids[$selected_index];

            // Ghi log phần thưởng quay bánh xe
            $stmt_log = $dbh->prepare("INSERT INTO ws_noel_log (Sv, Nickname, Username, Item, Count, Name, Time, IsExit) VALUES (?, ?, ?, ?, ?, ?, NOW(), 0)");
            $stmt_log->execute([
                $server,
                $actorname,
                $username,
                $item,
                $count,
                $name
            ]);

            $prizes[] = [
                'prize' => $name,
                'item_id' => $item_id
            ];

            // Gửi phần thưởng ngay tại đây
            if ($item === '0') { // Giả sử '0' là xu
                // Cộng xu
                $stmt_coin = $dbh->prepare("UPDATE game_account SET xu = xu + ? WHERE username = ?");
                $stmt_coin->execute([$count, $username]);
            } else {
                // Gửi item qua hệ thống game
                $Post = [
                    'type'=> '8',
                    'usr'=> $username,
                    'item'=> $item,
                    'num'=> $count,
                    'qu'=> $server,
                    'bao'=> 0,
                    'sqm'=> $PassGm, // Đảm bảo biến $PassGm đã được khai báo và an toàn
                ];
                $sendResult = sendMail($LinkGm, $Post); // Hàm gửi thông tin tới game server
                if(!$sendResult){
                    throw new Exception('Gửi phần thưởng thất bại.');
                }
            }
        }

        // Cập nhật tiến trình thử thách: tăng spins_completed cho tất cả các thử thách
        $stmt_update = $dbh->prepare("UPDATE ws_noel_thuthach_log SET spins_completed = spins_completed + ? WHERE username = ?");
        $stmt_update->execute([$times, $username]);

        // Commit giao dịch
        $dbh->commit();
    } catch (Exception $e) {
        // Rollback nếu có lỗi
        $dbh->rollBack();
        throw $e;
    }

    echo json_encode([
        'status' => 'success',
        'prizes' => $prizes
    ]);
} catch (Exception $e) {
    error_log('Error: ' . $e->getMessage());
    echo json_encode(['error' => 'Lỗi máy chủ']);
}
?>
