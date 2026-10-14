<?php
/**
 *  初始化
 */

//系统目录结构
define('ROOT', realpath(__DIR__ . '/../'));
define('FRAME_ROOT', realpath(__DIR__));
define('MOD_PATH', ROOT . '/Modules');
define('VAR_DIR', ROOT . '/var');
define('WEB_DIR', ROOT . '/www');

//配置
require ROOT . '/env.php';
//基础方法
require FRAME_ROOT . '/global.php';

define('DEBUG', $GLOBALS['cfg']['debug'] ?? false);

// 错误报告设置
if (DEBUG) {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
} else {
    error_reporting(0);
    ini_set('display_errors', 0);
}

date_default_timezone_set("Asia/Shanghai");
//注册类自动加载方法
spl_autoload_register('class_loader');


/**
 * 类自动加载函数
 * @param string $class 类名
 */
function class_loader($class)
{
    if (class_exists($class) || interface_exists($class)) {
        return;
    }

    $file = ROOT . DIRECTORY_SEPARATOR . str_replace('\\', '/', $class) . '.php';
    if (is_file($file))
        require_once $file;
}
