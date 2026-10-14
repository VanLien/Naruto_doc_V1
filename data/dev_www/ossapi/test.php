<?php
//初始化当前环境
require './Framework/_init.php';

use Framework\Curl;

/*$date_time = date('Y-m-d H:i:s', time());
//新玩家导入
$ret = Curl::post('test.com:8080/index.php/entry/step', [
    'product_name' => 'fssj',
    'platform_name' => '--',
    'channel_name' => '40',
    'ip' => '127.0.0.1',
    'date_time' => $date_time,
    'account_id' => 'syammcyds',
    'account_name' => 'syammcyds',
    'step' => '2',
    'sign' => md5('fssj' . $date_time . $GLOBALS['cfg']['secret_key']),
]);
var_dump($ret);*/


/*//设备激活
$ret = Curl::post('http://192.168.1.110/index.php/device/activation', [
    'product_name' => 'slg',
    'platform_name' => 'local',
    'channel_name' => '0',
    'ip' => '127.0.0.1',
    'date_time' => $date_time,
    'device_id' => 'e7c4d068-d3a70-jmcym-cny',
    'device_type' => 'iPhone',
    'os' => 'iOS 10',
    'carrier' => '移动',
    'network_type' => 'wifi',
    'resolution' => '1334*750',
    'sign' => md5('slg' . $date_time . $GLOBALS['cfg']['secret_key']),
]);

var_dump($ret);*/

//媒体卡请求
$date_time = time();
/*$ret = Curl::post('test.com:8080/index.php/card/send', [
    'product_name' => 'xianxia',
    'platform_name' => '37bate',
    'channel_name' => 'syxfhx',
    'gameserver_no' => '117',
    'date_time' => $date_time,
    'no' => '9b42f98190ca0dbe',
    'role_id' => '221',
    'role_name' => '龙帝的雪花',
    'account' => 'y222',
    'lv' => '20',
    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['server_key']),
]);

var_dump($ret);*/

//玩家反馈请求
/*$ret = Curl::post('test.com:8080/index.php/pvp/pvp', [
    'product_name' => 'xianxia',
    'platform_name' => 'yyb',
    'channel_name' => '1',
    'gameserver_no' => '1',
    'date_time' => $date_time,
    'role_id' => '647',
    'role_name' => '六月小师太',
    'account' => 'y222',
    'lv' => 20,
    'type' => 1,
    'title' => '测试。。。',
    'content' => 'asfdasddf阿斯顿发',
    'post_time' => time(),
    'ip' => '127.0.0.1',
    'phone' => '202-10114100',
    'full_name' => '小明',
    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['server_key']),
]);

var_dump($ret);*/

//提交开服申请到oms
/*$ret = Curl::post('http://oms.xianxia.shiyuegame.com/?mod=api&act=open', [
    'product_name' => 'xianxia',
    'date_time' => $date_time,
    'sign' => md5('xianxia' . $date_time . 'kmy3cycscym4@6'),
    'platform_name' => 'dev',
    'gameserver_no' => '2',
    'gameserver_name' => '测试服',
    'open_time' => $date_time,
    'url' => 's2.dev.xianxia.shiyuegame.com',
    'ip' => '115.159.117.157',
    'memo' => '备注',
]);

var_dump($ret);*/
//头像审核
/*$ret = Curl::post('test.com:8080/index.php/message/headReview', [
    'product_name' => 'xianxia',
    'platform_name' => 'yyb',
    'channel_name' => '1',
    'gameserver_no' => '1',
    'date_time' => $date_time,
    'role_id' => '647',
    'role_name' => '六月小师太',
    'account' => 'y222',
    'status' => '0',
    'num' => '3',
    'type' => '2',
    'type_name' => 'wahahah',
    'image' => 'https://wapbaike.123gm.top:81/item/%E8%B7%AF%E9%A3%9E',
    'post_time' => time(),
    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['server_key']),
]);

var_dump($ret);*/

