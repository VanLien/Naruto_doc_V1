<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/7/13
 * Time: 下午5:47
 * 信息模块
 */

namespace Modules;

use Framework\Api;
use Framework\Db;
use Framework\Push;
use Framework\IpLocation;

class Message
{

    /**
     * 玩家反馈
     */
    public static function feedback()
    {
        $product_name = Api::getVar('product_name', true);
        $platform_name = Api::getVar('platform_name', true);
        $channel_name = Api::getVar('channel_name', true);
        $gameserver_no = Api::getInt('gameserver_no');

        //获取角色
        $role_id = Api::getInt('role_id');
        $lv = Api::getInt('lv');
        $vip_lv = Api::getInt('vip_lv');
        $amount = Api::getFloat('amount');
        $role_name = Api::getVar('role_name', true);
        $account = Api::getVar('account', true);

        $type = Api::getInt('type');
        $title = Api::getVar('title', true);
        $content = Api::getVar('content', true);
        $post_time = date('Y-m-d H:i:s', Api::getInt('post_time'));
        $ip = Api::getVar('ip', true);
        $phone = Api::getVar('phone', true);
        $full_name = Api::getVar('full_name', true);
        $extend = Api::getVar('extend', true);
        $cli_ver = Api::getVar('cli_ver', true) ?? '';
        $order_id = Api::getVar('order_id') ?? '';
        $mail = Api::getVar('mail', true) ?? '';
        $device = Api::getVar('device', true) ?? '';
        //@TODO 图片处理逻辑

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        if (!in_array($type, [1, 2, 3])) Api::out(false, 'type error');

        //插入数据库
        $insert = compact('product_name', 'platform_name', 'channel_name', 'gameserver_no', 'role_id', 'role_name', 'account', 'lv', 'vip_lv', 'amount',
            'type', 'title', 'content', 'post_time', 'ip', 'phone', 'full_name', 'extend', 'cli_ver', 'order_id', 'mail', 'device');

        //有表情符号等特殊字符
        $db = Db::getInstance();
        $db->set_charset('utf8mb4');
        $ret = $db->insert('gm_feedback', $insert);

        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }

