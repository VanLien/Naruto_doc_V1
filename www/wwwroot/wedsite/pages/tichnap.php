<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkUser.php';
checkUserLogged('/user/'.htmlspecialchars($_GET['page']));
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
    function getLastDayOfMonth(year, month) {
        return new Date(year, month + 1, 0).getDate();
    }

    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth();
    var lastDay = getLastDayOfMonth(year, month);
    var countDownDate_task = new Date(year, month, lastDay, 23, 59, 59).getTime();

    var x_task = setInterval(function() {
        var now_task = new Date().getTime();
        var distance_task = countDownDate_task - now_task;

        var days_task = Math.floor(distance_task / (1000 * 60 * 60 * 24));
        var hours_task = Math.floor((distance_task % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes_task = Math.floor((distance_task % (1000 * 60 * 60)) / (1000 * 60));
        var seconds_task = Math.floor((distance_task % (1000 * 60)) / 1000);

        document.getElementById("countdown_task").innerHTML = days_task + " ngày " + hours_task + " giờ " + minutes_task + " phút " + seconds_task + " giây ";

        if (distance_task < 0) {
            clearInterval(x_task);
            document.getElementById("countdown_task").innerHTML = "ĐÃ KẾT THÚC";
        }
    }, 1000);
</script>
                    <div class="alert alert-info alert-dismissible fade show text-center mb-30 mt-2" style="border: 2px solid gold; background-color: #454545; color: yellow;">
    <span class="alert-close" data-dismiss="alert"></span>
    <i class="fe-icon-award"></i><b>Tích Luỹ Nạp Thẻ - Reset Lại Vào 24h Ngày Cuối Tháng </b><br>
    <span class="alert-close" data-dismiss="alert"></span>
    <i class="fe-icon-award"></i><b> Lưu ý: Nhận từng mốc rồi vào game bấm " Nhận hết " trong thư rồi hãy nhận tiếp để tránh full 100 thư mất quà</b><br>
    <br> Thời gian nhận thưởng còn lại: <span id="countdown_task">0</span>
    <hr> 
    <font color='orange'><b><a href="http://ninjahokage.com/donations" style="cursor: pointer; text-decoration: underline; color: red;">Nhấp vào đây để nạp</a></b></font>
</div>

                    <div id="quanap"></div>
                    <div id="tmpItemFrm" style="display: none;"></div>
                    <style>
                        .articleAccess {
                            background: #8e8e8e!important;
                            border-radius: 5px;
                        }
                        .articleAccess:hover {
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
                        function loadqua() {
                            if(type>2) {
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
                            if(!selectServer) {
                                alert("Vui lòng chọn máy chủ");
                                $('#inputGameServer').focus();
                                return;
                            }
                            $.get("/ajax/tichnap.php?tichnap="+pack+"&server="+selectServer+"", function(data) {
                                if(data =='true') {
                                    Swal.fire(
                                        'Thành công',
                                        'Nhận thưởng thành công vui lòng kiểm tra hộp thư game<br>Nếu không thấy thư vui lòng nhờ 1 ai đồ gửi cho 1 thư rác để hiện thư',
                                        'success'
                                    );
                                } else {
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
                                    });
                                    tmpItemFrm.show();
                                    var temid = $(this).attr('tempid');
                                    if(display == 'none' && oldtemplate != temid) {
                                        oldtemplate = temid;
                                        var info = $(this).attr('info');
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
                                    </button> <strong>Lưu ý!</strong> Điểm tích lũy nạp nửa tháng sẽ bị xóa vào ngày cuối cùng t7. Nếu không nhận sẽ bị mất điểm và không được khôi phục.
                                </div>
                                <form>
                                    <input type="hidden" id="pack" value="0">
                                    <input type="hidden" id="packID" value="0">
                                    <div class="form-group">
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
                    .cart-item:hover {
                        background-color: #;
                    }
                    .dudk {
                        background-color: #00a1ff;
                        box-shadow: 0 3px 12px 0 rgb(209, 236, 241);
                    }
                </style>
            </div>
        </div>
    </div>
</div>
