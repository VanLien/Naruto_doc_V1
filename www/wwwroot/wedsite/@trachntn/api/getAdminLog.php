<?php
session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
  exit;
}

// Database connection info
require_once $_SERVER['DOCUMENT_ROOT'].'/@trachntn/config.php';

// DB table to use
$table = 'admin_log';

// Table's primary key
$primaryKey = 'id';

// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database. 
// The `dt` parameter represents the DataTables column identifier.
$columns = array(
    array( 'db' => 'id', 'dt' => 0 ),
    array( 'db' => 'username', 'dt' => 1 ),

    array( 'db' => 'action', 'dt' => 2 ),
    array( 'db' => 'ip',  'dt' => 3 ),

  
    array(
        'db'        => 'created',
        'dt'        => 4,
        'formatter' => function( $d, $row ) {
            return date( 'd/m/Y H:i:s', strtotime($d));
        }
    ),
   
);

// Include SQL query processing class
require_once  $_SERVER['DOCUMENT_ROOT'].'/@trachntn/class/ssp.class.php';

// Output data as json format
echo json_encode(
    SSP::simple( $_GET, $dbDetails, $table, $primaryKey, $columns )
);
