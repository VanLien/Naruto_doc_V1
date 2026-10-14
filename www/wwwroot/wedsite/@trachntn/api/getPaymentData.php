<?php
session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
  exit;
}
// Database connection info
require_once $_SERVER['DOCUMENT_ROOT'].'/@trachntn/config.php';
require_once  $_SERVER['DOCUMENT_ROOT'].'/@trachntn/class/ssp.class.php';
if(isset($_GET['payment'])){

    $gatewayid = $_GET['payment'];
    $whereResult = "gateway=$gatewayid";
}
else
    $whereResult = '';
// DB table to use
$table = 'payment';

// Table's primary key
$primaryKey = 'id';

// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database. 
// The `dt` parameter represents the DataTables column identifier.
$columns = array(
    array( 'db' => 'user_id', 'dt' => 0 ),
    array(
            'db'        => 'gateway',
            'dt'        => 1,
            'formatter' => function( $d, $row ) {
                if($d==1)
                    $result = 'Momo';
                else if($d==0)
                    $result = 'Mobicard';
                else
                    $result = 'Bank';
                return $result;
            }
        ),
    
    
    array(
     'db' => 'id',
     'dt' => 2,
     'formatter' => function( $d, $row ) {
                return str_pad($d, 4, '0', STR_PAD_LEFT);
            }

      ),

    array(
            'db'        => 'amount',
            'dt'        => 3,
            'formatter' => function( $d, $row ) {
                return number_format($d);
            }
        ),
    array(
        'db'        => 'status',
        'dt'        => 4,
        'formatter' => function( $d, $row ) {
            // 0: hủy
            // 1: hoàn thành
            // 2: đang xử lý
            // 3: đã thanh toán
            if($d==0)
                $status = '<span class="badge badge-pill badge-danger" data-toggle="tooltip" data-html="true" data-placement="top" title="Giao dịch bị hủy"><i class="fa fa-times" aria-hidden="true"></i> Bị hủy</span>';
            else if($d==1)
                $status = '<span class="badge badge-pill badge-success" data-toggle="tooltip" data-html="true" data-placement="top" title="Giao dịch thành công"><i class="fa fa-check" aria-hidden="true"></i> Hoàn thành</span>';
            else if($d==2)
                $status = '<span class="badge badge-pill badge-warning" data-toggle="tooltip" data-html="true" data-placement="top" title="Giao dịch khởi tạo thành công, chờ thanh toán">Chờ thanh toán</span>';
            else
                $status = '<span class="badge badge-pill badge-info" data-toggle="tooltip" data-html="true" data-placement="top" title="Đã thanh toán thành công chờ xác nhận">Đã thanh toán</span>';
            return $status;
        }
    ),

    array(
        'db'        => 'id',
        'dt'        => 5,
        'formatter' => function( $d, $row ) {
            $buttons = '<button name="approve" type="button" id='.$d.' class="btn btn-info approve_btn"><i class="fa fa-check" aria-hidden="true"></i> Approve</button>
            <button name="cancel" type="button" id='.$d.' class="btn btn-danger approve_btn"><i class="fa fa-close" aria-hidden="true"></i> Cancel</button>'
            // $buttons = '<button type="button" name="delete" id="'.$d.' " class="btn btn-danger btn-xs delete">Delete</button>';
            ;
            return $buttons;
        }
    ),
    array(
            'db'        => 'created',
            'dt'        => 6,
            'formatter' => function( $d, $row ) {
                return $d;
            }
        ),

);

// Include SQL query processing class

// Output data as json format
echo json_encode(
    // / function simple ( $request, $conn, $table, $primaryKey, $columns )
    // SSP::simple( $_GET, $dbDetails, $table, $primaryKey, $columns )
    SSP::complex( $_GET, $dbDetails, $table, $primaryKey, $columns, null, $whereResult)
    
    //function complex ( $request, $conn, $table, $primaryKey, $columns, $whereResult=null, $whereAll=null )
);