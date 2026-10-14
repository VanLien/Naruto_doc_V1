<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2020/4/22
 * Time: 下午5:50
 * TODO:
 */

require './Framework/_init.php';


use Framework\Curl;

ini_set('memory_limit', '1024M');

$argv = $argv === null ? $argv : $_SERVER['argv'];
$file = VAR_DIR . '/activation_' . $argv[1];
echo '文件名：' . $file;
$lines = file($file);

$num = 0;
foreach ($lines as $v) {
    $sg = json_decode($v, true);
    if (!is_array($sg)) continue;

    $arr = explode(" ", $sg['request']);
    $params = $arr[1];
    $url = 'http://oss.api.shiyuegame.com' . $params;
    $ret = Curl::get($url);
    if ($ret['result']) {
        $num++;
    } else {
        echo '上报错误，地址：' . $url . PHP_EOL;
    }
    echo '总计上报成功第' . $num . PHP_EOL;
    unset($v);
}