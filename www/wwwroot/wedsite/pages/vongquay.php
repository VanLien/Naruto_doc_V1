<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkUser.php';
checkUserLogged('/user/'.$_GET['page']);
include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeHeader.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/api/vongquay/config.php';

?>
<script>
function getCharname(sid){
		$.getJSON("/api/getCharname.php?sid="+sid, function(result) {
			$("#actorname").val(result.msg);
		});
	}
 $( document ).ready(function() {
	//get username by id
	   $("#buy_num").on('keyup', function() {
	   var num = $("#buy_num").val();
		var needPay = num*10000;
		$("#needPay").val(needPay);
	});
 });	

</script>
	<link href="https://fonts.googleapis.com/css?family=Pattaya&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/assets/css/main.css" type="text/css" />
            <script type="text/javascript" src="/assets/js/Winwheel.min.js"></script>
    <script type="text/javascript" src="/assets/js/TweenMax.min.js"></script>
                    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script> -->
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

        <div class="container">
            <div class="content shadow-lg border m-3">
                <div class="row mt-3">

                   <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
				<h3 class="panel-title ml-3 gradient-color">Vòng quay nhân phẩm</h3>
                       
            <canvas id="secondCanvas" class="tutCanvas" width="400" height="400" data-responsiveMinWidth="100"
    data-responsiveScaleHeight="true" 
    data-responsiveMargin="0">Canvas not supported</canvas>

  
	<button id='bigButton2' class='btn btn-success btn-lg ml-5' onClick="calculatePrizeOnServer(); this.disabled=true;"><i class="fas fa-sync-alt"></i>
 Quay</button> Có <b class="text-success" id="luotquay">0</b> lượt quay <a data-toggle="modal" href="#buy"> Mua thêm</a>
		<div class="form-row ml-5 mb-3">
		<div class="col-6">
								<small>Vui lòng chọn máy chủ nhận item, KNB</small>

                                <select onchange="getCharname(this.value)" id="inputGameServer" class="form-control">
								<option value="">- Vui lòng chọn -</option>
                                  </select>
								  <div class="form-group">
                                <label for="actorname">Nhân vật:</label>
                                <input type="text" class="form-control" id="actorname" disabled="true" value="Chưa có nhân vật">
								<small class="text-muted">Vui lòng kiểm tra đúng tên nhân vật</small>
                              </div>
								  </div>
								  </div>
	

   <div id="buy" class="modal fade"  tabindex="-1">
  <div class="modal-dialog modal-login">
    <div class="modal-content">
      <div class="modal-header">
     
        <h4 class="modal-title">Mua thêm lượt (10k xu(gem)/lượt)</h4> 
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      </div>
      <form>
	 <div class="form-group pl-3 pr-3">
			<label for="buy_num">Nhập số lượt muốn mua</label>
			<input type="tel" class="form-control" id="buy_num" placeholder="Nhập số lượng" required="" maxlength="19">
			
		  </div>
		  <div class="form-groups pl-3 pr-3">
			<label for="needPay">Phải trả</label>
			<input type="text" class="form-control" id="needPay" disabled="true">
			
		  </div>
		  <div class="form-groups pl-3 pr-3">
			<label for="buy_num">Mua bằng</label>
			<select id="currency" class="form-control">
			  <option value="">- Vui lòng chọn -</option>
			  <option value="xu">Xu</option>
			  <option value="gem">Gem</option>
			  </select>
			
		  </div>
		  
		  <span class="pl-3" id="msg2"></span>
		  <div class="form-group pl-3">
		  
			<button class="btn btn-success" onclick="buyTurn();return false;" href="javscript:;">Xác nhận</button>
		  </div>
	  </form>
      <div class="modal-footer">
        Chọn số lượt sau đó nhấn xác nhận
      </div>
    </div>
  </div>
