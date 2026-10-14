<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkUser.php';
checkUserLogged('/user/'.$_GET['page']);
include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeHeader.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$user_id = $_SESSION['niceUsername'];
$check = $dbh ->query("SELECT * FROM game_account WHERE username = '$user_id' LIMIT 1")->fetch();
$spin = round($check['spin']/1);
$month = '12';
$day = '30';
$year = '2024';
$timeend ="$year-$month-$day 00:00:00";
$remain = ceil((mktime(0,0,0,$month,$day,$year) - time()) / 86400);
?>
  <div class="container pt-3">
  <div class="content">
    <div class="row">
      <div class="col mb-2">
        <div class="result">
          <div class="alert alert-success alert-dismissible fade show text-center mb-30 mt-2">
            <span class="alert-close" data-dismiss="alert"></span><i class="fe-icon-award"></i><font color='red'><b>MỖI NGÀY SẼ MIỄN PHÍ 1 LƯỢT QUAY NHẬN XU WEB</font></b><br>
			<span class="alert-close" data-dismiss="alert"></span>Thời gian: <span id="countdown_task">0</span><br>
			<span class="alert-close" data-dismiss="alert"></span><i class="fe-icon-award"></i><font color='black'><b>NẠP <font color='purple'><b>100.000 VNĐ</font></b> SẼ ĐƯỢC TẶNG THÊM 5 LƯỢT QUAY NHẬN XU WEB</font></b><br>
			<hr><font color='red'>Chấp nhận các hình thức "NẠP TIỀN":</font>
            <a href="/donations">Momo</a> |
            <a href="/donations">Ngân hàng</a> |
            <a href="/payment_mobi">Thẻ cào</a>
          </div>
		  <style>
        .flex-list .item {
            width: 50%;
            padding: 0 30px;
        }
        
        .rotation {
            text-align: center;
			width: 647px;
			height: 523px;
        }
        
        
        .rotation .play-spin {
            width: 100%;
            position: relative;
            margin: 0 auto;
			margin-top: 60px;
        }
        
        .rotation .play-spin .ani-zoom {
            position: absolute;
			display: block;
			width: 110px;
			height: 100px;
			z-index: 5;
			top: calc(50% - 50px);
			left: calc(50% - 55px);
        }
        
        .ani-zoom {
            -webkit-transition: all .2s linear;
            -moz-transition: all .2s linear;
            -ms-transition: all .2s linear;
            -o-transition: all .2s linear;
            transition: all .2s linear;
        }
        
        #start-played1 {
            cursor: pointer;
        }
        
        .c-content-client-logos-slider-1 .item {
            width: 85%;
            margin: auto;
        }
		#vt1
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 30px;
			left: 274px;
		}
		#vt2
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 63px;
			left: 371px;
		}
		#vt3
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 138px;
			left: 449px;
		}
		#vt4
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 236px;
			left: 475px;
		}
		#vt5
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 341px;
			left: 453px;
		}
		#vt6
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 411px;
			left: 376px;
		}
		#vt7
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 434px;
			left: 274px;
		}
		#vt8
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 423px;
			left: 163px;
		}
		#vt9
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 335px;
			left: 95px;
		}
		#vt10
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 227px;
			left: 64px;
		}
		#vt11
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 126px;
			left: 87px;
		}
		#vt12
		{
			width: 100px;
			position: absolute;
			display: block;
			top: 47px;
			left: 163px;
		}
		#num-play
		{
			color: white;
			font-size: 30px;
			background: -webkit-linear-gradient(#ffc52f, #fab910);
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
			font-weight: 750;
			-webkit-text-stroke: 1px #8c3909;
		}
		hr {
			margin-top: 0;
			margin-bottom: 0;
			border: 0;
			border-top: 1px solid #eee;
		}
    </style>
          <div id="vongquaymayman">
		  <div class="form-group ">
                                <select id="inputGameServer" class="form-control" onchange="getCharname(this.value)">
								<option value="">- Chọn máy chủ -</option>
                                  </select>
								  </div> 
								  
		  <div class="rotation">
                            <div class="play-spin">
                                <span class="ani-zoom" id="start-played1"><span id="num-play">0</span></span>
                                <div id="rotate-play" style="transform: rotate(0deg);">
									<img style="width: 80%; max-width: 80%;opacity: 1;" src="/images/spin.png" alt="Play">
									<div id="vt1"></div>
									<div id="vt2"></div>
									<div id="vt3"></div>
									<div id="vt4"></div>
									<div id="vt5"></div>
									<div id="vt6"></div>
									<div id="vt7"></div>
									<div id="vt8"></div>
									<div id="vt9"></div>
									<div id="vt10"></div>
									<div id="vt11"></div>
									<div id="vt12"></div>
								</div>
								<img id="mui-ten" style="opacity: 1;z-index: 1000;position: inherit;margin-top: -1070px;transform: rotate(0deg);" src="/images/mui-ten.png" alt="Play">
                            </div>
                        </div>
						<div class="result_log_top"><h3 style="font-family: 'Pattaya', sans-serif;
    background: linear-gradient(to right,#ff8a00,#da1b60);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;">Lịch sử quay </h3>
	<ul id="result_log_top" style="float: left;
    width: 100%;
    display: block;
    padding: 0;"></ul>
</div>
						<script type="text/javascript">
						function getCharname(sid){
		$.getJSON("/api/getCharname.php?sid="+sid, function(result) {
			$("#actorname").val(result.msg);
		});
	}

        $(document).ready(function(e) {
			 var countDownDate_task = new Date("<?=$timeend;?>").getTime();
          // Update the count down every 1 second
          var x_task = setInterval(function () {
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
              document.getElementById("countdown_task").innerHTML = "FINISHED";
            }
          }, 1000);
			$( document ).ready(function() {
			$.getJSON("/api/listServer.php?type=select_list", function(result) {
				var $dropdown = $("#");
				$.each(result, function() {
					$dropdown.append($("<option />").val(this.sid).text(this.name));
				});
			});
			});
            var roll_check = true;
            var num_loop = 4;
            var angle_gift = '';
            var num_gift = 12;
            var gift_detail = '';
            var angles = 0;
			$('#num-play').html('Spin<hr><?=number_format($spin);?>');
            //Click nút quay
			$('body')['delegate']('#start-played1', 'click', function () {
				if (<?=$remain;?> < 0) {
					alert("Sự kiện kết thúc");
					return;
				}
				if(!$('#inputGameServer').val())
				{
					alert("Vui lòng chọn máy chủ trước");
						$('#inputGameServer').focus();
						return;
				}
				
				if (roll_check) {
					$['post']('/ajax/spinstartfree.php', { server: $('#inputGameServer').val(),actorname: $('#actorname').val()}, function (_0xee11x1) {
						if (_0xee11x1['error'] === 0) {
							gift_detail = _0xee11x1['item'];
							type = _0xee11x1['type'];
							$('#num-play')['html'](_0xee11x1['vongquay']);
							$('#rotate-play')['css']({
								"transform": 'rotate(0deg)'
							});
							$('#start-played1')['css']({
								"display": 'none'
							});
							angles = 0;
							angles2 = 0;
							angle_gift = gift_detail * (360 / num_gift);
							loop();
						} else {
							alert(_0xee11x1['error'])
						}
					}, 'json')
				}
			}).toString()
			function loop() {
			$('#rotate-play')['css']({
				"transform": 'rotate(' + angles + 'deg)'
			});
			$('#mui-ten')['css']({
				"transform": 'rotate(' + angles2 + 'deg)'
			});
			if ((parseInt(angles) - 10) <= -(((num_loop * 360) + angle_gift))) {
				angles = parseInt(angles) - 2
			} else {
				angles = parseInt(angles) - 10
			};
			angles2 = Math['floor'](Math['random']() * 30);
			if (angles >= -((num_loop * 360) + angle_gift)) {
				requestAnimationFrame(loop)
			} else {
				roll_check = true;
				$['ajax']({
					url: '/ajax/senditemspinfree.php',
					type: 'post',
					dateType: 'text',
					data: {
						id: gift_detail,
						type: type
					},
					success: function (_0xb9dex2) {
						logspin()
					}
				});
				$('#start-played1')['css']({
					"display": 'block'
				})
			}
		}
		});
		var type=1;
		function load_item() {
			$['post']('/ajax/loadspinfree.php', 'type=' + type, function (_0x64cfx2) {
				var _0x64cfx3 = 0;
				for (_0x64cfx3 = 0; _0x64cfx3 < 13; _0x64cfx3++) {
					if (_0x64cfx2['Place' + _0x64cfx3 + '']) {
						$('#vt' + _0x64cfx3 + '')['html']('<img src="public/images/loading.gif" />');
						$('#vt' + _0x64cfx3 + '')['html']('' + _0x64cfx2['Place' + _0x64cfx3 + ''] + '')
					} else {
						$('#vt' + _0x64cfx3 + '')['html']('<img src="public/images/no-item.png" style="width: 55px;"/>')
					}
				}
			}, 'json')
		}
		load_item();
		function logspin() {
		$['post']('/ajax/logspinfree.php', function (_0xd401x8) {
			if (_0xd401x8['status']) {
				$('#result_log_top')['html'](_0xd401x8['lichsu']);
			} else {
				$('#msg2')['addClass']('text-danger')['html'](_0xd401x8['msg'])
			}
		}, 'JSON')
	}
	logspin();
    </script>
		</div>
        </div>
      </div>
      <div class="col-lg-3 order-lg-first">
        <!-- left bar -->
        <?php include_once $_SERVER[ 'DOCUMENT_ROOT']. '/template/homeLeftbar.php'; ?>
      </div>
    </div>
  </div>
</div>
<?php include_once $_SERVER[ 'DOCUMENT_ROOT']. '/template/homeFooter.php'; ?>