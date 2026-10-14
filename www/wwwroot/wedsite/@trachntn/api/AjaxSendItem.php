<?php
sleep(1);

session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
  exit;
}else
	$username = $_SESSION['admin'];
$json = array();
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnectGame.php';
if(isset($_POST['uid']) && isset($_POST['item_id']) && isset($_POST['item_type']) && isset($_POST['item_quantily']) && isset($_POST['serverid']))
{
	//Data
	$id = $_POST['uid'];
	$item_id = $_POST['item_id'];
	$item_type = $_POST['item_type'];
	$item_quantily = $_POST['item_quantily'];
	//khởi tạo kết nối data
	$dbh2 = connectDb($_POST['serverid'], $config);
	$serverid = $_POST['serverid']+1;
	

	//User ID encryption
	$encryptLoginKey = 'sdhfjhdsftrach12s#$';
	$loginKey      = md5(sha1($id) . $encryptLoginKey);
	//Check user
	$result = $dbh->query("SELECT * FROM `users` WHERE `id` = '{$id}' LIMIT 1")->fetch();
	if (!$result == true){
		$json['status'] = false;
		$json['msg'] = "Wrong User ID" .$id;
		echo json_encode($json);
		exit;		
	}
	//Check character

	$check = $dbh2->query("SELECT dbid FROM `players` WHERE `account` = '{$loginKey}' LIMIT 1")->fetch();
	if (!$result == true){
		$json['status'] = false;
		$json['msg'] = "Character doesn't exist";
		echo json_encode($json);
		exit;		
	}else{
		$roleid = $check['dbid'];
	}
	//Send mail process
	$itemstr = $item_type .= '_';
	if ($item_type == 0) {
		//<option value="0"> Kinh nghiệm </option>
		//<option value="1"> Kim tệ </option>
		//<option value="2"> Nguyên bảo </option>
		//<option value="3"> Khóa lại Nguyên bảo </option>
		$itemstr .= $item_id .= '_';
	} elseif ($item_type == 1) {
		if ($item_quantily < 1 || $item_quantily > 999999) {
			$json['status'] = false;
			$json['msg'] = "Quantily must be from 1 to 999999";
			echo json_encode($json);
			exit;	
		}
		$itemstr .= $item_id .= '_';
	}
	$itemstr .= $item_quantily;
	$items = explode('_', $itemstr);

	 try {
	 		$itemtype = $items[0];
	 		$itemid =  $items[1];
	 		$itemquantily = $items[2];
            $send_result = $dbh2->prepare("INSERT INTO `gmcmd` (serverid, cmd, playerid, param1, param2, param3, param4) VALUES (?, ?, ?, ?, ?, ?, ?)")
                ->execute(array($serverid,'mail',$roleid,$itemtype,$itemid,$itemquantily, 1));
             // Log
          $action = "Send item id:". $itemid . ", type: ".$itemtype.", quantily: ".$itemquantily.", server: ".$serverid." to ID:".$id;
	      	try {
	        $dbh->prepare("INSERT INTO `admin_log` (username, action, created, ip) VALUES (?, ?, NOW(), ?)")
		            ->execute(array($username, $action, $_SERVER['REMOTE_ADDR']));
		      } catch (Exception $e) {
		        $json['status'] = false;
		        $json['msg'] = $e;
			} 
              if($send_result){
              	$sv_return = intval($serverid) - 1;
            	$json['status'] = true;
            	$json['msg'] = 'Success send the item ['.$items[1].'] to character has id ['.$roleid.'] (item type: '.$items[0].', item num: '.$items[2].', server: '. $sv_return .')';
            }
            else{
            	$json['status'] = false;
            	$json['msg'] = "Can't insert into data";
            }
            
            echo json_encode($json);
            exit;

          } catch (Exception $e) {
            $json['status'] = false;
            $json['msg'] = 'error!'.$e;
            echo json_encode($json);
		exit;
        }   
     // Log

}
else
{
	$json['status'] = false;
		$json['msg'] = "Failed x0002";
		echo json_encode($json);
		exit;

}
