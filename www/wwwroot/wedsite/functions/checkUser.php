
<?php
function checkUserLogged($returnURL){
	
	if(!isset($_SESSION['is_login'])){
		echo "
		<link href='//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet' id='bootstrap-css'>
		<script>
		setTimeout(function () {
		   window.location.href = '/user/login&returnURL=$returnURL'; 
		}, 4000); //will call the function after 2 secs.
		</script>
		<style>
		#main {
		    height: 100vh;
		}
		</style>
		<div class='page-wrap d-flex flex-row align-items-center' id='main'>
		    <div class='container'>
		        <div class='row justify-content-center'>
		            <div class='col-md-12 text-center'>
		                <span class='display-1 d-block'>Welcome!</span>
		                <div class='mb-4 lead'>We are redirecting you to the user panel</div>

		                <a href='/user/login&returnURL=$returnURL' class='btn btn-link'>Go to login page</a>
		            </div>
		        </div>
		    </div>
		</div>
		";
		die();
	}

}
