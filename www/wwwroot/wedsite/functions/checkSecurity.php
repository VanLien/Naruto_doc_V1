<!-- document.getElementById('rePassword').value -->



<?php 
    include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
      // Kiểm tra liệu tài khoản đã có username chưa?

      $result = $dbh->query("SELECT * FROM `game_account` WHERE `uid` = '{$user_id}' LIMIT 1")->fetch();
      if (!$result){
          echo "Thông tin sai";
      }
      if ($result['username'] == ''):
    ?>
<?php elseif($result['oauth_uid'] == ''):?>
<?php endif;?>