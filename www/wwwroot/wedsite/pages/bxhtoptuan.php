<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkUser.php';
checkUserLogged('/user/'.$_GET['page']);
include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeHeader.php';
?>
    
<div class="container pt-3">
    <div class="content">
        <div class="row">
            <div class="col-lg-3 order-lg-first">
                <?php include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeLeftbar.php'; ?>
            </div>
            <div class="col mb-2">

                <div id="top-recharge">
                    <div class="text-center">
                        <img src="/assets/loading.gif" alt="Loading..." id="loading-indicator" style="display:none;">
                    </div>
                </div>
                
                <!-- Thêm Modal Thông Báo -->
                <div id="messageModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="messageModalTitle" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="messageModalTitle">Thông báo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Đóng">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body" id="messageModalBody">
                        <!-- Nội dung thông báo sẽ được chèn vào đây -->
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Thêm Modal Đã Nhận Thưởng -->
                <div id="alreadyClaimedModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="alreadyClaimedModalTitle" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="alreadyClaimedModalTitle">Thông báo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Đóng">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        Bạn đã nhận thưởng cho sự kiện này.
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Thêm Modal Chưa Kết Thúc Sự Kiện -->
                <div id="eventNotEndedModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="eventNotEndedModalTitle" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="eventNotEndedModalTitle">Thông báo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Đóng">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        Sự kiện chưa kết thúc. Vui lòng đợi đến khi sự kiện kết thúc để nhận thưởng.
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                      </div>
                    </div>
                  </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

                <script type="text/javascript">
                    // Hàm để hiển thị thông báo trong modal
                    function showMessageModal(title, message, type = 'info') {
                        $('#messageModalTitle').text(title);
                        $('#messageModalBody').text(message);
                        
                        // Loại bỏ các lớp màu trước đó
                        $('#messageModalBody').removeClass('text-danger text-success text-warning text-info');
                        
                        // Thêm lớp màu dựa trên loại thông báo
                        if(type === 'error') {
                            $('#messageModalBody').addClass('text-danger');
                        } else if(type === 'success') {
                            $('#messageModalBody').addClass('text-success');
                        } else if(type === 'warning') {
                            $('#messageModalBody').addClass('text-warning');
                        } else {
                            $('#messageModalBody').addClass('text-info');
                        }
                        
                        $('#messageModal').modal('show');
                    }
                    
                    // Hàm tải dữ liệu Top Recharge
                    function loadTopRecharge() {
                        $('#loading-indicator').show();
                        $.ajax({
                            url: '/ajax/loadbxhtoptuan.php',
                            type: 'GET',
                            success: function (result) {
                                $('#top-recharge').html(result);
                                $('#loading-indicator').hide();
                            },
                            error: function () {
                                showMessageModal('Lỗi', 'Không thể tải dữ liệu. Vui lòng thử lại sau.', 'error');
                                $('#loading-indicator').hide();
                            }
                        });
                    }

                    // Hàm xem quà
                    function viewPrizes(rank) {
                        $.ajax({
                            url: '/ajax/showPrizes.php',
                            type: 'POST',
                            data: { nap: rank },
                            success: function (result) {
                                $('#giftModalContent').html(result);
                                $('#giftModal').modal('show');
                            },
                            error: function () {
                                showMessageModal('Lỗi', 'Không thể tải dữ liệu quà.', 'error');
                            }
                        });
                    }

                    // Hàm nhận thưởng
                    function claimReward(rank) {
                        $('#claimRewardNap').val(rank); 
                        loadServerOptions(); 
                        $('#selectServerModal').modal('show'); 
                    }

                    // Hàm tải danh sách server
                    function loadServerOptions() {
                        $('#inputGameServer').html('<option value="">Đang tải danh sách server...</option>');
                        $.getJSON('/api/listServer.php?type=select_list', function (servers) {
                            let options = '<option value="">-- Chọn Server --</option>';
                            $.each(servers, function (index, server) {
                                options += `<option value="${server.sid}">${server.name}</option>`;
                            });
                            $('#inputGameServer').html(options);
                        }).fail(function() {
                            showMessageModal('Lỗi', 'Không thể tải danh sách server.', 'error');
                            $('#inputGameServer').html('<option value="">Lỗi tải server</option>');
                        });
                    }

                    // Hàm xác nhận nhận thưởng
                    function confirmClaimReward() {
                        const nap = $('#claimRewardNap').val();
                        const server = $('#inputGameServer').val();

                        if (!server) {
                            showMessageModal('Cảnh báo', 'Vui lòng chọn server!', 'warning');
                            return;
                        }

                        $.ajax({
                            url: '/ajax/claimReward.php',
                            type: 'POST',
                            data: { nap: nap, server: server },
                            dataType: 'json',
                            success: function (response) {
                                if(response.status === 'success') {
                                    showMessageModal('Thành công', response.message, 'success');
                                    // location.reload(); // Nếu muốn reload sau khi nhận thưởng, bỏ comment dòng này
                                    // Hoặc cập nhật bảng xếp hạng mà không cần reload
                                    loadTopRecharge();
                                } else {
                                    if(response.message.includes('đã nhận thưởng')) {
                                        $('#selectServerModal').modal('hide');
                                        $('#alreadyClaimedModal').modal('show');
                                    } else if(response.message.includes('Sự kiện chưa kết thúc')) {
                                        $('#selectServerModal').modal('hide');
                                        $('#eventNotEndedModal').modal('show');
                                    } else {
                                        showMessageModal('Lỗi', response.message, 'error');
                                    }
                                }
                            },
                            error: function () {
                                showMessageModal('Lỗi', 'Không thể kết nối đến máy chủ.', 'error');
                            }
                        });

                        $('#selectServerModal').modal('hide');
                    }

                    $(document).ready(function () {
                        loadTopRecharge();

                        setInterval(function () {
                            loadTopRecharge();
                        }, 30000); 
                    });
                </script>
            </div>
        </div>
    </div>
