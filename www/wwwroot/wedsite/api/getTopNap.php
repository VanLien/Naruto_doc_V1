<?php
header('Content-Type: text/html; charset=utf-8');


require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/encryptUserID.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/ConnectGame.php';
$sid = $_POST['sid'];
if(!isset($_SESSION['user_id'])){
	exit;
}
else{
	
	$serverid = $sid;
	$logknb = $dbh->query("SELECT userid,xu FROM user.pay_log WHERE serverid = '$serverid'");
	$logshop = $dbh->query("SELECT * FROM user.shop_log WHERE server = '$serverid'");

echo "TANTHU666</br>";
echo "TANTHU888</br>";
echo "TANTHU999</br>";
echo "CODE3K</br>";
echo "CODEOPEN (Sắp hết hạn)</br>";
echo "CODECHUNGS2 (Sắp hết hạn)</br>";
echo "TYJLJ19T1 (Sắp hết hạn)</br>";
echo "CODECHUNGS3 (Có thời hạn 29 Sử dụng được)</br>";
echo "MAYCHUMOI29/10 (Có thời hạn 29 Sử dụng được)</br>";

	echo 'Code likeshare vui lòng tham khảo fapage Làng Lá. Code fan cứng thứ 7 hàng tuần.';
	if($logknb && $logshop){
		$arr = array();
		echo '<table class="table">
						   <thead class="thead-dark">
							  <tr>
								 <th>TOP</th>
								 <th>User</th>
								 <th>Tổng Nạp</th>
							  </tr>
						   </thead>
						   <tbody>';
			// output data of each row
		foreach ($logknb as $row){
			if(!isset($arr[$row["userid"]])){
				$arr[$row["userid"]] = (int)$row["xu"];
			}else{
				$arr[$row["userid"]] += (int)$row["xu"];
			}
		}
		foreach ($logshop as $row){
			if(!isset($arr[$row["user_id"]])){
				$arr[$row["user_id"]] = (int)$row["num"] * (int)$row['cost'];
			}else{
				$arr[$row["user_id"]] += (int)$row["num"] * (int)$row['cost'];
			}
			
		}
		$topnap = array();
		$count = 0;
		$arrkey = array_keys($arr);
		while ($count < 10){
			$max = 0;
			foreach ($arrkey as $val){
				if($val == 2){ // lọc user admin 
					continue;
				}
				if ($arr[$val] > $max){
					$is_available = false;
					foreach($topnap as $userid){
						if($userid == $val){
							$is_available = true;
							break;
						}
					}
					if($is_available){
						continue;
					}
					$topnap[$count] = $val;
					$max = $arr[$val];
				}
			}
			$count++;
		}
		$i = 0;
		foreach ($topnap as $userid){
			$i++;
			$user = $dbh->query("SELECT username FROM user.users WHERE id = $userid")->fetch();
			echo "<tr><td>".$i."</td><td>".$user['username']."</td><td>".$arr[$userid]." Xu</td></tr>";
		}
		echo "</table>";
		
		/*$data = array(
			'status'=> true,
			'msg' => $topnap,
		);*/
	}
	else{
		$data = array(
		'status'=> false,
		'msg' => "Chưa có nhân vật",
		);
	}
	
	//echo json_encode($data);
	exit;
}