<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/12/26
 * Time: 上午10:19
 * Cdn服务接口
 */

namespace Modules;

use Framework\Api;
use Framework\Lib\Qcloud\Cdn AS QcloudCdn;

class Cdn
{
    public static function refreshCdnUrl()
    {
        $product_name = Api::getVar('product_name', true);
        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        $urls = Api::getVarArray('urls');
        if (!is_array($urls)) Api::out(false, 'urls error');

        $cdn = new QcloudCdn($product_name);
        $ret = $cdn->refreshCdnUrl($urls);

        Api::out($ret['success'], $ret['message']);
    }


    public static function refreshCdnDir()
    {
        $product_name = Api::getVar('product_name', true);
        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        $dirs = Api::getVarArray('dirs');
        if (!is_array($dirs)) Api::out(false, 'dirs error');

        $cdn = new QcloudCdn();
        $ret = $cdn->refreshCdnDir($dirs);

        Api::out($ret['success'], $ret['message']);
    }
}