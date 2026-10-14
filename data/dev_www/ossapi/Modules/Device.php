<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/6/21
 * Time: 上午10:18
 * 设备激活相关
 */

namespace Modules;

use Framework\Api;
use Framework\Flume;
use Framework\RedisDb;

class Device
{
    public static function activation()
    {
        $product_name = Api::getVar('product_name');
        $platform_name = Api::getVar('platform_name');
        $channel_name = Api::getVar('channel_name');
        $channel_name = urldecode($channel_name);

        $ip = Api::getVar('ip');
        if (empty($ip)) {
            $ip = getIP();
        }

        $date_time = Api::getVar('date_time');

        $device_id = Api::getVar('device_id');
        $device_type = Api::getVar('device_type');
        $os = Api::getVar('os');
        $carrier = Api::getVar('carrier');
        $network_type = Api::getVar('network_type');
        $resolution = Api::getVar('resolution');
        $version = Api::getVar('version');
        $aid = Api::getVar('aid');
        $gaid = Api::getVar('gaid');

        $key = rand(1, 5);
        $platform_array = json_decode(RedisDb::getInstance()->get(sprintf('%s_ossapi_%d', $product_name, $key)), true);
        if (is_array($platform_array)){
            foreach ($platform_array as $platform => $channel) {
                if (in_array($channel_name, $channel)){
                    $platform_name= $platform;
                }
            }
        }

        if (empty($platform_name)){
            $platform_name = 'default';
        }
        // 设备ID 为空使用 渠道_机型_IP
        if (empty($device_id)) {
            $device_id = sprintf('%s_%s_%s', $channel_name, $os, $ip);
        }
        $sign = Api::getVar('sign');
        if ($product_name == 'h5sszg') {
            $sercet = $GLOBALS['cfg']['h5sszg_secret_key'];
        } else {
            $sercet = $GLOBALS['cfg']['secret_key'];
        }

        if ($sign != md5($product_name . $date_time . $sercet)) {
            Api::out(false, 'sign error');
        }
        if ($product_name == 'fssj') {
            if ($platform_name == '--') {
                $platform_name = 'sy';
            }
            if (in_array($channel_name, $GLOBALS['cfg']['specialKey'])) {
                $channel_name = $GLOBALS['cfg']['specialArray'][$channel_name];
            }
        }
        //重置一下$date_time,客户端不保险,且暂时写死闪烁北美信任客户端时间
        if (!($product_name == 'sszg' && $platform_name == 'en' || $product_name == 'sgh5')) {
            $date_time = date('Y-m-d H:i:s');
        }
        $body = compact('product_name', 'platform_name', 'channel_name', 'ip', 'date_time',
            'device_id', 'device_type', 'os', 'carrier', 'network_type', 'resolution', 'version', 'aid', 'gaid');

        //支持跨域访问
        header("Access-Control-Allow-Origin: *");
        if (Flume::sendFlume('device', $body)) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }
}