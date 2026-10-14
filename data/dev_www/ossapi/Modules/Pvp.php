<?php
/**
 * Created by PhpStorm.
 * User: vicdeng
 * Date: 2019/3/13
 * Time: 下午2:58
 */

namespace Modules;

use Framework\Api;
use MongoDB;
use Framework\Db;

class Pvp
{

    public static function pvp()
    {
        Api::out(false, '关闭接口');
        /*$product_name = Api::getVar('product_name');
        $date_time = Api::getVar('date_time');
        $sign = Api::getVar('sign');
        $data = Api::getVar('data', true);

        //支持跨域访问
        header("Access-Control-Allow-Origin: *");
        try {
            $inserts = json_decode(stripslashes($data), true)['data'];
            if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) {
                Api::out(false, 'sign error');
            }

            $manager = new MongoDB\Driver\Manager($GLOBALS['cfg']['mongodb']);
            $bulk = new MongoDB\Driver\BulkWrite;

            foreach ($inserts as $insert) {
                $productSql = sprintf("SELECT product_id FROM products WHERE name = '%s' ", $insert['product_name']);
                $product = Db::getInstance('game-database')->getOne($productSql);

                if (empty($product)) {
                    Api::out(false, '游戏ID找不到');
                }

                $channelSql = sprintf("SELECT channel_id FROM channels WHERE name = '%s' ", $insert['channel_name'], $product);
                $channel = Db::getInstance('game-database')->getOne($channelSql);

                if (empty($channel)) {
                    Api::out(false, '渠道找不到');
                }

                $platformsSql = sprintf("SELECT platform_id FROM platforms WHERE name = '%s' AND product_id = %s", $insert['platform_name'], $product);
                $platforms = Db::getInstance('game-database')->getOne($platformsSql);

                if (empty($platforms)) {
                    Api::out(false, '平台找不到');
                }

                $gameserverSql = sprintf("SELECT gameserver_id FROM gameservers WHERE no = %d AND platform_id = %d AND product_id = %d ", $insert['gameserver_no'], $platforms, $product);
                $gameserver = Db::getInstance('game-database')->getOne($gameserverSql);

                if (empty($gameserver)) {
                    Api::out(false, '服务器找不到');
                }

                $typeSql = sprintf("SELECT unique_type_id FROM im_pvp_type WHERE name = '%s' AND product_id = %s", $insert['type'], $product);
                $type = Db::getInstance('game-database')->getOne($typeSql);

                if (empty($type)) {
                    $insert = [
                        'product_id' => $product,
                        'name' => $insert['type'],
                        'alias' => $insert['type'],
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),

                    ];
                    $type = Db::getInstance('game-database')->insert('im_pvp_type', $insert);
                }
                $bulk->insert(array_merge($insert, [
                    'product_id' => (int)$product,
                    'channel_id' => (int)$channel,
                    'platform_id' => (int)$platforms,
                    'gameserver_id' => (int)$gameserver,
                    'type_id' => (int)$type,
                    'date' => date('Y-m-d', strtotime($insert['date_time'])),
                ]));
            }
            $manager->executeBulkWrite(sprintf('shiyue.%s_pvp', $product_name), $bulk);
            Api::out(true, '上报成功');
        } catch (\Exception $e) {
            Api::log($e->getMessage(), 'pvp', 'error');

            Api::out(false, '上报失败');
        }*/
    }
}