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
if(!isset($_SESSION['user_id'])){
		$return['item']= "Vui lòng đăng nhập";
		$return['rand']= 0;
		$return['v']= 0;
	}
	else{
		if($_POST['server'] == '' || is_numeric($_POST['server']) ==false){
			$return['item']= "Vui lòng chọn máy chủ";
			$return['rand']= 0;
			$return['v']= 0;
		}else{
			$sum_cost =20000; // Giá xèng
			$server = $_POST['server'];
			$user_id = $_SESSION['user_id'];
			$dbh2 = connectGame($server, $dbh);
			$uid  = encryptUserID($user_id, $server);
			$username = $_SESSION['niceUsername'];
			$random = rand(0,100);
			$rand = rand(1,10);
			$v = rand(50,200);
			$string="";
			$check = $dbh ->query("SELECT * FROM game_account WHERE uid = '$user_id' LIMIT 1")->fetch();
					if($check['xu'] >= $sum_cost){
						$checkitem = $dbh ->query("SELECT * FROM dbo_xeng where random >= $random ORDER BY RAND() LIMIT 10")->fetchAll();
						if(count($checkitem)<10)
						{
							$return['item']= "Không tìm thấy vật phẩm phù hợp";
							$return['rand']= 0;
							$return['v']= 0;
						}
						else
						{
							$itemid = $rand-1;
							for($i = 0; $i < count($checkitem); $i++){
								$string.='<span><img class="imgitem" src="/shop/'.$checkitem[$i]['TemplateID'].'.png"><b class="itemname">'.$checkitem[$i]['Name'].' x('.$checkitem[$i]['Count'].')</b></span>';
								if($itemid==$i)
								{
									$TemplateID = $checkitem[$i]['TemplateID'];
									$Count = $checkitem[$i]['Count'];
									$Name = $checkitem[$i]['Name'];
								}
							}
							if(isset($TemplateID))
							{
								$dbh ->query("Update game_account set xu = xu- '$sum_cost' WHERE uid = '$user_id'")->fetch();
								if($TemplateID==0)
								{
									$dbh ->query("Update game_account set xu = xu+ '$Count' WHERE uid = '$user_id'")->fetch();
								}
								else
								{
									$Post = ['type'=> '8','usr'=> $username,'item'=> $TemplateID,'num'=> $Count,'qu'=> $server,'bao'=> 0,'sqm'=> $PassGm,];
									$re=sendmail($LinkGm,$Post);
								}
								$dbh->prepare("
									 INSERT INTO `ws_xeng_log` (`username`, `item`, `count`, `serverid`, `name`, `created`) VALUES (?, ?, ?, ?, ?, NOW())
								")->execute(array($username, $TemplateID, $Count, $server ,$Name));
								$return['item']= $string;
								$return['rand']= $rand;
								$return['v']= $v;
							}
							else
							{
								$return['item']= "Chúc bạn may mắn lần sau";
								$return['rand']= 0;
								$return['v']= 0;
							}
						}
					}
					else
					{
						$return['item']= "Bạn không đủ $sum_cost";
						$return['rand']= 0;
						$return['v']= 0;
					}
		}
}
echo json_encode($return);