<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/6/28
 * Time: 上午9:51
 * 礼包接口
 */

namespace Modules;

use Flc\Alidayu\Client;
use Framework\Api;
use Framework\Curl;
use Framework\Db;

class Card
{
    public static $card_info;
    public static $card;
    public static $product_id;
    public static $card_id;
    public static $batch_id;
    public static $startTime;
    public static $endTime;


    public static function send()
    {
        $product_name = Api::getVar('product_name', true);
        $platform_name = Api::getVar('platform_name', true);
        $channel_name = Api::getVar('channel_name', true);
        $gameserver_no = Api::getInt('gameserver_no');
        $no = Api::getVar('no', true);
        //获取角色
        $role_id = Api::getInt('role_id');
        $lv = Api::getInt('lv');
        $role_name = Api::getVar('role_name', true);
        $account = Api::getVar('account', true);
        $account_id = Api::getVar('account_id', true);

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');
        Api::log($product_name, 'card', 'info');
        Api::log($no, 'card', 'info');
        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');
        //获取卡号信息
        self::getCard($product_name, $no);
        if (empty(self::$card)) Api::out(false, '礼包码不存在');

        //获取礼包基础信息
        self::getCardInfo();

        //设置自然周时间
        self::getWeekDate();
        if (empty(self::$card_info)) Api::out(false, '礼包信息不存在');
        if (!self::$card_info['status']) Api::out(false, '礼包未开启');
        //判断条件
        if ($lv < self::$card_info['lv']) Api::out(false, '礼包码未达到可用等级');
        //有效时间
        if (strtotime(self::$card_info['start_time']) > time()) Api::out(false, '礼包码未到使用时间');
        if (strtotime(self::$card_info['end_time']) < time()) Api::out(false, '礼包码已过期');
        //平台标识限制
        if (self::$card_info['platform_names'] && !in_array($platform_name, explode(',', self::$card_info['platform_names'])))
            Api::out(false, '该平台不能使用');
        //渠道标识限制
        if (self::$card_info['channel_names'] && !in_array($channel_name, explode(',', self::$card_info['channel_names'])))
            Api::out(false, '该渠道不能使用');

        if (self::getRoleUsedNum($role_id, $platform_name, $gameserver_no) > 0) Api::out(false, '已经领取过该礼包');

        if (self::checkPay($product_name, $role_id, $platform_name, $gameserver_no, self::$card_info['min_pay'], self::$card_info['max_pay'])) Api::out(false, '不符合领取该礼包');

        if (self::checkSpecial($product_name, $role_id, $platform_name, $gameserver_no, $account_id)) Api::out(false, '不符合领取该礼包');
        //使用次数
        if (self::$card_info['available_num'] && self::$card_info['available_num'] <= self::getReceiveNum($no))
            Api::out(false, '该礼包已经超过使用次数');
        //分组判断
        if (self::$card_info['group_id'] > 0 && in_array(self::$card_info['group_id'], self::getUsedGroup($role_id, $platform_name, $gameserver_no)))
            Api::out(false, '已使用过同类型的礼包');

        //返回奖励信息
        $insert = [
            'product_id' => self::$product_id,
            'card_id' => self::$card_id,
            'batch_id' => self::$batch_id,
            'no' => $no,
            'group_id' => self::$card_info['group_id'],
            'platform_name' => $platform_name,
            'gameserver_no' => $gameserver_no,
            'channel_name' => $channel_name,
            'role_id' => $role_id,
            'role_name' => $role_name,
            'account' => $account,
            'receive_time' => date('Y-m-d H:i:s'),
        ];
        $ret = Db::getInstance()->insert('gm_media_card_logs', $insert);
        if (!$ret) Api::out(false, '插入领取日志失败');
        // 这步看情况，后面数据量大可取消
        Db::getInstance()->update('gm_media_card_lists',
            ['receive_num' => (self::$card['receive_num'] + 1)],
            ['id' => self::$card['id']]
        );
        Api::out(true, [
            'card_id' => self::$card_info['id'],
            'card_name' => self::$card_info['name'],
            'group_id' => self::$card_info['group_id'],
            'title' => self::$card_info['title'],
            'content' => self::$card_info['content'],
            'item' => self::parseItems(self::$card_info['items']),
        ]);
    }

