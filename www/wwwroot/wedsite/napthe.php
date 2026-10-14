<?php
$server_id = isset($_POST['serverid']) ? $_POST['serverid'] : '';
include_once $_SERVER['DOCUMENT_ROOT'].'/config.php';

?>
<style type="text/css">
	body, html{
		background-color: #000!important;


	}
</style>
<script type="text/javascript">
	function closeTab(){
		$("#payWrap").hide();
	}
</script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<div style="max-width: 400px" class="container">
<form method="post" onsubmit="ajaxLogin();return false;" class="form-signin">
    <div class="bg-light border rounded p-4 m-3">
  <h1 class="h3 m-3 font-weight-normal">Chọn hình thức thanh toán</h1>
  <div class="row">
  	<div class="col-6"><a target="_blank" href="<?=$url['id']?>/payment_momo&server=<?=$server_id?>"><img class="img-thumbnail" src="https://static.mservice.io/img/logo-momo.png"></a></div>
  	<div class="col-6"><a target="_blank" href="<?=$url['id']?>/payment_bank&server=<?=$server_id?>"><img class="img-thumbnail" src="http://file.vforum.vn/hinh/2014/6/ngan-hang.jpg"></a></div>

  </div>
  <div class="row pt-3">
	  	<div class="col-6"><a target="_blank" href="<?=$url['id']?>/payment_mobi&server=<?=$server_id?>"><img class="img-thumbnail" src="https://napgamemobile.com/image/data/the-cao/the-cao-dien-thoai-viettel-500k.png"></a></div>

  </div>
  
	<!-- http://file.vforum.vn/hinh/2014/6/ngan-hang.jpg -->

	<div class="text-center"><a class="text-danger " onclick="closeTab();" href="#">Đóng</a></div>
  

</form>
</div>