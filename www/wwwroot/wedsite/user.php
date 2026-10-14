<!doctype html>
<?php
	session_start();
	include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
	include_once "setup.php";
	include_once "pages/menu.php";
?>
<html lang="en" class="no-focus melior">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head lang="en">
  <title>
    <?php 
	 if(isset($pagetitle[$_GET['page']]['name']))
	 {
		 echo $pagetitle[$_GET['page']]['name'];
	 }
	 else
	 {
		 echo $setup[ 'title'];
	 }
	?>
  </title>
  <base href="<?=$setup[ 'domain'];?>">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <meta property="og: title" content="<?=$setup['og:title'];?>">
  <meta property="og: site_name" content="<?=$setup['og:site_name'];?>">
  <meta property="og: type" content="<?=$setup['og:type'];?>">
  <meta property="og: url" content="<?=$setup['og:url'];?>">
  <meta name="description" content="<?=$setup['description'];?>">
  <meta property="og: description" content="<?=$setup['og:description'];?>">
  <meta property="twitter: description" content="<?=$setup['twitter:description'];?>">
  <meta name="keywords" content="<?=$setup['keywords'];?>">
  <meta property="og:image" content="<?=$setup['og:image'];?>">
  <link rel="shortcut icon" href="<?=$setup['shortcut_icon'];?>">
  <link rel="icon" type="image/png" sizes="192x192" href="<?=$setup['shortcut_icon_192x192'];?>">
  <link rel="apple-touch-icon" sizes="32x32" href="<?=$setup['apple-touch-icon'];?>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,400i,600,700">
  <link id="css-main" rel="stylesheet" href="ui//panel/assets/css/codebaseafb3.css?v=1635177793">
  <link rel="stylesheet" href="ui//panel/assets/css/custom96b6.css?v=1633119122">
  <link rel="stylesheet" href="ui//panel/assets/css/panel.css">
  <link rel="stylesheet" href="ui//panel/assets/css/shop.css">
  <link rel="stylesheet" href="ui/panel/assets/js/plugins/slick/slick.css">
   <link rel="stylesheet" href="ui/panel/assets/js/plugins/slick/slick-theme.css">
   <link rel="stylesheet" href="https://melior.club/ui/panel/assets/js/plugins/ion-rangeslider/css/ion.rangeSlider.css">

