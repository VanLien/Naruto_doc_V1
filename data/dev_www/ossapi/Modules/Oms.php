<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2019/3/1
 * Time: 下午5:59
 * oms 相关
 */

namespace Modules;

use Framework\Api;

class Oms
{
    /**
     * oms 加代理检查端口
     */
    public static function nc()
    {
        $ip = Api::getVar('ip', true);
        $ip_proxy = Api::getVar('ip_proxy', true);
        $port = Api::getInt('port');
        $port_proxy = Api::getInt('port_proxy');

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($ip . $ip_proxy . $port . $port_proxy . $date_time . $GLOBALS['cfg']['server_key'])) exit('fail');

        $cmd = "nc -vz -i 2 -w 5 -n -x {$ip_proxy}:{$port_proxy} {$ip} {$port} && echo ok";
        $ret = exec($cmd);
        exit($ret);
    }
}