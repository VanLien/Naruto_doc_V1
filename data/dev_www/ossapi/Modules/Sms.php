<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/11/1
 * Time: 上午11:39
 * 短信服务接口
 */

namespace Modules;


use Framework\Alidayu;
use Framework\Api;
use Framework\Db;

class Sms
{
    public static function send()
    {
        $product_name = Api::getVar('product_name', true);
        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        $phoneNumber = Api::getVar('phone_number');
        if (!isPhoneNumber($phoneNumber)) Api::out(false, 'phone_number error');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');
        $post_time = date('Y-m-d H:i:s', $date_time);
         // 发送验证码
        $code = randToken(4, '0123456789');

        $ret = Alidayu::sendSms($phoneNumber, [
            'code' => $code
        ]);

        if ($ret) {
             $phone_number = $phoneNumber;
             Db::getInstance()->replace('gm_phone_message', compact('product_name','post_time', 'phone_number'));
             Api::out(true, ['code' => $code]);
        } else {
             Api::out(false, '发送失败');
        }
    }

    /**
     * 手机绑定上报
     */
    public static function phone()
    {
        $product_name = Api::getVar('product_name', true);
        $platform_name = Api::getVar('platform_name', true);
        $channel_name = Api::getVar('channel_name', true);
        $gameserver_no = Api::getInt('gameserver_no');

        //获取角色
        $role_id = Api::getInt('role_id');
        $lv = Api::getInt('lv');
        $account = Api::getVar('account', true);
        $role_name = Api::getVar('role_name', true);
        $os = Api::getVar('os', true);

        $phone_number = Api::getInt('phone_number');
        $post_time = date('Y-m-d H:i:s', Api::getInt('date_time'));

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        //插入数据库
        $replace = compact('product_name', 'platform_name', 'channel_name', 'gameserver_no', 'role_id', 'role_name', 'account',
            'post_time', 'phone_number', 'lv', 'os');

        $ret = Db::getInstance()->replace('gm_roles_phone_message', $replace);

        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }
}