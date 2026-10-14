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
 $a=1000;  
		$b=1500;  
		$c=29;  
		$d=7; 
		echo "<table border=1 cellspacing=0 cellpading=0>  
				<tr> <td><font color=black>CODE</td> <td> Thời Gian</font></td><td> Máy Chủ</font></td></tr>   
		<tr> <td><font color=blue>TANTHU666</td> <td> Vĩnh Viễn</font></td><td> Toàn Bộ</font></td></tr>   
		<tr> <td><font color=blue>TANTHU888</td> <td> Vĩnh Viễn</font></td><td>  Toàn Bộ</font></td></tr> 
		<tr> <td><font color=blue>TANTHU999</td> <td> Vĩnh Viễn</font></td><td>  Toàn Bộ</font></td></tr>  
		<tr> <td><font color=blue>CODE3K</td> <td> Vĩnh Viễn</font></td><td> Toàn Bộ</font></td></tr>   
		<tr> <td><font color=blue>MAYCHUMOI7/12</td> <td>$a ngày</font></td><td>S7</font></td></tr>  
		<tr> <td><font color=blue>CODECHUNGS7</td> <td>$d ngày</font></td><td> Toàn Bộ</font></td></tr> 
				<tr> <td><font color=blue>LIKESHARES7</td> <td>$d ngày</font></td><td> Toàn Bộ</font></td></tr> 
		</table>";  
		
		
		
		

		
echo "<table border=1 cellspacing=0 cellpading=0> 

<tr><br> <td>  Code likeshare vui lòng tham khảo fapage HMNGAME. Fanpage ở phía bên trái</font></td></tr>  </br> 
<tr> <td>  Code fan cứng thứ 7 hàng tuần.</font></td></tr> 
<tr> <td>  Code Nhóm Chính Thức HMNGAME Chấm Com thứ 4, 5 hoặc 6.</font></td></tr> 
			</table>";  
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