<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';

if (empty($_POST['rank']) || !is_numeric($_POST['rank'])) {
    echo "Lỗi: Mã rank không hợp lệ.";
    exit;
}

$rank = (int)$_POST['rank'];

try {
    // Lấy danh sách quà tặng cho rank tương ứng từ bảng ws_bxhlucchien_item
    $stmt = $dbh->prepare("
        SELECT item, count, name 
        FROM ws_bxhlucchien_item 
        WHERE rank = :rank
    ");
    $stmt->execute(['rank' => $rank]);
    $gifts = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if ($gifts) {
        $html = '<ul>';
        foreach ($gifts as $gift) {
            $html .= '<li>' . htmlspecialchars($gift['name'], ENT_QUOTES, 'UTF-8') . ' x ' . htmlspecialchars($gift['count'], ENT_QUOTES, 'UTF-8') . '</li>';
        }
        $html .= '</ul>';
        echo $html;
    } else {
        echo "Không có quà cho mốc này.";
    }

} catch (Exception $e) {
    echo "Đã xảy ra lỗi: " . $e->getMessage();
}
?>
