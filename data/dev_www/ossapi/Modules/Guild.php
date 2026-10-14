<?php
/**
 * User: dengzhenhua Email:dengzhenhua@shiyuegame.com
 * Date: 2017/12/5
 * Time: 17:52
 */
namespace Modules;

use Framework\Api;
use Framework\Db;

class Guild
{
    /**
     * 公会上报
     * */
    public static function info()
    {
        $product_name = Api::getVar('product_name', true);
        $platform_name = Api::getVar('platform_name', true);
        $channel_name = Api::getVar('channel_name', true);
        $gameserver_no = Api::getInt('gameserver_no');

        //帮会信息
        $guild_id = Api::getInt('guild_id');
        $guild_name = Api::getVar('guild_name', true);
        $chief_name = Api::getVar('chief_name', true);
        $lv = Api::getInt('lv');
        $role_num = Api::getInt('role_num');
        $announcement = base64_encode(Api::getVar('announcement', true));
        $fund = Api::getInt('fund');
        $guild_create_time = date('Y-m-d H:i:s', Api::getInt('guild_create_time'));
        $type = !empty(Api::getInt('type')) ? Api::getInt('type') : 2;

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        //插入数据库
        $db = Db::getInstance();
        $db->set_charset('utf8mb4');
        try{
            $replace = compact('product_name', 'platform_name', 'channel_name', 'gameserver_no', 'guild_id', 'guild_name', 'chief_name',
                'lv', 'role_num', 'announcement', 'fund', 'guild_create_time', 'type');
            $guild = $db->getOne("SELECT id FROM gm_guild WHERE product_name='{$product_name}' AND platform_name='{$platform_name}' AND gameserver_no='{$gameserver_no}' AND guild_id='{$guild_id}'");
            if ($guild){
                $ret = $db->update('gm_guild',
                    $replace,
                    ['id' => $guild]
                );
            }else{
                $ret = $db->insert('gm_guild', $replace);
            }
        }catch (\Exception $e){
            $ret = false;
        }


        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }

    /**
     * 合并公会上报
     */
    public static function mergeInfo()
    {
        $product_name = Api::getVar('product_name', true);
        $lord_platform_name = Api::getVar('lord_platform_name', true);
        $lord_channel_name = Api::getVar('lord_channel_name', true);
        $lord_gameserver_no = Api::getInt('lord_gameserver_no');

        $vice_platform_name = Api::getVar('vice_platform_name', true);
        $vice_channel_name = Api::getVar('vice_channel_name', true);
        $vice_gameserver_no = Api::getInt('vice_gameserver_no');

        //帮会信息
        $lord_guild = Api::getInt('lord_guild');
        $lord_guild_name = Api::getVar('lord_guild_name', true);
        $lord_guild_lv = Api::getInt('lord_guild_lv');
        $lord_guild_member_data = Api::getVar('lord_guild_member_data', true);

        $vice_guild = Api::getInt('vice_guild');
        $vice_guild_name = Api::getVar('vice_guild_name', true);
        $vice_guild_lv = Api::getInt('vice_guild_lv');
        $vice_guild_member_data = Api::getVar('vice_guild_member_data', true);

        $alliance = Api::getVar('alliance', true);
        $alliance_time = date('Y-m-d H:i:s', Api::getInt('alliance_time'));

        $created_at = date('Y-m-d H:i:s', Api::getInt('date_time'));
        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        //插入数据库
        try{
            $ret = Db::getInstance()->insert('gm_merge_guild_log', compact('product_name','lord_platform_name', 'lord_channel_name',
                'lord_gameserver_no', 'vice_platform_name', 'vice_channel_name', 'vice_gameserver_no', 'lord_guild', 'lord_guild_name', 'lord_guild_lv', 'lord_guild_member_data',
                'vice_guild', 'vice_guild_name', 'vice_guild_lv', 'vice_guild_member_data', 'alliance', 'alliance_time', 'created_at'));
        }catch (\Exception $e){
            $ret = false;
        }


        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }
}