<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/8/29
 * Time: 上午11:55
 * 补齐上报flume失败记录
 */

namespace Modules;


use Framework\Api;
use Framework\Db;
use Framework\Flume;

class MakeUp
{
    public function run()
    {
        $row = Db::getInstance()->getAll("SELECT * FROM failed_flume order by id asc limit 10000");
        foreach ($row as $v) {
            $body = unserialize($v['body']);
            Flume::sendFlume($v['type'], $body);
            //删除记录
            Db::getInstance()->delete('failed_flume', ['id' => $v['id']]);
        }
        Api::log(sprintf('执行完毕,条数：%d', count($row)), 'make-up');
    }
}