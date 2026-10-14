<?php
$user_id = $_SESSION['user_id'];
?>

<!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Hoả Chí Anh Hùng</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        

        <link rel="stylesheet" href="/assets/css/user-style.css">
        <link rel="shortcut icon" href="/assets/img/favicon.png">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        


        <script>
            $(document).ready(function() {
                ajaxGetUserInfo();
                ajaxGetVipInfo();

            });
            $(function () {
              $('[data-toggle="tooltip"]').tooltip()
            })
            
        </script>
 

              <?php

              include_once $_SERVER['DOCUMENT_ROOT'].'/functions/promotionChecker.php';


              ?>