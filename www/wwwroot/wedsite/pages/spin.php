<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkUser.php';
checkUserLogged('/user/'.$_GET['page']);
include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeHeader.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$user_id = $_SESSION['niceUsername'];
$check = $dbh ->query("SELECT * FROM game_account WHERE username = '$user_id' LIMIT 1")->fetch();
$spin = round($check['xu']/1000000);
$month = '12';
$day = '30';
$year = '2024';
$timeend ="$year-$month-$day 00:00:00";
$remain = ceil((mktime(0,0,0,$month,$day,$year) - time()) / 86400);
?>
<div class="content content-full" style="border: 2px solid gold; background-color: #454545; padding: 20px; border-radius: 8px;">
  <div class="container mt-3">
  <div class="content">
    <div class="row">
      <div class="col mb-2">
        <div class="result">
          <div class="alert alert-success alert-dismissible fade show text-center mb-30 mt-2">
            <span class="alert-close" data-dismiss="alert"></span><i class="fe-icon-award"></i><font color='red'><b>1000000 Xu / 1 lượt </font></b><br>
			<span class="alert-close" data-dismiss="alert"></span>Thời gian: <span id="countdown_task">0</span><br>
			<span class="alert-close" data-dismiss="alert"></span><i class="fe-icon-award"></i><font color='black'><b>Hãy "NẠP TIỀN" để có xu chơi</font></b><br>
			<hr><font color='red'>Chấp nhận các hình thức:</font>
            <a href="/donations"><font color='black'><b>Momo</font></b></a> |
            <a href="/donations"><font color='black'><b>Ngân Hàng</font></b></a> |
            <a href="/payment_mobi"><font color='black'><b>Thẻ Cào</font></b></a><br>
			<span class="alert-close" data-dismiss="alert"></span><i class="fe-icon-award"></i><font color='blue'><b>Lưu ý: Quay tầm 20 - 30 lần rồi vào game bấm " Nhận hết " trong thư rồi hãy quay tiếp để tránh full 100 thư mất quà</font></b><br>
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
								  
		  <div class="rotation-wrapper">
    <div class="rotation">
        <div class="play-spin">
            <span class="ani-zoom" id="start-played1"><span id="num-play">0</span></span>
            <div id="rotate-play" style="transform: rotate(0deg);">
                <img style="width: 100%; max-width: 100%; opacity: 1;" src="/images/spin.png" alt="Play">
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
				<img id="mui-ten" style="position: absolute; top: -15%; left: 50%; transform: translateX(-50%); width: 10%;" src="/images/mui-ten.png" alt="Arrow">
			</div>
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
					$['post']('/ajax/spinstart.php', { server: $('#inputGameServer').val(),actorname: $('#actorname').val()}, function (_0xee11x1) {
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
					url: '/ajax/senditemspin.php',
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
    $.post('/ajax/loadspin.php', 'type=' + type, function (data) {
        for (let i = 1; i <= 12; i++) {
            if (data['Place' + i]) {
                const icon = data['Place' + i]['icon'];
                const count = data['Place' + i]['count'];
                $('#vt' + i).html(`
                    <div style="position: relative; display: inline-block;">
                        ${icon}
                        <div class="item-count">
                            ${count}
                        </div>
                    </div>
                `);
            } else {
                $('#vt' + i).html('<img src="/public/images/no-item.png" style="width: 55px;"/>');
            }
        }
    }, 'json');
}

		load_item();
		function logspin() {
		$['post']('/ajax/logspin.php', function (_0xd401x8) {
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
</div>
<style>

  .image-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
  }
  .image-container img {
    border: 2px solid cyan;
    background-color: #E0FFFF;
    width: 60px;
    height: 60px;
  }
  @media (max-width: 768px) {
    .image-container img {
      width: 50px;
      height: 50px;
    }
  }

.rotation-wrapper {
    width: 100%;
    max-width: 600px;
    margin: 0 auto;
    position: relative;
    aspect-ratio: 1; /* Đặt tỷ lệ 1:1 để đảm bảo vòng quay tròn đều */
    overflow: visible; /* Đảm bảo các phần tử con không bị cắt */
}

.rotation {
    width: 100%;
    height: 100%;
    position: relative;
    transform-origin: center;
}

.play-spin img {
    width: 100%;
    height: auto;
}

#rotate-play {
    width: 100%;
    height: 100%;
    position: relative;
}

#vt1, #vt2, #vt3, #vt4, #vt5, #vt6, #vt7, #vt8, #vt9, #vt10, #vt11, #vt12 {
    width: 15%;
    height: auto;
    position: absolute;
    transform-origin: center;
}

/* Điều chỉnh vị trí các phần tử theo tỷ lệ */
#vt1 { top: 5%; left: 45%; }
#vt2 { top: 12%; left: 60%; }
#vt3 { top: 27%; left: 75%; }
#vt4 { top: 45%; left: 80%; }
#vt5 { top: 65%; left: 75%; }
#vt6 { top: 80%; left: 60%; }
#vt7 { top: 85%; left: 45%; }
#vt8 { top: 80%; left: 30%; }
#vt9 { top: 65%; left: 15%; }
#vt10 { top: 45%; left: 10%; }
#vt11 { top: 27%; left: 15%; }
#vt12 { top: 12%; left: 30%; }

/* CSS cho số lượng vật phẩm để nằm giữa hình ảnh */
.item-count {
    position: absolute;
    top: 50%; /* Căn giữa theo chiều dọc */
    left: 50%; /* Căn giữa theo chiều ngang */
    transform: translate(-50%, -50%); /* Di chuyển vị trí về chính giữa */
    color: red;
    font-size: 17px;
    font-weight: bold;
    z-index: 10;
    background: transparent; /* Xóa nền */
    text-shadow: 
        -1px -1px 0 black, /* Viền trong màu đen */
        1px -1px 0 black,
        -1px 1px 0 black,
        1px 1px 0 black,
        -2px -2px 0 yellow, /* Viền ngoài màu trắng */
        2px -2px 0 yellow,
        -2px 2px 0 yellow,
        2px 2px 0 yellow;
}




/* Thiết lập cho mũi tên */
#mui-ten {
    width: 10%; /* Điều chỉnh kích thước cho phù hợp */
    top: -5%; /* Đặt mũi tên cao hơn để không bị cắt */
    left: 50%;
    transform: translateX(-50%);
}


</style>