<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

function updateRechargeRank($dbh) {
    try {
        $eventTimeQuery = $dbh->prepare("
            SELECT CONCAT(year, '-', LPAD(month, 2, '0'), '-', LPAD(day, 2, '0'), ' ', LPAD(hour, 2, '0'), ':', LPAD(minute, 2, '0'), ':', LPAD(second, 2, '0')) AS end_datetime
            FROM ws_bxhtoptuan_time
            ORDER BY id DESC
            LIMIT 1
        ");
        $eventTimeQuery->execute();
        $eventTime = $eventTimeQuery->fetch(PDO::FETCH_ASSOC);

        if (!$eventTime || new DateTime() > new DateTime($eventTime['end_datetime'])) {
            return;
        }

        $query = $dbh->prepare("
            SELECT username, toptuan 
            FROM game_account 
            WHERE toptuan > 0
            ORDER BY toptuan DESC
            LIMIT 10
        ");
        $query->execute();
        $data = $query->fetchAll(PDO::FETCH_ASSOC);

        $dbh->exec("TRUNCATE TABLE ws_bxhtoptuan_rank");

        $rank = 1;
        foreach ($data as $row) {
            $update = $dbh->prepare("
                INSERT INTO ws_bxhtoptuan_rank (rank, username, total_recharge) 
                VALUES (:rank, :username, :total_recharge)
            ");
            $update->execute([
                ':rank' => $rank,
                ':username' => $row['username'],
                ':total_recharge' => $row['toptuan']
            ]);
            $rank++;
        }
    } catch (Exception $e) {
        error_log("Error updating rank: " . $e->getMessage());
    }
}

function fetchTopRechargeRank($dbh) {
    $stmt = $dbh->prepare("
        SELECT rank, username, total_recharge 
        FROM ws_bxhtoptuan_rank 
        ORDER BY rank ASC
        LIMIT 10
    ");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function fetchGiftDetails($dbh, $nap) {
    $stmt = $dbh->prepare("
        SELECT item, count, name 
        FROM ws_bxhtoptuan 
        WHERE nap = :nap
    ");
    $stmt->execute(['nap' => $nap]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function generateGiftHtml($gifts) {
    if (empty($gifts)) {
        return '<div class="alert alert-warning">Không có quà cho mốc này.</div>';
    }

    $html = '<div class="gift-container">';
    foreach ($gifts as $gift) {
        $imagePath = '/shop/' . htmlspecialchars($gift['item'], ENT_QUOTES, 'UTF-8') . '.png';
        $html .= '<div class="gift-item">
                        <img src="' . $imagePath . '" class="gift-image" alt="' . htmlspecialchars($gift['name'], ENT_QUOTES, 'UTF-8') . '">
                        <div class="gift-text">' . htmlspecialchars($gift['name'], ENT_QUOTES, 'UTF-8') . ' x(' . htmlspecialchars($gift['count'], ENT_QUOTES, 'UTF-8') . ')</div>
                  </div>';
    }
    $html .= '</div>';
    return $html;
}

updateRechargeRank($dbh);

$loggedInUsername = $_SESSION['niceUsername'] ?? null;

$topPlayers = fetchTopRechargeRank($dbh);

for ($i = count($topPlayers) + 1; $i <= 10; $i++) {
    $topPlayers[] = [
        'rank' => $i,
        'username' => '---',
        'total_recharge' => '---'
    ];
}

// Cập nhật phần lấy thời gian sự kiện
$eventTimeQuery = $dbh->prepare("
    SELECT year, month, day, hour, minute, second
    FROM ws_bxhtoptuan_time
    ORDER BY id DESC
    LIMIT 1
");
$eventTimeQuery->execute();
$eventTime = $eventTimeQuery->fetch(PDO::FETCH_ASSOC);

if ($eventTime) {
    $endDateTimeStr = "{$eventTime['year']}-{$eventTime['month']}-{$eventTime['day']} {$eventTime['hour']}:{$eventTime['minute']}:{$eventTime['second']}";
    $formattedEndDate = (new DateTime($endDateTimeStr))->format('d/m/Y H:i:s');
} else {
    $formattedEndDate = 'Chưa thiết lập';
}
?>

<div class="col mb-2">
    <h2 class="text-center mb-4">Bảng Xếp Hạng Top Nạp</h2>
    <div class="description-box border rounded p-3 mb-4">
        <p class="text-center mb-2" style="margin: 0;">
            Đây là danh sách các người chơi đứng đầu về số tiền nạp trong tuần. Tham gia nạp thẻ để có cơ hội nhận nhiều phần quà hấp dẫn và xếp hạng cao hơn!
        </p>
        <p class="text-center mb-0" style="margin-top: 10px;">
            <strong>Thời gian sự kiện kết thúc: <?php echo $formattedEndDate; ?></strong>
        </p>
        <p class="text-center mb-0" style="margin-top: 10px;">
            Thời gian còn lại: <span id="countdown-timer"></span>
        </p>
    </div>

    <div class="cart-container">
        
            
            <table class="bxh-table">
                <thead>
                    <tr>
                        <th>Top</th>
                        <th>Tài Khoản</th>
                        <th>Tổng Nạp (VNĐ)</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($topPlayers as $player): ?>
                        <tr>
                            <td class="rank"><?php echo $player['rank']; ?></td>
                            <td class="username"><?php echo htmlspecialchars($player['username'], ENT_QUOTES, 'UTF-8'); ?></td>
                            <td class="total-recharge"><?php echo is_numeric($player['total_recharge']) ? number_format($player['total_recharge']) : $player['total_recharge']; ?></td>
                            <td>
                                <?php if (is_numeric($player['total_recharge']) && $player['username'] === $loggedInUsername): ?>
                                    <button class="btn btn-success btn-sm" onclick="claimReward(<?php echo $player['rank']; ?>)">Nhận Thưởng</button>
                                <?php else: ?>
                                    <span class="text-muted">---</span>
                                <?php endif; ?>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="gift-row">
                                <?php
                                $gifts = fetchGiftDetails($dbh, $player['rank']); 
                                echo generateGiftHtml($gifts);
                                ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        
    </div>
</div>

<style>
.description-box {
    border: 2px solid gold;
    background-color: #454545;
    color: cyan;
    border-radius: 5px; /* Bo góc nhẹ */
    padding: 1rem; /* Khoảng cách bên trong */
}

.cart-container {
    max-height: 80vh; /* Giới hạn chiều cao tối đa của phần nội dung */
    overflow-y: auto; /* Kích hoạt cuộn theo chiều dọc */
    padding: 10px;
    border: 1px solid yellow;
    border-radius: 5px;
    background-color: #454545; /* Nền màu xám đậm */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
}

/* Thanh cuộn 7 màu */
.cart-container::-webkit-scrollbar {
    width: 12px; /* Độ rộng của thanh cuộn */
}

.cart-container::-webkit-scrollbar-thumb {
    background: linear-gradient(45deg, red, orange, yellow, green, blue, indigo, violet);
    border-radius: 10px; /* Bo góc thanh cuộn */
}

.cart-container::-webkit-scrollbar-track {
    background: rgba(0, 0, 0, 0.2); /* Màu nền track của thanh cuộn */
    border-radius: 10px;
}

.cart-item {
    padding: 15px;
    margin-bottom: 15px;
    background-color: transparent; /* Nền trong suốt */
    border: 1px solid yellow;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.cart-item-header {
    text-align: center;
    margin-bottom: 15px;
    color: cyan;
}

.bxh-table {
    border-collapse: collapse;
    width: 100%;
    background-color: #454545;
    color: #fff;
}

.bxh-table th, .bxh-table td {
    border: 1px solid yellow;
    padding: 10px;
    text-align: center;
}

.bxh-table th {
    background-color: #333333;
    color: #FFD700; /* Tiêu đề bảng có màu vàng */
}

.bxh-table tbody tr:nth-child(odd) {
    background-color: #5a5a5a;
}

.bxh-table tbody tr:nth-child(even) {
    background-color: #3d3d3d;
}

/* Màu sắc riêng cho từng cột */
.bxh-table td.rank {
    color: lime; /* Màu xanh lá cây cho cột xếp hạng */
    font-weight: bold;
}

.bxh-table td.username {
    color: cyan; /* Màu cyan cho tên người dùng */
    font-weight: bold;
}

.bxh-table td.total-recharge {
    color: yellow; /* Màu vàng cho tổng nạp */
    font-weight: bold;
}

.gift-row {
    background-color: #282828; /* Nền khác biệt cho hàng quà */
    text-align: left;
    padding: 10px;
}

/* Hiển thị quà */
.gift-container {
    display: flex;
    flex-wrap: wrap; /* Cho phép quà xuống dòng nếu tràn chiều ngang */
    justify-content: center; /* Căn giữa các vật phẩm */
    gap: 10px; /* Khoảng cách giữa các vật phẩm */
    padding: 10px;
}

.gift-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    width: 80px; /* Đặt chiều rộng cố định */
}

.gift-image {
    width: 50px;
    margin-bottom: 5px;
    background-color: #E0FFFF;
    border: 1px solid cyan;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.gift-text {
    color: lime;
    font-size: 12px;
}

button.confirm-received {
    margin-top: 10px;
}
</style>

<!-- Thêm mã JavaScript cho bộ đếm ngược -->
<script>
    // Thiết lập thời gian đếm ngược
    var countDownDate = new Date("<?php echo $endDateTimeStr; ?>").getTime();

    // Cập nhật đếm ngược mỗi giây
    var countdownfunction = setInterval(function() {

        var now = new Date().getTime();

        var distance = countDownDate - now;

        // Tính toán thời gian cho ngày, giờ, phút và giây
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Hiển thị kết quả trong phần tử với id="countdown-timer"
        document.getElementById("countdown-timer").innerHTML = days + " ngày " + hours + " giờ "
        + minutes + " phút " + seconds + " giây ";

        // Nếu đếm ngược kết thúc
        if (distance < 0) {
            clearInterval(countdownfunction);
            document.getElementById("countdown-timer").innerHTML = "Sự kiện đã kết thúc";
        }
    }, 1000);
</script>