</div>
                   </div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
				<div class="panel panel-primary pl-3" id="result_panel">
    <div class="panel-heading"><h3 class="panel-title gradient-color">Top nhân phẩm </h3>(Trong tổng số <span id="dathamgia"></span> tài khoản tham gia)
    </div>
		<div class="panel-body">
			<ul id="result_log_top" class="list-group">
				
			</ul>
		</div>
	</div>
				 <div class="panel panel-primary pl-3" id="result_panel">
    <div class="panel-heading"><h3 class="panel-title gradient-color">Lịch sử nhận quà</h3>
    </div>
		<div class="panel-body">
			<ul id="result_log" class="list-group">
				
			</ul>
		</div>
	</div>
	<div class="panel panel-primary pl-3" id="result_panel">
    <div class="panel-heading"><h3 class="panel-title gradient-color">Quà của bạn</h3>
    </div>
		<div class="panel-body">
			<ul id="result_log_uid" class="list-group">
				
			</ul>
		</div>
	</div>
	
				</div>

                   
                    

                </div>
 
            </div>
        </div>
		 <script>
        document.title ="Vòng quay nhân phẩm - MU H5";
        let secondWheel = new Winwheel({
            'numSegments' : <?=$config['numSegments']?>,
            'outerRadius' : <?=$config['outerRadius']?>,
            'canvasId'    : 'secondCanvas',
            'textOrientation' : 'horizontal',
            'textDirection' : 'reversed',
            'segments'    : [<?php showSegments($config['segments'])?>],
			'pointerAngle'   : 90, 

            'responsive'   : false,  // This wheel is responsive!
             'pins' :
                {
                    'outerRadius': 3,
                    'responsive' : false, // This must be set to true if pin size is to be responsive.
                    'fillStyle' : '#FFF',
                    'strokeStyle' : '#FFF',

                },

            'animation' :
            {
                'type'          : 'spinToStop',
                'duration'      : <?=$config['duration']?>,
                'spins'         : <?=$config['spins']?>,
                'callbackFinished' : 'alertPrize()',
                'callbackAfter' : 'drawTriangle2()',

            }
        });
		
         function alertPrize()
            {
		
                // Call getIndicatedSegment() function to return pointer to the segment pointed to on wheel.
                let winningSegment = secondWheel.getIndicatedSegment();
				
                // Basic alert of the segment text which is the prize name.
                Swal.fire(
                      'Chúc mừng!',
                      "Bạn nhận được " + winningSegment.text + "!",
                      'success'
                    ).then(function() {
						secondWheel.stopAnimation(false); secondWheel.rotationAngle=0; drawTriangle2(); bigButton2.disabled=false;
						getLuotQuay();getLog();
					});
            }
        // In this example I use raw Javascript to do the AJAX, but if you have jQuery included
        // in your website so might want to use its AJAX features as its a bit less code to write.
        // let xhr = new XMLHttpRequest();
        // xhr.onreadystatechange = ajaxStateChange;

        // Function called on click of spin button.
        function calculatePrizeOnServer()
        {
            segmentNumber = 0;

            // Make get request to the server-side script.
            // xhr.open('GET',"calculate_prize.php", true);
            // xhr.send('');
			var selectServer = $('#inputGameServer').children("option:selected").val();
			var actorname = $('#actorname').val();
			if(!selectServer){
				Swal.fire(
                      'Lưu ý',
                      "Bạn chưa chọn server nhận vật phẩm và KNB",
                      'warning'
                    ).then(function() {
						secondWheel.stopAnimation(false); secondWheel.rotationAngle=0; drawTriangle2(); bigButton2.disabled=false;
						getLuotQuay();getLog();
					});
				return;
			}
			if(actorname == "Chưa có nhân vật"){
				Swal.fire(
                      'Lưu ý',
                      "Bạn chưa có nhân vật ở máy chủ này",
                      'warning'
                    ).then(function() {
						secondWheel.stopAnimation(false); secondWheel.rotationAngle=0; drawTriangle2(); bigButton2.disabled=false;
						getLuotQuay();getLog();
					});
				return;
			}
            $.get( "/api/vongquay/calculate_prize.php?sid="+selectServer, function( data ) {
                if(data.status){
                    let segmentNumber = data.result; 
				
                    if (segmentNumber) {
                        let stopAt = secondWheel.getRandomForSegment(segmentNumber);

                        // Important thing is to set the stopAngle of the animation before stating the spin.
                        secondWheel.animation.stopAngle = stopAt;

                        // Start the spin animation here.
                        secondWheel.startAnimation();

                    }
                }else{
                    Swal.fire(
                      'Oops!',
                      data.msg,
                      'error'
                    ).then(function() {
						secondWheel.stopAnimation(false); secondWheel.rotationAngle=0; drawTriangle2(); bigButton2.disabled=false;
						getLuotQuay();getLog();
					});

            }
            }, "json" );
        }

    

        // Usual pointer drawing code.
        drawTriangle2();

        function drawTriangle2()
        {
			
			 let ctx = secondWheel.ctx;
 
			ctx.strokeStyle = 'navy';  // Set line colour.
			ctx.fillStyle   = 'aqua';  // Set fill colour.
			ctx.lineWidth   = 2;
			ctx.beginPath();           // Begin path.
	 
			ctx.moveTo(390, 174);      // Move to initial position.
			ctx.lineTo(390, 226);      // Draw lines to make the shape.
			ctx.lineTo(360, 200);
			ctx.lineTo(390, 175);
			ctx.stroke();              // Complete the path by stroking (draw lines).
			ctx.fill();
            
        }
           	$( document ).ready(function() {
			$.getJSON("/api/listServer.php?type=select_list", function(result) {
				var $dropdown = $("#inputGameServer");
				$.each(result, function() {
					$dropdown.append($("<option />").val(this.sid).text(this.name));
				});
			});
		});
		 // Get vip info
		  function getLuotQuay() {
			  $.post('/api/vongquay/get_luot_quay.php', function(result) {
					  if (result.status) {
						  $('#luotquay').html(result.luotquay);
						  $('#dathamgia').html(result.dathamgia);
						  
						  
					  } else {
						  $("#msg2").addClass("text-danger").html(result.msg);

					  }
				  },
				  'JSON'
			  );
		  }
		  function getLog(){
            $.get("/api/vongquay/get_log.php", function( data ) {
              $( "#result_log" ).html( data );
            });
			$.get("/api/vongquay/get_log.php?uid=1", function( data ) {
              $( "#result_log_uid" ).html( data );
            });
			$.get("/api/vongquay/get_log.php?uid=2", function( data ) {
              $( "#result_log_top" ).html( data );
            });
			}

		  $(document).ready(function() {
                getLuotQuay();
				getLog();
            });
			function buyTurn() {
			  var turn = $("#buy_num").val();
			  var currency = $("#currency").val();
			  if (!turn) {
				  
				  $("#msg2").addClass("text-danger").text('Vui lòng nhập đầy đủ các trường').show();
				  return false;
			  }
			  if (!currency) {
				  
				  $("#msg2").addClass("text-danger").text('Vui lòng nhập đầy đủ các trường').show();
				  return false;
			  }
			  $.post('/api/vongquay/buy_turn.php', {
					  turn: turn,
					  currency: currency
				  }, function(result) {
					  if (result.status) {
						  $("#msg2").html(result.msg).removeClass("text-danger").addClass(" text-success");
						  getLuotQuay();
					  } else {
						  $("#msg2").addClass("text-danger").html(result.msg);
					  }
				  },
				  'JSON'
			  );
		  }

    </script>

      <?php
      include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeFooter.php';
      ?>