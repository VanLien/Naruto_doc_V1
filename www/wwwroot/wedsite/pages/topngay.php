<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkUser.php';
checkUserLogged('/user/'.$_GET['page']);
include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeHeader.php';
?>
            	

            <div class="container pt-3">
   
            <div class="content">
              
                <div class="row">

                    
                   
                    <div class="col-lg-3 order-lg-first">
                       <!-- left bar -->
                       <?php include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeLeftbar.php' ?>
                    </div>
                    
<div class="col mb-2">
    <div class="result">
        <script>
            $(function() {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
		<script>
            // Set the date we're counting down to
            var countDownDate_task = new Date("<?=$timenaptichluy;?>").getTime();

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
                document.getElementById("countdown_task").innerHTML = days_task + " ngày " + hours_task + " giờ " + minutes_task + " phút " + seconds_task + " giây ";

                // If the count down is over, write some text 
                if (distance_task < 0) {
                    clearInterval(x_task);
                    document.getElementById("countdown_task").innerHTML = "ĐÃ KẾT THÚC";
                }
            }, 1000);
        </script>
        <div class="alert alert-info alert-dismissible fade show text-center mb-30 mt-2">
            <span class="alert-close" data-dismiss="alert"></span><i class="fe-icon-award"></i><b>Quà tặng nạp theo tuần. Sau 23h59p ngày Chủ nhật mỗi tuần sẽ Reset lại</b><br>
            <span class="alert-close" data-dismiss="alert"></span><i class="fe-icon-award"></i><b> Lưu ý: Nhận từng mốc rồi vào game bấm " Nhận hết " trong thư rồi hãy nhận tiếp để tránh full 100 thư mất quà</b><br>
			<br> Thời gian nhận thưởng còn lại: <span id="countdown_task">0</span>
            <hr> Chấp nhận các hình thức:
            <a href="/user/donations">Momo</a> |
            <a href="/user/donations">Ngân hàng</a> |
            <a href="/user/payment_mobi">Thẻ cào</a>
          </div>
		<div id="quanap"></div>
		<div id="tmpItemFrm" style="display: none;"></div>
		<style>
.articleAccess {
    background: #8e8e8e!important;
   

    border-radius: 5px;
	}
.articleAccess:hover{
	background:#f4e3ab!important;
	text-decoration:none
	}
	</style>
        <script type="text/javascript">
			$( document ).ready(function() {
			$.getJSON("/api/listServer.php?type=select_list", function(result) {
				var $dropdown = $("#");
				$.each(result, function() {
					$dropdown.append($("<option />").val(this.sid).text(this.name));
				});
			});
		});
		type = 0;
		function loadqua(){
						if(type>2)
						{
							type -= 1;
						}
						else
						{
							type += 1;
						}
                        $.ajax({                    
                            url: "/ajax/loadtopngay.php",
                                type: "post",
                                dateType: "text",
								data: {
									type: type,
								},
                                success: function(result) {
								$('#quanap').html(result);
                            }
                        });            
                    }
					loadqua();
            $(document).on("click", ".confirm-received", function() {
                var pack = $(this).data('pack');
                var packID = $(this).data('packid');
                $('#pack').val(pack);
                $('#packID').val(packID);

            });
            function sendPack() {
                var selectServer = $('#inputGameServer').children("option:selected").val();
                var pack = $('#pack').val();
                var packID = $('#packID').val();
				if(!selectServer)
				{
					alert("Vui lòng chọn máy chủ");
						$('#inputGameServer').focus();
						return;
				}
                $.get("/ajax/topngay.php?tichnap="+pack+"&server="+selectServer+"", function(data) {
                    if(data =='true')
					{
						/*Swal.fire({
						title: 'Thành công!',
						text: "Nhận thưởng thành công vui lòng kiểm tra hộp thư game",
						type: 'success',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#17a2b8',
						confirmButtonText: 'Xem lịch sử',
						cancelButtonText: 'Nạp tiếp'
					    }).then((result) => {
						if (result.value) {
						  window.location.href = '/lichsu'; 
						}else{
						  window.location.href = '/napmomo'; 

						}
					    })
						*/
						Swal.fire(
						  'Thành công',
						  'Nhận thưởng thành công vui lòng kiểm tra hộp thử game<br>Nếu không thấy thư vui lòng nhờ 1 ai đồ gửi cho 1 thư rác để hiện thư',
						  'success'
						);
					}
					else
					{
						Swal.fire(
						  'Thông báo',
						  data,
						  'success'
						);
					}
					
                });
            }
			$(document).ready(function () {
					var oldtemplate = 0;
					$(document).on({
						mouseenter: function (e) {
							var tmpItemFrm = $(document).find('#tmpItemFrm');
							var display = tmpItemFrm.css("display");
							el = $(this);
							var pos = $(this).position();
							tmpItemFrm.css({
								'position': 'Fixed',
								left: (pos.left + 750) + 'px',
								top: (pos.top + 300) + 'px'
								//left: '100px',
								//top: '100px'
							});
							tmpItemFrm.show();
							var temid = $(this).attr('tempid');
							if(display == 'none' && oldtemplate != temid) {
								oldtemplate = temid;
								var info = $(this).attr('info');
								// show loading
								tmpItemFrm.html('<div class="tooltip-content" id="tooltipcontent"><div class="ui-tooltip wiki-tooltip"><div class="tooltips"><font color="FF9900"><img src="images/loading.gif" /></font></div></div></div>');
								$.post("ajax/showitem.php", "id="+temid+"&info="+info,
								function(result) {
									tmpItemFrm.html(result);
								});
							}
						},
					mouseleave: function () {
						var tmpItemFrm = $(document).find('#tmpItemFrm');
						tmpItemFrm.hide();
					}
				}, '.articleAccess');
			});
        </script>
        <!-- Choose Server Modal HTML -->
        <div id="server" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-login">
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title">Thông báo</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
					 <div class="alert alert-warning fade in alert-dismissible show">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true" style="font-size:20px">×</span>
                        </button> <strong>Lưu ý!</strong> Điểm tích lũy nạp sẽ bị xóa vào ngày thử Chủ nhật hàng tuần.Nếu không nhận sẽ bị mất điểm và không được khôi phục.
                    </div>
					<form>
                        <input type="hidden" id="pack" value="0">
                        <input type="hidden" id="packID" value="0">
						 <div class="form-group ">
                                <select onchange="getCharname(this.value)" id="inputGameServer" class="form-control">
								<option value="">- Vui lòng chọn máy chủ-</option>
                                  </select>
								  </div>
                    </form>
                   
                    <div class="text-center mb-3">
                        <button type="submit" href="javascript:;" onclick="sendPack()" class="btn btn-info"> Nhận thưởng</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
<style>
.cart-item:hover{
	background-color: #;
}
.dudk{
	background-color: #00a1ff;
    box-shadow: 0 3px 12px 0 rgb(209, 236, 241);
}
</style>
</div>
                </div>

            </div>

        </div>

 <script>
        document.addEventListener('contextmenu', function(event) {
            event.preventDefault();
        });

        document.addEventListener('keydown', function(event) {
            if (event.key === 'F12' || 
                (event.ctrlKey && event.shiftKey && event.key === 'I') || 
                (event.ctrlKey && event.shiftKey && event.key === 'J') || 
                (event.ctrlKey && event.key === 'U')) {
                event.preventDefault();
            }
        });

        // Liên tục kiểm tra Developer Tools
        setInterval(function() {
            if (window.console && (window.console.firebug || (window.console.profile && window.console.profile.length > 0))) {
                alert('Developer tools are open, close them!');
                window.close();
            }
        }, 1000);
    </script>