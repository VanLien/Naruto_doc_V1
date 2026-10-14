<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php';

$result = array();
if (!isset($_SESSION['user_id'])) {
    $msg = "Vui lòng đăng nhập";
    echo json_encode(['error' => $msg]);
    exit;
} else {
    $user_id = $_SESSION['user_id'];
    $username = $_SESSION['niceUsername'];
    $actorname = $_POST['actorname'];
    $server = $_POST['server'];
    $items = $dbh->query("SELECT * FROM ws_spin")->fetchAll(PDO::FETCH_ASSOC);

    $listitem = [];
    $listcount = [];
    $listname = [];
    $probability = [];

    foreach ($items as $item) {
        $listitem[] = $item['item'];
        $listcount[] = $item['count'];
        $listname[] = $item['name'];
        $probability[] = $item['probability'];
    }
    $total_probability = array_sum($probability);
    if ($total_probability != 100) {
        die("Lỗi: Tổng xác suất không bằng 100");
    }
    $check = $dbh->query("SELECT * FROM game_account WHERE username = '$username' LIMIT 1")->fetch();
    if ($check['xu'] >= 1000000) {
        $dbh->query("UPDATE game_account SET xu = xu - 1000000 WHERE username = '$username'");
        $acc['error'] = 0;
        $random_value = mt_rand(1, 100); 
        $acc['item'] = null;
        $cumulative_probability = 0;
        for ($i = 0; $i < count($probability); $i++) {
            $cumulative_probability += $probability[$i];
            if ($random_value <= $cumulative_probability) {
                $acc['item'] = $i;
                break;
            }
        }
        $item = $listitem[$acc['item']];
        $name = $listname[$acc['item']];
        $count = $listcount[$acc['item']];

        $dbh->prepare("INSERT INTO `ws_spin_log` (`username`, `nickname`, `item`, `count`, `name`, `time`, `sv`) VALUES (?, ?, ?, ?, ?, NOW(), ?)")
            ->execute(array($username, $actorname, $item, $count, $name, $server));
        $spin = floor($check['xu'] / 1000000);
        $acc['vongquay'] = 'Spin<hr>' . number_format($spin);
        $current_time = date('Y-m-d H:i:s');
        $acc['message'] = "Quay may mắn nhận được $name ($count) Time $current_time";
        echo json_encode($acc);
    } else {
        $acc['error'] = 'Bạn đã hết lượt quay';
        echo json_encode($acc);
    }
}
?>
