<div class="content content-full">
  <div class="row">
    <div class="col-12 box_mw" data-layers-level="1">
      <div class="block block-rounded">
        <ul class="nav nav-tabs nav-tabs-block">
          <li class="nav-item">
            <a class="nav-link active" href="#changepass"><?=$pagetitle[$_GET['page']]['name'];?></a>
          </li>
        </ul>
        <div class="block-content tab-content">
          <div class="tab-pane active" id="changepass" role="tabpanel">
            <div class="row justify-content-center py-20">
              <div class="col-xl-12">
                <form action="api/users/AjaxUpdatePassword.php" method="post" onsubmit="return false;">
                  <input type="hidden" name="module_form" value="Modules\Settings">
                  <input type="hidden" name="module" value="addCharacter">
                  <div class="alert alert-warning fade in alert-dismissible show">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true" style="font-size:20px">×</span>
                    </button>
                    - Nên đặt mật khẩu từ 8 ký tự trở lên gồm cả ký tự đặc biệt.<br>
					- Nếu đổi mật khẩu không được hãy liên hệ Fanpage để được hỗ trợ đổi mật khẩu.<br>
                  </div>
                  <hr>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-right border-right" for="password">
                     Mật khẩu cũ</label>
                    <div class="col-md-6 pt-5">
                      <input type="text" class="form-control" id="password" name="password" placeholder="Mật khẩu cũ">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-right border-right" for="newPassword">
                      Mật khẩu mới</label>
                    <div class="col-md-6 pt-5">
                      <input type="text" class="form-control" id="newPassword" name="newPassword" placeholder="Mật khẩu mới">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-right border-right" for="reNewPassword">
                      Nhập lại mật khẩu</label>
                    <div class="col-md-6 pt-5">
                      <input type="text" class="form-control" id="reNewPassword" name="reNewPassword" placeholder="Nhập lại mật khẩu">
                    </div>
                  </div>
                  <div class="block-content block-content-sm block-content-full bg-body-light block-settings-save-fix">
                    <div class="row justify-content-center">
                      <button type="submit" class="btn btn-alt-primary submit-form">
                        <i class="fa fa-save mr-5"></i> Xác nhận </button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
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