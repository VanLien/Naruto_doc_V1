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
  <script src="js/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
     // Get news info
      function ajaxGetNewsInfo() {
          var id = $("#newsid").val();
          $.post('api/GetNewsInfo.php', {
                  id: id
              }, function(result) {
                  if (result.status) {
                      $("#title").val(result.title);
                      $("#thumbnail").val(result.thumbnail);
                      if(result.type == 'tintuc')
                        search = 1;
                      else if(result.type == 'sukien')
                        search = 2;
                      else
                        search = 3;
                      $('#type option[value='+search+']').attr('selected','selected');


                      CKEDITOR.instances['newscontent'].setData(result.content);
                  } else {
                      $("#msg2").addClass("alert alert-danger").html(result.msg);

                  }
              },
              'JSON'
          );
      } 
    function ajaxPostNews() {
      var newsid = $("#newsid").val();
      var title = $("#title").val();
      var type = $("#type").val();
      var game = $("#game").val();
      var thumbnail = $("#thumbnail").val();
      var newscontent = CKEDITOR.instances['newscontent'].getData();
      if (!title) {
        $("#msg").addClass("text-danger ").html('<i class="fa fa-close" aria-hidden="true"></i> Please input news title');
        $("#title").focus();
      }
        else if (!type) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Please input news type');
        $("#type").focus();
      
      } else if (!thumbnail) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Please input news thumbnail');
        $("#thumbnail").focus();
      }
       
       else if (!newscontent) {
        $("#msg").addClass("text-danger").html('<i class="fa fa-close" aria-hidden="true"></i> Please input news content');
        $("#newscontent").focus();
      }
      else
      {
        $("#submit").attr("disabled", true).html('<span class="spinner-border spinner-border-sm"></span> Processing..');
        $.post('/@trachntn/api/AjaxNews.php', {newsid:newsid, title:title,type:type,thumbnail:thumbnail,newscontent:newscontent,game:game}, function (result){
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
          <h1 class="h3 mb-4 text-gray-800">News manager</h1>
           <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">News manager</h6>
            </div>
            <div class="card-body">
          <form method="post" onsubmit="ajaxPostNews();return false;">
        <input type="hidden" class="form-control" id="newsid" value="<?=$id?>">
			  <div class="form-group">
          <label for="title">Title:</label>
          <input type="text" class="form-control" id="title">
        </div>
        
        <div class="form-group">
         <label for="type">Type</label>
      <select id="type" class="form-control">
        <option value="1">News</option>
        <option value="2">Event</option>
        <option value="3">Guide</option>
      </select>
    </div>

    <div class="form-group">
         <label for="type">Game</label>
      <select id="game" class="form-control">
        <option value="mtd">HNT H5</option>
        <option value="ty">Trảm Yêu</option>
      </select>
    </div>

      <div class="form-group">
            <label for="uid">Thumbnail:</label>
            <input type="text" class="form-control" id="thumbnail">
          </div>
          <div class="form-group">
            <label for="newscontent">Content:</label>
       <textarea name="newscontent" id="newscontent" rows="10" cols="80">
        </textarea>
      </div>
      <script type="text/javascript">
        CKEDITOR.replace( 'newscontent' );
        <?php
      if ($id != ''):
        ?>
    
        CKEDITOR.on('instanceReady', function() {ajaxGetNewsInfo();});


        <?php
        endif;
        ?>
      </script>

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