</head>
<body>
  <div style='display:none' id='sbbhscc'></div>
  <div id='sbbfrcc' style='position: absolute; top: -10px; left: 30px; font-size:1px'></div>
  <!-- Page Container-->
  <div id="page-container" class="sidebar-inverse side-scroll main-content-boxed enable-page-overlay side-trans-enabled sidebar-inverse black ">
    <!-- Sidebar -->
    <nav id="sidebar">
      <!-- Sidebar Scroll Container -->
      <div id="sidebar-scroll">
        <!-- Sidebar Content -->
        <div class="sidebar-content">
          <!-- Side Header -->
          <div class="content-header content-header-fullrow bg-black-op-10">
            <div class="content-header-section text-center align-parent">
              <button type="button" class="btn btn-circle btn-dual-secondary d-lg-none align-v-r" data-toggle="layout" data-action="sidebar_close">
                <i class="fa fa-times text-danger"></i>
              </button>
              <!-- END Close Sidebar -->

              <!-- Logo -->
              <div class="content-header-item">
                <a class="link-effect font-w700" href="index.html">
                  <span class="font-size-xl text-dual-primary-dark">HMNGAME</span>
                </a>
              </div>
              <!-- END Logo -->
            </div>
          </div>
          <!-- END Side Header -->

          <!-- Side Main Navigation -->
          <div class="content-side content-side-full">
            <ul class="nav-main">
              <?php foreach ($menu_data as $menu_value) { echo '
						<li class=""><a href="'.$menu_value[ 'link'].'" target="" lv_menu="'.$menu_value[ 'lv_menu'].'" class=" ">'.$menu_value[ 'icon'].'<span class="sidebar-mini-hide">'.$menu_value[ 'name'].'</span></a>
						</li>
					'; } ?>
            </ul>
          </div>
          <!-- END Side Main Navigation -->
        </div>
        <!-- Sidebar Content -->
      </div>
      <!-- END Sidebar Scroll Container -->
    </nav>
    <!-- END Sidebar -->
    <!-- Header -->
    <header id="page-header">
      <!-- Header Content -->
      <div class="content-header">
        <!-- Left Section -->
        <div class="content-header-section">
          <div class="content-header-item">
            <a href="index.html">
			  <?=$setup['logo'];?>
            </a>
          </div>
        </div>
        <!-- END Left Section -->
        <!-- Middle Section -->
        <div class="content-header-section d-none d-lg-block">
          <ul class="nav-main-header">
            <?php
			if(isset($_SESSION['is_login']))
			{
				$menu_data_array = $menu_data_login;
			}
			else
			{
				$menu_data_array = $menu_data;
			}
			foreach ($menu_data_array as $menu_value) { echo '
						<li class=""><a href="'.$menu_value[ 'link'].'" target="" lv_menu="'.$menu_value[ 'lv_menu'].'" class=" ">'.$menu_value[ 'icon'].'<span class="sidebar-mini-hide">'.$menu_value[ 'name'].'</span></a>
						</li>
					'; }
			?>
          </ul>
          <!-- END Header Navigation -->
        </div>
        <!-- END Middle Section -->
        <!-- Right Section -->
		
        <div class="content-header-section">
		<?php
		if(isset($_SESSION['is_login']))
		{
			echo '<a href="javascript:void(0)" data-action="ajax/logout.php" class="btn btn-rounded btn-dual-secondary mr-5 submit-btn">
                    '.$_SESSION['niceUsername'].' <i class="si si-logout"></i>
                </a>
				';
		}
		else
		{
			echo '<a href="/sign-in" class="btn btn-dual-secondary mr-5 active">
            <i class="si si-login"></i> Đăng nhập </a>
          <a href="/register" class="btn btn-dual-secondary ">
            <i class="fa fa-user-plus"></i> Đăng ký </a>';
		}
		?>
          
          <!-- Toggle Sidebar -->
          <button type="button" class="btn btn-circle btn-dual-secondary d-lg-none" data-toggle="layout" data-action="sidebar_toggle">
            <i class="fa fa-navicon"></i>
          </button>
          <!-- END Toggle Sidebar -->
        </div>
        <!-- END Right Section -->
      </div>
      <!-- END Header Content -->
      <!-- Header Loader -->
      <div id="page-header-loader" class="overlay-header bg-primary">
        <div class="content-header content-header-fullrow text-center">
          <div class="content-header-item">
            <i class="fa fa-sun-o fa-spin text-white"></i>
          </div>
        </div>
      </div>
      <!-- END Header Loader -->
    </header>
    <!-- END Header -->
    <!-- Main Container -->
    <main id="main-container">
      <?php
		if(isset($_GET['page']))
			$page = $_GET['page'];
		else
			$page = "";
		if(file_exists("pages/".$page.".php")){
			if(isset($_SESSION['is_login']) && $page <> 'sign-in' && $page <> 'reminder' && $page <> 'store' && $page <> 'donations' && $page <> 'register')
			{
				include_once "pages/".$page.".php";
			}
			elseif($page == 'sign-in')
			{
				include_once "pages/sign-in.php";
			}
			elseif($page == 'reminder')
			{
				include_once "pages/reminder.php";
			}
			elseif($page == 'verify')
			{
				include_once "pages/verify.php";
			}
			elseif($page == 'store')
			{
				include_once "pages/store.php";
			}
			elseif($page == 'donations')
			{
				include_once "pages/donations.php";
			}
			elseif($page == 'register')
			{
				include_once "pages/register.php";
			}
			else
			{
				include_once "pages/sign-in.php";
			}
		}
		else
		{
		   if(isset($_SESSION['is_login']))
		   {
			   include_once "pages/panel.php";
		   }
		   else
		   {
			   include_once "pages/sign-in.php";
		   }
		}
	  ?>
    </main>
    <!-- END Main Container -->
    <?php include_once "modal-popout.php"; ?>
  </div>
  <!-- END Page Container -->
  <!-- Core JS -->
  <script src="/ui/panel/assets/js/codebase.core.min.js?v=1633119122"></script>
<script src="/ui/panel/assets/js/codebase.app.min.js?v=1633119122"></script>
<script src="/ui/panel/assets/js/plugins/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="/ui/panel/assets/js/plugins/bootstrap-history-tabs/bootstrap-history-tabs.js?v=2"></script>
<script src="/ui/panel/assets/js/plugins/masonry/masonry.pkgd.min.js"></script>
<script src="/ui/panel/assets/js/mmoweb.js?v=1633119122"></script>
<script src="https://mmoweb.info/watch.js"></script>
<script>
  window.masonry_div = $('.grid').masonry({
    itemSelector: '.grid-item',
    columnWidth: '.grid-sizer',
    percentPosition: true
  });
  $('.nav-tabs a').historyTabs();
</script>
<script src="/ui/panel/assets/js/plugins/jquery-raty/jquery.raty.js"></script>
<script src="/ui/panel/assets/js/plugins/jquery.countdown/jquery.plugin.min.js"></script>
<script src="/ui/panel/assets/js/plugins/jquery.countdown/jquery.countdown.min.js"></script>
<script src="/ui/panel/assets/js/plugins/slick/slick.min.js"></script>
<script src="https://melior.club/ui/panel/assets/js/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
<script>
function getnickname(sid) {
		$("#actorname").html("");
        $.getJSON("/api/getCharnameNew.php?sid=" + sid, function (result) {
          var $dropdown = $("#actorname");
		  if(result.ID === ""){
			  $dropdown.append($("<option />").val("").text("Bạn chưa tạo nhân vật ở máy chủ này"));
			  //$("#notinick").html("<a href='addnickname'>>>>>Click here for character updates<<<<<</a>");
		  }
		  else
		  {
			  $("#notinick").html("Kiểm tra kỹ tên nhân vật trước khi mua");
			  $.each(result, function () {
				$dropdown.append($("<option />").val(this.ID).text(this.Nickname));
			  });
		  }
        });
      }
function getnickname1(sid) {
		$("#actorname1").html("");
        $.getJSON("/api/getCharnameNew.php?sid=" + sid, function (result) {
          var $dropdown = $("#actorname1");
		  if(result.ID === ""){
			  $dropdown.append($("<option />").val("").text("Bạn chưa tạo nhân vật ở máy chủ này"));
			  //$("#notinick").html("<a href='addnickname'>>>>>Click here for character updates<<<<<</a>");
		  }
		  else
		  {
			  $("#notinick").html("Kiểm tra kỹ tên nhân vật trước khi mua");
			  $.each(result, function () {
				$dropdown.append($("<option />").val(this.ID).text(this.Nickname));
			  });
		  }
        });
      }
$( document ).ready(function() {
			$.getJSON("api/listServer.php?type=select_list", function(result) {
				var $dropdown = $("#inputGameServer");
				$.each(result, function() {
					$dropdown.append($("<option />").val(this.sid).text(this.name));
				});
			});
		});
$( document ).ready(function() {
			$.getJSON("api/listServer.php?type=select_list", function(result) {
				var $dropdown = $("#inputGameServer1");
				$.each(result, function() {
					$dropdown.append($("<option />").val(this.sid).text(this.name));
				});
			});
		});
// Get user info
function ajaxGetUserInfo() {
  var uid = 123;
  $.post('/api/users/AjaxGetUserInfo.php', {
      uid: uid
    }, function (result) {
      if (result.status) {
        if (result.avatar != '') {
          $("#avatar").attr("src", result.avatar);
        }
        ver_icon = '';
        if (result.verify) {
          ver_icon = '<a class="p-1" href ="#" data-toggle="tooltip" data-html="true" data-placement="right" title="Đã xác minh"><img src="/assets/img/verify.png"></a>';
        }
        if (result.first_name != null || result.last_name != null)
          var fullname = result.last_name + ' ' + result.first_name;
        else
          var fullname = result.niceUsername;
        $(".fullname").val(fullname);
        $(".fullname_txt").html(fullname + ver_icon);
        $(".niceUsername").html(result.niceUsername);
        $("#phonenumber").val(result.phonenumber);
        $("#idcard").val(result.idcard);
        $("#email").val(result.email);
        $("#xu").html(result.xu);
        $("#xu2").html(result.xu2);
        $("#xu_lock").html(result.xu_lock);
        $("#vip_level").html(result.vip_level);
        $("[data-toggle=tooltip]").tooltip();
      } else {
        $("#msg2").addClass("alert alert-danger").html(result.msg);
      }
    },
    'JSON'
  );
}
ajaxGetUserInfo();
</script>
</body>
</html>