</div>

<!-- Modal Hiển Thị Quà -->
<div id="giftModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chi Tiết Quà</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="giftModalContent">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Chọn Server -->
<div id="selectServerModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chọn Server</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="inputGameServer">Vui lòng chọn server:</label>
                    <select id="inputGameServer" class="form-control">
                        <option value="">Đang tải danh sách server...</option>
                    </select>
                </div>
                <input type="hidden" id="claimRewardNap" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-success" onclick="confirmClaimReward()">Xác Nhận</button>
            </div>
        </div>
    </div>
</div>

<style>
.description-box {
    border: 2px solid gold;
    background-color: #454545;
    color: cyan;
    border-radius: 5px; /* Bo góc nhẹ */
    padding: 1rem; /* Khoảng cách bên trong */
}

.cart-container {
    max-height: 80vh; /* Giới hạn chiều cao tối đa của phần nội dung */
    overflow-y: auto; /* Kích hoạt cuộn theo chiều dọc */
    padding: 10px;
    border: 1px solid yellow;
    border-radius: 5px;
    background-color: #454545; /* Nền màu xám đậm */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
}

/* Thanh cuộn 7 màu */
.cart-container::-webkit-scrollbar {
    width: 12px; /* Độ rộng của thanh cuộn */
}

.cart-container::-webkit-scrollbar-thumb {
    background: linear-gradient(45deg, red, orange, yellow, green, blue, indigo, violet);
    border-radius: 10px; /* Bo góc thanh cuộn */
}

.cart-container::-webkit-scrollbar-track {
    background: rgba(0, 0, 0, 0.2); /* Màu nền track của thanh cuộn */
    border-radius: 10px;
}

.cart-item {
    padding: 15px;
    margin-bottom: 15px;
    background-color: transparent; /* Nền trong suốt */
    border: 1px solid yellow;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.cart-item-header {
    text-align: center;
    margin-bottom: 15px;
    color: cyan;
}

.bxh-table {
    border-collapse: collapse;
    width: 100%;
    background-color: #454545;
    color: #fff;
}

.bxh-table th, .bxh-table td {
    border: 1px solid yellow;
    padding: 10px;
    text-align: center;
}

.bxh-table th {
    background-color: #333333;
    color: #FFD700; /* Tiêu đề bảng có màu vàng */
}

.bxh-table tbody tr:nth-child(odd) {
    background-color: #5a5a5a;
}

.bxh-table tbody tr:nth-child(even) {
    background-color: #3d3d3d;
}

/* Màu sắc riêng cho từng cột */
.bxh-table td.rank {
    color: lime; /* Màu xanh lá cây cho cột xếp hạng */
    font-weight: bold;
}

.bxh-table td.username {
    color: cyan; /* Màu cyan cho tên người dùng */
    font-weight: bold;
}

.bxh-table td.total-recharge {
    color: yellow; /* Màu vàng cho tổng nạp */
    font-weight: bold;
}

.gift-row {
    background-color: #282828; /* Nền khác biệt cho hàng quà */
    text-align: left;
    padding: 10px;
}

/* Hiển thị quà */
.gift-container {
    display: flex;
    flex-wrap: wrap; /* Cho phép quà xuống dòng nếu tràn chiều ngang */
    justify-content: center; /* Căn giữa các vật phẩm */
    gap: 10px; /* Khoảng cách giữa các vật phẩm */
    padding: 10px;
}

.gift-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    width: 80px; /* Đặt chiều rộng cố định */
}

.gift-image {
    width: 50px;
    margin-bottom: 5px;
    background-color: #E0FFFF;
    border: 1px solid cyan;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.gift-text {
    color: lime;
    font-size: 12px;
}

button.confirm-received {
    margin-top: 10px;
}
</style>

<!-- Thêm mã JavaScript cho bộ đếm ngược -->
<script>
    // Thiết lập thời gian đếm ngược
    var countDownDate = new Date("<?php echo $endDateTimeStr; ?>").getTime();

    // Cập nhật đếm ngược mỗi giây
    var countdownfunction = setInterval(function() {

        var now = new Date().getTime();

        var distance = countDownDate - now;

        // Tính toán thời gian cho ngày, giờ, phút và giây
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Hiển thị kết quả trong phần tử với id="countdown-timer"
        document.getElementById("countdown-timer").innerHTML = days + " ngày " + hours + " giờ "
        + minutes + " phút " + seconds + " giây ";

        // Nếu đếm ngược kết thúc
        if (distance < 0) {
            clearInterval(countdownfunction);
            document.getElementById("countdown-timer").innerHTML = "Sự kiện đã kết thúc";
        }
    }, 1000);
</script>

<?php
// Tiếp tục với phần còn lại của tệp PHP nếu có
?>
