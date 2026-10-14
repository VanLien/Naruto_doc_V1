<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
if(isset($_SESSION['user_id']))
{
	$user_id = $_SESSION['user_id'];
	$result = $dbh->query("SELECT * FROM `vip` WHERE `id` = '{$user_id}' LIMIT 1")->fetch();
	$vip_exp = $result['vip_exp'];
	if ($result == false){
		$vip_exp = 0;
		$vip_level = 0;
		
	}
	
	// Tính kinh nghiệm VIP

	$cf_vip = array(
		'vip0' => 0,
		'vip1' => 100,
		'vip2' => 300,
		'vip3' => 700,
		'vip4' => 1500,
		'vip5' => 3200,
		'vip6' => 9999990,

	);

	if ($vip_exp < $cf_vip['vip1']) 
		$vip_level=0;
	else if ($vip_exp < $cf_vip['vip2']) 
		$vip_level=1;
	else if ($vip_exp < $cf_vip['vip3'])
		$vip_level=2;
	else if ($vip_exp < $cf_vip['vip4'])
		$vip_level=3;
	else if ($vip_exp < $cf_vip['vip5'])
		$vip_level=4;
	else if ($vip_exp < $cf_vip['vip6'])
		$vip_level=5;
	if($vip_level < 5)
	{
		$data = array(
		'status' => true,
		'vip_exp_current' => $vip_exp, //kinh nghiệm VIP hiện tại
		'vip_exp_next' => $cf_vip['vip'.($vip_level+1).''], //kinh nghiệm cấp VIP tiếp theo
		'vip_level_current' => $vip_level, //cấp VIP hiện tại
		'vip_level_next' => $vip_level+1, //cấp VIP tiếp theo
		'need_to_up' => $cf_vip['vip'.($vip_level+1).''] - $vip_exp// kinh nghiệm cần dể lên = kinh nghiệm cấp kế tiếp - hiện tại

	);
	}else{
		$data = array(
		'status' => true,
		'vip_exp_current' => $vip_exp, //kinh nghiệm VIP hiện tại
		'vip_exp_next' => "max", //kinh nghiệm cấp VIP tiếp theo
		'vip_level_current' => $vip_level, //cấp VIP hiện tại
		'vip_level_next' => "max", //cấp VIP tiếp theo
		'need_to_up' => "max"// kinh nghiệm cần dể lên = kinh nghiệm cấp kế tiếp - hiện tại

	);
	}
	
	$json = $data;
}
else
{
	$json['status'] = false;
	$json['msg'] = "Vui lòng nhập ít nhất 1 trường";
}
echo json_encode($json);
exit;