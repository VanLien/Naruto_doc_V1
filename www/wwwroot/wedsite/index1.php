<!DOCTYPE html>
<?php
	include_once "pages/menu.php";
	include_once "setup.php";
?>
<html lang="en" class="no-focus melior">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head lang="en">
  <title>
    <?=$setup[ 'title'];?>
  </title>
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
  <link rel="shortcut icon" href="ui//site/melior/assets/images/favicon/favicon.png">
  <link rel="stylesheet" href="ui//site/melior/assets/css/main90c6.css?ver=1664897596">
  <link rel="stylesheet" href="ui//site/melior/assets/libs/swiper/swiper0bad.css?ver=1634734853">
  <link rel="apple-touch-icon" sizes="256x256" href="ui//site/melior/assets/images/favicon/favicon.png">
  <script src="https://www.googletagmanager.com/gtag/js?id=G-T269QJNDYT" async="true"></script>
  <style>
    .preload {
      background-color: #1d1a19;
      position: fixed;
      z-index: 500;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      display: flex;
      justify-content: center;
      align-items: center;
    }
  </style>

</head>

<body class="body">
  <div style='display:none' id='sbbhscc'></div>
  <div id='sbbfrcc' style='position: absolute; top: -10px; left: 30px; font-size:1px'></div>
  <div class="wrapper">
    <header class="header">
      <nav class="nav">
        <div class="content-area flex-sc">
          <a href="index.html" class="nav__logo flex-cc"><?=$setup['logo'];?>
          </a>
          <div class="nav__links flex-sc">
		  <?php foreach ($menu_home_data as $menu_value) { echo '
						<div class="nav__links-item flex-cc"><a href="'.$menu_value[ 'link'].'">'.$menu_value[ 'name'].'</a>
						</div>
										'; } ?>
          </div>
          <div class="nav__langs">
            <div class="nav__langs-current flex-sc">
              <div class="nav__langs-current-icon flex-cc"><img src="ui//site/melior/assets/images/langs/en.png" alt="">
              </div>
              <div class="nav__langs-current-name">en</div>
              <div class="nav__langs-current-arrow flex-cc"><img src="ui//site/melior/assets/images/langs/arrow.png" alt="">
              </div>
            </div>
            <div class="nav__langs-items flex-ss">
			<?php foreach ($langs as $menu_value) { echo '
						<a href="'.$menu_value[ 'link'].'" class="flex-sc">
							<div class="nav__langs-items-icon flex-cc">'.$menu_value[ 'img'].'
							</div>
							<div class="nav__langs-items-name">'.$menu_value[ 'name'].'</div>
						  </a>
					'; } ?>
              
              
            </div>
          </div>
          <a href="/sign-in" class="button flex-cc"><img src="ui//site/melior/assets/images/icons/sign_in_icon.png" alt=""><span>Tài Khoản</span>
          </a>
          <div class="nav__open-links">
            <div class="nav__open-links-item"></div>
          </div>
        </div>
     

      </nav>
     <div class="header__box flex-cc">
        <div class="header__content">
          <div class="header__content-logo flex-cc">
            <div class="header__content-logo-left"></div>
          <!--  <a href="index.html" class="header__content-logo-center flex-cc">
              <img src="ui//site/melior/assets/images/logos/logo.png" alt="">
            </a>-->
            <div class="header__content-logo-right"></div>
          </div>
          <div class="header__content-promo">
         <!--   <div class="header__content-promo-title"><span>Elora 's Raid</span> </div>-->
         <!--   <div class="header__content-promo-text">Game Chiến Thuật Đối Kháng Cực Hay</div>	-->		
            <div class="header__content-promo-text"></div>
          </div>
          <div class="header__content-sep flex-cc"><img src="ui//site/melior/assets/images/bg/sep.png" alt="">
          </div>
          <div class="header__content-timer">
          <!--   <div class="header__content-timer-title">Phiên Bản Update Liên Tục Các Tướng - Tính Năng Mới Nhất - Phong cách Trung Cổ cực nét</div> -->
            <div class="header__content-timer-time flex-cs timer1" data-time="1667584800" data-lang="en" data-end-msg="<div class='header__content-timer-time-end flex-cc'>""</div>">
              <div class="header__content-timer-time-box">
                <div class="header__content-timer-time-num flex-cc">&nbsp;</div>
                <div class="header__content-timer-time-desc">DAYS</div>
              </div>
              <div class="header__content-timer-time-box">
                <div class="header__content-timer-time-num flex-cc">&nbsp;</div>
                <div class="header__content-timer-time-desc">HOUR</div>
              </div>
              <div class="header__content-timer-time-box">
                <div class="header__content-timer-time-num flex-cc">&nbsp;</div>
                <div class="header__content-timer-time-desc">MIN</div>
              </div>
              <div class="header__content-timer-time-box">
                <div class="header__content-timer-time-num flex-cc">&nbsp;</div>
                <div class="header__content-timer-time-desc">SEC</div>
              </div>
            </div>
          </div>	
					
					
					<a href="https://drive.google.com/file/d/1z_MZIEJnizT5ZzkuSjcTjGBHkyhNb82X/view?usp=sharing" class="button big flex-cc"><span>Download APK (Drive)</span></a>
					<a href="sign-in" class="button big flex-cc"><span>Đăng Nhập</span></a>
		            <a href="https://www.facebook.com/hokagedc" class="button big flex-cc"><span>Fanpage</span></a>
		            <a href="https://zalo.me/g/aibpiq888" class="button big flex-cc"><span>Group Zalo</span></a>					
        </div>
      </div>
    </header>

      </div>


  <link rel="stylesheet" href="ui//site/melior/assets/libs/FontAwesome/css/fontawesome.css">
  <script src="ui//site/melior/assets/js/jquery.min.js"></script>
  <script src="ui//site/melior/assets/js/navigation.js"></script>
  <script src="ui//site/melior/assets/js/timers.js"></script>
  <script src="ui//site/melior/assets/libs/swiper/swiper.js"></script>
  <script src="ui//site/melior/assets/js/scripts6465.js?ver=1647440677"></script>
  <script src="../../mmoweb.info/watch.js"></script>
  <script src="ui//site/melior/assets/js/streams.js"></script>
</body>
</html>