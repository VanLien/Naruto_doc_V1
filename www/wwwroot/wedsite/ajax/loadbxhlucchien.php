<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';

$server = isset($_GET['server']) ? $_GET['server'] : 'symlf_1';  // Lấy server từ GET, mặc định là symlf_1

try {
    // Xoá dữ liệu cũ trong bảng ws_bxhlucchien
    $dbh->exec("TRUNCATE TABLE ws_bxhlucchien");

    // Chọn bảng role theo server đã chọn
    $tableName = '';
    switch ($server) {
        case 'symlf_1':
            $tableName = 'sszg_symlf_1.role';
            break;
        case 'symlf_2':
            $tableName = 'sszg_symlf_2.role';
            break;
        case 'symlf_3':
            $tableName = 'sszg_symlf_3.role';
            break;
        case 'symlf_4':
            $tableName = 'sszg_symlf_4.role';
            break;
        default:
            $tableName = 'sszg_symlf_1.role'; // Default to symlf_1
    }

    // Sử dụng biến để tính thứ hạng (rank) thay vì ROW_NUMBER()
    $updateSql = "
        SET @rank = 0;
        INSERT INTO ws_bxhlucchien (username, name_server, lucchien, `rank`)
        SELECT 
            account AS username,
            name AS name_server,
            power AS lucchien,
            @rank := @rank + 1 AS `rank`
        FROM $tableName
        ORDER BY power DESC
        LIMIT 10
    ";
    $stmt = $dbh->prepare($updateSql);
    $stmt->execute();

    // Lấy dữ liệu bảng xếp hạng Lực Chiến từ ws_bxhlucchien
    $stmt = $dbh->prepare("SELECT `rank`, username, name_server, lucchien FROM ws_bxhlucchien ORDER BY `rank` ASC");
    $stmt->execute();
    $topPlayers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Trả về dữ liệu dạng JSON cho frontend
    echo json_encode([
        'topPlayers' => $topPlayers
    ]);

} catch (Exception $e) {
    echo json_encode(['error' => 'Đã xảy ra lỗi: ' . $e->getMessage()]);
}
?>