    /**
     * 解析物品信息，获取格式为：{BaseId,Bind,Num}
     * @param $rawItems
     * @return array
     */
    protected static function parseItems($rawItems)
    {
        $items = [];
        if (!$rawItems) return $items;
        $rawItems = array_filter(explode("\n", str_replace("\r", '', trim($rawItems))));
        foreach ($rawItems as $_item) {
            //骑士训练战甲：14000：1：绑定
            $_item = explode('：', $_item);
            //格式：物品基础ID,数量,0非绑定1绑定 {BaseId,Bind,Num}
            $items[] = [(int)$_item[1], (int)$_item[3], (int)$_item[2]];
        }

        return $items;
    }

    /**
     * 获取礼包
     * @param $product_name
     * @param $no
     */
    protected static function getCard($product_name, $no)
    {
        self::$card = Db::getInstance()->getRow("SELECT id,product_id,card_id,batch_id,receive_num FROM gm_media_card_lists WHERE product_name='{$product_name}' AND no='{$no}'");
        self::$product_id = self::$card['product_id'] ?? 0;
        self::$card_id = self::$card['card_id'] ?? 0;
        self::$batch_id = self::$card['batch_id'] ?? 0;
    }

    /**
     * 获取礼包基础信息
     */
    protected static function getCardInfo()
    {
        if (empty(self::$card)) {
            self::$card_info = [];
            return;
        }

        $sql = sprintf("SELECT * FROM gm_media_cards WHERE product_id=%d AND id=%d", self::$product_id, self::$card_id);

        self::$card_info = Db::getInstance()->getRow($sql);
    }

    /**
     * 获取角色已获取的分组ID
     * @param int $role_id
     * @param string $platform_name
     * @param int $gameserver_no
     * @return array
     */
    protected static function getUsedGroup(int $role_id, string $platform_name, int $gameserver_no)
    {
        $sql = sprintf("SELECT DISTINCT group_id FROM gm_media_card_logs WHERE role_id={$role_id} AND platform_name='{$platform_name}' AND gameserver_no={$gameserver_no} AND product_id=%s AND group_id>0", self::$product_id);
        $sql = self::setSql($sql);
        $rows = Db::getInstance()->getAll($sql);
        $group_ids = [];
        foreach ($rows as $group_id) {
            $group_ids[] = $group_id['group_id'];
        }
        return $group_ids;
    }

    /**
     * 获取角色领取礼包次数
     * @param int $role_id
     * @param string $platform_name
     * @param int $gameserver_no
     * @return int
     */
    protected static function getRoleUsedNum(int $role_id, string $platform_name, int $gameserver_no)
    {
        $sql = sprintf("SELECT count(1) FROM gm_media_card_logs WHERE role_id={$role_id} AND platform_name='{$platform_name}' AND gameserver_no={$gameserver_no} AND product_id=%d  AND card_id=%d", self::$product_id, self::$card_id);
        $sql = self::setSql($sql);
        $num = (int)Db::getInstance()->getOne($sql);
        return $num;
    }

    /**
     * 获取领取数量
     * @param $no
     * @param $available_num
     * @return int
     */
    protected static function getReceiveNum($no)
    {
        switch (self::$card_info['type']) {
            case 2: //2每周领取（以后扩展）
                $sql = sprintf("SELECT count(1) FROM gm_media_card_logs WHERE no = '{$no}' AND product_id=%d  AND card_id=%d", self::$product_id, self::$card_id);
                return (int)Db::getInstance()->getOne($sql);
                break;
            case 1: //1普通领取
            default:
                return self::$card['receive_num'];
                break;
        }
    }

