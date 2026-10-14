<div class="content content-full">
  <div class="grid">
    <div class="grid-sizer col-12 col-md-6 col-xl-4 box_mw" data-layers-level="1"></div>
    <div class="grid-item col-md-12 col-sm-12 box_mw" data-layers-level="2">
      <div class="row invisible" data-toggle="appear">
        <div class="col-12 col-xl-8">
          <div class="block block-rounded block-bordered block-link-shadow options-container">
            <div class="block-content block-content-full clearfix">
              <div class="font-size-h3 font-w600" style="font-size: 15px;">
                <?php
                  $stmt = $dbh->prepare("SELECT noti FROM ws_noti WHERE ID = :id");
                  $stmt->execute([':id' => 1]);
                  $check = $stmt->fetch();
                  if ($check) {
                    echo htmlspecialchars($check['noti'], ENT_QUOTES, 'UTF-8');
                  } else {
                    echo 'No notification found.';
                  }
                ?>
              </div>
            </div>
          </div>
        </div>
        <div class="col-4 col-xl-4">
          <div class="block block-rounded block-bordered block-link-shadow options-container">
            <div class="block-content block-content-full clearfix d-flex align-items-center justify-content-between">
              <div class="d-flex align-items-center">
                <img src="shop/risecoins.png" height="30px" class="mr-2">
                <div>
                  <div class="font-size-h3 font-w600 balance_html" id="xu">0</div>
                  <div class="font-size-sm font-w600 text-uppercase text-muted">Xu</div>
                </div>
              </div>
            </div>
            <div class="options-overlay bg-white">
              <div class="options-overlay-content">
                <ul class="nav nav-pills flex-column push mb-0 ml-10">
                  <li class="nav-item">
                    <a class="nav-link d-flex align-items-center justify-content-between p-1" href="/donations">
                      <span><i class="si fa-fw si-plus mr-5" style="color: #fab81b;"></i> Nạp tiền</span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link d-flex align-items-center justify-content-between p-1" href="javascript:void(0)" onclick="ajaxGetUserInfo();">
                      <span><i class="fa fa-fw fa-refresh mr-5"></i>Refresh</span>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <script>
        document.addEventListener("DOMContentLoaded", function (event) {
          function swich_status_widget_head(btn) {
            $(".options-overlay-show").removeClass("options-overlay-show");
            if (($('.options-overlay').length - 1) >= btn) {
              $(".options-overlay").eq(btn).addClass("options-overlay-show");
              btn++;
              setTimeout(swich_status_widget_head, 1000, btn);
            } else {
              setTimeout(swich_status_widget_head, 15000, 0);
            }
          }
          setTimeout(swich_status_widget_head, 5000, 0);
        });
      </script>
    </div>
    <div class="grid-item col-12 col-xl-8 box_mw" data-layers-level="3">
      <div class="block block-rounded ribbon ribbon-modern ribbon-primary invisible" data-toggle="appear">
        <div class="block-content">
          <div class="mb-20"><span class="d-none d-md-inline-block">Chức năng chính</span></div>
          <div id="account_list_info" role="tablist" aria-multiselectable="true">
            <div class="block block-bordered block-rounded mb-2 list_account open">
              <div class="block-header pt-10 pb-10 pr-10 accordion_account" role="tab" id="account_list_info__makluso_h1">
                <a class="font-w600" data-toggle="collapse" data-parent="#account_list_info" href="#account_list_info_makluso_q1" aria-expanded="true" aria-controls="account_list_info_makluso_q1">Ẩn</a>
                <div class="float-left text-right">
                  <i class="fa fa-info-circle text-primary" data-toggle="popover" title="" data-html="true" data-placement="top" data-content="Status: Active" data-original-title="<?=$_SESSION['niceUsername'];?>"></i>
                </div>
              </div>
              <div id="account_list_info_makluso_q1" class="collapse show" role="tabpanel" aria-labelledby="account_list_info_makluso_h1">
                <div class="d-flex">
                  <a href="/donations" class="w-50 pr-3 pb-4">
                    <div class="card border-0 border-bottom-yellow shadow-lg shadow-hover">
                      <div class="card-body text-center">
                        <div class="text-center"><img class="shadow-effect" src="shop/topup.png" width="70" height="70"></div>
                        <br> <font color='lime'><b>Nạp XU WEB</b></font></br>
                        <br> <font color='orange'><b>TOP UP</b></font></br>
                      </div>
                    </div>
                  </a>
				  <a href="/giftcode" class="w-50 pr-3 pb-4">
                    <div class="card border-0 border-bottom-yellow shadow-lg shadow-hover">
                      <div class="card-body text-center">
                        <div class="text-center"><img class="shadow-effect" src="shop/giftcode.png" width="70" height="70"></div>
                        <br> <font color='lime'><b>Nhận Code</b></font></br>
                        <br> <font color='orange'><b>GIFTCODE</b></font></br>
                      </div>
                    </div>
                  </a>
         <!--         <a href="/exchange" class="w-50 pr-3 pb-4">
                    <div class="card border-0 border-bottom-yellow shadow-lg shadow-hover">
                      <div class="card-body text-center">
                        <div class="text-center"><img class="shadow-effect" src="shop/rewards.png" width="70" height="70"></div>
                        <br> <font color='lime'><b>Đổi KC Lên VIP</b></font></br>
                        <br> <font color='orange'><b>Exchange Dias Up VIP</b></font></br>
                      </div>
                    </div>
                  </a>
                 <a href="/exchange1" class="w-50 pr-3 pb-4">
                    <div class="card border-0 border-bottom-yellow shadow-lg shadow-hover">
                      <div class="card-body text-center">
                        <div class="text-center"><img class="shadow-effect" src="shop/rewards.png" width="70" height="70"><img src="../images/new.jpg"></div>
                        <br> <font color='lime'><b>Đổi Xu Ingame</b></font></br>
                        <br> <font color='orange'><b>Coin Ingame</b></font></br>
                      </div>
                    </div>
                  </a>-->
                </div>
                
                
			<!--	<div class="d-flex">
                  <a href="/giftcode" class="w-50 pr-3 pb-4">
                    <div class="card border-0 border-bottom-yellow shadow-lg shadow-hover">
                      <div class="card-body text-center">
                        <div class="text-center"><img class="shadow-effect" src="shop/giftcode.png" width="70" height="70"></div>
                        <br> <font color='lime'><b>Nhận Code</b></font></br>
                        <br> <font color='orange'><b>GIFTCODE</b></font></br>
                      </div>
                    </div>
                  </a>
				  
                  <a href="/tichnap" class="w-50 pr-3 pb-4">
                    <div class="card border-0 border-bottom-yellow shadow-lg shadow-hover">
                      <div class="card-body text-center">
                        <div class="text-center"><img class="shadow-effect" src="shop/risecoins.png" width="70" height="70"><img src="../images/new.jpg"></div>
                        <br> <font color='lime'><b>Tích Nạp</b></font></br>
                        <br> <font color='orange'><b>Accumulation</b></font></br>
                      </div>
                    </div>
                  </a>
                  
                </div>
				<div class="d-flex">
                 <a href="/bxhtoptuan" class="w-50 pr-3 pb-4">
                    <div class="card border-0 border-bottom-yellow shadow-lg shadow-hover">
                      <div class="card-body text-center">
                        <div class="text-center"><img class="shadow-effect" src="shop/rewards.png" width="70" height="70"><img src="../images/new.jpg"></div>
                        <br> <font color='lime'><b>Top Nạp</b></font></br>
                        <br> <font color='orange'><b>TOP Donate</b></font></br>
                      </div>
                    </div>
                  </a>
				  <a href="/duatop" class="w-50 pr-3 pb-4">
                    <div class="card border-0 border-bottom-yellow shadow-lg shadow-hover">
                      <div class="card-body text-center">
                        <div class="text-center"><img class="shadow-effect" src="shop/rewards.png" width="70" height="70"><img src="../images/new.jpg"></div>
                        <br> <font color='lime'><b>Top Lực Chiến</b></font></br>
                        <br> <font color='orange'><b>Top BP</b></font></br>
                      </div>
                    </div>
                  </a>
                  
                </div>-->
			<!--	<div class="d-flex">
					<a href="/spin" class="w-50 pr-3 pb-4">
                    <div class="card border-0 border-bottom-yellow shadow-lg shadow-hover">
                      <div class="card-body text-center">
                        <div class="text-center"><img class="shadow-effect" src="shop/spinicon.png" width="70" height="70"><img src="../images/new.jpg"></div>
                        <br> <font color='lime'><b>VQMM" </b></font></br>
                        <br> <font color='orange'><b>Lucky Spin</b></font></br>
                      </div>
                    </div>
					</a>
					<a href="/daugia" class="w-50 pr-3 pb-4">
                    <div class="card border-0 border-bottom-yellow shadow-lg shadow-hover">
                      <div class="card-body text-center">
                        <div class="text-center"><img class="shadow-effect" src="shop/daugia.png" width="70" height="70"><img src="../images/new.jpg"></div>
                        <br> <font color='lime'><b>Đấu Giá" </b></font></br>
                        <br> <font color='orange'><b>Auction</b></font></br>
                      </div>
                    </div>
					</a>
					<a href="/boxnoel" class="w-50 pr-3 pb-4">
                    <div class="card border-0 border-bottom-yellow shadow-lg shadow-hover">
                      <div class="card-body text-center">
                        <div class="text-center"><img class="shadow-effect" src="shop/noel.png" width="70" height="70"><img src="../images/new.jpg"></div>
                        <br> <font color='lime'><b>Hộp Mù Noel </b></font></br>
                        <br> <font color='orange'><b>Box Noel</b></font></br>
                      </div>
                    </div>
					</a>
				
				</div>
				-->
              </div>
            </div>
          </div>
        </div>
      </div>
      <script>
        document.addEventListener("DOMContentLoaded", function (event) {
          $('#account_list_info').on('click', '.list_account > .accordion_account > a', function () {
            if ($(this).parent().parent().hasClass('open')) {
              $(this).parent().parent().removeClass('open');
            } else {
              $(this).parent().parent().addClass('open');
            }
            setTimeout(() => window.masonry_div.masonry('layout'), 200);
          });
        });
      </script>
    </div>
    <div class="grid-item col-12 col-md-6 col-xl-4 box_mw" data-layers-level="4"></div>
    <div class="grid-item col-12 col-md-6 col-xl-4 box_mw" data-layers-level="4"></div>
    <div class="grid-item col-12 col-md-6 col-xl-4 box_mw" data-layers-level="5"></div>
    <div class="grid-item col-12 col-md-6 col-xl-4 box_mw" data-layers-level="6" style="position: absolute; left: 66.6667%; top: 379.906px;">
      <div class="row items-push js-slider" data-dots="true" data-autoplay="true" data-autoplay-speed="2000">
        <?php 
          $data = $dbh->query("SELECT * FROM ws_shop_item WHERE sale>0")->fetchAll();
          foreach ($data as $item_detail):
            if ($item_detail['sale'] > 0) {
              $giamgia = ($item_detail['cost'] / 100 * $item_detail['sale']);
              $giagiam = '<br><small><span style="color: rgb(146, 146, 146);">-' . $giamgia . ' Xu</span></small><span class="badge badge-sale ml-1">-' . $item_detail['sale'] . '%</span>';
              $discount = '<div class="ribbon-box">Giảm - ' . $item_detail['sale'] . ' %</div>';
            } else {
              $giagiam = '';
              $discount = '';
            }
        ?>
        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn" data-category="cat_300">
          <a class="block block-link-shadow block-rounded ribbon ribbon-bookmark ribbon-left ribbon-warning text-center shop-item" href="/buy/<?=$item_detail['id'];?>">
            <?=$discount;?>
            <div class="shop-img-wrp">
              <img class="shop-img shadow-effect" style="width: 65px;" src="shop/<?=$item_detail['icon'];?>.png">
            </div>
            <div class="block-content block-content-full block-content-sm bg-body-light shop-name">
              <div class="font-size-sm text-muted">(<?=$item_detail['cost']?> Xu)<?=$giagiam;?></div>
            </div>
            <div class="block-content block-content-full shop-price">
              <div class="font-w600"><?=$item_detail['name']?> (x<?=$item_detail['count'];?>)</div>
            </div>
          </a>
        </div>
        <?php endforeach; ?>
      </div>
    </div>
  </div>
  <script>
    document.querySelectorAll('div.box_mw').forEach(div => {
      if (div.textContent.trim() === '') {
        div.remove();
      }
    });
  </script>
  <script>
    document.addEventListener("DOMContentLoaded", function (event) {
      jQuery.fn.raty.defaults.starType = 'i';
      jQuery.fn.raty.defaults.hints = ['Bad', 'Not very good', 'Good', 'Very good!', 'Awesome!'];
      jQuery('.js-rating').each((index, element) => {
        let el = jQuery(element);
        el.raty({
          score: el.data('score') || 0,
          number: el.data('number') || 5,
          cancel: el.data('cancel') || false,
          target: el.data('target') || false,
          targetScore: el.data('target-score') || false,
          precision: el.data('precision') || false,
          cancelOff: el.data('cancel-off') || 'fa fa-fw fa-times-circle text-danger',
          cancelOn: el.data('cancel-on') || 'fa fa-fw fa-times-circle',
          starHalf: el.data('star-half') || 'fa fa-fw fa-star-half text-warning',
          starOff: el.data('star-off') || 'fa fa-fw fa-star text-muted',
          starOn: el.data('star-on') || 'fa fa-fw fa-star text-warning',
          scoreName: 'vote[' + el.data('type') + ']'
        });
      });
    });
  </script>
  <script>
    document.addEventListener("DOMContentLoaded", function (event) {
      jQuery(function () {
        Codebase.helpers('content-filter');
      });
      jQuery(function () {
        Codebase.helpers('slick');
      });

      $("[data-sale-timer]").each(function (indx, element) {
        const __this = $(this);
        let austDay = new Date(__this.attr('data-sale-timer') * 1000);
        let layout = '{dn} {dl} {hnn}{sep}{mnn}{sep}{snn}';
        if (parseInt(__this.attr('data-sale-date')) === 0) {
          layout = '{hnn}{sep}{mnn}{sep}{snn}'
        }
        __this.countdown({
          until: austDay,
          layout: layout,
        });
      });

    });
  </script>
</div>


<!-- Thêm CSS để tạo hiệu ứng đánh bóng cho ảnh -->
<style>
  .shadow-effect {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: box-shadow 0.3s ease-in-out;
  }

  .shadow-effect:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
  }

  .d-flex {
    display: flex;
    align-items: center;
  }

  .mr-2 {
    margin-right: 0.5rem;
  }

  .text-center {
    text-align: center;
  }

  .mt-3 {
    margin-top: 1rem;
  }

  .btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    color: white;
    padding: 0.5rem 1rem;
    text-decoration: none;
    display: inline-block;
    font-size: 1rem;
    border-radius: 0.25rem;
  }
</style>
