<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .card-pricing {
            background-color: #1c1c1e;
            color: #ffffff;
        }
        .card-pricing .text-muted {
            color: #6c757d !important;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="content content-full">
    <div class="row">
        <div class="col-lg-3 order-lg-first">
            <!-- left bar -->
            <?php include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeLeftbar.php' ?>
        </div>
        <div class="col-lg-9">
            <div class="row">
                <div class="col-12 box_mw" data-layers-level="1">
                    <div class="block block-rounded">
                        <ul class="nav nav-tabs nav-tabs-block" data-toggle="tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" href="#risecoins">
                                    <?php echo $pagetitle[$_GET['page']]['name']; ?>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#shoptickets">🎫 Nạp ATM - MOMO - PAYPAL</a>
                            </li>
                        </ul>
                        <div class="block-content tab-content">
                            <div class="tab-pane active" id="risecoins" role="tabpanel">
                                <div class="col-xl-3 col-md-6 col-sm-6 choose-method">
                                    <div class="card card-pricing text-center px-3 mb-4" style="background-color: #1c1c1e; color: #ffffff;">
                                        <strong class="text-muted" style="color: #6c757d !important;">
                                            <font color='white'><b>Thẻ Cào Tự Động</b></font>
                                        </strong><br>
                                        <strong class="text-muted" style="color: #6c757d !important;">
                                            <font color='white'><b>Hỗ Trợ Các Loại Thẻ</b></font>
                                        </strong><br>
                                        
                                        <div class="card-body pt-0">
                                            <ul class="list-unstyled mb-4">
                                                <li>VIETTEL</li>
                                                <li>MOBIPHONE</li>
                                                <li>VINAPHONE</li>
												<li>ZING</li>
                                            </ul>
                                        </div>
                                        <div class="card-footer border-0 bg-transparent">
                                            <a href="/payment_mobi" class="btn btn-outline-warning mb-3">Tiếp tục</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
							
                            <div class="tab-pane" id="shoptickets" role="tabpanel">
                                <div class="row justify-content-center py-20">
                                    <div class="col-xl-12">
                                        <form action="ajax/paybank.php" method="post" onsubmit="return false;">
                                            <input type="hidden" name="module_form" value="Modules\Settings">
                                            <input type="hidden" name="module" id="module2" value="1">
                                            <div class="alert alert-warning fade in alert-dismissible show">
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true" style="font-size:20px">×</span>
                                                </button>
                                                - Hiện tại nạp qua ví momo và ATM đang xử lý thủ công.<br>
                                                - Sau khi chuyển tiền thành công các bạn vui lòng điền số tiền đã chuyển và bấm xác nhận<br>
                                                - Nếu không làm đủ các bước sẽ không nhận được tiền<br>
                                                (Lưu ý nếu bạn chưa chuyển tiền thành công mà bấm xác nhận đã chuyển.Span nhiều lần sẽ bị khóa tài khoản)
                                                <br>
                                            </div>
                                            <hr>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-right border-right" for="username">
                                                    Tài khoản <br>
                                                </label>
                                                <div class="col-md-6 pt-5">
                                                    <input type="text" class="form-control" id="username2" name="username" value="<?php echo $_SESSION['niceUsername']; ?>">
                                                </div>
                                            </div>
											
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-right border-right" for="inputGameServer">
                                                    Hình thức chuyển tiền
                                                </label>
                                                <div class="col-md-6 pt-5">
                                                    <select id="mySelect" name="mySelect" onchange="myFunction()" class="form-control">
                                                        <option value="">- Hình thức chuyển tiền -</option>
                                                        <option value="1">Chuyển khoản qua ví Momo</option>
                                                        <option value="2">Chuyển khoản qua ATM</option>
                                                        <option value="3">Chuyển khoản qua Paypal</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row" id="vimomo">
                                                <label class="col-md-4 col-form-label text-right border-right" for="inputGameServer"></label>
                                                <img src="http://ninjahokage.com/momo1.jpg" width="300">
                                            </div>
                                            <div class="form-group row" id="viatm">
                                                <label class="col-md-4 col-form-label text-right border-right" for="inputGameServer"></label>
                                                <img src="http://ninjahokage.com/bank1.jpg" width="300">
                                            </div>
                                            <div class="form-group row" id="paypal">
                                                <label class="col-md-4 col-form-label text-right border-right" for="inputGameServer"></label>
                                                <ul style="background-color: #000" class="list-group p-3">
                                                    Lưu ý: Sau khi đã chuyển khoản thành công <br>vui lòng bấm xác nhận và đợi từ 10 -> 15 phút<br> hệ thống sẽ cộng tiền cho các bạn.<br>Nếu quá thời gian trên mà chưa được + tiên vui lòng liên hệ Admin
                                                    <br> <font color='orange'><b>WHEN COMPLETE<br>PLEASE WAIT 10 - 15 MINS<br> SYSTEM AUTO ADD XU.<br>IF OVERTIME BUT STILL NOT RECEIVE, PLZ INBOX ADMIN </b></font></br>

                                                    <li class="list-group-item font-weight-bold">Gmail:  <span class="badge-info p-1">lnhlam99@gmail.com </span></li>
                                                    <li class="list-group-item font-weight-bold">Name:       <span id="payment_amount" class="badge-success p-1">Le Lam</span></li>
                                                    <li class="list-group-item font-weight-bold">Nội dung:      <span id="payment_id" class="badge-danger p-1">GAME + USER + MONEY TRANSFER</span></li>
                                                </ul>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-right border-right" for="username">
                                                    Nội dung chuyển khoản <br>
                                                </label>
                                                <div class="col-md-6 pt-5">
                                                    <input type="text" class="form-control" id="noidung" name="noidung" value="Nap_<?php echo $_SESSION['niceUsername']; ?>">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-right border-right" for="inputGameServer">
                                                    Số tiền đã chuyển
                                                </label>
                                                <div class="col-md-6 pt-5">
                                                    <input id="sotien" name="sotien" type="text" class="form-control" placeholder="Số tiền đã chuyển">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-right border-right"></label>
                                                <div class="col-md-6 pt-5">
                                                    <button type="submit" class="btn btn-danger btn-lg submit-form">
                                                        Xác nhận đã chuyển tiền thành công
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
							<table class="table-striped" style="width:100%">
                    <thead>
                        <tr>
						<big class="text-muted"><span style="color:lime;"><b>Lưu ý:</b></span><span style="color:orange;"> 100k = 200.000 Xu Web</span></big><br>
						<big class="text-muted"><span style="color:lime;"><b>Notice:</b></span><span style="color:orange;"> 5$ = 200.000 Webcoin</span></big>
                           <!-- <th style="text-align:center;font-size:inherit;border-bottom:2px solid #ddd"><font color='orange'><b><a href="http://ninjahokage.com/bonus" style="cursor: pointer; text-decoration: underline; color: yellow;">Nhấp vào đây để xem khuyến mãi</a></b></font></th> -->
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
                </div>
            </div>
        </div>
		
    </div>
</div>

<script>
    document.getElementById("vimomo").style.display = 'none';
    document.getElementById("viatm").style.display = 'none';
    document.getElementById("paypal").style.display = 'none';

    function myFunction() {
        var x = document.getElementById("mySelect").value;
        var sections = {
            1: "vimomo",
            2: "viatm",
            3: "paypal"
        };
        Object.keys(sections).forEach(function(key) {
            document.getElementById(sections[key]).style.display = (key == x) ? 'block' : 'none';
        });
    }

</script>

</body>
</html>
