<?php
$username = $_SESSION['niceUsername'];
$check = $dbh ->query("SELECT * FROM game_account WHERE username = '$username' LIMIT 1")->fetch();
$spin = round($check['xu']/25);
$checktime = $dbh ->query("SELECT * FROM ws_time_end where id=1 LIMIT 1")->fetch();
$month=$checktime['month'];
$day=$checktime['day'];
$year=$checktime['year'];
$timeend ="$year-$month-$day 00:00:00";
$remain = ceil((mktime(0,0,0,$month,$day,$year) - time()) / 86400);
?>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div class="content content-full">
  <div class="row">
    <div class="col-12 box_mw" data-layers-level="1">
      <div class="block block-rounded">
        <ul class="nav nav-tabs nav-tabs-block">
          <li class="nav-item">
            <a class="nav-link active" href="/rewards"><?=$pagetitle[$_GET['page']]['name'];?></a>
          </li>
		  <li class="nav-item">
            <a class="nav-link" href="/rewards2">Tích lũy nạp ngày</a>
          </li>
        </ul>
        <div class="block-content tab-content">
          <div class="tab-pane active" id="changepass" role="tabpanel">
            <div class="row justify-content-center py-20">
              <div class="col-xl-12">
                <div class="alert alert-warning fade in alert-dismissible show">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true" style="font-size:20px">×</span>
                    </button>
                    <span class="alert-close" data-dismiss="alert"></span>Thời gian sự kiện kết thúc: <span id="countdown_task">0</span>
					<br>
					<b>Tích lũy : <?=$check['tichnap'];?></b>
               </div>
			   <div id="quanap"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<div id="server" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
  <div class="modal-dialog modal-login">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Chú ý</h4>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      </div>
      <form action="ajax/tichnap.php" method="post" onsubmit="return false;">
        <input type="hidden" id="pack" name="tichnap" value="0">
        <div class="form-group row">
          <div class="alert alert-danger fade in alert-dismissible show">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true" style="font-size:20px">×</span>
            </button> <strong>Note!</strong> Tích lũy nạp thẻ sẽ reset vào thứ 2 hàng tuần,nếu không nhận sẽ mất không được bồi thường.
          </div>
          <label class="col-md-4 col-form-label text-right border-right" for="password">
            Chọn máy chủ</label>
          <div class="col-md-6 pt-5">
            <select onchange="getnickname(this.value)" id="inputGameServer" name="server" class="form-control">
              <option value="" selected>Chọn máy chủ</option>
            </select>
          </div>
        </div>
        <div class="form-group row">
          <label class="col-md-4 col-form-label text-right border-right" for="actorname">
            Chọn nhân vật
            <br><small style="color:red;" id="notinick">Vui lòng chọn máy chủ trước</small> </label>
          <div class="col-md-6 pt-5">
            <select id="actorname" name="actorname" class="form-control">
              <option value="" selected>Chọn nhân vật</option>
            </select>
          </div>
        </div>
		<div class="block-content block-content-sm block-content-full bg-body-light block-settings-save-fix">
                    <div class="row justify-content-center">
                      <button type="submit" class="btn btn-alt-primary submit-form">
                        Nhận thưởng </button>
                    </div>
                  </div>
      </form>
    </div>
  </div>
</div>
<script>
// Set the date we're counting down to
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
  document.getElementById("countdown_task").innerHTML = days_task + " days " + hours_task + " hours " + minutes_task + " minute " + seconds_task + " second ";
  // If the count down is over, write some text 
  if (distance_task < 0) {
    clearInterval(x_task);
    document.getElementById("countdown_task").innerHTML = "FINISHED";
  }
}, 1000);
</script>
<style>
.articleAccess {
  background: #8e8e8e!important;
  border-radius: 5px;
}

.articleAccess:hover {
  background: #f4e3ab!important;
  text-decoration: none
}
</style>
<script type="text/javascript">
type = 0;
function loadqua() {
  if (type > 2) {
    type -= 1;
  } else {
    type += 1;
  }
  $.ajax({                
    url: "/ajax/loadquatichluy.php",
        type: "post",
        dateType: "text",
    data: {
      type: type,
    },
        success: function (result) {
      $('#quanap').html(result);
    }
  });            
}
loadqua();
$(document).on("click", ".confirm-received", function () {
  var pack = $(this).data('pack');
  $('#pack').val(pack);
});
</script>
<style>
.remove-item {
    display: block;
    position: absolute;
    right: -5px;
    width: 22px;
    height: 22px;
    padding-left: 1px;
    border-radius: 50%;
    background-color: #ff5252;
    color: #fff;
    line-height: 23px;
    text-align: center;
    box-shadow: 0 3px 12px 0 rgb(255 82 82 / 50%);
    cursor: pointer;
}
.cart-item .cart-item-product {
  display: table;
  width: 420px;
  text-decoration: none;
}
.cart-item .cart-item-product-thumb, .cart-item .cart-item-product-info {
  display: table-cell;
  vertical-align: top;
}
.cart-item .cart-item-product-thumb {
  width: 110px;
}
.cart-item .cart-item-product-thumb > img {
  display: block;
  width: 100%;
}
.cart-item .cart-item-product-info {
  padding-top: 5px;
  padding-left: 15px;
}
.cart-item .cart-item-product-info > span {
  display: block;
  margin-bottom: 2px;
  color: #404040;
  font-size: 12px;
}
.cart-item .cart-item-product-title {
  margin-bottom: 8px;
  transition: color, 0.3s;
  color: #343b43;
  font-size: 16px;
  font-weight: bold;
}
.cart-item .cart-item-product:hover .cart-item-product-title {
  color: #ac32e4;
}
.cart-item .count-input {
  display: inline-block;
  width: 85px;
}
.cart-item .remove-item {
  right: -10px !important;
}
@media (max-width: 991px) {
  .cart-item {
    padding-right: 30px;
  }
  .cart-item .cart-item-product {
    width: auto;
  }
}
@media (max-width: 768px) {
  .cart-item {
    padding-right: 10px;
    padding-bottom: 15px;
  }
  .cart-item .cart-item-product {
    display: block;
    width: 100%;
    text-align: center;
  }
  .cart-item .cart-item-product-thumb, .cart-item .cart-item-product-info {
    display: block;
  }
  .cart-item .cart-item-product-thumb {
    margin: 0 auto 10px;
  }
  .cart-item .cart-item-product-info {
    padding-left: 0;
  }
  .cart-item .cart-item-label {
    margin-bottom: 8px;
  }
}
</style>
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