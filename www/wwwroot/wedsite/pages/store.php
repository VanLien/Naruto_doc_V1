<div class="content content-full" style="border: 2px solid gold; background-color: #454545; padding: 20px; border-radius: 8px;">
  <div class="row">
    <div class="col-lg-3 order-lg-first">
      <!-- left bar -->
      <?php include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeLeftbar.php' ?>
    </div>
    <div class="col-lg-9 box_mw" data-layers-level="2">
      <div class="my-10 text-center">
        <h2 class="font-w700 text-black mb-10">Cửa hàng</h2>
      </div>
      <div class="js-filter" data-numbers="true">
        <div class="p-10 bg-white push">
          <ul class="nav nav-pills">
            <li class="nav-item">
              <a class="nav-link active" href="#" data-category-link="all">Tất cả</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" data-category-link="cat_300">Shop 1</a>
            </li>
          </ul>
        </div>
        <div class="row items-push">
          <?php 
          $data = $dbh ->query("SELECT * FROM ws_shop_item")->fetchAll();
          foreach ($data as $item_detail):
          if($item_detail['sale']>0)
          {
            $giamgia = ($item_detail['cost']/100*$item_detail['sale']);
            $giagiam = '
            <br>
            <small>
              <span class="" style="color: rgb(146, 146, 146);">
                -'.$giamgia.' Xu
              </span>
            </small>
            <span class="badge badge-sale ml-1" title="Discount: Discount">-'.$item_detail['sale'].'%</span>
            ';
            $discount = '<div class="ribbon-box">Giảm - '.$item_detail['sale'].' %</div>';
          }
          else
          {
            $giagiam='';
            $discount = '';
          }
          ?>
          <div class="col-md-6 col-lg-4 col-xl-3" data-category="cat_300">
            <a class="block block-link-shadow block-rounded ribbon ribbon-bookmark ribbon-left ribbon-warning text-center shop-item" href="/buy/<?=$item_detail['id'];?>/">
              <?=$discount;?>
              <div class="shop-img-wrp">
                <img class="shop-img" src="shop/<?=$item_detail['icon'];?>.png">
              </div>
              <div class="block-content block-content-full block-content-sm bg-body-light shop-name">
                <div class="font-size-sm text-muted"><img src="shop/tickets.png" height="20px"> (<?=$item_detail['cost']?> Xu)<?=$giagiam;?></div>
              </div>
              <div class="block-content block-content-full shop-price">
                <div class="font-w600">
                  <?=$item_detail['name']?> (x<?=$item_detail['count'];?>)
                </div>
              </div>
            </a>
          </div>
          <?php endforeach;?>  
        </div>
      </div>
      <script>
        document.addEventListener("DOMContentLoaded", function (event) {
          jQuery(function () {
            Codebase.helpers('content-filter');
          });
        });
      </script>
    </div>
  </div>
</div>
<style>
  .image-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
  }
  .image-container img {
    border: 2px solid cyan;
    background-color: #E0FFFF;
    width: 60px;
    height: 60px;
  }
  @media (max-width: 768px) {
    .image-container img {
      width: 50px;
      height: 50px;
    }
  }
</style>