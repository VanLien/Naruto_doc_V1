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
    function ajaxSendItem() {
      
      var uid = $("#uid").val();
      var item_id = $("#item_id").val();
      var item_type = $("#item_type").val();
      var item_quantily = $("#item_quantily").val();
      var serverid = $("#serverid").val();
      if (!uid) {
        $("#msg").addClass("text-danger ").html('<i class="fa fa-close" aria-hidden="true"></i> Please input User ID');
        $("#uid").focus();
      }
        else if (!item_type) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Please input item type');
        $("#item_type").focus();
      
      } else if (!item_id) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Please input item ID');
        $("#item_id").focus();
      }
       
       else if (!item_quantily) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Please input item quantily');
        $("#item_quantily").focus();
      }
      else
      {
        $("#submit").attr("disabled", true).html('<span class="spinner-border spinner-border-sm"></span> Processing..');
        $.post('/@trachntn/api/AjaxSendItem.php', {uid:uid,item_id:item_id,item_type:item_type,item_quantily:item_quantily, serverid:serverid}, function (result){
            if(result.status){
              $("#msg").html('<i class="fa fa-check" aria-hidden="true"></i> ' + result.msg).removeClass("text-danger").addClass("text-success");
            }
            else{
              $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> '+result.msg).fadeOut(2000);
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
          <h1 class="h3 mb-4 text-gray-800">Send Item</h1>
           <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Send Item</h6>
            </div>
            <div class="card-body">
          <form method="post" onsubmit="ajaxSendItem();return false;">
			  <div class="form-group">
          <label for="uid">User ID:</label>
          <input type="number" class="form-control" id="uid" value="<?=$id?>">
        </div>
          <div class="form-group">
            <label for="uid">Username:</label>
            <input type="text" class="form-control" id="uname">
          </div>
        <div class="form-group">
         <label for="serverid">Server</label>
      <select id="serverid" class="form-control">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">test</option>
      </select>
    </div>
        <div class="form-group">
         <label for="item_type">Item type</label>
      <select id="item_type" class="form-control">
        <option value="" selected>Choose...</option>
        <option value="0">0 (Currency)</option>
        <option value="1">1 (Item)</option>
      </select>
    </div>
			  <div class="form-group">
			    <label for="item_id">Item ID:</label>
			    <input type="text" class="form-control" id="item_id">
			  </div>
         <div class="form-group">
          <label for="item_quantily">Item Quantily:</label>
          <input type="text" class="form-control" id="item_quantily">
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