    protected static function checkSpecial($product_name, $role_id, $platform_name, $gameserver_no, $account_id)
    {
        if (self::$card_info['type'] == 3) {
            $key = 'cBcc18D0808fEB9739601e893E2D4A07';
            $data = [];
            if ($account_id) {
                $sql = sprintf("SELECT * FROM gm_internal_stats WHERE product_id = '%s' AND account = '%s'", $product_name, $account_id);
                $data = Db::getInstance()->getRow($sql);
            }
            if ($data) {
                $sql = sprintf("SELECT product_id FROM products WHERE name = '%s'", $product_name);
                $product = Db::getInstance('oms-database')->getOne($sql);
                $sql = sprintf("SELECT platform_id FROM platforms WHERE product_id = %d AND name = '%s'", $product, $platform_name);
                $platforms = Db::getInstance('oms-database')->getOne($sql);
                $sql = sprintf("SELECT host FROM zones WHERE product_id = %d AND platform_id = %d AND zone_id = %d", $product, $platforms, $gameserver_no);
                $url = Db::getInstance('oms-database')->getOne($sql);
                $host = sprintf("http://%s/api.php/pf/sy/role_info", $url);
                $time = time();
                $sign = md5(sprintf('%d%s%d%d%s', $role_id, $platform_name, $gameserver_no, $time, $key));
                $ret = Curl::post($host, ['role_id' => $role_id, 'platform' => $platform_name, 'zone_id' => $gameserver_no, 'time' => $time, 'sign' => $sign]);
                $code = json_decode($ret['msg'], true);
                Api::log($code, 'card', 'info');
                if ($code['error'] == 1) {
                    if ($code['msg'] > 200) {
                        return true;
                    } else {
                        return false;
                    }
                } else {
                    return true;
                }
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    /**
     * 每周领取  返回这个星期的开始时间与结束时间
     *
     */
    protected static function getWeekDate()
    {
        $week = strftime("%u", time());
        self::$startTime = strftime("%Y-%m-%d 00:00:00", time() - ($week - 1) * 86400);
        self::$endTime = strftime("%Y-%m-%d 23:59:59", time() + (7 - $week) * 86400);
    }

    protected static function setSql($sql)
    {
        switch (self::$card_info['type']) {
            case 2:
                $sql = sprintf("%s AND receive_time BETWEEN '%s' AND '%s'", $sql, self::$startTime, self::$endTime);
                break;
            case 4:
                $sql = sprintf("%s AND receive_time BETWEEN '%s' AND '%s'", $sql, date('Y-m-d 00:00:00', time()), date('Y-m-d 23:59:59', time()));
                break;
        }
        return $sql;
    }

    protected static function checkPay($product_name, $role_id, $platform_name, $gameserver_no, $min, $max)
    {
        if ($min == 0 || $max == 0) {
            return false;
        }
        $key = 'cBcc18D0808fEB9739601e893E2D4A07';
        $sql = sprintf("SELECT product_id FROM products WHERE name = '%s'", $product_name);
        $product = Db::getInstance('oms-database')->getOne($sql);
        $sql = sprintf("SELECT platform_id FROM platforms WHERE product_id = %d AND name = '%s'", $product, $platform_name);
        $platforms = Db::getInstance('oms-database')->getOne($sql);
        $sql = sprintf("SELECT host FROM zones WHERE product_id = %d AND platform_id = %d AND zone_id = %d", $product, $platforms, $gameserver_no);
        $url = Db::getInstance('oms-database')->getOne($sql);
        $host = sprintf("http://%s/api.php/pf/sy/role_info", $url);
        $time = time();
        $sign = md5(sprintf('%d%s%d%d%s', $role_id, $platform_name, $gameserver_no, $time, $key));
        $ret = Curl::post($host, ['role_id' => $role_id, 'platform' => $platform_name, 'zone_id' => $gameserver_no, 'time' => $time, 'sign' => $sign]);
        $code = json_decode($ret['msg'], true);
        Api::log($code, 'card', 'info');
        if ($code['error'] == 1) {
            if ($code['msg'] >= $min && $code['msg'] <= $max) {
                return false;
            } else {
                return true;
            }
        } else {
            return true;
        }
    }
}