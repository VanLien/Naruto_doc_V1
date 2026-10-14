<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/6/19
 * Time: 下午5:18
 * 渠道包下载功能
 */

namespace Modules;

use Framework\Api;
use Framework\Db;
use Framework\Curl;

class ChannelBag
{

    public static function bag()
    {
        $product_name = Api::getVar('product_name');
        $channel_name = Api::getVar('channel_name');
        $channel_group = Api::getVar('channel_group');
        $date_time = Api::getVar('date_time');
        $user = Api::getVar('userid');

        $sign = Api::getVar('sign');
        // 暂时兼容2套key
        if ($product_name == 'h5sszg') {
            $sercet = $GLOBALS['cfg']['h5sszg_secret_key'];
        } else {
            $sercet = $GLOBALS['cfg']['secret_key'];
        }

        if ($sign != md5($product_name . $date_time . $sercet) && $sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) {
            Api::out(false, 'sign error');
        }

        $info = [];
        if (!empty($channel_group)) { //兼容风色等特殊分发
            $sql = sprintf("SELECT * FROM gm_channel_bag WHERE product_name='%s' AND channel_group = '%s'", $product_name, sprintf('%s|%s', $channel_group, $channel_name));
            $info = Db::getInstance()->getRow($sql);
        }

        if (empty($info)) {
            $sql = sprintf("SELECT * FROM gm_channel_bag WHERE product_name='%s' AND FIND_IN_SET('%s', channel_name)", $product_name, $channel_name);
            $info = Db::getInstance()->getRow($sql);
        }

        if (!empty($user) && !empty($info)) {
            $cname = !empty($channel_group) ? sprintf('%s|%s', $channel_group, $channel_name) : $channel_name;
            $sql = sprintf("SELECT * FROM gm_channel_bag_use WHERE product_name = '%s' AND channel_name = '%s' AND user = '%s' ", $product_name, $cname, $user);
            $data = Db::getInstance()->getRow($sql);
            if (!empty($data)) {
                $info['mid'] = $data['mid'];
            }else{
                $name = sprintf("%s_%s.html", (int)(microtime(true) * 1000), $user);
                $aims_url = str_replace('-', '\-', str_replace('/', "\/", !empty($info['android']) ? $info['android'] : $info['ios']));
                exec(sprintf("cd /data/www/static/ && cp %s %s/%s", $info['file'], $product_name, $name));

                exec(sprintf("sed -i 's/%s/%s/g' /data/www/static/%s/%s ", $aims_url, $aims_url . "{" . $user . "}", $product_name, $name));

                $url = sprintf('http://static.apk.mengdawl.com/%s/%s', $product_name, $name);
                $mid = self::shortUrl($url);
                $insert = [
                    'product_name' => $product_name,
                    'channel_name' => $cname,
                    'user' => $user,
                    'mid' => $mid,
                ];
                Api::log($mid, 'bag', 'info');
                Db::getInstance()->insert('gm_channel_bag_use', $insert);
                $info['mid'] = $mid ?? $info['mid'];
            }
        }

        //支持跨域访问
        header("Access-Control-Allow-Origin: *");
        if ($info['status'] == 1) {
            Api::out(true, [
                'url' => $info['mid'],
                'qrcode_url' => $info['qrcode_url']
            ]);
        } else {
            Api::out(false, '该应用已下架');
        }

    }

    public static function shortUrl($url)
    {
        $ret = self::sina($url);
        return $ret['success'] ? $ret['message'] : $url;
    }

    public static function sina(string $url, string $type = 'shorten')
    {
        //$appKey = '4162138337'; //诗悦官网
        $appKey = '2849184197'; //iPad新浪客户端App Key

        $baseUrl = sprintf('http://api.t.sina.com.cn/short_url/%s.json?source=%s&url_long=%s', $type, $appKey, $url);

        $ret = Curl::get($baseUrl);

        if (!$ret['success']) {
            return $ret;
        }

        $code = json_decode($ret['message'], true);
        return $code[0]['url_short'] ?? '';
    }
}