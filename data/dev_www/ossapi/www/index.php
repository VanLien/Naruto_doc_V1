<?php
/**
 *  入口文件
 */

//初始化当前环境
require '../Framework/_init.php';

use Framework\Api;

/**
 * 映射到对应的接口文件
 * index.php/entry/step/?a=1&b=3     => entry模块step方法
 */
if (!isset($_SERVER['PATH_INFO'])) Api::out(false, '500:内部错误');
$pathInfo = explode('/', trim(str_replace('index.php', '', $_SERVER['PATH_INFO']), '/'));
if (count($pathInfo) != 2) Api::out(false, '501:内部错误');

$className = ucfirst($pathInfo[0]);
$funcName = $pathInfo[1];
if (!$className || !$funcName || preg_match('#[^\w]#', $className) || preg_match('#[^\w]#', $funcName))
    Api::out(false, '非法的模块调用');
$classFile = MOD_PATH . '/' . $className . '.php';
if (!is_file($classFile)) Api::out(false, '404:找不到文件');

call_user_func_array(['Modules\\' . $className, $funcName], []);