//单用户通知推送
/*$ret = Curl::post('http://192.168.1.110/index.php/message/push', [
    'product_name' => 'xianxia',
    'date_time' => $date_time,
    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['server_key']),
    'app_id' => 'gMMH4oJAp89Q536YvIAqi2',
    'cid' => 'b3c37517d737c3f277697c51994afb86',
    'title' => '测试aaa',
    'content' => '测试aaaa',
]);
var_dump($ret);*/
//玩家反馈请求
/*$ret = Curl::post('http://192.168.1.110/index.php/guild/info', [
    'product_name' => 'xianxia',
    'platform_name' => 'yyb',
    'channel_name' => '1',
    'gameserver_no' => '1',
    'date_time' => $date_time,
    'guild_id' => 1,
    'guild_name' => '轰天帮',
    'chief_name' => '轰天帮帮主',
    'lv' => 2,
    'role_num' => 3,
    'announcement' => '轰天帮，你唔好理，总之好犀利！',
    'fund' => 1,
    'guild_create_time' => time(),
    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['server_key']),
]);

var_dump($ret);*/

//cdn刷新url请求
/*$ret = Curl::post('http://local.ossapi.com/index.php/cdn/refreshCdnUrl', [
    'product_name' => 'xianxia',
    'urls' => ['http://api.tg.shiyuegame.com/112/6011.html'],
    'date_time' => $date_time,
    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['server_key']),
]);

var_dump($ret);*/

//http://cdnres.fengbao.shiyuegame.com/yhsy/and/cn_a1/
//cdn刷新目录请求
//$ret = Curl::post('http://local.ossapi.com/index.php/cdn/refreshCdnDir', [
//    'product_name' => 'xianxia',
//    'dirs' => ['http://cdnres.fengbao.shiyuegame.com/yhsy/and/cn_a1/'],
//    'date_time' => $date_time,
//    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['server_key']),
//]);
//
//var_dump($ret);

/*$ret = Curl::post('test.com:8080/index.php/message/report', [
    'product_name' => 'xianxia',
    'platform_name' => 'yyb',
    'gameserver_no' => '1',
    'date_time' => $date_time,
    'violators_id' => 12,
    'violators_lvl' => 12,
    'violators_name' => '年',
    'account' => 'yyb_01',
    'type_name' => '骚扰谩骂',
    'evidence' => '嘿嘿嘿！',
    'whistle_blower_id' => 11,
    'whistle_blower_lvl' => 11,
    'whistle_blower_name' => '月',
    'source' => 2,
    'extend' => '123',
    'notice_type' => 1,
    'post_time' => time(),
    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['server_key']),
]);

var_dump($ret);*/
/*$ret = Curl::post('test.com:8080/index.php/channelbag/bag', [
    'product_name' => 'xianxia',
    'channel_name' => '1002738|1',
    'date_time' => $date_time,
    'sign' => md5('xianxia'.$date_time.$GLOBALS['cfg']['server_key']),
]);

var_dump($ret);*/
/*$ret = Curl::post('test.com:8080/index.php/sms/phone', [
    'product_name' => 'xianxia',
    'platform_name' => 'yyb',
    'channel_name' => '1',
    'gameserver_no' => '1',
    'date_time' => $date_time,
    'role_id' => '647',
    'role_name' => '六月小师太',
    'account' => 'y222',
    'lv' => '10',
    'os' => 'ios',
    'phone_number' => '123456789101',
    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['server_key']),
]);
var_dump($ret);*/

