<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
header('Content-Type: application/json');
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

if(!isset($_SESSION['user_id'])){
    echo json_encode(['error' => 'Vui lòng đăng nhập để tham gia sự kiện bốc quà.']);
    exit;
}

try {
    $stmt = $dbh->prepare("SELECT * FROM ws_noel ORDER BY RAND() LIMIT 10");
    $stmt->execute();
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    if(!$items){
        echo json_encode(['error' => 'Hiện tại không có phần thưởng nào để hiển thị.']);
        exit;
    }
    
    $wheelData = [];
    $listitem = [];
    $listcount = [];
    $listname = [];
    $listprobability = [];
    $item_ids = [];

    foreach($items as $index => $item){
        $Place = $index + 1;
        $wheelData['Place' . $Place] = array(
            'icon' => '/shop/' . htmlspecialchars($item['icon'], ENT_QUOTES, 'UTF-8') . '.png',
            'count' => intval($item['count']),
            'name' => htmlspecialchars($item['name'], ENT_QUOTES, 'UTF-8')
        );
        $listitem[] = $item['item'];
        $listcount[] = intval($item['count']);
        $listname[] = htmlspecialchars($item['name'], ENT_QUOTES, 'UTF-8');
        $listprobability[] = intval($item['probability']);
        $item_ids[] = intval($item['id']);
    }
    
    $_SESSION['listitem'] = $listitem;
    $_SESSION['listcount'] = $listcount;
    $_SESSION['listname'] = $listname;
    $_SESSION['probability'] = $listprobability;
    $_SESSION['item_ids'] = $item_ids;

    $response = [
        'status' => 'success',
        'items' => $items,
        'wheel' => $wheelData
    ];

    echo json_encode($response);
} catch (PDOException $e) {
    error_log('Database Error: ' . $e->getMessage());
    echo json_encode(['error' => 'Đã xảy ra lỗi trên máy chủ. Vui lòng thử lại sau.']);
}
?>
