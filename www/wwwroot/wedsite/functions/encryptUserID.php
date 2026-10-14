<?php
function encryptUserID($user_id, $sid){
	$encryptLoginKey = 'sdhfjhdsftrach12s#$';
	return md5(sha1($user_id) . $encryptLoginKey);
	
}