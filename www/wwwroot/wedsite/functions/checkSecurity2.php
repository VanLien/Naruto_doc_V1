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
<script type="text/javascript">
    
   $(document).ready(function() {
                UpdateUser();

            });
      function UpdateUser() {
        	(async () => {

        const { value: formValues } = await Swal.fire({
          text: 'sdfsdfsdf',
          title: 'Security Warning',
          html:
            'Please update your username & password to continue!'+
            '<input type="text" id="username" class="swal2-input" placeholder="Tài khoản" required>' +
            '<input type="password" id="password" class="swal2-input" placeholder="Mật khẩu" required>' +
            '<input type="password" id="rePassword" class="swal2-input" placeholder="Xác nhận mật khẩu" required>'+
            '<span id="msg"></span>'
            ,
          focusConfirm: true,
          allowEscapeKey: false,
          allowOutsideClick: false,
          confirmButtonText: 'Xác nhận',

          preConfirm: () => {
            return [
              username = document.getElementById('username').value,
              password = document.getElementById('password').value,
              rePassword = document.getElementById('rePassword').value,
            ]
          }
        })    
      if (formValues) {

      // Swal.fire(JSON.stringify(formValues))
       $.ajax({
            type: "POST",
            url: "/api/users/AjaxUpdateInfo2.php",
            data: {username:username, password:password, rePassword:rePassword},
            cache: false,
            dataType: 'JSON',
          
            success: function(response) {
                if(response.status !== true){
                  UpdateUser();
                  Swal.showValidationMessage(
                  response.msg
                )}else{
                  Swal.fire(
                  "Chúc mừng",
                  "Cập nhật email và số điện thoại thành công!.", // had a missing comma
                  "success"
                  )
                }
            },
            failure: function (response) {
                UpdateUser();
                Swal.fire(
                "Internal Error",
                "Oops, your note was not saved.", // had a missing comma
                "error"
                )
            }
        });
      }

  })()
}
</script>
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