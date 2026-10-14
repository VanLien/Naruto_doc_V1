<?php
//Gửi xu
function sendXu($xu, $uid, $dbh, $action='+'){

	$uid = $uid;
	$amount = $xu;
	try{
	$update = $dbh->prepare("UPDATE game_account SET xu = xu {$action} ? WHERE id = ?")->execute(array($amount, $uid));
	} catch (Exception $e) {
		return false;
	}
	if($update)
		return true;
	else
		return false;
}
// Lưu log mời bạn bè
function logInviteFriend($id_moi, $id_duocmoi, $soxu, $dbh, $note=""){

	try {
            $insert = $dbh->prepare("INSERT INTO `invited_log` (id_moi, id_duocmoi, xu, created, note) VALUES (?, ?, ?, NOW()), ?")
                ->execute(array($id_moi, $id_duocmoi, $soxu, $note));
          } catch (Exception $e) {
            return false;
        }

 	if($insert)
 		return true;
 	else
 		return false;

}