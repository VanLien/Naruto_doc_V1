<div class="container pt-3">
    <div class="content">
        <div class="row">
            <div class="col-lg-3 order-lg-first">
                <?php include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeLeftbar.php'; ?>
            </div>
            <div class="col mb-2">
                <!-- Dropdown chọn server -->
                <div class="mb-3">
                    <label for="serverSelect">Chọn Server:</label>
                    <select id="serverSelect" class="form-control" style="width:200px; display:inline-block;">
                        <option value="symlf_1">S1</option>
                        <option value="symlf_2">S2</option>
                    </select>
                </div>
                
                <!-- Khối hiển thị bảng xếp hạng Lực Chiến -->
                <div id="top-power">
                    <div class="text-center">
                        <img src="/assets/loading.gif" alt="Loading..." id="loading-indicator" style="display:none;">
                    </div>
                </div>

                <!-- Modal hiển thị quà -->
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
                                <!-- Nội dung quà tặng sẽ được chèn vào đây -->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        // Hàm tải bảng xếp hạng Lực Chiến qua AJAX
        function loadTopPower() {
            var server = $('#serverSelect').val(); // Lấy giá trị server đã chọn
            $('#loading-indicator').show(); // Hiển thị loading

            $.ajax({
                url: '/ajax/loadbxhlucchien.php', // Đường dẫn tới file xử lý AJAX
                type: 'GET',
                data: { server: server }, // Gửi thông tin server
                success: function(result) {
                    var data = JSON.parse(result); // Parse dữ liệu JSON từ server

                    // Kiểm tra nếu có lỗi
                    if (data.error) {
                        alert(data.error); // Hiển thị lỗi nếu có
                        $('#loading-indicator').hide();
                        return;
                    }

                    var html = '<h2 class="text-center mb-4">Bảng Xếp Hạng Lực Chiến</h2>';
                    html += '<table class="table table-bordered text-center"><thead><tr><th>Rank</th><th>Tài Khoản</th><th>Nhân Vật</th><th>Lực Chiến</th><th>Quà Tặng</th></tr></thead><tbody>';

                    // Duyệt qua dữ liệu topPlayers và hiển thị bảng
                    if (data.topPlayers && data.topPlayers.length > 0) {
                        data.topPlayers.forEach(function(player) {
                            html += '<tr>';
                            html += '<td>' + player.rank + '</td>';
                            html += '<td>' + player.username + '</td>';
                            html += '<td>' + player.name_server + '</td>';
                            html += '<td>' + player.lucchien + '</td>';
                            html += '<td><button class="btn btn-primary btn-sm" onclick="viewPrizes(' + player.rank + ')">Xem Quà</button></td>';
                            html += '</tr>';
                        });
                    } else {
                        html += '<tr><td colspan="5">Không có dữ liệu.</td></tr>';
                    }

                    html += '</tbody></table>';
                    $('#top-power').html(html); // Cập nhật bảng vào phần tử với id 'top-power'
                    $('#loading-indicator').hide(); // Ẩn loading
                },
                error: function() {
                    alert('Không thể tải dữ liệu. Vui lòng thử lại sau.');
                    $('#loading-indicator').hide();
                }
            });
        }

        // Hàm xem quà khi người dùng nhấn vào "Xem Quà"
        function viewPrizes(rank) {
            $.ajax({
                url: '/ajax/showPrizes.php',
                type: 'POST',
                data: { rank: rank },
                success: function(result) {
                    $('#giftModalContent').html(result); // Chèn dữ liệu quà vào modal
                    $('#giftModal').modal('show'); // Hiển thị modal
                },
                error: function() {
                    alert('Không thể tải dữ liệu quà tặng.');
                }
            });
        }

        // Khi người dùng chọn server khác, gọi lại hàm loadTopPower
        $('#serverSelect').change(loadTopPower);

        // Tải bảng xếp hạng ngay khi trang được load
        loadTopPower();
    });
</script>
