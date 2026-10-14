<?php
class cURL
{
    var $headers;
    var $user_agent;
    var $compression;
    var $cookie_file;
    var $proxy;
    var $referer;
    var $debug;

    function __construct($cookies = TRUE, $cookie = 'cookies.txt', $compression = 'gzip', $proxy = '')
    {
        $this->headers[]   = 'Accept: image/gif, image/x-bitmap, image/jpeg, image/pjpeg';
        $this->headers[]   = 'Connection: Keep-Alive';
        $this->headers[]   = 'Content-type: application/x-www-form-urlencoded;charset=UTF-8';
        $this->user_agent  = 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0)';
        $this->compression = $compression;
        $this->proxy       = $proxy;
        $this->cookies     = $cookies;
        if ($this->cookies == TRUE)
            $this->cookie($cookie);
        $this->debug = false;
	}

    function cookie($cookie_file)
    {
        if (file_exists($cookie_file)) {
            $this->cookie_file = $cookie_file;
        } else {
            fopen($cookie_file, 'w') or $this->error('The cookie file could not be opened. Make sure this directory has the correct permissions');
            $this->cookie_file = $cookie_file;
            fclose($this->cookie_file);
        }
    }

    public function setReferer($url){
    	$this->referer = $url;
    }

    public function setDebug($debug){
    	$this->debug = $debug;
    }

    function get($url)
    {
        $process = curl_init($url);
        curl_setopt($process, CURLOPT_HTTPHEADER, $this->headers);
        curl_setopt($process, CURLOPT_HEADER, $this->debug);
        curl_setopt($process, CURLOPT_USERAGENT, $this->user_agent);
        if ($this->cookies == TRUE)
            curl_setopt($process, CURLOPT_COOKIEFILE, $this->cookie_file);
        if ($this->cookies == TRUE)
		curl_setopt($process, CURLOPT_COOKIEJAR, $this->cookie_file);            
        curl_setopt($process, CURLOPT_ENCODING, $this->compression);
        curl_setopt($process, CURLOPT_TIMEOUT, 30);
        if ($this->proxy)
            curl_setopt($process, CURLOPT_PROXY, $this->proxy);
        if($this->referer){
        	curl_setopt($process, CURLOPT_REFERER, $this->referer);
        }
        curl_setopt($process, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($process, CURLOPT_FOLLOWLOCATION, 1);
        $return = curl_exec($process);
        curl_close($process);
        return $return;
    }

    function post($url, $data)
    {
        $process = curl_init($url);
        curl_setopt($process, CURLOPT_HTTPHEADER, $this->headers);
        curl_setopt($process, CURLOPT_HEADER, $this->debug);
        curl_setopt($process, CURLOPT_USERAGENT, $this->user_agent);
        if ($this->cookies == TRUE)
            curl_setopt($process, CURLOPT_COOKIEFILE, $this->cookie_file);
        if ($this->cookies == TRUE)
            curl_setopt($process, CURLOPT_COOKIEJAR, $this->cookie_file);
        
        curl_setopt($process, CURLOPT_ENCODING, $this->compression);
        curl_setopt($process, CURLOPT_TIMEOUT, 30);
        if ($this->proxy)
            curl_setopt($process, CURLOPT_PROXY, $this->proxy);
        curl_setopt($process, CURLOPT_POSTFIELDS, $data);
        curl_setopt($process, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($process, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($process, CURLOPT_POST, 1);
        $return = curl_exec($process);
        curl_close($process);
        return $return;
    }

    function error($error)
    {
        echo "<center><div style='width:500px;border: 3px solid #FFEEFF; padding: 3px; background-color: #FFDDFF;font-family: verdana; font-size: 10px'><b>cURL Error</b><br>$error</div></center>";
        die;
    }
}
// $cc = new cURL(TRUE, 'vcb.txt');
// $a  = $cc->get('https://www.vietcombank.com.vn/IBanking2015/');
// echo $a;
?> 