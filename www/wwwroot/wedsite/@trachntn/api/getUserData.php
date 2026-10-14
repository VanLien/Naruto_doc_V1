<?php
session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
  exit;
}
// Database connection info
require_once $_SERVER['DOCUMENT_ROOT'].'/hntntn.php';

// DB table to use
$table = 'game_account';

// Table's primary key
$primaryKey = 'uid';

// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database. 
// The `dt` parameter represents the DataTables column identifier.
$columns = array(
    array( 'db' => 'uid', 'dt' => 0 ),
    array( 'db' => 'username', 'dt' => 1 ),
    array( 'db' => 'password', 'dt' => 2 ),
    array(
        'db'        => 'xu',
        'dt'        => 3,
        'formatter' => function( $d, $row ) {
            return number_format($d);
        }
    ),
    array(
        'db'        => 'xu_lock',
        'dt'        => 4,
        'formatter' => function( $d, $row ) {
            return number_format($d);
        }
    ),

    array( 'db' => 'ip_address',  'dt' => 5 ),
    array( 'db' => 'email',      'dt' => 6 ),

    array(
        'db'        => 'created',
        'dt'        => 7,
        'formatter' => function( $d, $row ) {
            return date( 'd/m/Y', strtotime($d));
        }
    ),
    array(
        'db'        => 'status',
        'dt'        => 9,
        'formatter' => function( $d, $row ) {
            return ($d == 1)?'Active':'Blocked';
        }
    ),
    array(
        'db'        => 'uid',
        'dt'        => 8,
        'formatter' => function( $d, $row ) {
            $buttons = '<a href="index.php?page=sendgold&id='.$d.'" class="text-info">Send gold</a>
            <a href="index.php?page=senditem&id='.$d.'" class="text-warning">Send item</a>';
            // $buttons = '<button type="button" name="delete" id="'.$d.' " class="btn btn-danger btn-xs delete">Delete</button>';
             return $buttons;
        }
    ),
);

// Include SQL query processing class
require_once  $_SERVER['DOCUMENT_ROOT'].'/@trachntn/class/ssp.class.php';

// Output data as json format
echo json_encode(
    SSP::simple( $_GET, $dbDetails, $table, $primaryKey, $columns )
);