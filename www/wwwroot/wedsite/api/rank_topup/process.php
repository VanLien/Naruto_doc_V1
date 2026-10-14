<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
require_once $_SERVER['DOCUMENT_ROOT'] . '/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'] . '/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'] . '/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'] . '/functions/ConnectGame.php';
include_once $_SERVER['DOCUMENT_ROOT'] . '/functions/sendMail.php';
include_once $_SERVER['DOCUMENT_ROOT'] . '/functions/sendXu.php';
include_once $_SERVER['DOCUMENT_ROOT'] . '/api/rank_topup/config.php';

$result = array();

// Validate user session
if (!isset($_SESSION['user_id'])) {
    $result['msg'] = "กรุณาเข้าสู่ระบบ";
    echo json_encode($result);
    exit;
} else {
    // Validate POST data
    if (empty($_POST['server']) || empty($_POST['AuthPassword']) || empty($_POST['actorname'])) {
        $result['msg'] = "โปรดกรอกข้อมูลให้ครบทุกช่อง";
        echo json_encode($result);
        exit;
    } else {
        // Validate and sanitize user input for password
        $Authusername = $_SESSION['niceUsername'];
        $AuthPassword = $_POST['AuthPassword']; // Assume it's properly validated and sanitized here
        $actorname = $_POST['actorname'];

        // Prepare and execute the query with bound parameters
        $stmt = $dbh->prepare("SELECT `uid`, `status` FROM `game_account` WHERE `username` = :username AND `password` = :password LIMIT 1");
        $stmt->bindParam(':username', $Authusername);
        $stmt->bindParam(':password', $AuthPassword);
        $stmt->execute();
        $result_auth = $stmt->fetch();

        if ($result_auth !== false) {
            if ($result_auth['status'] == '1') {
                $isAuth = '1';
            } else {
                $isAuth = '0';
                $result['msg'] = "บัญชีนี้ถูกแบน";
                echo json_encode($result);
                exit;
            }
        } else {
            $isAuth = '0';
            $result['msg'] = "ชื่อบัญชีหรือรหัสผ่านผิด";
            echo json_encode($result);
            exit;
        }
    }

    // Further processing with validated data
    if (isset($_POST['action']) && $_POST['action'] == 'send') {
        if ($isAuth != '1') {
            $result['msg'] = "Please Enter your password again!";
            echo json_encode($result);
            exit;
        }
        if(time() < strtotime($date_rank['start']) )
		{
			$result['msg'] = "กิจกรรมยังไม่เริ่ม";
            echo json_encode($result);
			exit;
		}
		else if(time() > strtotime($date_rank['end']) && time() > strtotime($date_rank['reward_end']) )
		{	
			$result['msg'] = "กิจกรรมสิ้นสุดลงแล้ว";
            echo json_encode($result);
			exit;
		}
		if (time() > strtotime($date_rank['reward_start']) && time() < strtotime($date_rank['reward_end'])) { 
            // Process transaction
            $server = $_POST['server'];
            $user_id = $_SESSION['user_id'];
    
            $dbh2 = connectGame($server, $dbh);
            $uid = encryptUserID($user_id, $server);
            $username = $_SESSION['niceUsername'];
    
    
            // Prepare SQL statement to fetch top 10 usernames ordered by total
            $stmt = $dbh->prepare("SELECT `username` FROM `rank_topup` ORDER BY total DESC LIMIT 10");
            $stmt->execute();
            $rank = 0;
            $my_rank = 0;
            // Check if your username is within the top 10
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $rank++; // Increment rank counter
                if ($row['username'] === $username) {
                    $my_rank = $rank;
                    switch ($my_rank) {
                        case 1:
                            $data_rank = $data_rank_1;
                            break;
                        case 2:
                            $data_rank = $data_rank_2;
                            break;
                        case 3:
                            $data_rank = $data_rank_3;
                            break;
                        case 4:
                            $data_rank = $data_rank_4;
                            break;
                        case 5:
                            $data_rank = $data_rank_5;
                            break;
                        case 6:
                            $data_rank = $data_rank_6;
                            break;
                        case 7:
                            $data_rank = $data_rank_7;
                            break;
                        case 8:
                            $data_rank = $data_rank_8;
                            break;
                        case 9:
                            $data_rank = $data_rank_9;
                            break;
                        case 10:
                            $data_rank = $data_rank_10;
                            break;
                        default:
                            $data_rank = [];
                            break;
                    }
                    break;
                }
            }
    
            if ($rank > 10){
                // If username is not found in the top 10
                $result['msg'] = "ขออภัย บัญชีของคุณไม่ติด 10 อันดับแรกของกิจกรรม";
                echo json_encode($result);
                exit;
            } else {
                if ($rank > 0) { //เช็คว่า น้อยกว่า 10 และ มากกว่า 0
                    
                    $stmt = $dbh->prepare("SELECT * FROM `rank_topup` WHERE `username` = :username LIMIT 1");
                    $stmt->bindParam(':username', $username);
                    $stmt->execute();
                    $check_recived = $stmt->fetch();
                    if ($check_recived['status'] == '1') { // 1 == ยังไม่รับรางวัล
                        // เช็ค sv จากฐานข้อมูล
                        $stmt = $dbh->prepare("SELECT * FROM `ty_server` WHERE `id` = :server LIMIT 1");
                        $stmt->bindParam(':server', $server);
                        $stmt->execute();
                        $check_sv = $stmt->fetch();
                        if ($check_sv !== false) {
                            $current_sv = $check_sv['sid'];
                            // เปลี่ยน status เป็นรับแล้ว
                            $stmt = $dbh->prepare("UPDATE rank_topup SET status = 2 WHERE username = :username");
                            $stmt->bindParam(':username', $username);
                            $update_player_status = $stmt->execute();
                            
                            foreach ($data_rank['item'] as $item) {
                                $post = [
                                    'type'=> '8',
                                    'usr'=> $username,
                                    'item'=> $item['id'],
                                    'num'=> $item['num'],
                                    'qu'=> $current_sv,
                                    'gmlb'=> 0,
                                    'isrmb'=> 1,
                                    'sqm'=> $PassGm,
                                ];
                                $send = sendmail2($LinkGm,$post);
                            }
                            if(isset($send)){
                                $today = date("Y-m-d H:i:s");
                                $insert_log = "INSERT INTO rank_topup_log (server, username, actorname, rank, created) 
                                    VALUES (:server, :username, :actorname, :rank, :created)";
                                $stmt = $dbh->prepare($insert_log);
                                $stmt->bindParam(':server', $current_sv);
                                $stmt->bindParam(':username', $_SESSION['niceUsername']);
                                $stmt->bindParam(':actorname', $actorname);
                                $stmt->bindParam(':rank', $rank);
                                $stmt->bindParam(':created', $today);
                                $check_insert_log = $stmt->execute();
                                if ($check_insert_log !== false) {
                                    $result['msg'] = "ได้รับแพ็คเกจสะสมเรียบร้อยแล้ว";
                                    echo json_encode($result);
                                } else {
                                    $result['msg'] = "การจัดการเก็บ Log มีปัญหา โปรดติดต่อ Admin เพื่อรายงาน";
                                    echo json_encode($result);
                                    exit;
                                }
        					} else {
                                $result['msg'] = "การรับรางวัลมีปัญหา โปรดติดต่อ Admin เพื่อรายงาน";
                                echo json_encode($result);
                                exit;
        					}
                        } else {
                            $result['msg'] = "การตรวจสอบ Server มีปัญหา โปรดติดต่อ Admin เพื่อตรวจสอบ";
                            echo json_encode($result);
                            exit;
                        }
                    } else {
                        $result['msg'] = 'คุณได้รับรางวัลกิจกรรมนี้แล้ว ไม่สามารถรับซ้ำได้';
                        echo json_encode($result);
                        exit;
                    }
                } else {
                    $result['msg'] = "อันดับผิดพลาด โปรดติดต่อ Admin เพื่อรายงาน";
                    echo json_encode($result);
                    exit;
                }
            }
        } else {
            $result['msg'] = "ไม่อยู่ในระยะเวลาสำหรับรับรางวัล";
            echo json_encode($result);
            exit;
        }
    } else {
        $result['msg'] = "action error";
        echo json_encode($result);
        exit;
    }
}
?>
