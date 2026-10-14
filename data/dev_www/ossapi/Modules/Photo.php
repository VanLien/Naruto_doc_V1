<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2019/1/23
 * Time: 下午5:51
 * ip地址模块
 */

namespace Modules;

use Framework\Api;
use Framework\Db;

class Photo
{
    public static function back()
    {
        $data = Api::getVarArray('data', true);
        $score = [];
        $url = '';
        foreach ($data as $v) {
            $url = $data['url'];
            if (is_array($v)){
                $score[] = $v['score'];
            }
        }
        if (empty($url)){
            Api::out(false, '回调失败');
        }
        Api::log($url, 'back', 'info');
        Api::log(max($score) ?? 0, 'back', 'info');
        Db::getInstance()->insert('gm_photo_back_logs', ['url' => $url, 'score' => max($score) ?? 0 , 'created_at' => date('Y-m-d H:i:s')]);
        Api::out(true, '回调成功');
    }
}