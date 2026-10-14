<?php
//初始化当前环境
require './Framework/_init.php';

use Framework\Curl;


$v = '{"device_id":"867676045153169","device_type":"SEA-AL10","os":"9","carrier":"\u672a\u77e5","network_type":"WIFI","resolution":"1080*2139","product_name":"sgh5","platform_name":"release","channel_name":"ml200260135","ip":"192.168.1.27","date_time":"2020-02-25"}';
$sg = json_decode($v, true);
$sg['date_time'] = $sg['date_time'].' 00:00:00';
var_dump($sg);
//http://oss.api.shiyuegame.com/index.php/device/activation
Curl::post('http://oss.api.shiyuegame.com/index.php/device/activation', array_merge($sg, [
    'sign' => md5('sgh5' . $sg['date_time'] . $GLOBALS['cfg']['secret_key']),
]));
