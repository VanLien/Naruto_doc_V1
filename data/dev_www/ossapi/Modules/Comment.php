<?php
/**
 * User: dengzhenhua Email:dengzhenhua@shiyuegame.com
 * Date: 2018/1/26
 * Time: 09:52
 */
namespace Modules;

use Framework\Api;
use Framework\Db;

class Comment
{
    /**
     * 伙伴评论上报
     * */
    public static function info()
    {
        $product_name = Api::getVar('product_name', true);
        $platform_name = Api::getVar('platform_name', true);
        $channel_name = Api::getVar('channel_name', true);
        $gameserver_no = Api::getInt('gameserver_no');

        //伙伴评论信息
        $comment_id = Api::getInt('comment_id');
        $partner_id = Api::getInt('partner_id');
        $partner_name = Api::getVar('partner_name', true);
        $role_id = Api::getInt('role_id');
        $role_name = Api::getVar('role_name', true);
        $account = Api::getVar('account', true);
        $account_name = Api::getVar('account_name', true);
        $comments = Api::getVar('comments', true);
        $like_num = Api::getInt('like_num');

        $unlike_num = Api::getInt('unlike_num');
        $recommend = Api::getInt('recommend');
        $type_id = Api::getInt('type_id');
        $type_name = Api::getInt('type_name');
        $post_time = date('Y-m-d H:i:s', Api::getInt('post_time'));
        $created_at = date('Y-m-d H:i:s', time());

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        //插入数据库
        $db = Db::getInstance();
        $db->set_charset('utf8mb4');
        $replace = compact('product_name', 'platform_name', 'channel_name', 'gameserver_no', 'comment_id', 'role_id', 'role_name',
            'account', 'account_name', 'comments', 'like_num', 'unlike_num', 'recommend', 'post_time', 'created_at', 'partner_id', 'partner_name',
            'type_id', 'type_name');
        $id = $db->getOne("SELECT id FROM gm_comment WHERE product_name='{$product_name}' AND platform_name='{$platform_name}' AND gameserver_no='{$gameserver_no}' AND comment_id='{$comment_id}' AND type_id='{$type_id}'");
        if ($id){
            $ret = $db->update('gm_comment',
                $replace,
                ['id' => $id]
            );
        }else{
            $ret = $db->insert('gm_comment', $replace);
        }

        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }
}