<?php
// error_reporting(0);
if(!isset($_GET['type']))
	exit;
else{
	include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
	include_once $_SERVER['DOCUMENT_ROOT'].'/functions/rebuild_date.php';
	#$server_data = $dbh->query("SELECT * FROM `ip_web_sv` ORDER BY `id` DESC")->fetchAll();
	$server_data = $dbh->query("SELECT * FROM `ip_web_sv` WHERE `released` <= NOW() ORDER BY `id` DESC")->fetchAll();
	// $recent_play_sv = $dbh->query("SELECT * FROM `ty_server` ORDER BY `id` DESC")->fetchAll();
	if($_GET['type'] == 'button_list'){
		
		echo '<div class="modal-body">';
		echo '<div class="row ml-0">';
		echo '<div class="col-12"><span>Máy chủ mới</span></div>';
		echo '<div class="col-12 text-center">';
		echo '<a href="/play?sid='.$server_data[0]['id'].'" class="shadow btn text-light p-3 m-2">'.$server_data[0]['name'];
		$open_date = $server_data[0]['released'];
		if(time() - strtotime($open_date) < 0){
			$ngay = rebuild_date("D", strtotime($open_date));
			$ngay_thang = rebuild_date("d-m", strtotime($open_date));
			$gio_phut = rebuild_date("H:i", strtotime($open_date));
			echo ' <span class="badge badge-light">sắp</span>';
			echo ' <span class="badge badge-light">'.$gio_phut.' '.$ngay.' - '.$ngay_thang.'</span></a>';
			//<?php echo ;?
		}else{
			echo ' <span class="badge badge-light">mới</span></a>';
		}
		echo '</div>';
		// if ($recent_play_sv){
		// echo '<div class="col-12"><span>Chơi gần đây</span></div>';
		
		// }
		echo '<div class="col-12"><span>Máy chủ khác</span></div>';
				
		for($i = 1; $i < count($server_data); $i++){
			echo '<div class="col-4 p-0">';
			echo '<a href="/play?sid='.$server_data[$i]['id'].'" class="shadow btn text-light p-3 m-2">'.$server_data[$i]['name'].'</a>';
			echo '</div>';
		}
		
		echo '</div>';
		
		
		
	}elseif($_GET['type'] == 'select_list'){
		$data = array();
		$i = 0;
		foreach($server_data as $item){
			$data[$i]['sid'] = $item['id'];
			$data[$i]['name'] =  $item['name'];
			$i++;
		}
	
		echo json_encode($data);

	}else
		exit;
}
?>
		
      