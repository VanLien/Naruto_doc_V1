<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2018/10/30
 * Time: 下午10:51
 * 测试flume数据
 */
//初始化当前环境
require './Framework/_init.php';

use Framework\Api;
use Framework\Flume;

//$json = '{"operator_id":"321","operator":"fads321","by_the_operator_id":"321","by_the_operator":"321","channel_name":"1003992|1","date_time":"2018-10-15 17:07:55","device_id":"99001216049914","device_key":"","device_type":"Redmi 6 Pro","event":"22\u7ea7","event_type":"\u4f19\u4f34\u5347\u7ea7","gameserver_no":10001,"gender":"\u7537","header_type":"labour_union","ip":"116.22.53.238","log_id":766002,"labour_union_id":10033,"labour_union_name":"\u9a6c\u53ef\u6ce2\u7f57","platform_name":"devtest","product_name":"zhuxian","version":"v181014","ext":"fdsafads","info":"fdsafads"}';
//$json = '{"account_id":"1116241004_1003992-1_1003992|1_1003992|1","account_name":"1116241004_1003992-1_1003992|1","career":"藏剑","channel_name":"1003992|1","chr_id":"1352_devtest_10001","chr_level":26,"chr_level_vip":0,"chr_name":"阿姆斯朗蒂","date_time":"2018-10-15 17:07:55","device_id":"99001216049914","device_key":"","device_type":"Redmi6Pro","type":"公共","target":"","keyword":"keyword","guild":"","gameserver_no":10001,"gender":"男","header_type":"battle","ip":"116.22.53.238","log_id":766002,"platform_name":"devtest","product_name":"zhuxian","version":"v181014","ext":"fdsafads","info":"fdsafads","battle_type":"全民争霸","select_skill":"100001","used_skill":"1000002","cur_round":5,"combat_rate":1.11,"own_survival_num":3,"enemy_survival_num":0,"own_tdot":"七星阵","enemy_tdot":"急流阵","life_state":"健康","is_control":"否","order_of_release":3,"busy_skills":"{100001,100002}","own_buff":"{1,0,0,0}","mana":3,"own_pets":"[{\"name\":\"女娲\",\"career\":\"飞羽\",\"state\":\"上阵\",\"life_state\":\"一般\",\"is_control\":\"否\",\"is_exorcised\":\"是\",\"order\":2,\"skill_to_use\":\"2000001\",\"de_buff\":\"{0,0,1}\"},{\"name\":\"盘古\",\"career\":\"天罡\",\"state\":\"候阵\",\"life_state\":\"虚弱\",\"is_control\":\"否\",\"is_exorcised\":\"是\",\"order\":3,\"skill_to_use\":\"2000002\",\"de_buff\":\"{0,0,1}\"}]","enemy_pets":"[{\"name\":\"女娲\",\"career\":\"羽\",\"state\":\"上阵\",\"life_state\":\"一般\",\"is_control\":\"否\",\"is_exorcised\":\"是\",\"order\":2,\"skill_to_use\":\"2000001\",\"de_buff\":\"{0,0,1}\"},{\"name\":\"盘古\",\"career\":\"天罡\",\"state\":\"候阵\",\"life_state\":\"虚弱\",\"is_control\":\"否\",\"is_exorcised\":\"是\",\"order\":3,\"skill_to_use\":\"2000002\",\"de_buff\":\"{0,0,1}\"}]"}';
$json = '{"product_name":"test","header_type":"sy-reg","os_type":1,"version":"12","ip":"113.66.104.77","date_time":"2020-02-27 10:59:00","game_id":1,"app_id":1,"account_id":"123123","account_name":"HUA","user_type":1,"level_vip":2,"device_id":"123123","device_type":"123123","os":"123123","carrier":"123123","network_type":"123123"}';

$eq = json_decode($json, true);


$ret = Flume::sendFlume('sy-reg', $eq);

var_dump($ret);