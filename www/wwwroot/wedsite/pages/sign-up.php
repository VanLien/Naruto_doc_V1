<div class="row mx-0 justify-content-center">
  <div class="col-lg-6 col-xl-4">
    <div class="content content-full overflow-hidden">
      <!-- Header -->
      <div class="pb-20 text-center">
        <h1 class="h4 font-w700 mt-30 mb-10">Vui lòng đăng ký tài khoản 6-12 ký tự</h1>
      </div>
      <!-- END Header -->

      <form class="js-validation-signin" action="/input" method="post" id="form_signup" onsubmit="return false;">
        <input type="hidden" name="module_form" value="Modules\Globals\SignUp\SignUp" wfd-invisible="true">
        <input type="hidden" name="module" value="signup" wfd-invisible="true">
        <input id="type_reg" name="type_reg" type="hidden" value="#r-email" wfd-invisible="true">

        <div class="block block-themed block-rounded block-shadow ">

          <div class="block-header bg-gd-emerald">
            <h3 class="block-title">Create a new Master Account</h3>
            <div class="block-options">
              <select class="form-control font-size-xs" id="change_lang" style="height: 30px;">
                <option hreflang="ru" value="/ru/sign-up">RUS</option>
                <option hreflang="en" value="/en/sign-up" selected="">ENG</option>
                <option hreflang="es" value="/es/sign-up">SPA</option>
                <option hreflang="pt" value="/pt/sign-up">POR</option>
                <option hreflang="ko" value="/ko/sign-up">KOR</option>
              </select>
            </div>
          </div>


          <ul class="nav nav-tabs nav-tabs-alt row no-gutters js-tabs-enabled" data-toggle="tabs" role="tablist">


            <li class="nav-item col-12">
              <a class="nav-link active " href="#r-email"><i class="si si-envelope"></i> E-mail Address</a>
            </li>


          </ul>

          <div class="block-content">

            <div class="form-group add-login">
              <label for="t-signup-server">Select Server</label>
              <select class="form-control" id="t-signup-server" name="sid">
                <option value="474">Melior [x2]</option>
                <option value="351">Melior Legacy [x5]</option>
              </select>
            </div>

            <div class="form-group row add-login">
              <div class="col-12">
                <label for="t-signup-login">ID</label>
                <div class="input-group">

                  <input type="text" class="form-control" id="t-signup-login" name="login" placeholder="Login">
                </div>
              </div>
            </div>

            <div class="tab-content">
              <div class="tab-pane active " id="r-email" role="tabpanel">

                <div class="form-group row">
                  <div class="col-12">
                    <label for="signup-email">E-mail</label>
                    <input type="email" class="form-control" id="signup-email" name="email" placeholder="john@example.com">
                    <div class="form-text text-muted">A confirmation email will be sent to the specified email address.</div>

                  </div>
                </div>

              </div>
            </div>


            <div class="form-group row">
              <div class="col-12">
                <label for="t-signup-password">Password</label>
                <div class="input-group">

                  <input type="password" class="form-control" id="t-signup-password" name="password" placeholder="********">
                  <div class="input-group-append">
                    <button type="button" class="btn btn-secondary" id="eye">
                      <i class="fa fa-eye"></i>
                    </button>
                  </div>
                </div>
              </div>
            </div>


            <script src="https://www.google.com/recaptcha/api.js" wfd-invisible="true"></script>
            <div class="g-recaptcha" data-sitekey="6Lfv5-UcAAAAAEop07sUVFgoi63_zfyZstioYom3">
              <div style="width: 304px; height: 78px;">
                <div>
                  <iframe title="reCAPTCHA" src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6Lfv5-UcAAAAAEop07sUVFgoi63_zfyZstioYom3&amp;co=aHR0cHM6Ly9tZWxpb3IuY2x1Yjo0NDM.&amp;hl=vi&amp;v=Km9gKuG06He-isPsP6saG8cn&amp;size=normal&amp;cb=xcm9ed11g121" width="304" height="78" role="presentation" name="a-k3nggwq05m6p" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox"></iframe>
                </div>
                <textarea id="g-recaptcha-response" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;" wfd-invisible="true"></textarea>
              </div>
              <iframe style="display: none;" wfd-invisible="true"></iframe>
            </div>
            <br>


            <div class="form-group row mb-0">
              <div class="col-sm-12 push">
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="signup-terms" name="terms" wfd-invisible="true">
                  <label class="custom-control-label" for="signup-terms">I have read and accept the User Agreement</label>
                </div>
              </div>
              <div class="col-sm-12 text-sm-right push">

                <button type="submit" class="btn btn-alt-success submit-form">
                  Create Master Account </button>
              </div>
            </div>
          </div>
          <div class="block-content bg-body-light">
            <div class="form-group text-center">
              <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="/terms" target="_blank">
                <i class="fa fa-book text-muted mr-5"></i> Read the User Agreement </a>
              <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="https://melior.club/en/sign-in">
                <i class="fa fa-user text-muted mr-5"></i> Sign in </a>
            </div>
          </div>
        </div>
      </form>
      <!-- END Sign Up Form -->

    </div>
  </div>
</div>

<script wfd-invisible="true">
  document.addEventListener("DOMContentLoaded", function (event) {

    /* function onSubmitReInv(token) {
         $('#captcha').val(token);
         document.getElementById("form_signup").submit();

     }*/

    $('.nav-tabs').on('click', '.nav-link', function () {
      $('#type_reg').val($(this).attr('href'));
    });
    $('.nav-link.active').click();

    $("#eye").click(function () {
      const this__ = $(this).find('.fa');
      const password = $("#t-signup-password");

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