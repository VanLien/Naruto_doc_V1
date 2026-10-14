<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2018/2/8
 * Time: 下午4:54
 * Redis封装类
 */

namespace Framework;

use Redis;
use Exception;

class RedisDb extends Redis
{
    private static $instance = [];

    public function __construct($host, $port, $pw = null, $db = 0)
    {
        parent::__construct();

        $conn = $this->pconnect($host, $port);
        if ($conn !== true) {
            throw new Exception("连接Redis失败:" . $this->getLastError());
        }

        if ($pw !== null) {
            $auth = $this->auth($pw);
            if ($auth !== true) {
                throw new Exception("Redis权限验证失败:" . $this->getLastError());
            }
        }

        //如果不是0号库，选择一下数据库
        if ($db != 0) {
            $select = $this->select($db);
            if ($select !== true) {
                throw new Exception("Redis切换数据{$db}失败:" . $this->getLastError());
            }
        }

    }

    /**
     * 返回一个单例
     * @param string $db
     * @return mixed
     * @throws Exception
     */
    public static function getInstance($db = "redis")
    {
        if (isset(self::$instance[$db])) {
            return self::$instance[$db];
        }
        $cfg = $GLOBALS['cfg'][$db];
        try {
            self::$instance[$db] = new self($cfg['host'], $cfg['port'], $cfg['password'], $cfg['database']);
        } catch (Exception $e) {
            throw new Exception('Redis失败');
        }

        return self::$instance[$db];
    }
}