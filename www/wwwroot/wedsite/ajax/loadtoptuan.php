<?php
date_default_timezone_set('Asia/Ho_Chi_Minh'); 
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';

include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php';

function isMondayMidnight() {
    return (date('G') == 0 && date('i') == 0 && date('N') == 1); 
}

if (isMondayMidnight()) {
    try {
        $dbh = new PDO('mysql:host=localhost;dbname=your_database', 'username', 'password');
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        $dbh->exec("DELETE FROM ws_toptuan_log");
        $dbh->exec("UPDATE game_account SET toptuan = 0");

        echo "Đã reset dữ liệu tuần thành công!";
    } catch (PDOException $e) {
        echo "Lỗi: " . $e->getMessage();
    }
}

function fetchUsertoptuan($dbh, $username) {
    $stmt = $dbh->prepare("SELECT toptuan FROM game_account WHERE username = :username");
    $stmt->execute(['username' => $username]);
    return $stmt->fetchColumn();
}

function fetchDistinctNap($dbh) {
    $stmt = $dbh->prepare("SELECT nap FROM ws_toptuan GROUP BY nap ORDER BY nap ASC");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function fetchGiftDetails($dbh, $nap) {
    $stmt = $dbh->prepare("SELECT * FROM ws_toptuan WHERE nap = :nap");
    $stmt->execute(['nap' => $nap]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function generateGiftHtml($gifts) {
    $html = '<div class="gift-container">';
    foreach ($gifts as $gift) {
        $html .= '<div class="gift-item">
                    <img src="/shop/' . htmlspecialchars($gift['item'], ENT_QUOTES, 'UTF-8') . '.png" class="gift-image">
                    <div class="gift-text">' . htmlspecialchars($gift['name'], ENT_QUOTES, 'UTF-8') . ' x(' . htmlspecialchars($gift['count'], ENT_QUOTES, 'UTF-8') . ')</div>
                  </div>';
    }
    $html .= '</div>';
    return $html;
}

if (!isset($_SESSION['user_id'])) {
    echo '<div class="alert alert-danger">Vui lòng đăng nhập</div>';
} else {
    $username = $_SESSION['niceUsername']; 
    $toptuanuid = fetchUsertoptuan($dbh, $username); 
    $napList = fetchDistinctNap($dbh); 

    foreach ($napList as $nap) {
        $gifts = fetchGiftDetails($dbh, $nap['nap']); 
        $giftHtml = generateGiftHtml($gifts); 

        echo '
        <div class="cart-item">
            <div class="main-container">
                <div class="info-item">
                    <h4 class="cart-item-product-title">Mốc Thần Trang</h4>
                    <span class="text-xl font-weight-medium"><b class="text-success">' . number_format((int)$toptuanuid) . '/' . number_format((int)$nap['nap']) . ' </b></span>
                </div>
                <div class="right-container">
                    <div class="info-item">
                        <h4 class="cart-item-product-title">Phần quà</h4>
                        ' . $giftHtml . '
                    </div>
                    <div class="text-center" style="margin-top: 10px;">
                        <button href="#server" data-toggle="modal" data-pack="' . htmlspecialchars($nap['nap'], ENT_QUOTES, 'UTF-8') . '" data-packid="1" data-packtype="1" class="confirm-received btn btn-success text-light">Nhận</button>
                    </div>
                </div>
            </div>
        </div>
        ';
    }
}
?>
<style>
.cart-item {
    padding: 15px;
    margin-bottom: 15px;
    background-color: transparent;
    border: 1px solid cyan;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
}

.main-container {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.info-item {
    text-align: center;
    padding: 10px;
    flex: 1;
    background: none;
}

.right-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    flex: 2;
    padding: 10px;
    background: none; 
}

.gift-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    background: none;
    padding: 10px;
}

.gift-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    margin: 5px;
    padding: 10px;
}

.gift-image {
    width: 50px;
    margin-bottom: 5px;
	background-color: #E0FFFF;
    border: 1px solid cyan;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
}

.gift-text {
    color: lime;
}

@media (max-width: 767px) {
    .main-container {
        flex-direction: column;
    }

    .info-item, .right-container {
        width: 100%;
        margin-bottom: 10px;
    }
}
</style>
