<?php
// File: pages/daugia.php

include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkUser.php';
checkUserLogged('/user/' . $_GET['page']);
include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeHeader.php';
?>

<div class="container pt-3">
    <div class="content">
        <div class="row">
            <div class="col-lg-3 order-lg-first">
                <?php include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeLeftbar.php'; ?>
            </div>
            <div class="col mb-2">

                <div class="auction-container">
                    <div class="auction-description">
					<h2 class="text-center mb-4">Sự Kiện Đấu Giá</h2>
                        <h4>Mô Tả Sự Kiện</h4>
                        <p>
                            Chào mừng bạn đến với sự kiện đấu giá đặc biệt! Đây là cơ hội tuyệt vời để bạn sở hữu những vật phẩm quý giá với giá cả phải chăng. Tham gia ngay để không bỏ lỡ những phần thưởng hấp dẫn và trải nghiệm thú vị.
                        </p>
                        <p>
                            Các quy định tham gia:
                            <ul>
                                <li>Mỗi đấu giá có thời gian cụ thể từ lúc bắt đầu đến khi kết thúc.</li>
                                <li>Giá khởi điểm sẽ được đặt tại mỗi sự kiện.</li>
                                <li>Người đặt giá cao nhất sẽ giành chiến thắng và nhận được phần thưởng.</li>
                                <li>Hãy đảm bảo bạn đủ Xu để đặt giá thầu.</li>
								<li><font color='yellow'><b>Các người chơi không đạt giải sẽ được hoàn xu</b></font></li>
                            </ul>
                        </p>
                    </div>
                    
                    <div id="auction-event">
                        <div class="text-center">
                            <img src="/assets/loading.gif" alt="Loading..." id="loading-indicator" style="display:none;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="placeBidModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form id="placeBidForm">
                <div class="modal-header">
                    <h5 class="modal-title">Đặt Giá</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Đóng">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label for="bidAmount">Nhập số Xu muốn đặt giá:</label>
                        <input type="number" id="bidAmount" class="form-control" min="1" required>
                        <small id="bidAmountHelp" class="form-text" style="color: cyan;">
                        </small>
                    </div>
                    <input type="hidden" id="placeBidAuctionId" value="">
                    <input type="hidden" id="existingBidAmount" value="">
                    <input type="hidden" id="currentHighestBid" value="">
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Đặt Giá</button>
                </div>
            </form>
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
                <form id="claimRewardForm">
                    <div class="form-group">
                        <label for="inputGameServer">Vui lòng chọn server:</label>
                        <select id="inputGameServer" class="form-control">
                            <option value="">-- Chọn Server --</option>
                        </select>
                    </div>
                    <input type="hidden" id="claimRewardAuctionId" value="">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-success" onclick="confirmClaimReward()">Xác Nhận</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Thông Báo Chung -->
