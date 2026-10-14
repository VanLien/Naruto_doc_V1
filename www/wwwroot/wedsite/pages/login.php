<!doctype html>
<html lang="en" class="no-focus melior">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<?php
$returnURL = isset($_GET['returnURL']) ? $_GET['returnURL'] : '/user';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
if(isset($_SESSION['is_login'])){
    header('location: '.$returnURL);
    exit;
}
?>
<head lang="en">
  <title>The Rise of Legends - Login to the Account Panel</title>
  <meta property="og: title" content="The Rise of Legends - Account Panel">
  <meta property="og: site_name" content="The Rise of Legends">
  <meta property="og: type" content="website">
  <meta property="og: url" content="http://127.0.0.1:81/">
  <meta name="description" content="The Rise of Legends - Account Panel">
  <meta property="og: description" content="The Rise of Legends - Account Panel">
  <meta property="twitter: description" content="The Rise of Legends - Account Panel">
  <meta name="keywords" content="mmorpg, mobile, android, openworld, magic, private server, classic private, rise of legends">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <link rel="shortcut icon" href="https://theriseoflegends.online/ui/site/riseoflegends/assets/images/favicon/favicon.png">
  <link rel="icon" type="image/png" sizes="192x192" href="https://theriseoflegends.online/ui/site/riseoflegends/assets/images/favicon/favicon.png">
  <link rel="apple-touch-icon" sizes="32x32" href="https://theriseoflegends.online/ui/site/riseoflegends/assets/images/favicon/favicon.png">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,400i,600,700">
  <link id="css-main" rel="stylesheet" href="/logincss/codebaseafb3.css?v=1635177793">
  <link rel="stylesheet" href="/logincss/custom96b6.css?v=1633119122">
  <link rel="stylesheet" href="/logincss/panel.css">
  <script type="text/javascript">
    function ajaxLogin() {
      var username = $("#username").val();
      var password = $("#password").val();
      if (!username) {
        $("#msg").addClass("text-danger ").html('<i class="fa fa-close" aria-hidden="true"></i> Please enter your username');
        $("#username").focus();
      } else if (!password) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Please enter a password');
        $("#password").focus();
      }
      else
      {
        $.post('/api/users/AjaxLogin.php', {password:password,username:username,}, function (result){
            if(result.status){
              $("#msg").html('<i class="fa fa-check" aria-hidden="true"></i>  Logged in successfully!').removeClass("text-danger").addClass("text-success");
              setTimeout(function(){
                window.location.href = '<?=$returnURL?>';
              }, 1000);
            }
            else{
              $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> '+result.msg);
            }
          },
          'JSON'
        );
      }
    }
  </script>
