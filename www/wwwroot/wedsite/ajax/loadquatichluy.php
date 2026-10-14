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
} else {
    $check2 = $dbh->query("SELECT DISTINCT nap FROM ws_tichnap ORDER BY nap ASC")->fetchAll();
    $checktich = $dbh->query("SELECT tichnap FROM game_account WHERE username='" . $_SESSION['niceUsername'] . "'")->fetch();
    $tichnapuid = $checktich['tichnap'];

    echo '<div class="cart-container">';
    for ($i2 = 0; $i2 < count($check2); $i2++) {
        $check = $dbh->query("SELECT * FROM ws_tichnap WHERE nap='" . $check2[$i2]['nap'] . "'")->fetchAll();
        $qua = '<div class="gift-container">';
        for ($i = 0; $i < count($check); $i++) {
            $img = '<div class="gift-item">
                        <img src="/shop/' . $check[$i]['item'] . '.png" class="gift-image">
                        <div class="gift-text">' . $check[$i]['name'] . ' x(' . $check[$i]['count'] . ')</div>
                    </div>';
            $qua .= $img;
        }
        $qua .= '</div>';

        
        $nap = $check2[$i2]['nap'];
        $logCheck = $dbh->query("SELECT id FROM ws_tichnap_log WHERE username='" . $_SESSION['niceUsername'] . "' AND tichnap='$nap'")->fetch();
        $status = "chưa đạt";
        if ($tichnapuid >= $nap) {
            if ($logCheck) {
                $status = "đã nhận";
            } else {
                $status = "nhận";
            }
        }

        
        $button = '';
        if ($status == "nhận") {
            $button = '<button href="#server" data-toggle="modal" data-pack="' . $nap . '" data-packid="1" data-packtype="1" class="confirm-received btn btn-success text-light">Nhận</button>';
        } elseif ($status == "đã nhận") {
            $button = '<button class="btn btn-secondary text-light" disabled>Đã nhận</button>';
        } else {
            $button = '<button class="btn btn-danger text-light" disabled>Chưa đạt</button>';
        }

        echo ('<div class="cart-item">
                <div class="cart-item-header">
                    <h4 class="cart-item-product-title">Đạt ' . number_format($nap) . ' điểm tích lũy nhận thưởng</h4>
                    <span class="text-xl font-weight-medium">
                        <b class="text-success">' . number_format($tichnapuid) . '/' . number_format($nap) . '</b>
                    </span>
                </div>
                ' . $qua . '
                <div class="text-center mt-3">' . $button . '</div>
            </div>');
    }
    echo '</div>';
}
?>

<style>
.cart-container {
    max-height: 80vh; /* Giới hạn chiều cao tối đa của phần nội dung */
    overflow-y: auto; /* Kích hoạt cuộn theo chiều dọc */
    padding: 10px;
    border: 1px solid yellow;
    border-radius: 5px;
    background-color: #454545; /* Nền trong suốt */
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
}

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