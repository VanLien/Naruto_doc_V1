<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2019/1/23
 * Time: 下午5:51
 * ip地址模块
 */

namespace Modules;

use Framework\Api;
use Framework\Curl;
use Framework\IpLocation;

class Ip
{
    /**
     * ip地址转地理位置
     */
    public static function area()
    {
        $product_name = Api::getVar('product_name', true);
        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        $ip = Api::getVar('ip');
        if (!isValidIP($ip)) Api::out(false, 'ip error');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');
        $ret = IpLocation::getLocation($ip);
        $url = [
            sprintf("https://api.map.123gm.top:81/location/ip?ak=dNXG8D22vsSGrx6MnsnKfBnl50kHeL1e&ip=%s", $ip),
            sprintf("http://ip.taobao.com/service/getIpInfo.php?ip=%s", $ip)
        ];
        if (empty($ret['city'])) {
            foreach ($url as $k => $v) {
                $message = self::getAreaMessage($v, $k);
                if (!empty($message['city']) && !empty($message['province'])){
                    $ret['city'] = $message['city'];
                    $ret['province'] = $message['province'];
                    break;
                }
            }
        }
        if (isset($ret['error'])) {
            Api::out(false, '解析失败');
        } else {
            Api::out(true, $ret);
        }
    }

    /**
     * 纯真IP获取不到城市后
     * 向百度地图和淘宝IP查询城市
     * @param string $url
     * @param int $type 0 百度地图 1淘宝IP
     * @return array ['city' => '广州', 'province' => '广东']
     **/
    public static function getAreaMessage($url, $type)
    {
        $city = '';
        $province = '';
        $res = Curl::get($url);
        if ($res['result']) {
            $msg = json_decode($res['msg'], true);
            if ($msg[($type == 0 ? 'status' : 'code')] == 0) {
                $city = ($type == 0 ? $msg['content']['address_detail']['city'] : $msg['data']['city']);
                $province = ($type == 0 ? $msg['content']['address_detail']['province'] : $msg['data']['region']);
            }
        }
        return ['city' => $city, 'province' => $province];
    }
}