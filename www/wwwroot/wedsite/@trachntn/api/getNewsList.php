<?php
session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
  exit;
}
// Database connection info
require_once $_SERVER['DOCUMENT_ROOT'].'/hntntn.php';
require_once  $_SERVER['DOCUMENT_ROOT'].'/@trachntn/class/ssp.class.php';
if(isset($_GET['payment'])){

    $gatewayid = $_GET['payment'];
    $whereResult = "gateway=$gatewayid";
}
else
    $whereResult = 'status = 1';
// DB table to use
$table = 'news';

// Table's primary key
$primaryKey = 'id';

// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database. 
// The `dt` parameter represents the DataTables column identifier.
$columns = array(
    array( 'db' => 'id', 'dt' => 0 ),
    array( 'db' => 'title', 'dt' => 1 ),
    array( 'db' => 'type', 'dt' => 2 ),
    array(
            'db'        => 'thumbnail',
            'dt'        => 3,
            'formatter' => function( $d, $row ) {
                $img = '<img width="100px" src="'.$d.'" />';
                return $img;
            }
        ),
     array(
            'db'        => 'slug',
            'dt'        => 4,
            'formatter' => function( $d, $row ) {
                $result =  '<a target="_blank" href="/pages/news.php?slug='.$d.'">'.$d.'</a>';
                return $result;
            }
        ),
    array(
        'db'        => 'id',
        'dt'        => 5,
        'formatter' => function( $d, $row ) {
            $buttons = '<a href="index.php?page=addnews&id='.$d.'"  class=" text-info"><i class="fas fa-edit"></i> Edit</a></br>
            <a name="delete" href="#" id='.$d.' class="text-danger delete_btn"><i class="fas fa-trash-alt"></i> Delete</a>'
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