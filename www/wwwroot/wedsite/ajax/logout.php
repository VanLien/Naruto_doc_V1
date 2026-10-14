<?php
session_start();
session_destroy();
//header('location: /sign-in');
$result['text'] = 'See you again';
$result['location'] = "/sign-in";
echo json_encode($result);
?>