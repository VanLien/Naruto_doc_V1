<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

include_once $_SERVER['DOCUMENT_ROOT'].'/api/shop/config.php';

if(!isset($_SESSION['user_id'])){
		echo "Please log in";
		exit;
	}
	else{
		$user_id = $_SESSION['user_id'];
		
	}


?>

<script>
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
function getCharname(sid){
		$.getJSON("/api/getCharname.php?sid="+sid, function(result) {
			$("#actorname").val(result.msg);
		});
	}

</script>


	<div class="container">
    <div class="row">
		<?php 
		if($_GET['cat'] == '1'){
			$cat = "1";
		}
		elseif($_GET['cat'] == '2'){
			$cat = "2";
		}else{
			$cat = "all";
		}
		$data = $dbh ->query("SELECT * FROM ws_shop_item")->fetchAll();
		//print_r($item_detail);
		//for($i = 0; $i < count($item_detail); $i++){
		foreach ($data as $item_detail):
		if($cat != "all"):
		if($item_detail['cat'] == $cat):
		
		?>
		
		<div class="col-lg-4 col-sm-6 mb-30 pb-3">
            <div class="product-card mx-auto mb-3">
                <div class="product-head d-flex justify-content-between align-items-center"><!--- <span class="badge badge-danger">Sale</span> -->
                </div>
				<div class="text-center">
                <a data-toggle="modal" data-pack="<?=$item_detail['id']?>" data-name="<?=$item_detail['name']?>" data-cost="<?php echo number_format($item_detail['cost'])?>" data-icon="/shop/<?=$item_detail['id']?>.png" width="75" height="75"><img data-toggle="tooltip" data-placement="top" data-delay="300" data-html="true" title="" class="text-success" data-original-title="<img src=/shop/<?=$item_detail['id']?>.PNG ></a>" class="lazy" style="width: 89px;" src="/shop/<?=$item_detail['id']?>.png" alt="<?=$item_detail['name']?>"></a>
				</div>
                <div class="product-card-body"><a class="product-meta" href="#">
				<?php if($item_detail['cat']==1) echo "Equipment"; else echo "Tools";?>
				</a>
                    <h5 class="product-title"><a href="#server" class="confirm-buy" data-toggle="modal" data-name="<?=$item_detail['name']?>" data-cost="<?php echo number_format($item_detail['cost'])?>" data-icon="/shop/<?=$item_detail['id']?>.png" width="75" height="75"" data-pack="<?=$item_detail['id']?>"><?=$item_detail['name']?> x(<?=number_format($item_detail['count'])?>)</a></h5><span class="product-price text-success">
                    <img src="http://127.0.0.1:81/static/img/tickets.png" height="20px"> <?=number_format($item_detail['cost'])?> Tickets</span>
                </div>
                <div class="product-buttons-wrap">
                    <div class="product-buttons">
                        <div class="product-button"><a href="#server" class="confirm-buy" data-toggle="modal" data-name="<?=$item_detail['name']?>" data-cost="<?php echo number_format($item_detail['cost'])?>" data-icon="/shop/<?=$item_detail['id']?>.png" width="75" height="75" data-pack="<?=$item_detail['id']?>" ><i class="fa fa-shopping-cart"></i></a></div>
                    </div>
                </div>
            </div>
        </div>
		<?php endif;?>
		<?php else:?>
		<div class="col-lg-4 col-sm-6 mb-30 pb-3">
            <div class="product-card mx-auto mb-3">
                <div class="product-head d-flex justify-content-between align-items-center"><!--- <span class="badge badge-danger">Limited Sale</span> --->
                </div>
				<div class="text-center">
                <a data-toggle="modal" data-pack="<?=$item_detail['id']?>" data-name="<?=$item_detail['name']?>" data-cost="<?php echo number_format($item_detail['cost'])?>" data-icon="/shop/<?=$item_detail['id']?>.png" width="75" height="75"><img data-toggle="tooltip" data-placement="top" data-delay="300" data-html="true" title="" class="text-success" data-original-title="<img src=/assets/img/item/<?=$item_detail['id']?>.PNG ></a>" class="shadow-lg" style="width: 75px;" src="/shop/<?=$item_detail['id']?>.png" alt="<?=$item_detail['name']?>"></a>
				</div>
                <div class="product-card-body"><a class="product-meta" href="#">
				<?php if($item_detail['cat']==1) echo "Equipment"; else echo "Tools";?>
				</a>
                    <h5 class="product-title"><a href="#server" class="confirm-buy" data-toggle="modal" data-name="<?=$item_detail['name']?>" data-cost="<?php echo number_format($item_detail['cost'])?>" data-icon="/shop/<?=$item_detail['id']?>.png"  data-pack="<?=$item_detail['id']?>"><?=$item_detail['name']?> x(<?=number_format($item_detail['count'])?>)</a></h5><span class="product-price text-success">
                    <img src="http://127.0.0.1:81/static/img/tickets.png" height="20px"> <?=number_format($item_detail['cost'])?> Tickets</span>
                </div>
                <div class="product-buttons-wrap">
                    <div class="product-buttons">
                        <div class="product-button"><a href="#server" class="confirm-buy" data-toggle="modal" data-name="<?=$item_detail['name']?>" data-cost="<?php echo number_format($item_detail['cost'])?>" data-icon="/shop/<?=$item_detail['id']?>.png" data-pack="<?=$item_detail['id']?>" ><i class="fa fa-shopping-cart"></i></a></div>
                    </div>
                </div>
            </div>
        </div>
		<?php endif;?>
		<?php endforeach;?>
		
		
	</div>
	</div>
    
  <div class="alert alert-info alert-dismissible fade show text-center mb-30 mt-3">
	<span class="alert-close" data-dismiss="alert"></span><i class="fe-icon-award"></i>
	<b>Note!</b><br>
