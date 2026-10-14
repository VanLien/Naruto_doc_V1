<?php
//初始化当前环境
require './Framework/_init.php';

use Framework\Curl;

$dataFile = file_get_contents('/Users/vicdeng/Desktop/三国数据/补数据/can1.txt');
$b = explode("\n", $dataFile);

foreach ($b as $v) {
    $sg = json_decode($v, true);
    $sg['date_time'] = $sg['date_time'].' 00:00:00';
    //http://oss.api.shiyuegame.com/index.php/device/activation
    Curl::post('http://oss.api.shiyuegame.com/index.php/device/activation', array_merge($sg, [
        'sign' => md5('sgh5' . $sg['date_time'] . $GLOBALS['cfg']['secret_key']),
    ]));
}
