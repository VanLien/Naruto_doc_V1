<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
$user_id = $_SESSION['user_id'];
// Database connection info
require_once $_SERVER['DOCUMENT_ROOT'].'/hntntn.php';
require_once  $_SERVER['DOCUMENT_ROOT'].'/functions/ssp.class.php';
$whereResult = "user_id=$user_id";
// DB table to use
$table = 'payment';

// Table's primary key
$primaryKey = 'id';

// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database. 
// The `dt` parameter represents the DataTables column identifier.
$columns = array(
    array(
     'db' => 'id',
     'dt' => 0,
     'formatter' => function( $d, $row ) {
                return '<span class="text-monospace">'.PAYMENT_PREFIX.str_pad($d, 4, '0', STR_PAD_LEFT).'</span>';
            }

      ),

    array(
            'db'        => 'gateway',
            'dt'        => 1,
            'formatter' => function( $d, $row ) {
                if($d==1)
                    $result = 'Momo';
                else if($d==0)
                    $result = 'Thẻ điện thoại';
                else
                    $result = 'Ngân hàng';
                return $result;
            }
        ),
    
    


    array(
            'db'        => 'amount',
            'dt'        => 2,
            'formatter' => function( $d, $row ) {
                return number_format($d);
            }
        ),
    array(
        'db'        => 'status',
        'dt'        => 3,
        'formatter' => function( $d, $row ) {
            // 0: hủy
            // 1: hoàn thành
            // 2: đang xử lý
            // 3: đã thanh toán
            if($d==0)
                $status = '<span class="badge badge-pill badge-danger" data-toggle="tooltip" data-html="true" data-placement="top" title="Giao dịch bị hủy"><i class="fa fa-close" aria-hidden="true"></i> Bị hủy</span>';
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
            'db'        => 'created',
            'dt'        => 4,
            'formatter' => function( $d, $row ) {
                $d = date_create($d);
                return date_format($d, 'd/m/Y H:i:s');
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