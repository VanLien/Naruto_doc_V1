<main id="main-container" style="min-height: 363px;">
  <div class="row mx-0 justify-content-center">
    <div class="col-lg-6 col-xl-4">
      <div class="content content-full overflow-hidden">
        <!--<div class="pb-20 text-center">
          <h1 class="h4 font-w700 mt-30 mb-10 sparkle-text">Hoả Chí Anh Hùng</h1>

        </div> 
		<div class="pb-20 text-center">
			<img src="/ui/site/melior/assets/images/logos/logo.png" alt="Vận Mệnh Triệu Hồi" style="width: 400px; height: 250px; border: 0px solid #000; padding: 1px; display: inline-block;">
		</div>-->

        <form class="js-validation-signin" action="api/users/AjaxLogin.php" method="post" onsubmit="return false;">
          <input type="hidden" name="module_form" value="Modules\Globals\SignIn\SignIn">
          <input type="hidden" name="module" value="signin">
          <input id="type_login" name="type_login" type="hidden" value="email">

          <div class="block block-themed block-rounded block-shadow">
            <div class="block-header bg-gd-dusk">
              <h3 class="block-title">Vui lòng đăng nhập tài khoản để trải nghiệm</h3>
            </div>
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
              <div class="form-group row mb-0">
              <!--  <div class="col-sm-6 d-sm-flex align-items-center push">
                  <div class="custom-control custom-checkbox mr-auto ml-0 mb-0">
                    <input type="checkbox" class="custom-control-input" id="remember-me" name="remember-me">
                    <label class="custom-control-label" for="remember-me">Ghi nhớ</label>
                  </div>
                </div> -->
                <div class="col-sm-6 text-sm-right push">
                  <button type="submit" class="btn btn-alt-primary submit-form">
                    <i class="si si-login mr-10"></i> đăng nhập
                  </button>
                </div>
				<!--<div class="form-group text-center">
                <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="/register">
                  <i class="fa fa-plus mr-5"></i> Đăng ký
                </a>
              </div>-->
              </div>
            </div>
         <!--   <div class="block-content bg-body-light">
              
              <div class="form-group text-center">
				<a href="https://drive.google.com/file/d/1z_MZIEJnizT5ZzkuSjcTjGBHkyhNb82X/view?usp=sharing" class="btn btn-primary btn-lg mb-2">Drive APK</a>
                <a href="https://www.facebook.com/hokagedc" class="btn btn-primary btn-lg mb-2">FANPAGE</a>
                <a href="https://zalo.me/g/aibpiq888" class="btn btn-primary btn-lg mb-2">NHÓM ZALO</a>
              </div>
            </div>-->
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- CSS for Sparkle Effect -->
  <style>
    .sparkle-text {
  font-size: 35px; 
  background: linear-gradient(90deg, #ffcc00, #ff66cc, #00ccff);
  background-size: 200% 200%;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent; 
  animation: sparkle 3s infinite linear;
  
  text-shadow: 0 0 5px rgba(255, 255, 255, 0.5), 
               0 0 10px rgba(255, 255, 255, 0.5), 
               0 0 15px rgba(255, 255, 255, 0.5), 
               0 0 20px rgba(255, 200, 200, 0.5); 
}

@keyframes sparkle {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}



  </style>

