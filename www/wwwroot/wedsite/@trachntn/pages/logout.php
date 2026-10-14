<?php

session_name('admin_session');
session_start();
if(!isset($_SESSION['admin'])){
  exit;
}
session_destroy();
header('location:  /@trachntn');
