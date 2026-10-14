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
      $( document ).ready(function() {

        //get username by id
         	 $("#uid").on('keyup', function() {
         	 var uid = $("#uid").val();
	         $.post('api/GetUsernameByID.php', {
	                uid: uid
	            }, function(result) {
	                if (result.status) {
	                    $("#uname").val(result.this_username);
	                    $("#msg").empty();
	                }else{
	                	$("#uname").val('');
	                	$("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> '+ result.msg);
	                }
	            },
	            'JSON'
	        );
        });
          // get id by username
          $("#uname").on('keyup', function() {	
          var uname = $("#uname").val();
         $.post('api/GetIDByUsername.php', {
                uname: uname
            }, function(result) {
                if (result.status) {
	                $("#uid").val(result.this_id);
	                $("#msg").empty();
                }else{
                	$("#uid").val('');
                	$("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> '+ result.msg);
                } 
            },
            'JSON'
        );
        });
      });
      
    function ajaxSendGold() {
      
      var uid = $("#uid").val();
      var gold = $("#gold").val();
      var uname = $("#uname").val();
      if (!uid) {
        $("#msg").addClass("text-danger ").html('<i class="fa fa-close" aria-hidden="true"></i> Please input User ID');
        $("#uid").focus();
      } else if (!gold) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Please input gold amount');
        $("#gold").focus();
      }
      else
      {
        $("#submit").attr("disabled", true).html('<span class="spinner-border spinner-border-sm"></span> Processing..');
        $.post('/@trachntn/api/AjaxAddLuotQuay.php', {uid:uid,gold:gold,uname:uname}, function (result){
            if(result.status){
              $("#msg").html('<i class="fa fa-check" aria-hidden="true"></i> '+result.msg).removeClass("text-danger").addClass("text-success");
            }
            else{
              $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> '+ result.msg);
            }
            $("#submit").removeAttr("disabled").html("Submit");
          },
          'JSON'
        );
      }
    }
  </script>
     <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">Thêm lượt quay</h1>
           <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Thêm lượt quay</h6>
            </div>
            <div class="card-body">
          <form method="post" onsubmit="ajaxSendGold();return false;">
			  <div class="form-group">
			    <label for="uid">User ID:</label>
			    <input type="number" class="form-control" id="uid" value="<?=$id?>">
			  </div>
	        <div class="form-group">
	          <label for="uid">Username:</label>
	          <input type="text" class="form-control" id="uname">
	        </div>
			  <div class="form-group">
			    <label for="gold">Lượt:</label>
			    <input type="text" class="form-control" id="gold">
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