</head>
<body>
  <div style='display:none' id='sbbhscc'></div>
  <div id='sbbfrcc' style='position: absolute; top: -10px; left: 30px; font-size:1px'></div>
  <div id="page-container" class="sidebar-inverse side-scroll main-content-boxed enable-page-overlay side-trans-enabled sidebar-inverse black ">
    <nav id="sidebar">
      <div id="sidebar-scroll">
        <div class="sidebar-content">
          <div class="content-header content-header-fullrow bg-black-op-10">
            <div class="content-header-section text-center align-parent">
              <button type="button" class="btn btn-circle btn-dual-secondary d-lg-none align-v-r" data-toggle="layout" data-action="sidebar_close">
                <i class="fa fa-times text-danger"></i>
              </button>
              <div class="content-header-item">
                <a class="link-effect font-w700" href="index.html">
                  <span class="font-size-xl text-dual-primary-dark">THE RISE OF LEGENDS</span>
                </a>
              </div>
            </div>
          </div>
          <div class="content-side content-side-full">
            <ul class="nav-main">
              <li class=""><a href="https://discord.link/warlordgamers" target="_blank" lv_menu="400" class=" "><i class="si si-bubbles"></i><span class="sidebar-mini-hide">Discord</span></a>
              </li>
              <li class=""><a href="https://www.theriseoflegends.online" target="_blank" lv_menu="500" class=" "><i class="si si-action-undo"></i><span class="sidebar-mini-hide">Back to the main site</span></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
    <header id="page-header">
      <div class="content-header">
        <div class="content-header-section">
          <div class="content-header-item">
            <a href="https://www.theriseoflegends.online">
              <img src="/logincss/min_logo.png" style="height: 38px;" alt="">
            </a>
          </div>
        </div>
        <div class="content-header-section d-none d-lg-block">
          <ul class="nav-main-header">
            </li>
            <li class=""><a href="https://discord.link/warlordgamers" target="_blank" lv_menu="400" class=" "><i class="si si-bubbles"></i><span class="sidebar-mini-hide">Discord</span></a>
            </li>
            <li class=""><a href="https://www.theriseoflegends.online" target="_blank" lv_menu="500" class=" "><i class="si si-action-undo"></i><span class="sidebar-mini-hide">Back to the main site</span></a>
            </li>
          </ul>
        </div>
        <div class="content-header-section">
          <a href="http://127.0.0.1:81/user/login" class="btn btn-dual-secondary mr-5 active">
            <i class="si si-login"></i> Sign Ιn </a>
        </div>
      </div>
      <div id="page-header-loader" class="overlay-header bg-primary">
        <div class="content-header content-header-fullrow text-center">
          <div class="content-header-item">
            <i class="fa fa-sun-o fa-spin text-white"></i>
          </div>
        </div>
      </div>
    </header>
    <main id="main-container">
      <div class="row mx-0 justify-content-center">
        <div class="col-lg-6 col-xl-4">
          <div class="content content-full overflow-hidden">
            <div class="pb-20 text-center">
              <h1 class="h4 font-w700 mt-30 mb-10">Welcome to Rise of Legends Panel</h1>
            </div>
          <form class="js-validation-signin" action="https://theriseoflegends.com/input" method="post" onsubmit="return false;">
              <input type="hidden" name="module_form" value="Modules\Globals\SignIn\SignIn">
              <input type="hidden" name="module" value="signin">
              <input id="type_login" name="type_login" type="hidden" value="email">
              <div class="block block-themed block-rounded block-shadow ">
                <div class="block-header bg-gd-dusk">
                  <h3 class="block-title">Sign in to the Account Panel</h3>
                </div>
                <div class="block-content">
                  <div class="form-group row input-email">
                    <div class="col-12">
                      <label for="email">Account</label>
                      <input type="text" class="form-control" id="username" name="username" placeholder="Enter Account">
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-12">
                      <label for="password">Password</label>
                      <input type="password" class="form-control" id="password" name="password" placeholder="*************">
                    </div>
                  </div>
                  <div class="form-group row mb-0">
                    <div class="col-sm-6 d-sm-flex align-items-center push">
                      <div class="custom-control custom-checkbox mr-auto ml-0 mb-0">
                        <label id="msg"></label>
                      </div>
                    </div>
                    <div class="col-sm-6 text-sm-right push">
                      <button type="submit" onclick="ajaxLogin()" class="btn btn-alt-primary submit-form">
                        <i class="si si-login mr-10"></i> Login </button>
                    </div>
                  </div>
                </div>
                <div class="block-content bg-body-light">
                  <div class="form-group text-center">
                    <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="#">
                      <i class="fa fa-plus mr-5"></i> You can register your account ingame</a>                 
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </main>
    <div class="modal fade" id="modal-ajax" tabindex="-1" role="dialog" aria-labelledby="modal-popout" aria-hidden="true">
      <div class="modal-dialog modal-dialog-popout" role="document">
        <div class="modal-content">
          <form class="modal-ajax-form" action="#" method="post" onsubmit="return false;">
            <div class="block block-themed block-transparent mb-0">
              <div class="block-header bg-primary-dark">
                <h3 class="block-title modal-ajax-title"></h3>
                <div class="block-options">
                  <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                    <i class="si si-close"></i>
                  </button>
                </div>
              </div>
              <div class="block-content modal-ajax-content"></div>
            </div>
            <div class=" modal-ajax-footer block-content block-content-sm block-content-full bg-body-light block-settings-save-fix"></div>
          </form>
        </div>
      </div>
    </div>
  </div>
  </body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</html>
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
    </script>