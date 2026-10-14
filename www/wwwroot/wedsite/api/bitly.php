<?php
function shortenURL($url){
	$login = 'gracebee';
	$api_key = 'R_9a5ea145aa084e0183b6dd5a9c030af4';
	$ch = curl_init('http://api.bitly.com/v3/shorten?login='.$login.'&apiKey='.$api_key.'&longUrl='.$url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	$result = curl_exec($ch);
	$res = json_decode($result, true);
	return $res['data']['url'];
}
