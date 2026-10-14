<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendMail.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sendXu.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php';
$result = array();
$username = $_SESSION['niceUsername'];
if(!isset($_SESSION['user_id'])){
		$msg = "please log in";
	}
	else{
		$checkitem = $dbh ->query("SELECT * FROM `ws_spin_log` where Username='$username' and IsExit=0")->fetchAll();
							for($i = 0; $i < count($checkitem); $i++){
								$TemplateID = $checkitem[$i]['Item'];
								$count = $checkitem[$i]['Count'];
								if($TemplateID==0)
								{
									$dbh ->query("Update game_account set xu = xu+ '$count' WHERE username = '$username'")->fetch();
								}
								else
								{
									$Post = ['type'=> '8','usr'=> $username,'item'=> $checkitem[$i]['Item'],'num'=> $checkitem[$i]['Count'],'qu'=> $checkitem[$i]['Sv'],'bao'=> 0,'sqm'=> $PassGm,];
									sendmail($LinkGm,$Post);
								}
							}
							$updatelog = $dbh ->query("Update `ws_spin_log` set IsExit=1 where Username='$username'")->fetchAll();
	}