<div id="messageModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="messageModalTitle" class="modal-title">Thông Báo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="messageModalBody"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script type="text/javascript">
    function showMessageModal(title, message) {
        $('#messageModalTitle').text(title);
        $('#messageModalBody').html(message);
        $('#messageModal').modal('show');
    }

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function loadAuctionEvent() {
        $.ajax({
            url: '/ajax/loadAuctionEvent.php',
            type: 'GET',
            success: function (result) {
                $('#auction-event').html(result);
                initializeCountdowns();
            },
            error: function () {
                showMessageModal('Lỗi', 'Không thể tải dữ liệu sự kiện đấu giá. Vui lòng thử lại sau.');
            }
        });
    }

    function placeBid(auctionId, currentBid, existingBid) {
        $('#placeBidAuctionId').val(auctionId);
        $('#bidAmount').val('');
        $('#existingBidAmount').val(existingBid);
        $('#currentHighestBid').val(currentBid);

        const minimumBid = parseInt(currentBid) + 5000000;
        let message = '';
        if (existingBid > 0) {
            const requiredAdditional = minimumBid - parseInt(existingBid);
            message = '<span style="color: cyan;">Bạn đã đặt ' + numberWithCommas(existingBid) + ' Xu, bạn cần đặt thêm ' + numberWithCommas(requiredAdditional) + ' Xu để có thể vượt tối thiểu ' + numberWithCommas(minimumBid) + ' Xu để đấu giá.</span>';
        } else {
            message = '<span style="color: cyan;">Giá hiện tại là ' + numberWithCommas(currentBid) + ' Xu, bạn cần đặt ' + numberWithCommas(minimumBid) + ' Xu để đấu giá.</span>';
        }

        $('#bidAmountHelp').html(message);

        $('#placeBidModal').modal('show');
    }

    function showSelectServerModal(auctionId) {
        $('#claimRewardAuctionId').val(auctionId);
        loadServerOptions();
        $('#selectServerModal').modal('show');
    }

    function loadServerOptions() {
        $('#inputGameServer').html('<option value="">Đang tải danh sách server...</option>');
        $.getJSON('/api/listServer.php?type=select_list', function (servers) {
            let options = '<option value="">-- Chọn Server --</option>';
            $.each(servers, function (index, server) {
                options += `<option value="${server.sid}">${server.name}</option>`;
            });
            $('#inputGameServer').html(options);
        });
    }

    function confirmClaimReward() {
        const auctionId = $('#claimRewardAuctionId').val();
        const server = $('#inputGameServer').val();

        if (!server) {
            showMessageModal('Lỗi', 'Vui lòng chọn server!');
            return;
        }

        $.ajax({
            url: '/ajax/loadquadaugia.php', // Correct URL to your PHP script
            type: 'POST',
            data: { auction_id: auctionId, server: server },
            success: function (response) {
                try {
                    const result = typeof response === 'object' ? response : JSON.parse(response);
                    if (result.error) {
                        showMessageModal('Lỗi', result.error);
                    } else if (result.success) {
                        showMessageModal('Thành Công', result.success);
                        loadAuctionEvent();
                    } else {
                        showMessageModal('Lỗi', 'Phản hồi không xác định. Vui lòng thử lại sau.');
                    }
                } catch (error) {
                    console.error('JSON parse error:', error);
                    console.error('Response:', response);
                    showMessageModal('Lỗi', 'Lỗi không xác định. Vui lòng thử lại sau.');
                }
            },
            error: function (xhr, status, error) {
                console.error('AJAX error:', error);
                showMessageModal('Lỗi', 'Không thể gửi yêu cầu. Vui lòng thử lại sau.');
            }
        });

        $('#selectServerModal').modal('hide');
    }

    function initializeCountdowns() {
        $('.countdown-timer').each(function () {
            const auctionGroup = $(this).closest('.auction-group');
            const endTimeStr = auctionGroup.data('end-time');
            const countdownElement = $(this);

            const endTime = new Date(endTimeStr).getTime();

            const timer = setInterval(function () {
                const now = new Date().getTime();
                const distance = endTime - now;

                if (distance < 0) {
                    clearInterval(timer);
                    countdownElement.html('Đấu giá đã kết thúc');
                    // Optionally, reload the auction list to update status
                    // loadAuctionEvent();
                    return;
                }

                const days = Math.floor(distance / (1000 * 60 * 60 * 24));
                const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                const seconds = Math.floor((distance % (1000 * 60)) / 1000);

                countdownElement.html(days + 'd ' + hours + 'h ' + minutes + 'm ' + seconds + 's ');
            }, 1000);
        });
    }

    $(document).ready(function () {
        loadAuctionEvent();

        $('#placeBidForm').on('submit', function (e) {
            e.preventDefault();

            const auctionId = $('#placeBidAuctionId').val();
            const bidAmount = $('#bidAmount').val();

            if (!bidAmount || isNaN(bidAmount) || bidAmount <= 0) {
                showMessageModal('Lỗi', 'Giá thầu không hợp lệ!');
                return;
            }

            $.ajax({
                url: '/ajax/placeBid.php',
                type: 'POST',
                data: { auction_id: auctionId, bid_amount: bidAmount },
                success: function (response) {
                    try {
                        const result = typeof response === 'object' ? response : JSON.parse(response);
                        if (result.error) {
                            showMessageModal('Lỗi', result.error);
                        } else if (result.success) {
                            showMessageModal('Thành Công', result.success);
                            loadAuctionEvent();
                        } else {
                            showMessageModal('Lỗi', 'Phản hồi không xác định. Vui lòng thử lại sau.');
                        }
                    } catch (error) {
                        console.error('JSON parse error:', error);
                        showMessageModal('Lỗi', 'Lỗi không xác định. Vui lòng thử lại sau.');
                    }
                },
                error: function () {
                    showMessageModal('Lỗi', 'Không thể gửi yêu cầu. Vui lòng thử lại sau.');
                }
            });

            $('#placeBidModal').modal('hide');
        });

        setInterval(function () {
            loadAuctionEvent();
        }, 30000);
    });
</script>

<!-- CSS Styles -->
<style>
.auction-container {
    border: 2px solid #FFD700; /* Viền cam */
    background-color: #454545; /* Nền màu #454545 */
    padding: 20px;
    border-radius: 10px;
}

.auction-description {
    margin-bottom: 20px;
    color: #FFF;
}

.auction-description h4 {
    color: #FFD700; /* Tiêu đề màu cam */
}

.auction-group {
    margin-bottom: 15px;
    padding: 10px;
    border: 1px solid #FFD700;
    background-color: #333;
    color: #FFF;
    border-radius: 8px;
}

.group-items {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}

.group-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    width: 80px;
}

.item-image {
    width: 60px;
    height: 60px;
    margin-bottom: 5px;
    background-color: #E0FFFF;
    border: 1px solid cyan;
    border-radius: 5px;
}

.item-name {
    color: lime;
    font-size: 12px;
}

.item-count {
    color: yellow;
    font-size: 10px;
}

.group-bid {
    margin-top: 8px;
}

.group-bid p {
    margin-bottom: 5px;
}

.countdown-timer {
    font-weight: bold;
    color: #FF4500; /* Màu đỏ cam cho thời gian đếm ngược */
    margin-top: 5px;
}

.group-bid button {
    margin-top: 8px;
    padding: 8px;
    background-color: #FFD700;
    color: #000;
    font-weight: bold;
    border-radius: 5px;
    border: none;
}

.group-bid button.btn-success {
    background-color: #28a745;
    color: #fff;
}

.group-bid button.btn-secondary {
    background-color: #6c757d;
    color: #fff;
}

.auction-log {
    margin-top: 15px;
}

.auction-log-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

.auction-log-table th, .auction-log-table td {
    border: 1px solid #FFD700;
    padding: 8px;
    text-align: center;
    color: #fff;
}

.auction-log-table th {
    background-color: #333;
    color: #FFD700;
}

.auction-log-table tbody tr:nth-child(odd) {
    background-color: #3d3d3d;
}

.auction-log-table tbody tr:nth-child(even) {
    background-color: #2a2a2a;
}

/* Responsive Styles */
@media (max-width: 768px) {
    .group-items {
        justify-content: center;
    }
}
</style>

<?php include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeFooter.php'; ?>
