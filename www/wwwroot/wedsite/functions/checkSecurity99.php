<!-- document.getElementById('rePassword').value -->



<?php 
    include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
      // Kiểm tra liệu tài khoản đã có username chưa?

      $user_id = $_SESSION['user_id'];
      $result = $dbh->query("SELECT * FROM `users` WHERE `acc_id` = '{$user_id}' LIMIT 1")->fetch();
      if (!$result){
          echo "Thông tin sai";
      }
      if ($result['username'] == ''):
    ?>

<?php elseif($result['oauth_uid'] == ''):?>
  <div class="row">
  <!--  <div class="col">
      <div class="alert alert-warning" role="alert">
       <i class="fa fa-shield font-weight-bold" aria-hidden="true"></i>
 Bạn chưa liên kết tài khoản với facebook <a href="http://haitach5.online/auth/fblogin/?action=link" class="btn btn-primary"><i class="fa fa-facebook-square font-weight-bold" aria-hidden="true"></i> LIÊN KẾT VỚI FACEBOOK </a> ngay để bảo mật tài khoản. <a href="#" class="alert-link">Tìm hiểu thêm <i class="fa fa-question-circle
 font-weight-bold" aria-hidden="true"></i> </a>
      </div>
    </div>-->

  </div>
<?php endif;?>