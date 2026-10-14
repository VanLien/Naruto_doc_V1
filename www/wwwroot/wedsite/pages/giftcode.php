<div class="content content-full" style="border: 2px solid gold; padding: 15px; background-color: #454545;">
  <div class="container mt-3">
    <div class="content">
      <div class="row">
        <div class="col-lg-9 col-md-12 col-xs-12 pb-2">
          <div>
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" role="tab" data-toggle="tab" href="#tab-1">
                  <i class="fa fa-list" aria-hidden="true"></i> Nhận Code
                </a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active border border-top-0 p-3" role="tabpanel" id="tab-1">
                <form action="api/giftcode.php" method="post" onsubmit="return false;">
                  <input type="hidden" name="module_form" value="Modules\Settings">
                  <input type="hidden" name="module" value="saveform">
                  <hr>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-right border-right" for="inputGameServer">
                      Vui lòng chọn máy chủ
                    </label>
                    <div class="col-md-6 pt-5">
                      <select onchange="getnickname(this.value)" id="inputGameServer" name="server" class="form-control">
                        <option value="" selected>Vui lòng chọn máy chủ</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-right border-right" for="actorname">
                      Tên nhân vật<br><small style="color:red;" id="notinick">Vui lòng chọn máy chủ trước</small>
                    </label>
                    <div class="col-md-6 pt-5">
                      <select id="actorname" name="actorname" class="form-control">
                        <option value="" selected>Chọn nhân vật</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-right border-right" for="giftcode">
                      Giftcode
                    </label>
                    <div class="col-md-6 pt-5">
                      <input type="text" class="form-control" id="giftcode" name="giftcode" placeholder="Enter gift code">
                    </div>
                  </div>
                  <div class="block-content block-content-sm block-content-full bg-body-light block-settings-save-fix">
                    <div class="row justify-content-center">
                      <button type="submit" class="btn btn-yellow submit-form">
                        <i class="fa fa-save mr-5"></i> Nhận thưởng
                      </button>
                    </div>
                  </div>
                </form>
                <table class="table-striped" style="width:100%; margin-top: 20px;">
                  <thead>
                    <tr>
                      <th style="text-align:center; font-size:inherit; border-bottom:2px solid #ddd;">Code Tân Thủ</th>
                      <th style="padding:8px 0 8px 0; text-align:center; font-size:inherit; border-bottom:2px solid #ddd;">Thời Hạn</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="text-align:center">
						<td>
							<font color='orange'><b>hokagedc</b></font>
								<div style="display: inline-block; position: relative;">
									<button class="btn btn-sm btn-primary ml-2" onclick="copyCode(this, 'hokagedc')">Copy</button>
										<span class="copy-alert" style="display: none; margin-left: 10px; background-color: #28a745; color: white; padding: 5px 10px; border-radius: 5px; font-size: 12px;">
											<i class="fa fa-check"></i> Đã sao chép
										</span>
								</div>
						</td>
						<td><font color='cyan'><b>Vĩnh Viễn</b></font></td>
					</tr>
					
                    <tr style="text-align:center">
						<td>
							<font color='orange'><b>VIP555</b></font>
								<div style="display: inline-block; position: relative;">
									<button class="btn btn-sm btn-primary ml-2" onclick="copyCode(this, 'VIP555')">Copy</button>
										<span class="copy-alert" style="display: none; margin-left: 10px; background-color: #28a745; color: white; padding: 5px 10px; border-radius: 5px; font-size: 12px;">
											<i class="fa fa-check"></i> Đã sao chép
										</span>
								</div>
						</td>
						<td><font color='cyan'><b>Vĩnh Viễn</b></font></td>
					</tr>
					
					<tr style="text-align:center">
						<td>
							<font color='orange'><b>VIP666</b></font>
								<div style="display: inline-block; position: relative;">
									<button class="btn btn-sm btn-primary ml-2" onclick="copyCode(this, 'VIP666')">Copy</button>
										<span class="copy-alert" style="display: none; margin-left: 10px; background-color: #28a745; color: white; padding: 5px 10px; border-radius: 5px; font-size: 12px;">
											<i class="fa fa-check"></i> Đã sao chép
										</span>
								</div>
						</td>
						<td><font color='cyan'><b>Vĩnh Viễn</b></font></td>
					</tr>
					
					<tr style="text-align:center">
						<td>
							<font color='orange'><b>VIP777</b></font>
								<div style="display: inline-block; position: relative;">
									<button class="btn btn-sm btn-primary ml-2" onclick="copyCode(this, 'VIP777')">Copy</button>
										<span class="copy-alert" style="display: none; margin-left: 10px; background-color: #28a745; color: white; padding: 5px 10px; border-radius: 5px; font-size: 12px;">
											<i class="fa fa-check"></i> Đã sao chép
										</span>
								</div>
						</td>
						<td><font color='cyan'><b>Vĩnh Viễn</b></font></td>
					</tr>
					
					<tr style="text-align:center">
						<td>
							<font color='orange'><b>VIP888</b></font>
								<div style="display: inline-block; position: relative;">
									<button class="btn btn-sm btn-primary ml-2" onclick="copyCode(this, 'VIP888')">Copy</button>
										<span class="copy-alert" style="display: none; margin-left: 10px; background-color: #28a745; color: white; padding: 5px 10px; border-radius: 5px; font-size: 12px;">
											<i class="fa fa-check"></i> Đã sao chép
										</span>
								</div>
						</td>
						<td><font color='cyan'><b>Vĩnh Viễn</b></font></td>
					</tr>
					
					<tr style="text-align:center">
						<td>
							<font color='orange'><b>VIP999</b></font>
								<div style="display: inline-block; position: relative;">
									<button class="btn btn-sm btn-primary ml-2" onclick="copyCode(this, 'VIP999')">Copy</button>
										<span class="copy-alert" style="display: none; margin-left: 10px; background-color: #28a745; color: white; padding: 5px 10px; border-radius: 5px; font-size: 12px;">
											<i class="fa fa-check"></i> Đã sao chép
										</span>
								</div>
						</td>
						<td><font color='cyan'><b>Vĩnh Viễn</b></font></td>
					</tr>
					
					
					
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-3 order-lg-first">
          <?php include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeLeftbar.php' ?>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Script Copy -->
<script>
  function copyCode(button, code) {
    // Tạo input tạm để sao chép
    var tempInput = document.createElement("input");
    tempInput.value = code;
    document.body.appendChild(tempInput);
    tempInput.select();
    tempInput.setSelectionRange(0, 99999); // Cho mobile
    document.execCommand("copy");
    document.body.removeChild(tempInput);

    // Hiển thị thông báo "Đã sao chép"
    var copyAlert = button.nextElementSibling; // Lấy span thông báo
    copyAlert.style.display = "inline-block";
    copyAlert.style.opacity = "1";

    // Tạo hiệu ứng tan biến
    setTimeout(() => {
      copyAlert.style.transition = "opacity 1s";
      copyAlert.style.opacity = "0";
      setTimeout(() => {
        copyAlert.style.display = "none";
        copyAlert.style.transition = ""; // Reset transition
      }, 1000);
    }, 2000); // Thời gian hiển thị thông báo
  }
</script>



<!-- CSS -->
<style>
  .btn-yellow {
    background-color: #FFD700;
    color: black;
    font-weight: bold;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
  }
  .btn-yellow:hover {
    background-color: #FFC107; /* Màu đậm hơn khi hover */
  }
</style>
