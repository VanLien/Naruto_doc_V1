<?php
//初始化当前环境
require './Framework/_init.php';

use Framework\Curl;


$dataFile = file_get_contents('/Users/vicdeng/Desktop/三国数据/补数据/query_result.csv');
$b = explode("\n", $dataFile);
unset($b[0]);
foreach ($b as $v) {
    if (empty($v)) continue;
    if (stristr($v, '"device",')) {
        $c = str_replace('"device",', '', $v);
        $a = json_decode(json_decode($c, true), true);
        $d = substr($a['resolution'],0,3);
        $f = substr(stristr($a['resolution'], 'X'),0,4);
        $a['resolution'] = $d.$f;
        //http://oss.api.shiyuegame.com/index.php/device/activation
        Curl::post('test.com:8080/index.php/device/activation', array_merge($a, [
            'sign' => md5('sgh5' . $a['date_time'] . $GLOBALS['cfg']['secret_key']),
        ]));
    } else {
        $c = str_replace('"entry",', '', $v);
        $a = json_decode(json_decode($c, true), true);
        $d = substr($a['resolution'],0,3);
        $f = substr(stristr($a['resolution'], 'X'),0,4);
        $a['resolution'] = $d.$f;
        //http://oss.api.shiyuegame.com/index.php/entry/step
        Curl::post('test.com:8080/index.php/entry/step', array_merge($a, [
            'sign' => md5('sgh5' . $a['date_time'] . $GLOBALS['cfg']['secret_key']),
        ]));
    }
}
