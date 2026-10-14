<?php
// /api/open_noel_gift.php
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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $gift_id = intval($_POST['gift_id']);
    $user_id = $_SESSION['user_id'];

    // Kiểm tra xem gói quà đã được mở chưa
    $stmt = $conn->prepare("SELECT is_opened FROM noel_gifts WHERE id = ?");
    $stmt->bind_param("i", $gift_id);
    $stmt->execute();
    $stmt->bind_result($is_opened);
    if ($stmt->fetch()) {
        if ($is_opened) {
            $response['status'] = 'error';
            $response['message'] = 'Gói quà đã được mở.';
        } else {
            // Mở gói quà
            $stmt->close();
            $stmt = $conn->prepare("UPDATE noel_gifts SET is_opened = 1, opened_at = NOW() WHERE id = ?");
            $stmt->bind_param("i", $gift_id);
            if ($stmt->execute()) {
                // Thêm log sự kiện
                $stmt->close();
                $stmt = $conn->prepare("INSERT INTO noel_event_logs (user_id, gift_id, action) VALUES (?, ?, 'open')");
                $stmt->bind_param("ii", $user_id, $gift_id);
                $stmt->execute();

                // Lấy thông tin gói quà
                $stmt->close();
                $stmt = $conn->prepare("SELECT name, description, image_url FROM noel_gifts WHERE id = ?");
                $stmt->bind_param("i", $gift_id);
                $stmt->execute();
                $stmt->bind_result($name, $description, $image_url);
                if ($stmt->fetch()) {
                    $response['status'] = 'success';
                    $response['gift'] = [
                        'id' => $gift_id,
                        'name' => $name,
                        'description' => $description,
                        'image_url' => $image_url
                    ];
                } else {
                    $response['status'] = 'error';
                    $response['message'] = 'Không tìm thấy thông tin gói quà.';
                }
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Lỗi khi cập nhật gói quà.';
            }
        }
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Gói quà không tồn tại.';
    }
    $stmt->close();
} else {
    $response['status'] = 'error';
    $response['message'] = 'Phương thức không hợp lệ.';
}

echo json_encode($response);
?>