/*$ret = Curl::post('test.com:8080/index.php/buried/buried', [
    'product_name' => 'xianxia',
    'platform_name' => 'yyb',
    'channel_name' => '1',
    'gameserver_no' => '1',
    'date_time' => $date_time,
    'role_id' => '647',
    'role_name' => '六月小师太',
    'account' => 'y222',
    'lv' => '10',
    'vip_lv' => '10',
    'career' => '飞羽',
    'gender' => '男',
    'reg_time' => $date_time,
    'post_time' => $date_time,
    'package_id' => 1,
    'package_name' => '至尊卡',
    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['secret_key']),
]);
var_dump($ret);*/
/*$b = '{"data":[{"option_id":111,"type":4,"option":"11"},{"option_id":110,"type":4,"option":"11"},{"option_id":109,"type":1,"option":"D"},{"option_id":108,"type":1,"option":"D"},{"option_id":107,"type":1,"option":"\u7535\u8bdd\u5206\u5206\u5408\u5408\u7535\u8bdd"},{"option_id":106,"type":3,"option":"C"},{"option_id":105,"type":1,"option":"D"},{"option_id":104,"type":1,"option":"D"},{"option_id":103,"type":1,"option":"C"},{"option_id":102,"type":1,"option":"C"},{"option_id":101,"type":3,"option":"D"},{"option_id":100,"type":3,"option":"D"},{"option_id":99,"type":1,"option":"D"},{"option_id":98,"type":1,"option":"A"},{"option_id":97,"type":1,"option":"C"}]}';

$ret = Curl::post('test.com:8080/index.php/message/answer', [
    'product_name' => 'xianxia',
    'platform_name' => 'yycbc',
    'channel_name' => '1',
    'gameserver_no' => '1',
    'date_time' => $date_time,
    'role_id' => '647',
    'role_name' => '六月小师太',
    'account' => 'y222',
    'lv' => 20,
    'vip_lv' => 20,
    'amount' => 20.00,
    'post_time' => time(),
    'quest_id' => 1,
    'answer' => $b,
    'ip' => '192.168.2.166',
    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['server_key']),
]);

var_dump($ret);*/

/*$ret = Curl::post('test.com:8080/index.php/ip/area', [
    'product_name' => 'xianxia',
    'date_time' => $date_time,
    'ip' => '112.40.126.40',
    'sign' => md5('xianxia' . $date_time . $GLOBALS['cfg']['server_key']),
]);
var_dump($ret);*/

/*$data = json_encode(['data' => [[
    'product_name'  =>  'sszg' ,
    'platform_name'  =>  'release2' ,
    'channel_name'  =>  'release2' ,
    'gameserver_no'  =>  '1' ,
    'ip'  =>  '192.168.62.6' ,
    'date_time'  =>  '2019-03-12 14:37:45' ,
    'account_id'  =>  'x7VS9CJ52E9c' ,
    'account_name'  =>  'x7VS9CJ52E9c' ,
    'chr_id'  =>  '445_release2_1' ,
    'chr_name'  =>  '霸道滴无情' ,
    'chr_level'  =>  '99' ,
    'chr_level_vip'  =>  '0' ,
    'career'  =>  '拓跋' ,
    'gender'  =>  '女' ,
    "compete" => "1",
    'session_id'  =>  '123' ,
    'formation_id'  =>  '1' ,
    'location_id'  =>  '2' ,
    'partner_id'  =>  '3' ,
    'partner_name'  =>  'hh' ,
    'partner_level'  =>  '1' ,
    'partner_star'  =>  '1' ,
    'type'  =>  '竞技场' ,
    'bout'  =>  '1' ,
    'result'  =>  '1' ,
    'mark'  =>  '1' ,
    'phase'  =>  '1' ,
    'phase_mark'  =>  '1' ,
    'info'  =>  '1',
    'partner_info' => '亚巴顿,炎魔之王,雅典娜,潘多拉,大祭司'
]]]);

$ret = Curl::post('test.com:8080/index.php/pvp/pvp', [
    'product_name' => 'sszg',
    'date_time' => $date_time,
    'sign' => md5('sszg' . $date_time . $GLOBALS['cfg']['server_key']),
    'data' => $data
]);
var_dump($ret);*/

$data = json_encode([[
    'platform_name'  =>  'jangest' ,
    'status' => 1,
    'issue'  =>  '100010' ,
    'item_id'  =>  '100010' ,
    'item_name'  =>  '大力丸' ,
    'date_time'  =>  $date_time ,
]]);

$ret = Curl::post('http://192.168.1.110/index.php/treasure/treasure', [
    'product_name' => 'xxwy',
    'date_time' => $date_time,
    'sign' => md5('xxwy' . $date_time . $GLOBALS['cfg']['server_key']),
    'data' => $data
]);
var_dump($ret);
