<?php
if(!isset($_SESSION['admin'])){
  exit;
}else{
  if(isset($_GET['id']))
    $id = $_GET['id'];
    else
      $id = '';
}
?>


    <script type="text/javascript">
    function random_code(length) {
   var result           = '';
   var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
   var charactersLength = characters.length;
   for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
   }
   $("#code").val('TY'+result);
   $("#currentCode").html('TY'+result);
   
}

    function ajaxSendItem() {
      
      var code = $("#code").val();
      var items = $("#items").val();
      var subject = $("#subject").val();
      var content_code = $("#content_code").val();
      var date = $("#date").val();
      var code_limit = $("#code_limit").val();
      var code_limit_num = $("#code_limit_num").val();
      var server = $("#inputGameServer").val();
      if (!code) {
        $("#msg").addClass("text-danger ").html('<i class="fa fa-close" aria-hidden="true"></i> Nhập code');
        $("#code").focus();
      }
        else if (!items) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Nhập item');
        $("#items").focus();
      
      } else if (!subject) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Nhập tiêu đề');
        $("#subject").focus();
      }
	  else if (!content_code) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Nhập nội dung');
        $("#content_code").focus();
      }
	  else if (!date) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Nhập số lượng ngày dùng code');
        $("#date").focus();
      }
      else
      {
        $("#submit").attr("disabled", true).html('<span class="spinner-border spinner-border-sm"></span> Processing..');
        $.post('/@trachntn/api/AjaxAddCode.php', {
			code:code,
			items:items,
			subject:subject,
			content:content_code,
			date:date,
			server:server,
			code_limit:code_limit,
			code_limit_num:code_limit_num
			
			}, function (result){
            if(result.status){
              $("#msg").html('<i class="fa fa-check" aria-hidden="true"></i> ' + result.msg).removeClass("text-danger").addClass("text-success");
            }
            else{
              $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> '+result.msg);
            }
            $("#submit").removeAttr("disabled").html("Submit");
          },
          'JSON'
        );
      }
    }
	$( document ).ready(function() {
			random_code(7);
			
			$.getJSON("/api/listServer.php?type=select_list", function(result) {
				var $dropdown = $("#inputGameServer");
				$.each(result, function() {
					$dropdown.append($("<option />").val(this.sid).text(this.name));
				});
			});

		});
	function generateCode(type){
		random_code(7);
		
		if(type == "tanthu"){
			var date = "1000";
			var title = "Giftcode tân thủ";
			var content = "Chúc mừng bạn đã nhận thành công giftcode tân thủ. Muốn nhận thêm code hãy truy cập group và tham giá nhé, link: fb.com/haitach5online";
			var item = '{"id":2,"num":1500000,"type":0}&{"id":2000690,"num":50,"type":1}&{"id":2000315,"num":50,"type":1}&{"id":2005056,"num":5,"type":1}';
		}else if(type =="vip"){
			var date = "1000";
			var title = "Giftcode VIP HNT H5";
			var content = "Chúc mừng bạn đã nhận thành công giftcode VIP. Muốn nhận thêm code hãy truy cập group và tham giá nhé, link: fb.com/haitach5online";
			var item = '{"id":3,"num":1000000,"type":0}&{"id":2000690,"num":100,"type":1}&{"id":2000040,"num":100,"type":1}&{"id":2000315,"num":100,"type":1}&{"id":2005059,"num":5,"type":1}';
		}
		else if(type =="hangngay"){
			var date = "1";
			var title = "Giftcode ngày <?php echo date("d-m")?>";
			var content = "Chúc mừng bạn đã nhận thành công giftcode hàng ngày (<?php echo date("d-m")?>). Muốn nhận thêm code hãy truy cập group và tham gia nhé, link: fb.com/haitach5online";
			var item = '{"id":2,"num":500000,"type":0}&{"id":2000690,"num":50,"type":1}&{"id":2000315,"num":50,"type":1}';
		}else{
			alert("Chưa có mẫu này");
			return false;
		}
		//gán
			$("#items").val(item);
			$("#subject").val(title);
			$("#content_code").val(content);
			$("#date").val(date);
		return;
	}
  </script>
     <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">Add code</h1>
           <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Add code</h6>
            </div>
            <div class="card-body">
			<div class="pb-2 alert alert-warning">
			Tạo nhanh theo mẫu
			<a href="javascript:;" onclick="generateCode(this.id)" id="tanthu" class="badge badge-primary">Tân thủ</a>
			<a href="javascript:;" onclick="generateCode(this.id)" id="vip" class="badge badge-secondary">VIP</a>
			<a href="javascript:;" onclick="generateCode(this.id)" id="hangngay" class="badge badge-success">Hàng ngày</a>
			</div>
			<p class="alert alert-info">
			Mẫu bài đăng code hàng ngày</br>
			#tramyeuh5</br>
			BXH và code ngày <?php echo date("d-m")?> game Trảm Yêu H5</br>
			<b>CODE: <span id="currentCode"></span></b></br>
			<i>Lưu ý: code không giới hạn số lượng nhưng chỉ sử dụng được trong 24h</i></br>
			Link nhập code: <a href="http://ty.naruto.p4fgame.com/user/giftcode">http://ty.naruto.p4fgame.com/user/giftcode</a>
			</p>
          <form method="post" onsubmit="ajaxSendItem();return false;">

			  <div class="form-group">
          <label for="uid">Code: (<a onclick="random_code(7)" href="javascript:;">làm mới</a>)</label>
          <input type="text" class="form-control" id="code" >
        </div>
          <div class="form-group">
            <label for="uid">Số ngày hết hạn:</label>
            <input type="number" class="form-control" id="date">
          </div>
        <div class="form-group">
                                <label for="inputGameServer">Server</label>
                                <select id="inputGameServer" class="form-control">
                                  <option value="all" selected>All</option>
                                </select>
                              </div>
        <div class="form-group">
         <label for="subject">Tiêu đề</label>
			<input type="text" class="form-control" id="subject">
		</div>
		<div class="form-group">
         <label for="content">Nội dung</label>
			<input type="text" class="form-control" id="content_code">
		</div>
		
			<div class="form-group">
         <label for="items">Items (VD: {"id":200318,"num":5,"type":1}&{"id":2,"num":20000,"type":0}&{"id":201007,"num":1,"type":1})</label>
			<input type="text" class="form-control" id="items">
		</div>
		<div class="form-group">
         <label for="code_limit">Loại code</label>
      <select id="code_limit" class="form-control">
        <option value="0">Không giới hạn</option>
        <option value="1">Giới hạn</option>
      </select>
    </div>
	<div class="form-group">
         <label for="code_limit_num">Số lượng giới hạn</label>
			<input type="number" class="form-control" id="code_limit_num" value="0">
		</div>

			  <div class="form-group">
			  	<span id="msg"></span>
			  </div>
			  <button id="submit" type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->