<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
$date = array(
	'start' => '2019-12-29 11:00:00',
	'end' => '2021-10-07 11:00:00',
);
$data = array(

	'92' =>  array(
		'cat' => 2,
		'id' => 92,
		'icon' =>92,
		'type' => 1, 
		'name' => 'Flame of Soul',
		'cost' => 2,
		'count' => 1,
	),
		'217' =>  array(
		'cat' => 2,
		'id' => 217,
		'icon' =>217,
		'type' => 1, 
		'name' => 'Peso',
		'cost' => 1,
		'count' => 1,
	),
		'218' =>  array(
		'cat' => 2,
		'id' => 218,
		'icon' =>218,
		'type' => 1, 
		'name' => 'General Fostone',
		'cost' => 20,
		'count' => 100,
	),
		'219' =>  array(
		'cat' => 2,
		'id' => 219,
		'icon' =>219,
		'type' => 1, 
		'name' => 'Boost Stone',
		'cost' => 20,
		'count' => 70,
	),		
		'50550' =>  array(
		'cat' => 2,
		'id' => 50550,
		'icon' =>50550,
		'type' => 1, 
		'name' => 'Emblem Stone',
		'cost' => 1,
		'count' => 1,
	),


		'208' =>  array(
		'cat' => 2,
		'id' => 208,
		'icon' =>208,
		'type' => 1, 
		'name' => 'Elder Tektite',
		'cost' => 5,
		'count' => 1,
	),
		'220' =>  array(
		'cat' => 2,
		'id' => 220,
		'icon' =>220,
		'type' => 1, 
		'name' => 'Mythic Exp Emblem ',
		'cost' => 1,
		'count' => 1,
	),
		'213' =>  array(
		'cat' => 2,
		'id' => 213,
		'icon' =>213,
		'type' => 1, 
		'name' => 'Raw Iron',
		'cost' => 1,
		'count' => 1,
	),
		'150' =>  array(
		'cat' => 2,
		'id' => 150,
		'icon' =>150,
		'type' => 1, 
		'name' => 'Omni Heart',
		'cost' => 150,
		'count' => 1,
	),
		'215' =>  array(
		'cat' => 2,
		'id' => 215,
		'icon' =>215,
		'type' => 1, 
		'name' => 'Switch Cert',
		'cost' => 140,
		'count' => 1,
	),
		'93' =>  array(
		'cat' => 2,
		'id' => 93,
		'icon' =>93,
		'type' => 1, 
		'name' => 'Immortal Soul',
		'cost' => 2,
		'count' => 1,
	),	
		'110' =>  array(
		'cat' => 2,
		'id' => 110,
		'icon' =>110,
		'type' => 1, 
		'name' => 'Sacrifice Fire',
		'cost' => 4,
		'count' => 1,
	),	
	
);
function checkSumPay($user_id, $dbh, $start_day, $end_day){
	$payment = $dbh ->query("SELECT sum(amount) AS sum  FROM payment WHERE `user_id` = '$user_id' AND `status` = '1' AND `created` >= '$start_day' AND `created` <= '$end_day'")->fetch();
	return $payment['sum'];
}