<main id="main-container" style="min-height: 363px;">
  <div class="row mx-0 justify-content-center">
    <div class="col-lg-6 col-xl-4">
      <div class="content content-full overflow-hidden">
        <div class="pb-20 text-center">
          <h1 class="h4 font-w700 mt-30 mb-10">Chào mừng Thuyền Trưởng gia nhập</h1>
        </div>
        <form class="js-validation-signin" action="api/users/AjaxRegister.php" method="post" onsubmit="return false;">
          <input type="hidden" name="module_form" value="Modules\Globals\SignIn\SignIn" wfd-invisible="true">
          <input type="hidden" name="module" value="signin" wfd-invisible="true">
          <input id="type_login" name="type_login" type="hidden" value="email" wfd-invisible="true">
          <div class="block block-themed block-rounded block-shadow">
            
            <div class="block-content">
              <div class="form-group row input-email">
                <div class="col-12">
                  <label for="email">Tài khoản</label>
                  <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tài khoản">
                </div>
              </div>
              <div class="form-group row">
                <div class="col-12">
                  <label for="password">Mật Khẩu</label>
                  <div class="input-group">

                    <input type="password" class="form-control" id="password" name="password" placeholder="********">
                    <div class="input-group-append">
                      <button type="button" class="btn btn-secondary" id="eye">
                        <i class="fa fa-eye"></i>
                      </button>
                    </div>
                  </div>
                </div>

              </div>
			  <div class="form-group row">
                <div class="col-12">
                  <label for="password">Nhập lại mật Khẩu</label>
                  <div class="input-group">

                    <input type="password" class="form-control" id="repassword" name="repassword" placeholder="********">
                    <div class="input-group-append">
                      <button type="button" class="btn btn-secondary" id="eye2">
                        <i class="fa fa-eye"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group row mb-0">
                <div class="col-sm-6 d-sm-flex align-items-center push">
                  <div class="custom-control custom-checkbox mr-auto ml-0 mb-0">
                    
                    
                  </div>
                </div>
                <div class="col-sm-6 text-sm-right push">
                  <button type="submit" class="btn btn-alt-primary submit-form">
                    <i class="si si-login mr-10"></i> đăng ký </button>
                </div>
              </div>
            </div>
            <div class="block-content bg-body-light">
              <div class="form-group text-center">
                <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="/sign-in">
                  <i class="fa fa-plus mr-5"></i> Đăng nhập </a>
                <!--   <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="/reminder">
                  <i class="fa fa-warning mr-5"></i> Reset password </a> -->
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script>
    document.addEventListener("DOMContentLoaded", function (event) {
      $('.nav-tabs').on('click', '.nav-link', function () {
        $('#type_reg').val($(this).attr('href'));
      });
      $('.nav-link.active').click();
      $("#eye").click(function () {
        const this__ = $(this).find('.fa');
        const password = $("#password");
        if (password.attr("type") === "password") {
          password.attr("type", "text");
          this__.removeClass('fa-eye').addClass('fa-eye-slash');
        } else {
          password.attr("type", "password");
          this__.removeClass('fa-eye-slash').addClass('fa-eye');
        }
      });
		$("#eye2").click(function () {
        const this__ = $(this).find('.fa');
        const password = $("#repassword");
        if (password.attr("type") === "password") {
          password.attr("type", "text");
          this__.removeClass('fa-eye').addClass('fa-eye-slash');
        } else {
          password.attr("type", "password");
          this__.removeClass('fa-eye-slash').addClass('fa-eye');
        }
      });
    });
  </script>
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