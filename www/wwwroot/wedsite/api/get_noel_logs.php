<?php
// /api/get_noel_logs.php
header('Content-Type: application/json');
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php'; // Đảm bảo người dùng đã đăng nhập

$response = [];

if(!isset($_SESSION['user_id'])){
    $response['status'] = 'error';
    $response['message'] = 'Vui lòng đăng nhập.';
    echo json_encode($response);
    exit;
}

$stmt = $conn->prepare("SELECT nel.*, ng.name AS gift_name, u.username FROM noel_event_logs nel JOIN noel_gifts ng ON nel.gift_id = ng.id JOIN users u ON nel.user_id = u.id ORDER BY nel.timestamp DESC LIMIT 20");
$stmt->execute();
$result = $stmt->get_result();

$logs = [];

while($row = $result->fetch_assoc()) {
    $logs[] = [
        'username' => htmlspecialchars($row['username']),
        'action' => htmlspecialchars($row['action']),
        'gift_name' => htmlspecialchars($row['gift_name']),
        'timestamp' => $row['timestamp']
    ];
}

$response['status'] = 'success';
$response['logs'] = $logs;

echo json_encode($response);
?>
