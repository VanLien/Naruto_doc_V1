

<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$json = array();
try {
            $dbh->prepare("INSERT INTO `game_account` (username, password, created, ip_address) VALUES (?, ?, NOW(), ?)")
                ->execute(array("1s23sdsd", "23213123123", ""));
			$json['msg'] = "failed";
          } catch (Exception $e) {
            $json['status'] = false;
            $json['msg'] = 'Đăng ký lỗi!'.$e;
        } 
		echo json_encode($json);