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

class Treasure
{

    public static function treasure()
    {

        $product_name = Api::getVar('product_name');
        $date_time = Api::getVar('date_time');
        $sign = Api::getVar('sign');
        $data = Api::getVar('data', true);
        try {
            $inserts = json_decode(stripslashes($data), true);
            if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) {
                Api::out(false, 'sign error');
            }


            $productSql = sprintf("SELECT product_id FROM products WHERE name = '%s' ", $product_name);
            $product = Db::getInstance('game-database')->getOne($productSql);

            if (empty($product)) {
                Api::out(false, '游戏ID找不到');
            }

            $manager = new MongoDB\Driver\Manager($GLOBALS['cfg']['mongodb']);
            $bulk = new MongoDB\Driver\BulkWrite;

            foreach ($inserts as $insert) {
                $platformsSql = sprintf("SELECT platform_id FROM platforms WHERE name = '%s' AND product_id = %s", $insert['platform_name'], $product);
                $platforms = Db::getInstance('game-database')->getOne($platformsSql);

                if (empty($platforms)) {
                    Api::out(false, '平台找不到');
                }

                $typeSql = sprintf("SELECT id FROM im_treasure_items WHERE item_name = '%s' AND item_id = '%s' AND product_id = %s", $insert['item_name'], $insert['item_id'], $product);
                $type = Db::getInstance('game-database')->getOne($typeSql);

                if (empty($type)) {
                    $insert = [
                        'product_id' => $product,
                        'item_id' => $insert['item_id'],
                        'item_name' => $insert['item_name'],
                        'alias' => $insert['item_name'],
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),

                    ];
                    $type = Db::getInstance('game-database')->insert('im_treasure_items', $insert);
                }
                $bulk->insert([
                    'product_id' => (int)$product,
                    'product_name' => $product_name,
                    'platform_id' => (int)$platforms,
                    'platform_name' => $insert['platform_name'],
                    'status' => (int)$insert['status'],
                    'unique_item_id' => (int)$type,
                    'issue' => $insert['issue'],
                    'item_id' => $insert['item_id'],
                    'item_name' => $insert['item_name'],
                    'the_date' => date('Y-m-d', $insert['date_time']),
                    'the_date_time' => date('Y-m-d H:i:s', $insert['date_time']),
                ]);
            }
            $manager->executeBulkWrite('shiyue.treasure', $bulk);
            Api::out(true, '上报成功');
        } catch (\Exception $e) {
            Api::log($e->getMessage(), 'treasure', 'error');

            Api::out(false, '上报失败');
        }
    }


}