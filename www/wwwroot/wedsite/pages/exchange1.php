<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkUser.php';
checkUserLogged('/user/'.$_GET['page']);
include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeHeader.php';
?>
            	

<div class="container" style="border: 2px solid gold; background-color: #454545; padding: 20px; border-radius: 8px;">
            	
             <?php include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkSecurity.php' ?>		        
            <div class="content">
              <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
              <script type="text/javascript">
            
            function getCharname(sid){
					$.getJSON("/api/getCharname.php?sid="+sid, function(result) {
						$("#actorname").val(result.msg);
					});
				}
				
              function exchangeMoney() {
                    var game = $("#inputGame").val();
                    var server = $("#inputGameServer").val();
                    var money = $("#inputMoney").val();
if(actorname == "Chưa có nhân vật"){
				alert("Chưa có nhân vật");
				$('#actorname').focus();
				return;
			}
                    
                    
                    if (!game) {
                        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Vui lòng chọn game');
                        $("#inputGame").focus();
                        return false;
                    }
                    if (!server) {
                        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Vui lòng chọn server');
                        $("#inputGameServer").focus();
                        return false;
                    }
                    if (!money) {
                        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Vui lòng chọn số xu muốn đổi');
                        $("#inputMoney").focus();
                        return false;
                    }

                    $("#confirmExchange").attr("disabled", true).html('<span class="spinner-border spinner-border-sm"></span> Đang thực hiện..');
                    $.post('/api/exchangeMoney.php', {
                            game: game,
                            server: server,
                            money: money
                        }, function(result) {
                            if (result.status) {
                                $("#msg").html('<i class="fa fa-check" aria-hidden="true"></i> Đổi xu thành công, vui lòng vào game kiểm tra!').removeClass("text-danger").addClass("text-success");
								$("#confirmExchange").removeAttr("disabled").html("Xác nhận");
                            } else {
                                $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> '+result.msg);
                                $("#confirmExchange").removeAttr("disabled").html("Xác nhận");
                            }
                        },
                        'JSON'
                    );
                }
				 // Xu Calculation
				 $(document).ready(function() {
				  $( "#inputMoney" ).change(function() {
					coin = $("#inputMoney").val();
						if(coin==1)
							$( "#xuNeed" ).val(500000);
						else if(coin == 2)
							$( "#xuNeed" ).val(100000);
						else
							$( "#xuNeed" ).val(coin);
				  });
				 });
	$(document).ready(function() {
        $.getJSON("/api/listServer.php?type=select_list", function(result) {
          var $dropdown = $("#");
          $.each(result, function() {
            $dropdown.append($("<option />").val(this.sid).text(this.name));
          });
        });
      });
              </script>
                <div class="row">

                    
                    <div class="col-lg-9 col-md-12 col-xs-12 pb-2">
                        <div>

                            <ul class="nav nav-tabs">
                                <li class="nav-item"><a class="nav-link active" role="tab" data-toggle="tab" href="#tab-1"><i class="fa fa-list" aria-hidden="true"></i> Quy đổi xu</a></li>
             
                            </ul>
                            <div class="tab-content">

                                <!-- Tab 1 thông tin tài khoản -->
                                <div class="tab-pane active border border-top-0 p-3" role="tabpanel" id="tab-1">
                               <div class="row">
                                <div class="col-md-12">
                                <!--   <div class="alert alert-warning fade in alert-dismissible show">
                                   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                      <span aria-hidden="true" style="font-size:20px">×</span>
                                    </button>    <strong>Sự kiện máy chủ mới</strong> </br>
                                  Hàng ngày</br>
                                    x2 thẻ nạp


                                  </div>-->
                                  
                                </div>

                              </div>
                                    <form onsubmit="exchangeMoney();return false;">
                               <div class="form-group">
                                <label for="inputGame">Chọn game:</label>
                                <select id="inputGame" class="form-control">
                                  <option value="1" selected>Afk 3Q</option>
                                </select>
                              </div>
                              <div class="form-group">
                                <label for="inputGameServer">Máy chủ</label>
                                <select onchange="getCharname(this.value)" id="inputGameServer" class="form-control">
                                  <option value="" selected>Vui lòng chọn</option>
                                </select>
                              </div>
							   <div class="form-group">
                                <label for="xxx">Nhân vật:</label>
                                <input type="text" class="form-control" id="actorname" disabled="true" value="Chưa có nhân vật">
								<small class="text-muted">KNB cập nhật chậm nhưng vẫn sử dụng trong game bình thường</small><br>
								<small class="text-muted">Chọn đúng tên nhân vật</small>
                              </div>
							  
                            <div class="form-group">
                              <label for="inputMoney">Gói nạp:</label>
							  <select id="inputMoney" class="form-control">
                                  <option value ="" selected>Nhấn chọn...</option> 
								  <option value="7">1000 Xu Trong Game(1M xu web)</option>
								  <option value="8">2000 Xu Trong Game(2M xu web)</option>
								  <option value="9">3000 Xu Trong Game(3M xu web)</option>
								  <option value="10">4000 Xu Trong Game(4M xu web)</option>
								  <option value="11">5000 Xu Trong Game(5M xu web)</option>
								  <option value="12">10000 Xu Trong Game(10M xu web)</option>
                                </select>
                            </div>
							<div class="form-group" style="display:none;">
                                <label for="xuNeed">Số xu phải trả <a data-toggle="tooltip" data-html="true" data-placement="right" title="" data-original-title="Xu là gì?" target="_blank" href="/huong-dan/xu-la-gi"><i class="text-muted fa fa-question-circle" aria-hidden="true"></i></a></label>
                                <input type="text" class="form-control" id="xuNeed" disabled="true">
                              </div>

                            <div class="form-group">
                              <span id="msg"></span>                            </div>

                            <button id="confirmExchange" type="submit" class="btn btn-primary">Xác nhận</button>
                          </form>
                                </div>
                               <!-- list game -->

                            </div>

                        </div>

                    </div>
                    <div class="col-lg-3 order-lg-first">
                       <!-- left bar -->
                       <?php include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeLeftbar.php' ?>
                    </div>
                    
                </div>

            </div>

        </div>

      <?php
      include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeFooter.php';
      ?>