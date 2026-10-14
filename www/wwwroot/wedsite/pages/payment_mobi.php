<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkUser.php';
checkUserLogged("/user/payment_mobi");
include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeHeader.php';

?>
        <script type="text/javascript">
         $(document).ready(function(){
            // Coin Calculation
            $( "#price_guest" ).change(function() {
              coin = $("#price_guest").val();;
              real_coin = parseInt(coin);
			  //real_coin = parseInt(coin)/120;
              $( "#coinReceive" ).html(real_coin);
            });

        });

            function ajaxMobiPayment() {
              var mang = $("#card_type_id").val();
              var seri = $("#seri").val();
              var pin = $("#pin").val();
              var menhgia = $("#price_guest").val();
              if (!mang) {
                  $("#msg").addClass("text-danger").text('Vui lòng chọn mạng').show();
                  $("#card_type_id").focus();
                  return false;
              }
              if (!menhgia) {
                  $("#msg").addClass("text-danger").text('Vui lòng chọn mệnh giá').show();
                  $("#price_guest").focus();
                  return false;
              }
              if (!seri) {
                  $("#msg").addClass("text-danger").text('Vui lòng nhập seri').show();
                  $("#seri").focus();
                  return false;
              }
              if (!pin) {
                  $("#msg").addClass("text-danger").text('Vui lòng nhập pin').show();
                  $("#pin").focus();
                  return false;
              }
                             
              $(":submit").attr("disabled", true).html("<span class='spinner-border spinner-border-sm'></span> Đang xử lý...");  
              $.post('/transaction1.php', {
                      card_type_id: mang,
                      seri: seri,
                      pin: pin,
                      price_guest: menhgia,
                }, function(result) {
                      if (result.code == 0) {
                          $("#msg").removeClass("text-danger").addClass("text-success").html(result.msg);
                      } else {
                          $("#msg").addClass("text-danger").html(result.msg);
                      }
                      //$("#captcha").attr('src', 'http://h5gate.net/captcha?' + Math.random());
                      $(":submit").removeAttr("disabled").html("Nạp thẻ");

                  },
                  'JSON'
              );
          }

        </script>  

            <div class="container">
             <?php include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkSecurity.php' ?>		        
            <div class="content">

                <div class="row pt-3">

                    
                    <div class="col mb-2">
                        <div>

                            <ul class="nav nav-tabs">
                                <li class="nav-item"><a class="nav-link active" role="tab" data-toggle="tab" href="#tab-1"><i class="fa fa-list" aria-hidden="true"></i> Nạp thẻ cào</a></li>
             
                            </ul>
                                            <div class="tab-content">
                    <div class="tab-pane active" id="card">
                        <div class="block-id">
                            <div class="tittle-pay"><span>Chọn đúng loại thẻ, mệnh giá nạp sai BQT không chịu trách nhiệm</span></div>
                                <form method="post" onsubmit="ajaxMobiPayment();return false;">
                                        
                                                   
                                        <div class="form-group">
                                            <label for="inputAddress2">Loại thẻ</label>
                                            <select id="card_type_id" class="form-control">
                                                <option value="1" selected>Viettel (Khuyên Dùng)</option>
                                                <option value="3">Mobiphone </option>
                                                <option value="2">Vinaphone</option>
												
                                            </select>
                                        </div>

                                         <div class="form-group">
                                            <label for="inputAddress2">Mệnh giá</label>
                                            <select id="price_guest" class="form-control">
                                                    <option value="">- Chọn mệnh giá -</option>
                                                    <option value="10000">10.000 VNĐ</option>
                                                    <option value="20000">20.000 VNĐ</option>
													<option value="30000">30.000 VNĐ</option>
                                                    <option value="50000">50.000 VNĐ</option>
                                                    <option value="100000">100.000 VNĐ</option>
                                                    <option value="200000">200.000 VNĐ</option>
													<option value="300000">300.000 VNĐ</option>
                                                    <option value="500000">500.000 VNĐ</option>
                                                    <option value="1000000">1.000.000 VNĐ</option>
                                                </select>
                                                <!-- <div class="text-info pt-2">Coin thực nhận:<span id="coinReceive"> 0</span> Thanh toán thành công sẽ tự động được cộng xu</div>-->
												 <!--<div class="text-info pt-2">Coin thực nhận +50%:<span id="coinReceive"> 0</span></div> -->
                                            </div>

                                            <div class="form-group">
                                                <label for="inputFullname">Số seri</label>
                                                <input id="seri" type="text" class="form-control"  placeholder="Nhập số seri">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPassword4">Mã thẻ</label>
                                                <input id="pin" type="text" class="form-control" placeholder="Nhập mã thẻ">
                                            </div>
                                        <div class="form-group">
                                        <span id="msg"></span>
                                        </div>
                                       
                                        <button type="submit" class="btn btn-info">Nạp thẻ</button>
                                    </form>
                        </div>
                    </div>
              </div>
			  

                <table class="table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th style="text-align:center;font-size:inherit;border-bottom:2px solid #ddd"><font color='orange'><b><a href="http://ninjahokage.com/bonus" style="cursor: pointer; text-decoration: underline; color: yellow;">Nhấp vào đây để xem khuyến mãi</a></b></font></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="text-align:center">
                            <td></td>
                            
                        </tr>
                        
                    </tbody>
                </table>
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
    </script>