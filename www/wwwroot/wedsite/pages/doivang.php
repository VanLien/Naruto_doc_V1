<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$json = array();
$uname = $_SESSION['user_id'];
$getcoin = $dbh->query("SELECT * FROM `game_account` WHERE `uid` = '{$uname}' ")->fetch();

$charges = array(
	'1'=> 'Thẻ Vĩnh Viễn (100.000 Coin)',
	'2'=>'Thẻ Tháng (50.000 Coin)',
	'23'=>'Nạp Đầu 50NB Trong Game X5 KNB (50.000 Coin)',
	'24'=>'Nạp Đầu 100NB Trong Game X5 KNB (100.000 Coin)',
	'25'=>'Nạp Đầu 200NB Trong Game X5 KNB (200.000 Coin)',
	'3'=>'20.000 Dcoin = 400.000 KNB (X2 Lần Đầu Đổi)', 
	'4'=>'50.000 Dcoin = 1.000.000 KNB (X2 Lần Đầu Đổi)',
	'5'=>'100.000 Dcoin = 2.000.000 KNB (X2 Lần Đầu Đổi)',
	'6'=>'200.000 Dcoin = 4.000.000 KNB (X2 Lần Đầu Đổi)',
	'7'=>'500.000 Dcoin = 10.000.000 KNB (X2 Lần Đầu Đổi)',
	'8'=>'1.000.000 Dcoin = 20.000.000 KNB (X2 Lần Đầu Đổi)',
	'46'=>'2.000.000 Dcoin = 40.000.000 KNB (X2 Lần Đầu Đổi)',
	'47'=>'3.000.000 Dcoin = 60.000.000 KNB (X2 Lần Đầu Đổi)',
	'48'=>'4.000.000 Dcoin = 80.000.000 KNB (X2 Lần Đầu Đổi)',
	'49'=>'5.000.000 Dcoin = 100.000.000 KNB (X2 Lần Đầu Đổi)',
);

if($_GET['act']=='pay'){	
if($_POST['coin'] =='1'){$trucoin = 100000;}	
if($_POST['coin'] =='2'){$trucoin = 50000;}	
if($_POST['coin'] =='3'){$trucoin = 20000;}	
if($_POST['coin'] =='4'){$trucoin = 50000;}	
if($_POST['coin'] =='5'){$trucoin = 100000;}	
if($_POST['coin'] =='6'){$trucoin = 200000;}		
if($_POST['coin'] =='7'){$trucoin = 500000;}	
if($_POST['coin'] =='8'){$trucoin = 1000000;}
if($_POST['coin'] =='46'){$trucoin = 2000000;}
if($_POST['coin'] =='47'){$trucoin = 3000000;}
if($_POST['coin'] =='48'){$trucoin = 4000000;}
if($_POST['coin'] =='49'){$trucoin = 5000000;}
if($_POST['coin'] =='23'){$trucoin = 50000;}
if($_POST['coin'] =='24'){$trucoin = 100000;}
if($_POST['coin'] =='25'){$trucoin = 200000;}
	
$serverid = $_POST['sid']; 
	$config1 = array(
    'host' => 'localhost;port=3306',
    'db' => 'dslh_s'.$serverid,
    'username' => 'root',
    'password' => '8309d858daf05157',
    'options' => array(
        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
    )
);
	$dsn1 = "mysql:host={$config['dbHost']};port=3306;dbname={$config['dbName']}";
	$dbh1 = new PDO($dsn, $config['dbUser'], $config['dbPass'], $config['dbOptions']);
$time = time();
$name = $_SESSION['user_id'];
$coin = $_POST['coin'];
	// get info
	$user_id = $_GET['id'];
	$encryptLoginKey = 'sdhfjhdsftrach12s#$';
	$loginKey      = md5(sha1($user_id) . $encryptLoginKey);
if($getcoin['xu'] < $trucoin){
	echo "<script>alert('Bạn không đủ xu, vui lòng nạp thêm!');location.href='/doivang';</script>";
	exit;
}
if($coin <= 0){
	echo "<script>alert('Đừng làm như vậy bạn hiền =))');location.href='/doivang';</script>";
	exit;
}

$geid = $dbh1->query("SELECT * FROM players WHERE account LIKE '{$loginKey}' LIMIT 1")->fetch();
$playerid = $geid['dbid'];
	

// query xử lý
if($geid == true){
	$dbh1->prepare("INSERT INTO `pay` (`dbid`, `playerid`, `serverid`, `goodsid`) VALUES (?, ?, ?, ?)")->execute(array($time,$playerid,$serverid,$coin));
	$dbh->query("UPDATE `game_account` SET `xu` = `xu` - '{$trucoin}' WHERE `id` = '{$uname}' ")->fetch();
	echo "<script>alert('Xác nhận thành công!');location.href='/doivang';</script>";
	exit;
}else{
	echo "<script>alert('Vui lòng tạo nhân vật!');location.href='/doivang';</script>";
	exit;
}
}
$getsid = $dbh->query("SELECT * FROM `ip_web_sv` ORDER BY `id` DESC")->fetchall();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Đổi KNB</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/assets/css/bootstrap.pay.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<style>
body{
    font-family: 'Oswald', sans-serif !important;
    color: #963811 !important;
    background-size: cover;
    min-width: 980px;
	margin-top: 5%;
}
.col-wrap {
    display: table; 
    width: 100%; 
}

.col {
    display: table-cell;
    padding: 1rem;
}
.col:nth-child(even){
width: 50%;
}
.col:nth-child(odd){
	width: 50%;
}
</style>
<div class="container">
<div class="col-wrap">
<div class="col">
<p>Tài khoản: <?php echo $uname;?> </br>
Hiện có: <?php echo number_format($getcoin['xu']);?></i> Coin</p>
  <form method="POST" action="?act=pay">
  <div class="form-group">
      <label for="sid">Máy Chủ:</label>
<select class="form-control" id="sid" name="sid" required>
<?php foreach($getsid as $item){?>
	<option value="<?php echo $item['sid'];?>"><?php echo $item['name'];?></option>
<?php } ?>	
</select>
    </div>

    <div class="form-group">
      <label for="coin">Gói KNB:</label>
<select class="form-control" id="coin" name="coin">
	<?php
		foreach($charges as $k=>$v){
		echo '<option value="'.$k.'">'.$v.'</option>';
		}
	?>
</select>
    </div>
    <button type="submit" class="btn btn-info bootbox-accept">Xác nhận</button>
  </form>
</div>

  </div>
  </div>
</body>
</html>
