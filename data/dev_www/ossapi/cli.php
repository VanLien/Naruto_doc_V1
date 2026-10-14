<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/8/25
 * Time: 上午10:58
 * 命令行入口
 * 格式 /usr/bin/php cli.php 模块::方法 参数1 参数2 ...
 */

//初始化当前环境
require __DIR__ . '/Framework/_init.php';

use Framework\Api;

$argv = $argv === null ? $argv : $_SERVER['argv'];
list($className, $funcName) = explode('::', $argv[1]);

if (!$className || !$funcName || preg_match('#[^\w]#', $className) || preg_match('#[^\w]#', $funcName))
    Api::out(false, '非法的模块调用');
$classFile = MOD_PATH . '/' . $className . '.php';
if (!is_file($classFile)) Api::out(false, '404:找不到文件');

//剔除多余参数
array_shift($argv);
array_shift($argv);

$fullClassName = "Modules\\" . $className;
$obj = new $fullClassName;
$obj->$funcName($argv);