<?php
$id = intval($_GET['id']);
if($id==0)
{
	exit;
}
else
{
	$datashop = $dbh ->query("SELECT * FROM ws_shop_item where id='$id'")->fetch();
}
?>
<div class="content content-full">
  <div class="row">
    <div class="col-12 box_mw" data-layers-level="2">
      <div class="my-10 text-center">
        <h2 class="font-w700 text-black mb-10"><?=$datashop['name'];?></h2>
        <h3 class="h5 text-muted mb-0"><?=$datashop['name'];?> x(<?=$datashop['count'];?>) = <img src="shop/tickets.png" height="20px"> <?=$datashop['cost'];?> Tickets</h3>
      </div>
      <form action="api/shop/do2.php" method="post" onsubmit="return false;">
        <input type="hidden" name="module_form" value="Modules\Plugins\Shop\Shop">
        <input type="hidden" name="module" value="ajax_buy_shop">
        <input type="hidden" name="shop_id" value="<?=$datashop['id'];?>">
        <input type="hidden" id="type_buy" name="type_buy" value="buyitem">
        <div class="row">
          <div class="col-md-8">
            <div class="block block-rounded p-20">
              <h3 class="h5 text-muted mb-0 text-center pt-5">Product list</h3>
              <div class="isel-list">
                <div class="isel isel_header">
                  <div class="isel__checkbox checkbox checkbox_fill">
                    <div class="checkbox__label">
                      <div class="checkbox__content checkbox__content_header isel__heading">Name</div>
                    </div>
                  </div>
                  <div class="isel__quantity isel__quantity_header isel__heading">
                    Qty. </div>
                  <div class="isel__price isel__price_header isel__heading">
                    Price <span class="badge badge-sale ml-1" style="position: absolute;padding: 1px;" title="Discount: Discount">-<?=$datashop['sale'];?>%</span>
                  </div>
                </div>
                <!-- END isel isel_header -->
                <div class="isel">
                  <div class="isel__checkbox checkbox checkbox_fill">
                    <label class="checkbox__label">

                      <input type="checkbox" class="checkbox__input" name="pack" value="<?=$datashop['id'];?>" data-price="<?=$datashop['count'];?>" data-apiece="<?=$datashop['cost'];?>" />
                      <div class="checkbox__block"></div>
                      <img data-item="<?=$datashop['id'];?>" class="isel__img" src="shop/<?=$datashop['icon'];?>.png" width="27px" data-toggle="popover" data-placement="top" data-content="" data-original-title="<?=$datashop['name'];?> ">
                      <div class="checkbox__content"><?=$datashop['name'];?> </div> <span class="text-success mr-5" title="Count pack">x<?=$datashop['count'];?></span> </label>
                  </div>
                  <div class="isel__quantity">
                    <div class="input-group input_count">
                      <div class="input-group-prepend">
                        <button class="btn btn-sm minus-btn"><i class="fa fa-minus"></i>
                        </button>
                      </div>
                      <input type="number" class="form-control form-control-sm text-center qty_input isel__qty" data-apiece-count="<?=$datashop['cost'];?>" name="num" value="0" min="0" disabled>
                      <div class="input-group-prepend">
                        <button class="btn btn-sm plus-btn"><i class="fa fa-plus"></i>
                        </button>
                      </div>
                    </div>
                  </div>
                  <div class="isel__price" title="Melior Coin"><?=$datashop['cost'];?></div>
                </div>
                <!-- END isel -->
                <div class="isel isel_footer">
                  <div class="isel__checkbox checkbox checkbox_fill">

                  </div>
                  <div class="isel__quantity isel__quantity_header isel__heading">
                    Payment receipt </div>
                  <div class="isel__price isel__price_header isel__heading" data-total-price>0.00</div>
                </div>
                <!-- END isel isel_header -->
              </div>
              <!-- END isel-list -->
              <div class="block">
              <!--  <ul class="nav nav-tabs nav-tabs-alt" data-toggle="tabs" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" href="buyitem">Transfer to the game</a>
                  </li>
                </ul> -->
                <div class="block-content tab-content">
                  <div class="tab-pane active" id="ma" role="tabpanel">
                    <div class="form-group row justify-content-center">
                      <div class="col-lg-10">
                        <div class="in-game-message"></div>
                      </div>
                    </div>
					<div class="form-group row justify-content-center">
                      <div class="col-lg-10">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-server"></i></span>
                          </div>
                          <select onchange="getnickname(this.value)" id="inputGameServer" name="server" class="form-control" size="1">
                            <option value="0">- Chọn máy chủ -</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="form-group row justify-content-center">
                      <div class="col-lg-10">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                          </div>
                          <select id="actorname" name="actorname" class="form-control" size="1">
                            <option value="0">Chọn nhân vật</option>
                          </select>
						  
                        </div>
						<small style="color:red;" id="notinick">Vui lòng chọn máy chủ trước</small>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" id="warehouse" role="tabpanel">
                    <p>Sau khi mua vật phẩm sẽ được chuyển đến hòm thư game.</p>
                  </div>
                </div>
              </div>
              <div class="block-content block-content-sm block-content-full bg-body-light text-center mt-20">
                <button type="submit" class="btn btn-alt-primary submit-form"><i class="fa fa-money mr-5"></i> Mua Item</button>
				<a href="/store" class="btn btn-warning text-dark font-weight-bold"><i class="si si-action-undo"></i> Trở Về  </a>
              </div>
			 
            </div>
          </div>
          <div class="col-md-4">
            <?php $data=$dbh->query("SELECT * FROM ws_shop_item where sale>0 ORDER BY RAND()
			LIMIT 1;")->fetchAll(); foreach ($data as $item_detail): if($item_detail['sale']>0) { $giamgia = ($item_detail['cost']/100*$item_detail['sale']); $giagiam = '
            <br>
            <small>
				<span class="" style="color: rgb(146, 146, 146);">
					-'.$giamgia.' Tickets
				</span>
			</small>
            <span class="badge badge-sale ml-1" title="Discount: Discount">-'.$item_detail['sale'].'%</span> '; $discount = '
            <div class="ribbon-box">Discount - '.$item_detail['sale'].' %</div>'; } else { $giagiam=''; $discount = ''; } ?>
            <div class="block block-rounded ribbon ribbon-bookmark ribbon-left ribbon-warning">
              <a class="block block-link-shadow block-rounded ribbon ribbon-bookmark ribbon-left ribbon-warning text-center shop-item" href="/buy/<?=$item_detail['id'];?>/">
                <?=$discount;?>
                  <div class="shop-img-wrp">
                    <img class="shop-img" style="width: 65px;" src="shop/<?=$item_detail['icon'];?>.png">
                  </div>
                  <div class="block-content block-content-full block-content-sm bg-body-light shop-name">
                    <div class="font-size-sm text-muted">(
                      <?=$item_detail['cost']?> Gcoin)
                        <?=$giagiam;?>
                    </div>
                  </div>
                  <div class="block-content block-content-full shop-price">
                    <div class="font-w600">
                      <?=$item_detail['name']?> (x
                        <?=$item_detail['count'];?>)

                    </div>
                  </div>
              </a>
            </div>
            <?php endforeach;?>
          </div>
        </div>
      </form>
      <script>
        document.addEventListener("DOMContentLoaded", function (event) {

          $(document).ready(function () {
            $('body').on('click', '.plus-btn', function (e) {
              let qty_input = $(this).parents('.input_count').find('.qty_input');
              qty_input.val(parseInt(qty_input.val()) + 1);
              if (qty_input.val() == 1) {
                qty_input.prop('disabled', false);
                let key = qty_input.attr('data-apiece-count');
                $('[data-apiece="' + key + '"]').prop("checked", true);
              }
              total_sum();
            });
            $('body').on('click', '.minus-btn', function (e) {
              let qty_input = $(this).parents('.input_count').find('.qty_input');
              qty_input.val(parseInt(qty_input.val()) - 1);

              if (qty_input.val() == 0) {
                qty_input.prop('disabled', true);
                let key = qty_input.attr('data-apiece-count');
                $('[data-apiece="' + key + '"]').prop("checked", false);
              } else if (qty_input.val() < 0) {
                qty_input.val(0);
              }
              total_sum();
            });
            $('body').on('keyup change click', '[data-apiece-count]', function (e) {
              let this__ = $(this);
              let key = this__.attr('data-apiece-count');
              let count = this__.val();
              if (count.length == 0) {
                this__.val(0);
              } else if (count <= 0) {
                this__.prop('disabled', true).val(0);
                $('[data-apiece="' + key + '"]').prop("checked", false);
              }
              total_sum();
            });
            $('body').on('change', '[data-price]', function (e) {
              let this__ = $(this);
              let key = this__.attr('data-apiece');
              if (key) {
                if (this__.is(':checked')) {
                  $('[data-apiece-count="' + key + '"]').prop('disabled', false).val(1);
                } else {
                  $('[data-apiece-count="' + key + '"]').prop('disabled', true).val(0);
                }
              }
              total_sum();
            });

            function total_sum() {
              let item_list = $('[data-price]:checked');
              let sum = 0;
			  let giamgia = 0;
              item_list.each(function (i, e) {
                let element = $(e);
                let key = element.attr("data-apiece");
                if (key) {
                  let count = $('[data-apiece-count="' + key + '"]').val();
                  sum += parseFloat(element.attr('data-price')) * parseFloat(count-1);
				  giamgia = sum/100 * <?=$datashop['sale'];?>;
				  sum = sum - giamgia;
				  if(sum==0)
				  {
					  sum = <?=$datashop['cost'];?>;
				  }
                } else {
                  sum += parseFloat(element.attr('data-price'));
                }
              });
              $('[data-total-price]').html(sum.toFixed(2) + "");
            }

            $('.nav-tabs').on('click', '.nav-link', function () {
              $('#type_buy').val($(this).attr('href'));
            });
            $('.nav-link.active').click();

            $('body').on('change', '#account_name_in_game', function (e) {
              let char_list = JSON.parse('{"makluso":[]}');
              let account_id = $(this).val();
              let char_name_in_game = $('#char_name_in_game');

              if (account_id != '0') {
                char_name_in_game.find('option').remove().end().prop('disabled', true);
                if (char_list[account_id].length !== 0) {

                  $.each(char_list[account_id], function (char_id, name) {
                    char_name_in_game.append('<option value="' + name + '" >' + name + '</option>');
                  });
                  char_name_in_game.prop('disabled', false);
                } else {
                  char_name_in_game.append('<option value="0">No characters found</option>');
                }
              } else {
                char_name_in_game.prop('disabled', true);
              }
            });
			$('.submit-form').on('click', function (e) {
			e.preventDefault();
				let serverValue = $('#inputGameServer').val(); 

				if (serverValue == 0) { 
				alert('Vui lòng chọn máy chủ trước khi mua item.');
				$('#notinick').show(); 
				return false;
				}

        
				$(this).closest('form').submit();
				});

				
				$('#inputGameServer').on('change', function () {
				if ($(this).val() != 0) {
				$('#notinick').hide(); 
				}
				});
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
  </div>
  
