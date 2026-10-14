<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/6/21
 * Time: 上午11:52
 * flume 接口基类
 */

namespace Framework;

// 特殊处理（文件里多个类蛋疼）
include FRAME_ROOT . '/Lib/Flume/ThriftSourceProtocol.php';
include FRAME_ROOT . '/Lib/Flume/Types.php';

use Flume\Status;
use Thrift\Protocol\TCompactProtocol;
use Thrift\Transport\TFramedTransport;
use Thrift\Transport\TSocket;
use Thrift\Exception\TException;
use Flume\ThriftSourceProtocolClient;
use Flume\ThriftFlumeEvent;

class Flume
{
    /**
     * 发送数据到flume
     * @param string $type 类型
     * @param array $body 消息 body
     * @return bool
     */
    public static function sendFlume(string $type, array $body)
    {
        if (empty($body)) return false;
        $ip = $GLOBALS['cfg']['flume']['ip'];
        $port = $GLOBALS['cfg']['flume']['port'];

        try {
            $socket = new TSocket($ip, $port);
            //设置超时
            $socket->setSendTimeout(10 * 1000);
            $socket->setRecvTimeout(60 * 1000);

            $transport = new TFramedTransport($socket);
            $protocol = new TCompactProtocol($transport);
            $client = new ThriftSourceProtocolClient($protocol);
            $transport->open();

            $flume_body = [
                'headers' => ['type' => $type],
                'body' => json_encode($body),
            ];

            $evt = new ThriftFlumeEvent($flume_body);
            //增加open判断
            if (!$transport->isOpen()) {
                throw new \Exception("transport failed: not open");
            }

            $success = $client->append($evt);
            if ($success != Status::OK) {
                throw new \Exception("append failed, status: " . $success);
            }

            $transport->close();
            $socket->close();
            return true;
        } catch (\Exception $tx) {
            //记录失败信息
            Api::log(sprintf('Exception: %s Body: %s', $tx->getMessage(), json_encode($body)), $type, 'send-exception');
            // 插入数据库
            Db::getInstance()->insert('failed_flume', [
                'type' => $type,
                'body' => serialize($body),
                'create_at' => date('Y-m-d H:i:s')
            ]);
            return false;
        }
    }
}