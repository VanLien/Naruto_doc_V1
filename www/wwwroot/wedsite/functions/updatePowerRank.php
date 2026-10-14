<?php
function updatePowerRank($dbh) {
    try {
        // Truy vấn lấy bảng xếp hạng lực chiến
        $stmt = $dbh->prepare("SELECT rank, username, power FROM ws_bxhlucchien_rank ORDER BY rank ASC LIMIT 10");
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (empty($result)) {
            return []; // Trả về mảng rỗng nếu không có dữ liệu
        }

        return $result;
    } catch (PDOException $e) {
        error_log("Error fetching power rank: " . $e->getMessage());
        return [];
    }
}
?>
