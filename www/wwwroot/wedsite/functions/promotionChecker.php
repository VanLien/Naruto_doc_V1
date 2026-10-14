<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
include_once $_SERVER['DOCUMENT_ROOT'].'/hntntn.php';


$is_promotion = false;

$now = time();
$promotion_start = strtotime($promotion['start']);
$promotion_end = strtotime($promotion['end']);
if($now >= $promotion_start && $now <= $promotion_end){
  $is_promotion = true;
  $promotion_rate = $promotion['promotion_rate'];
}
else
  $promotion_rate = $promotion['promotion_normal_rate'];
$promotion_msg = 'Đang khuyến mãi '.(($promotion_rate-1)*100).'% giá trị nạp tiền từ ['.date_format(date_create($promotion['start']), "H:i:s d/m/Y").'] đến ['.date_format(date_create($promotion['end']), "H:i:s d/m/Y").']';
?>
<?php
      if($is_promotion):
    ?>
    <script type="text/javascript">
         $(document).ready(function(){
            const Toast = Swal.mixin({
              toast: true,
              position: 'bottom-end',
              showConfirmButton: false,
              timer: 10000
            })

            Toast.fire({
              type: 'success',
              title: '<?php echo $promotion_msg?>'
            })

        });
    </script>
  <?php endif;?>