Write well your username, before send it<br>
We dont refound bad writed names.<br>
DO NOT INSIST
	</div>
  <script type="text/javascript">
       	$( document ).ready(function() {
			$.getJSON("/api/listServer.php?type=select_list", function(result) {
				var $dropdown = $("#inputGameServer");
				$.each(result, function() {
					$dropdown.append($("<option />").val(this.sid).text(this.name));
				});
			});
		});
		$(document).on("click", ".confirm-buy", function () {
			 var pack = $(this).data('pack');
			 var item_name = $(this).data('name');
			 var item_cost = $(this).data('cost');
			 var item_icon = $(this).data('icon');
			 $('#pack').val(pack);
			 $('#buy_item_name').html(item_name);
			 $('#buy_item_cost').html(item_cost);
			 $('#buy_item_icon').html("<img width='35px' src="+item_icon+">");
			 
		});
		
		function sendPack(){
			
			var selectServer = $('#inputGameServer').children("option:selected").val();
			var actorname = $('#actorname').val();
			if(!selectServer){
				alert("Please select the server to receive the item");
				$('#inputGameServer').focus();
				return;
			}
			
			if(actorname == "No characters yet"){
				alert("No characters yet");
				$('#actorname').focus();
				return;
			}
			var itemNum = $('#inputItemNum').val();
			var pack = $('#pack').val();
			var actorname = $('#actorname').val();
			 $.post('/api/shop/do2.php', {
					server: selectServer,
					pack: pack,
					num: itemNum,
					actorname: actorname,
					action: "send"
				}, function(result) {
					alert(result.msg);
				},
				'JSON'
			);
		}
	
    </script>
	<!-- Choose Server Modal HTML -->
<div id="server" class="modal fade"  tabindex="-1">
  <div class="modal-dialog modal-login">
    <div class="modal-content">
      <div class="modal-header">
     
        <h4 class="modal-title">Purchasing Item</h4> 
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      </div>
	  <form class="p-3">
	  <input type="hidden" id="pack">
      <div class="form-group ">
	  You are purchasing <span id="buy_item_icon"></span> <span class="text-success" id="buy_item_name"></span> for 🎫<span class="text-success" id="buy_item_cost"> </span> Tickets per unit
								<h4 class="modal-title">Fill your details</h4> 
								<label for="num">Server</label>
                                <select onchange="getnickname(this.value)" id="inputGameServer" class="form-control">
								<option value="">- Choose Server -</option>
                                  </select>
								  </div>
								  <div class="form-group">
                                <label for="actorname">Character:</label>
															    	<div class="alert alert-warning fade in alert-dismissible show">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true" style="font-size:20px">×</span>
                    </button><b>The Shop don't accept special characters names. <br>Change your name to a normal characters name to reedem it well.</b></br></br>
                  </div>
								<select id="actorname" class="form-control">
                    <option value="" selected>Please choose nickname</option>
                  </select>
				  <small style="color:red;" id="notinick">Please select a server first</small>
                              </div>
								  <div class="form-group">
                                <label for="inputItemNum">Amount</label>
								<input type="tel" class="form-control" id="inputItemNum" placeholder="* Enter the amount from 1-99.">
                             <small class="text-muted">* Dont buy more than 99 per purchase, because you will not receive it well.</small>
                              </div>
                              
							 <div class="text-center mb-3">
							  <button href="javascript:;" onclick="sendPack();return false;" class="btn btn-info"> Purchase</button>
							  </div>
							  </form> </div>
      <div class="modal-footer">
       Please select the server and check the player name to receive the item then confirm
      </div>
	  
    </div>
  </div>
</div>
