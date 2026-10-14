<?php
$PassGm = '1';// Pass GM Chỗ này là mật khẩu GM,Còn send ko cần thêm gì
$LinkGm='http://ninjahokage.com:84/@adminhlno1/gzs.php';// Link GM Chỗ này là link GM nếu đổi thì phải thay cả ở đây mới đc nhé
function SendItem($encrypt_user_id, $itemid, $num, $type = 1, $srvid, $dbh2, $mail_title ="Thư hệ thống", $mail_content="Bạn nhận được 1 thư từ hệ thống") {
    try {
        $check = $dbh2->query("SELECT dbid FROM `players` WHERE `account` = '{$encrypt_user_id}' LIMIT 1")->fetch();
        if (!$check) {
            return false;
        } else {
            $roleid = $check['dbid'];
        }

        $send_result = $dbh2->prepare("INSERT INTO `gmcmd` (serverid, cmd, playerid, param1, param2, param3, param4) VALUES (?, ?, ?, ?, ?, ?, ?)")
                ->execute(array($srvid + 1, 'mail', $roleid, $type, $itemid, $num, 1));

        return $send_result ? true : false;
    } catch (PDOException $e) {
        // Log error or handle it
        return false;
    }
}

function sendmail($url, $post) {
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
    $data = curl_exec($ch);
    curl_close($ch);
    return $data;
}

function SendCard($url, $post) {
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_DIGEST);
    curl_setopt($ch, CURLOPT_TIMEOUT, 120);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
    $result = curl_exec($ch);
    curl_close($ch);
    $result = json_decode($result);
    $return = array(
        'status' => $result->status,
        'message' => $result->message,
    );
    return $return;
}
?>