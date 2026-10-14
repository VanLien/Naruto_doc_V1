<?php
session_name('admin_session');

session_start();
if(!isset($_SESSION['admin'])){
	echo "<script>alert('Vui lòng đăng nhập để tiếp tục'); window.location.href='login.php';</script>";
	exit;
	// header('location: /');
}
else
{
	$admin = $_SESSION['admin'];
}

include_once "templates/header.php";
if(isset($_GET['page']))
	$page = $_GET['page'];
else
	$page = "";
if(file_exists("pages/".$page.".php")){
   include_once "pages/".$page.".php";
}
else
{
   include_once "pages/home.php";
}
include_once "templates/footer.php";