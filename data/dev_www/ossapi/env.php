<?php
//配置
$GLOBALS['cfg'] = [
    'debug' => false,
    //秘钥
    'secret_key' => 'cmTc8^vv1k(,i2<}nc52-<#.lxz5>9m#2MMCYSD',
   
    'h5sszg_secret_key' => 'B27DE63b40e1œ∑3d45@@7335d30a6a6e5D30A6A',
     //服务端秘钥
    'server_key' => 'cmRcnnv1ky43qwc2379m28VKpcjc58cycYb2myXz',
    // flume信息
    'flume' => [
        'ip' => '156.233.68.240',
        'port' => '60000',
    ],
    //阿里大鱼配置
    'alidayu' => [
        // 帐号ID
        'appkey' => '23439214',
        // 安全码
        'secret' => 'df3f9a04e25d6ed333a3d357f8425e09',
        // 短信签名
        'signName' => '诗悦网络',
    ],

    // 数据库服务器信息
    'database' => [
        'type' => 'mysql',
        'host' => '127.0.0.1',
        'user' => 'root',
        'pwd' => 'Vanlien1503',
        'port' => 3306,
        'charset' => 'utf8',
        'db_name' => 'gameadminapi',
        'socket' => '',
    ],
'mongodb' => 'mongodb://localhost:27017',
	'oms-database' => [
        'type' => 'mysql',
        'host' => '127.0.0.1',
        'user' => 'root',
        'pwd' => 'Vanlien1503',
        'port' => 3306,
        'charset' => 'utf8',
        'db_name' => 'oms',
        'socket' => '',
    ],
'game-database' => [
        'type' => 'mysql',
        'host' => '127.0.0.1',
        'user' => 'root',
        'pwd' => 'Vanlien1503',
        'port' => 3306,
        'charset' => 'utf8',
        'db_name' => 'gameadmin',
        'socket' => '',
    ],

	// redis信息
    'redis' => [
        'host' => '127.0.0.1',
        'port' => 6379,
        'password' => null,
        'database' => 5,
    ],

    'name' => [
        'sszgh5'
    ],
	'specialKey' => [
        '40',
        'sy39',
        'sy41',
        'sy40',
        '0|'
    ],
    'specialArray' => [
        '40' => 'sy40|1',
        'sy39' => 'sy39|1',
        'sy41' => 'sy41|1',
        'sy40' => 'sy40|1',
        '0|' => 'sy39|1'
    ],
];
