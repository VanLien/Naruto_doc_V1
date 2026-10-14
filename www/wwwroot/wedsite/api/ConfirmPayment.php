<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$user_id = $_SESSION['user_id'];
$json = array();
// lấy id
if (!isset($_POST['moneyInt']) || !isset($_POST['gateway'])) {
	$json['status'] = false;
	$json['msg'] = 'Vui lòng nhập dữ liệu';
}

else{
	//check xem đã đăng nhập chưa
	$result = $dbh->query("SELECT * FROM `game_account` WHERE `uid` = '{$user_id}' LIMIT 1")->fetch();
	if ($result == false){
	    $json['status'] = false;
	    $json['msg'] = "Lỗi xác minh thông tin";
		
		//insert data
	}
	else
	{
		$money = $_POST['moneyInt'];
		$gateway = $_POST['gateway'];
		$ip = $_SERVER['REMOTE_ADDR'];
		
		// 0: hủy
        // 1: hoàn thành
        // 2: đang xử lý
        // 3: đã thanh toán
        // kiểm tra xem đã có yêu cầu nạp trước đó mà chưa xử lý không?
        // try 
        //     {
        // $check = $dbh->query("SELECT * FROM `payment` WHERE `user_id` = '{$user_id}' AND `status` = 2 LIMIT 1")->fetch();
        // } catch (Exception $e) {
        //         $json['status'] = false;
        //         $json['msg'] = 'Lỗi dữ liệu!';
        //         exit;
        //         }
        // //Nếu có thì không thêm data mà chỉ sửa số tiền + gateway
        // if($check)
        // {
        // 	$id = $check['id'];
        // 	$query = "UPDATE `payment` SET `amount` = ?, gateway = ?, modified = NOW() WHERE id = ?";
        // 	$dbh->prepare($query)->execute(array($money, $gateway, $id));
        // }
        // //ngược lại thêm data
        // else
        // {
        	try 
        	{
				$dbh->prepare("INSERT INTO `payment` (user_id, amount, gateway, ip, status, created) VALUES (?, ?, ?, ?, ?, NOW())")
	                ->execute(array($user_id, $money, $gateway, $ip, 2));
	        } catch (Exception $e) {
			    $json['status'] = false;
			    $json['msg'] = 'Lỗi dữ liệu!';
                exit;
			}
        // }
        
	    
         // echo $user_id.$money.$gateway.$
         //Lấy id vừa insert
        $inserted = $dbh->query("SELECT * FROM `payment` WHERE `user_id` = '{$user_id}' AND `status` = 2 ORDER BY created DESC LIMIT 1 ")->fetch();

        //tạo payment id từ id của payment và id user
        $payment_id = str_pad($inserted['id'], 4, '0', STR_PAD_LEFT);
        $json['status'] = true;
        $json['payment_id'] = $payment_id;
        $json['amount'] = $money;
		
	}

}

// return
echo json_encode($json);exit;

