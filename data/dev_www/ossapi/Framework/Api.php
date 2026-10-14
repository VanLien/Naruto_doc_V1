<?php
/**
 * 接口常用方法类
 */
namespace Framework;

class Api
{

    public static function has($index)
    {
        return isset($_POST[$index]) || isset($_GET[$index]);
    }

    /**
     * @static
     * 获取一个正数
     * @param string $index GPC请求变量键名
     * @param string $method 请求方式限制,值为: GET,POST,COOKIE
     * @return int
     */
    public static function getInt($index, $method = '')
    {
        $value = self::_getGPC($index, $method);
        return (int)$value;
    }

    /**
     * @static
     * 获取一个正数
     * @param string $index GPC请求变量键名
     * @param string $method 请求方式限制,值为: GET,POST,COOKIE
     * @return [@type int)
     */
    public static function getIntArray($index, $method = '')
    {
        $value = self::_getGPC($index, $method);
        return !is_array($value) || !$value ? [] : parseInt($value);
    }

    /**
     * 取得请求为浮数值
     * @param string $index GPC请求变量键名
     * @param string $method 请求方式限制,值为: GET,POST,COOKIE
     * @return float
     */
    public static function getFloat($index, $method = '')
    {
        $value = self::_getGPC($index, $method);
        return (float)$value;
    }

    /**
     * 取得请求为浮数值
     * @param string $index GPC请求变量键名
     * @param string $method 请求方式限制,值为: GET,POST,COOKIE
     * @return array (@type float)
     */
    public static function getFloatArray($index, $method = '')
    {
        $value = self::_getGPC($index, $method);
        return !is_array($value) || !$value ? [] : parseFloat($value);
    }

    /**
     * 返回一个Unix时间戳
     * @param string $index GPC请求变量键名
     * @param string $method 请求方式限制,值为: GET,POST,COOKIE
     * @return int
     */
    public static function getTime($index, $method = '')
    {
        $value = self::_getGPC($index, $method);
        return self::_getTime($value);
    }

    private static function _getTime($value)
    {
        if (!$value || !is_string($value)) return 0;
        //phpdoc: 成功则返回时间戳，否则返回 FALSE。在 PHP 5.1.0 之前本函数在失败时返回 -1
        $value = strtotime($value);
        if ($value < 1)
            return 0;
        return $value;
    }

    /**
     * 获取一个经过HTML过滤和转义的GPC变量
     * @param string $index GPC请求变量键名
     * @param bool $force 是否强制转义
     * @param string $method 请求方式限制,值为: GET,POST,COOKIE
     * @return string 返回将返回false,否则则可能是字符串或数组
     */
    public static function getVar($index, $force = false, $method = '')
    {
        $value = self::_getGPC($index, $method);
        return self::_getVar((string)$value, $force);
    }

    /**
     * 获取一个经过HTML过滤和转义的GPC变量
     * @param string $index GPC请求变量键名
     * @param bool $force 是否强制转义
     * @param string $method 请求方式限制,值为: GET,POST,COOKIE
     * @return array 返回将返回false,否则则可能是字符串或数组
     */
    public static function getVarArray($index, $force = false, $method = '')
    {
        $value = self::_getGPC($index, $method);
        $value = self::_getVar($value, $force);
        if (!$value || !is_array($value))
            return [];
        return $value;
    }

    /**
     * 通用获取变量
     * @param $value
     * @param bool $force 是否强制转义
     * @return mixed|string
     */
    private static function _getVar($value, $force = false)
    {
        if (!$value) return $value;
        $value = _addslashes($value, $force);
        return _trim($value);
    }

    /**
     * 获取一个数组请求，如果index请求值的键不在map的键中则抛出一个错误
     * @static
     * @param string $index GPC请求变量键名
     * @param array $map 字段数组，格式：[key=>type,,)，如: ['name'=>'var'),
     *             type类型有（区分大小写）:int,int[],float,float[],date,time,keyword,var,var[]；默认为var
     * @param string $method 请求方式限制,值为: GET,POST,COOKIE
     * @return array
     * @throws Exception
     */
    public static function getMap($index, $map, $method = '')
    {
        $value = self::_getGPC($index, $method);
        if ($value === false)
            return [];
        if (!is_array($value))
            throw new Exception('非数组请求：' . $index);

        $newValue = [];

        foreach ($map as $name => $type) {
            $Pv = isset($value[$name]) ? $value[$name] : null;
            switch ($type) {
                case 'int':
                    $Pv = (int)$Pv;
                    break;
                case 'int[]':
                    $Pv = is_array($Pv) && $Pv ? parseInt($Pv) : [];
                    break;
                case 'float':
                    $Pv = (float)$Pv;
                    break;
                case 'float[]':
                    $Pv = is_array($Pv) && $Pv ? parseFloat($Pv) : [];
                    break;
                case 'time':
                    $Pv = self::_getTime($Pv);
                    break;
                case 'keyword':
                    $Pv = preg_replace('/[^\w\-]/', '', $Pv);
                    break;
                case 'var[]':
                    $Pv = self::_getVar($Pv, true);
                    if (!is_array($Pv) || !$Pv) $Pv = [];
                    break;
                case 'var':
                default:
                    $Pv = (string)self::_getVar($Pv, true);
            }
            $newValue[$name] = $Pv;
        }
        unset($value);

        return $newValue;
    }

    /**
     * 从GPC数组中寻找索引值
     * @param string $index GPC请求变量键名
     * @param string $method 请求方式限制,值为: GET,POST,COOKIE
     * @return bool|string|array
     */
    private static function _getGPC($index, $method = '')
    {
        if ($method) {
            $name = '_' . $method;
            if (!isset($GLOBALS[$name][$index]))
                return false;
            return $GLOBALS[$name][$index];
        }
        if (isset($_POST[$index]))
            return $_POST[$index];
        if (isset($_GET[$index]))
            return $_GET[$index];
        $json = json_decode(file_get_contents("php://input"), true);
        if (isset($json[$index]))
            return $json[$index];


        return false;
    }


    /**
     * 统一输出格式
     *
     * @param bool $success 是否成功
     * @param mixed $message 错误信息，具体错误信息，正确信息为空
     * @param mixed $data 额外数据
     */
    public static function out(bool $success = true, $message = '', $data = NULL)
    {
        $ret = ['success' => $success, 'message' => $message];
        if ($data !== NULL) $ret['data'] = $data;

        echo json_encode($ret);
        exit;
    }


    /**
     * 接口日志记录
     * @param mixed $msg 信息
     * @param string $file 文件名
     * @param string $type 记录日志类型
     */
    public static function log($msg, $file, $type = 'default')
    {
        if (is_array($msg) || is_object($msg)) {
            $msg = json_encode($msg);
        }
        $date = date('Y-m-d H:i:s', time());
        $ymd = date('Ymd', time());
        $dir = VAR_DIR . "/log/$ymd/";
        if (!is_dir($dir)) {
            $old = umask(0);
            mkdir($dir, 0777, true);
            umask($old);
        }

        $log_file = $dir . $file . ".log";
        $log_line = "[{$date}] [{$type}] {$msg}\n";
        file_put_contents($log_file, $log_line, FILE_APPEND);
    }
}