<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');

require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

include_once $_SERVER['DOCUMENT_ROOT'].'/api/taskday/config.php';

if(!isset($_SESSION['user_id'])){
		echo "Vui lòng đăng nhập";
		exit;
	}
	else{
		$user_id = $_SESSION['user_id'];
		
		$danap = checkSumPay($user_id, $dbh, $dateday['start'], $dateday['end']);
	}


?>
<script>
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>
<script>
	// Set the date we're counting down to
	var countDownDate_task = new Date("<?=$dateday['end']?>").getTime();

	// Update the count down every 1 second
	var x_task = setInterval(function() {

	  // Get today's date and time
	  var now_task = new Date().getTime();
		
	  // Find the distance between now and the count down date
	  var distance_task = countDownDate_task - now_task;
		
	  // Time calculations for days, hours, minutes and seconds
	  var days_task = Math.floor(distance_task / (1000 * 60 * 60 * 24));
	  var hours_task = Math.floor((distance_task % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes_task = Math.floor((distance_task % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds_task = Math.floor((distance_task % (1000 * 60)) / 1000);
		
	  // Output the result in an element with id="demo"
	  document.getElementById("countdown_task").innerHTML =  days_task + " ngày " + hours_task + " giờ "
	  + minutes_task + " phút " + seconds_task + " giây ";
		
	  // If the count down is over, write some text 
	  if (distance_task < 0) {
		clearInterval(x_task);
		document.getElementById("countdown_task").innerHTML = "ĐÃ KẾT THÚC";
	  }
	}, 1000);
	</script>
    <div class="alert alert-info alert-dismissible fade show text-center mb-30 mt-2">
	<span class="alert-close" data-dismiss="alert"></span><i class="fe-icon-award"></i><b> Nap Hàng Ngày </b><br>
	Bắt đầu: <?=date_format(date_create($dateday['start']), 'H:i - d/m/Y')?><br>
	Kết thúc: <?=date_format(date_create($dateday['end']), 'H:i - d/m/Y')?><br>
	Thời gian còn lại: <span id="countdown_task"></span>
	
	</div>
	
	<?php foreach ($data as $item):
	$pack_id = $item['id'];
	$start_day = $dateday['start'];
	$end_day = $dateday['end'];
	
	$check = $dbh ->query("SELECT `pack_id` FROM napngay_log WHERE `user_id` = '$user_id' AND `pack_id` = '$pack_id' AND `created` >= '$start_day' AND `created` <= '$end_day'")->fetch();
	?>
	<!-- Event Item-->
    <div class="cart-item d-md-flex justify-content-between"><?php if($danap >= $item['required']) echo '<span class="remove-item"><i class="fa fa-remove"></i></span>'; else echo '<span class="remove-item check"><i class="fa fa-check"></i></span>';?>
        <div>
            <div class="cart-item-product" href="#">
                <div class="cart-item-product-thumb"><img src="/assets/img/hot-icon.gif" alt="Tích lũy"></div>
                <div class="cart-item-product-info">
                    <h4 class="cart-item-product-title">Tích lũy nạp <?=number_format($item['required'])?>VNĐ</h4>
					<p>
					<?php foreach ($item['item'] as $item_detail)
					{
						
						echo '<li><img class="img-thumbnail " style="width:50px" src="/play/Dev@Dken/assets/image/item_single/'.$item_detail['icon'].'.png"><a href="javascript:;" data-toggle="tooltip" data-placement="top" data-delay="300" data-html="true" title="<img src=/assets/img/item/'.$item_detail['id'].'.PNG />" class="text-success">'.$item_detail['name'].'</a> SL: '.number_format($item_detail['num']).'</li>';
					}
					?>

					</p>

                </div>

            </div>
        </div>
		<div class="text-center">
            <div class="cart-item-label">Đã nạp</div><span class="text-xl font-weight-medium"><b class="text-success"><?php echo number_format($danap).'/'.number_format($item['required'])?> </b></span>
        </div>

        <div class=" text-center">
            <div class="cart-item-label">Trang thái</div><span class="text-xl font-weight-medium"><span class="text-info"> 
			<?php
			if($danap >= $item['required']){
				
					
					if(!$check)
						echo '<button href="#server" data-toggle="modal" data-pack="'.$item['required'].'" data-packid="'.$item['id'].'" class="confirm-received btn btn-success text-light">Nhận</button>';
					else
						echo '<button class="btn btn-secondary disabled">Đã nhận</button>';
			}
				
			else
				echo 'Chưa đạt';
			?>
</span></span>
        </div>
    </div>
    
    <!-- Event Item-->
  <?php endforeach;?>
  <div class="alert alert-info alert-dismissible fade show text-center mb-30 mt-2">
	<span class="alert-close" data-dismiss="alert"></span><i class="fe-icon-award"></i>
	<b>Lưu ý!</b><br>
	Nạp Ngày bắt đầu từ 10h sáng - 10h sáng hôm sau sẽ reset<br>
	Chấp nhận các hình thức:
	<a href="/user/payment_momo">Momo</a>,
	<a href="/user/payment_bank">Ngân hàng</a>,
	<a href="/user/payment_mobi">Thẻ cào</a>
	</div>
  <script type="text/javascript">
   function getCharname(sid){
			$.getJSON("/api/getCharname.php?sid="+sid, function(result) {
				$("#actorname").val(result.msg);
			});
		}
       	$( document ).ready(function() {
			$.getJSON("/api/listServer.php?type=select_list", function(result) {
				var $dropdown = $("#inputGameServer");
				$.each(result, function() {
					$dropdown.append($("<option />").val(this.sid).text(this.name));
				});
			});
		});
		$(document).on("click", ".confirm-received", function () {
			 var pack = $(this).data('pack');
			 var packID = $(this).data('packid');
			 $('#pack').val(pack);
			 $('#packID').val(packID);
			 
		});
		
		function sendPack(){
			var selectServer = $('#inputGameServer').children("option:selected").val();
			 var pack = $('#pack').val();
			 var packID = $('#packID').val();
			 $.get( "/api/taskday/do.php?action=send&server="+selectServer+"&pack="+pack+"&packID="+packID+"", function( data ) {
              alert(data);
			});
		}
    </script>
	<!-- Choose Server Modal HTML -->
<div id="server" class="modal fade"  tabindex="-1">
  <div class="modal-dialog modal-login">
    <div class="modal-content">
      <div class="modal-header">
     
        <h4 class="modal-title">Chọn máy chủ nhận vật phẩm</h4> 
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      </div>
	  <form>
	  <input  type="hidden" id="pack">
	  <input  type="hidden" id="packID">
      <div class="form-group p-3">
                                <select onchange="getCharname(this.value)" id="inputGameServer" class="form-control">
								<option value="">- Vui lòng chọn -</option>
                                  </select>
								  
                              </div>
							  <div class="form-group pr-3 pl-3">
                                <label for="actorname">Nhân vật:</label>
                                <input type="text" class="form-control" id="actorname" disabled="true" value="Chưa có nhân vật">
								<small class="text-muted">Vui lòng kiểm tra đúng tên nhân vật</small>
								
                              </div>
							 
							  </form> <div class="text-center mb-3">
							  <button type="submit" href="javascript:;" onclick="sendPack()" class="btn btn-info"> Xác nhận</button>
							  </div>
							  <div class="alert alert-warning fade in alert-dismissible show">
 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true" style="font-size:20px">×</span>
  </button>    <strong>Lưu ý!</strong> Sau khi nhận thành công vào thư game nhận đính kèm liền để tránh tình trạng mất thư.
</div>
							  
      <div class="modal-footer">
        Vui lòng chọn máy chủ nhận item sau đó xác nhận
      </div>
	  
    </div>
  </div>
</div>