    /**
     * 头像审核
     * */
    public static function headReview()
    {
        $product_name = Api::getVar('product_name', true);
        $platform_name = Api::getVar('platform_name', true);
        $channel_name = Api::getVar('channel_name', true);
        $gameserver_no = Api::getInt('gameserver_no');

        //获取角色
        $role_id = Api::getInt('role_id');
        $role_name = Api::getVar('role_name', true);
        $account = Api::getVar('account', true);

        //审核内容
        $status = Api::getInt('status');
        $post_time = date('Y-m-d H:i:s', Api::getInt('post_time'));
        $image = Api::getVar('image', true);
        $extend = Api::getVar('extend', true);
        $num = Api::getInt('num');
        $type = Api::getInt('type') ? Api::getInt('type') : 1;
        $type_name = Api::getVar('type_name', true) ? Api::getVar('type_name', true) : '头像审核';

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        //插入数据库
        $insert = compact('product_name', 'platform_name', 'channel_name', 'gameserver_no', 'role_id', 'role_name', 'account',
            'status', 'post_time', 'image', 'num', 'type', 'type_name', 'extend');

        $db = Db::getInstance();
        $db->set_charset('utf8mb4');
        $ret = $db->insert('gm_head_review', $insert);

        if ($ret) {
            Api::out(true, ['avatar_id' => $ret]);
            //Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }


    /**
     * 单用户通知推送
     */
    public static function push()
    {
        $product_name = Api::getVar('product_name', true);
        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        //消息配置
        $app_id = Api::getVar('app_id');
        $cid = Api::getVar('cid');
        $title = Api::getVar('title');
        $content = Api::getVar('content');
        if (empty($app_id) || empty($cid) || empty($title) || empty($content)) Api::out(false, 'parameter error');

        $appCfg = Db::getInstance()->getRow("SELECT * FROM gm_message_push_apps WHERE product_name='{$product_name}' AND getui_app_id='{$app_id}'");
        if (empty($appCfg)) Api::out(false, '个推应用配置错误');

        $messageCfg = [
            'title' => $title,
            'content' => $content,
            'type' => 1,
            'is_offline' => $appCfg['is_ios'] ? 1 : 0,
            'offline_time' => $appCfg['is_ios'] ? 2 : 0,
        ];

        $push = new Push($messageCfg, $appCfg);
        $ret = $push->pushMessageToSingle($cid);
        if ($ret['result'] == 'ok') {
            Api::log($ret, 'getui', 'info');
            Api::out(true, sprintf('推送成功,任务ID:%s,状态:%s', $ret['taskId'], $ret['status']));
        } else {
            Api::log($ret, 'getui', 'error');
            Api::out(false, '推送失败:' . $ret['result']);
        }

    }

    /**
     * 多用户通知推送
     */
    public static function pushToList()
    {
        $product_name = Api::getVar('product_name', true);
        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        //消息配置
        $app_id = Api::getVar('app_id');
        $cid = Api::getVar('cid');
        $title = Api::getVar('title');
        $content = Api::getVar('content');
        if (empty($app_id) || empty($cid) || empty($title) || empty($content)) Api::out(false, 'parameter error');

        $cids = explode(',', $cid);
        if (empty($cids)) Api::out(false, 'cid error');
        if (count($cids) > 500) Api::out(false, 'cid 个数不能大于500');

        $appCfg = Db::getInstance()->getRow("SELECT * FROM gm_message_push_apps WHERE product_name='{$product_name}' AND getui_app_id='{$app_id}'");
        if (empty($appCfg)) Api::out(false, '个推应用配置错误');

        $messageCfg = [
            'title' => $title,
            'content' => $content,
            'type' => 1,
            'is_offline' => $appCfg['is_ios'] ? 1 : 0,
            'offline_time' => $appCfg['is_ios'] ? 2 : 0,
        ];

        $push = new Push($messageCfg, $appCfg);
        $ret = $push->pushMessageToList($cids);
        if ($ret['result'] == 'ok') {
            Api::log($ret, 'getui', 'info');
            Api::out(true, sprintf('推送成功,任务ID:%s,状态:%s', $ret['taskId'], $ret['status']));
        } else {
            Api::log($ret, 'getui', 'error');
            Api::out(false, '推送失败:' . $ret['result']);
        }
    }

    /**
     * vip列表
     */
    public static function vip()
    {
        $product_name = Api::getVar('product_name', true);
        $platform_name = Api::getVar('platform_name', true);
        $channel_name = Api::getVar('channel_name', true);
        $gameserver_no = Api::getInt('gameserver_no');

        //获取角色
        $role_id = Api::getInt('role_id');
        $amount = Api::getFloat('amount');
        $role_name = Api::getVar('role_name', true);
        $account = Api::getVar('account', true);

        $qq = Api::getInt('qq');
        $post_time = date('Y-m-d H:i:s', Api::getInt('post_time'));

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        //插入数据库
        $insert = compact('product_name', 'platform_name', 'channel_name', 'gameserver_no', 'role_id', 'role_name', 'account', 'amount',
            'post_time', 'qq');

        $ret = Db::getInstance()->insert('gm_vip', $insert);

        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }

    /**
     * 举报人接口
     */
    public static function report()
    {
        $product_name = Api::getVar('product_name', true);
        $platform_name = Api::getVar('platform_name', true);
        $gameserver_no = Api::getInt('gameserver_no');
        $channel_name = Api::getVar('channel_name');

        //获取角色
        $violators_id = Api::getInt('violators_id');
        $violators_lvl = Api::getInt('violators_lvl');
        $violators_name = Api::getVar('violators_name', true);
        $account = Api::getVar('account', true);
        $type_name = Api::getVar('type_name', true);
        $directions = Api::getVar('directions', true);
        $evidence = Api::getVar('evidence', true);
        $post_time = date('Y-m-d H:i:s', Api::getInt('post_time'));
        $created_at = date('Y-m-d H:i:s', time());
        $whistle_platform_name = Api::getVar('whistle_platform_name');
        $whistle_gameserver_no = Api::getInt('whistle_gameserver_no');
        $whistle_channel_name = Api::getVar('whistle_channel_name');
        $whistle_blower_id = Api::getInt('whistle_blower_id');
        $whistle_blower_lvl = Api::getInt('whistle_blower_lvl');
        $notice_type = Api::getInt('notice_type');
        $whistle_blower_name = Api::getVar('whistle_blower_name', true);
        $source = Api::getInt('source') ? Api::getInt('source') : 1;
        $extend = Api::getVar('extend', true);

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if (empty($evidence)) {
            Api::out(false, '上报失败');
        }
        $content_id = md5($evidence);

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        //插入数据库
        $insert = compact('product_name', 'platform_name', 'gameserver_no', 'channel_name', 'violators_id', 'violators_lvl', 'account', 'violators_name', 'type_name',
            'post_time', 'evidence', 'directions', 'whistle_blower_id', 'whistle_blower_lvl', 'whistle_blower_name', 'created_at', 'source', 'extend',
            'whistle_platform_name', 'whistle_gameserver_no', 'whistle_channel_name', 'content_id', 'notice_type');

        $sql = sprintf("SELECT count(1) FROM gm_report_source WHERE product_name='%s' AND source='%s'", $product_name, $source);
        $exist = (int)Db::getInstance()->getOne($sql);
        if (!$exist) {
            Db::getInstance()->insert('gm_report_source', [
                'product_name' => $product_name,
                'source' => $source,
                'name' => $source,
                'created_at' => date('Y-m-d H:i:s', $date_time),
                'updated_at' => date('Y-m-d H:i:s', $date_time),
            ]);
        }

        $ret = Db::getInstance()->insert('gm_report', $insert);

        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }

    /**
     * 玩家反馈
     */
    public static function feedbackScore()
    {
        $product_name = Api::getVar('product_name', true);

        $extend = Api::getVar('extend', true);

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        $data = json_decode(stripslashes($extend), true);

        $ret = false;
        if (isset($data['id'])) {
            $ret = Db::getInstance()->update('gm_feedback',
                ['score' => $data['score']],
                ['id' => $data['id']]
            );
        }elseif (isset($data['order_id'])) {
            $ret = Db::getInstance()->update('gm_feedback',
                ['score' => $data['score']],
                ['order_id' => $data['order_id']]
            );
        }

        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }

    /**
     * 玩家反馈: 更新反馈状态
     * http://local.oss.api.shiyuegame.com:23000/index.php/message/feedbackStatus
     */
    public static function feedbackStatus()
    {
        $product_name = Api::getVar('product_name', true);
        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');
        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        $extend = Api::getVar('extend', true);
        $data = json_decode(stripslashes($extend), true);
        $ret = Db::getInstance()->update('gm_feedback',
            ['reply_status' => $data['status'], 'status_change_at' => date('Y-m-d H:i:s')],
            ['order_id' => $data['order_id']]
        );

        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }

    public static function answer()
    {
        $product_name = Api::getVar('product_name', true);
        $platform_name = Api::getVar('platform_name', true);
        $channel_name = Api::getVar('channel_name', true);
        $gameserver_no = Api::getInt('gameserver_no');

        //获取角色
        $role_id = Api::getInt('role_id');
        $lv = Api::getInt('lv');
        $vip_lv = Api::getInt('vip_lv');
        $fill_time = Api::getInt('fill_time');
        $amount = Api::getFloat('amount');
        $role_name = Api::getVar('role_name', true);
        $account = Api::getVar('account', true);

        $post_time = date('Y-m-d H:i:s', Api::getInt('post_time'));
        $ip = Api::getVar('ip', true);
        $quest_id = Api::getInt('quest_id');
        $answer = Api::getVar('answer', true);
        $answerArray = json_decode(stripslashes($answer), true);

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        if (empty($ip)) Api::out(false, 'ip empty');

        if (!is_array($answerArray)) Api::out(false, 'answer is not json string');
        try {
            $ipList = IpLocation::getLocation($ip);
        } catch (\Exception $e) {
            $ipList = [];
        }
        $province = $ipList['province'] ?? '未知';
        $city = $ipList['city'] ?? '未知';
        $insert = compact('product_name', 'platform_name', 'channel_name', 'gameserver_no', 'role_id', 'role_name', 'account',
            'lv', 'post_time', 'vip_lv', 'amount', 'quest_id', 'ip', 'province', 'city', 'answer', 'fill_time');
        try {
            $ret = Db::getInstance()->insert('gm_answer_role', $insert);
        } catch (\Exception $e) {
            Api::out(false, 'role to Answered ');
        }

        foreach ($answerArray['data'] as $v) {
            $option_id = $v['option_id'];
            $type = $v['type'];
            $answer_id = $ret;
            $v['option'] = explode(',', $v['option']);
            if (is_array($v['option'])) {
                foreach ($v['option'] as $val) {
                    $option = $val;
                    $option = compact('option_id', 'type', 'option', 'answer_id');
                    Db::getInstance()->insert('gm_answer_option', $option);
                }

            } else {
                $option = $v['option'];
                $option = compact('option_id', 'type', 'option', 'answer_id');
                Db::getInstance()->insert('gm_answer_option', $option);
            }
        }

        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }

    public static function sendMessage()
    {
        $product_name = Api::getVar('product_name', true);

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');
        $receiver = Api::getVar('receiver', true);
        $messages = Api::getVar('messages', true);
        $title = Api::getVar('title', true);

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        try {
            $from = "shiyuegame@126.com";
            $headers = "From: $from";
            mail($receiver, $title, $messages, $headers);
            Api::out(true, '发送成功');
        } catch (\Exception $e) {
            Api::out(true, '发送失败');
        }
    }
}