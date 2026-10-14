<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/hntntn.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';
$userid = $_SESSION['user_id'];
include_once $_SERVER['DOCUMENT_ROOT'].'/api/bitly.php';
$url = $url['home'].'?ref='.$userid;
$shortenUrl = shortenURL($url);
$data = array(
		'status'	=> true,
		'originalUrl' => $url,
		'shortenUrl' => $shortenUrl,
);
echo json_encode($data);