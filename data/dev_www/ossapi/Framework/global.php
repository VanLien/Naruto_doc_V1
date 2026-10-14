<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2015/12/24
 * Time: 18:08
 * 基础方法
 */

function getIP()
{
    $clientIP = '0.0.0.0';
    if (isset($_SERVER['HTTP_CLIENT_IP']) && $_SERVER['HTTP_CLIENT_IP'] && strcasecmp($_SERVER['HTTP_CLIENT_IP'], 'unknown'))
        $clientIP = $_SERVER['HTTP_CLIENT_IP'];
    elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR']) && $_SERVER['HTTP_X_FORWARDED_FOR'] && strcasecmp($_SERVER['HTTP_X_FORWARDED_FOR'], 'unknown'))
        $clientIP = $_SERVER['HTTP_X_FORWARDED_FOR'];
    //web在内网，即web在vpn里的情况
    elseif (isset($_SERVER['HTTP_CDN_SRC_IP']) && $_SERVER['HTTP_CDN_SRC_IP'])
        $clientIP = $_SERVER['HTTP_CDN_SRC_IP'];
    elseif (isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown'))
        $clientIP = $_SERVER['REMOTE_ADDR'];

    preg_match('/[\d\.]{7,15}/', $clientIP, $clientIPmatches);
    $clientIP = $clientIPmatches[0] ? $clientIPmatches[0] : '0.0.0.0';
    unset($clientIPmatches);

    return $clientIP;
}

function _addslashes($var, $force = false)
{
    if (!$force) return $var;

    if (is_array($var)) {
        foreach ($var as &$v) {
            $v = _addslashes($v, $force);
        }
        return $var;
    }

    return addslashes($var);

}

/**
 * 清理空格 - 支持数组
 * @param mixed $var
 * @return mixed
 */
function _trim($var)
{
    if (is_array($var))
        return array_map("_trim", $var);
    return trim($var);
}

/**
 * 递归创建所有不存在的目录
 * @param string $path 目标路径
 * @param int $mode 权限，安全方案：注意:文件夹必须带有x权限才能有读取权限,文件带有x权限则有执行权限
 * @return bool
 */
function _mkdir($path, $mode = 0744)
{
    if (is_dir($path))
        return true;
    //bool mkdir ( string $pathname [, int $mode = 0777 [, bool $recursive = false [, resource $context ]]] )
    return mkdir($path, $mode, true);
}

/**
 * 创建一个PHP文件
 * @param string $file 路径
 * @param mixed $var 变量
 * @return boolean 是否写入成功
 */
function makePhp($file, $var)
{
    $data = '';
    if (!$file)
        return false;
    $data .= "<?php\n//this file create by framework " . date('Y-m-d H:i:s') .
        "\nreturn " . var_export($var, true) . ';';
    return file_put_contents($file, $data);
}


/**
 * 返回一个整数
 * @param mixed $var 字符串或数字或数组
 * @return int
 */
function parseInt($var)
{
    if (is_array($var))
        return array_map('parseInt', $var);
    return (int)$var;
}

/**
 * 返回一个浮点数 注:.9 这样方式将解析为0
 * @param mixed $var 字符串或数字或数组
 * @return float
 */
function parseFloat($var)
{
    if (is_array($var))
        return array_map('parseFloat', $var);
    return (float)$var;
}

/**
 * 检查是否答合手机号码规则
 * 参考: https://github.com/VincentSit/ChinaMobilePhoneNumberRegex
 * 电信:
 *     2G/3G号段（CDMA2000网络）133、153、180、181、189
 *     4G号段 177、173
 * 联通:
 *     2G号段（GSM网络）130、131、132、155、156
 *     3G上网卡145
 *     3G号段（WCDMA网络）185、186
 *     4G号段 176、185
 * 移动:
 *     2G号段（GSM网络）有134x（0-8）、135、136、137、138、139、150、151、152、158、159、182、183、184。
 *     3G号段（TD-SCDMA网络）有157、187、188
 *     3G上网卡 147
 *     4G号段 178、184
 * 卫星通信:
 *     1349
 * 虚拟运营商号码段：
 *  电信 1700、1701、1702
 *  联通 1707、1708、1709、171
 *  移动 1705
 * @param string 手机号码
 * @return bool
 */
function isPhoneNumber($phoneNumber)
{
    return preg_match("/^(13[0-9]|14[5-9]|15[0-3,5-9]|16[5-6]|17[0-8]|18[0-9]|19[1,8-9])(\d{8})$/", $phoneNumber);
}

/**
 * 是否有效的邮箱地址
 * @param string $email
 * @return bool
 */
function isValidMail($email)
{
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}

/**
 * 是否有效的IP地址，支持IPv4, IPv6
 * @param string $ip
 * @return bool
 */
function isValidIP($ip)
{
    return filter_var($ip, FILTER_VALIDATE_IP) !== false;
}

/**
 * 产生一个随机字符串(比mt_rand产生的随机性更高)
 * @param int $length 字串长度
 * @param string $alphabet 允许的字母列表
 * @return string
 */
function randToken($length, $alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
{
    $token = "";
    $max = strlen($alphabet) - 1;
    for ($i = 0; $i < $length; $i++) {
        $token .= $alphabet[crypto_rand_secure(0, $max)];
    }
    return $token;
}

function crypto_rand_secure($min, $max)
{
    $range = $max - $min;
    if ($range < 1) return $min;
    $log = ceil(log($range, 2));
    $bytes = (int)($log / 8) + 1;
    $bits = (int)$log + 1;
    $filter = (int)(1 << $bits) - 1;
    do {
        $rnd = hexdec(bin2hex(openssl_random_pseudo_bytes($bytes)));
        $rnd = $rnd & $filter;
    } while ($rnd >= $range);
    return $min + $rnd;
}