<?php

/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/12/24
 * Time: 下午1:57
 * 腾讯云cdn
 */
namespace Framework\Lib\Qcloud;

use Framework\Curl;

class Cdn
{
    const SECRET_ID = 'AKIDrzKvigtKnuBTuX9t3RWJ6ADwdSIvDYXU';
    const SECRET_KEY = 'GjfmAXoDX9zEsUPNIgRVaduSGPVl5mu4';
    const HOST = 'cdn.api.qcloud.com';
    const URL = 'cdn.api.qcloud.com/v2/index.php';
    const MAX_REFRESH_CDN_URL = 10000; //限额为10000条

    public $common_params = [];
    public $httpUrl;
    public $time;
    public $secret_id;
    public $secret_key;

    //cdn各个游戏配置
    public $keyCfg = [
        'xxwy' => ['secret_id' => 'AKIDFUnwrZJMV2c2E4dGE2UjoeFLDqGRc4Wi', 'secret_key' => '94kBNODoLgmcDZhbHm6C3f2A3h6HDvOs'],
        'fssj' => ['secret_id' => 'AKIDFUnwrZJMV2c2E4dGE2UjoeFLDqGRc4Wi', 'secret_key' => '94kBNODoLgmcDZhbHm6C3f2A3h6HDvOs'],
    ];

    public function __construct($productName)
    {
        if (isset($this->keyCfg[$productName])) {
            $this->secret_id = $this->keyCfg[$productName]['secret_id'];
            $this->secret_key = $this->keyCfg[$productName]['secret_key'];
        } else {
            $this->secret_id = self::SECRET_ID;
            $this->secret_key = self::SECRET_KEY;
        }

        $this->common_params = [
            'Nonce' => rand(),
            'Timestamp' => time(NULL),
            'Action' => '',
            'SecretId' => $this->secret_id,
        ];
        $this->httpUrl = 'https://' . self::URL;

        $this->time = time(); //当前时间戳
    }

    /**
     * 刷新URL
     * 1）每一个用户每天的URL刷新限额为10000条；
     * 2）每一次最多可提交1000条URL进行刷新。
     * @param array $urls
     * @return array|mixed
     */
    public function refreshCdnUrl(array $urls)
    {
        $this->common_params['Action'] = 'RefreshCdnUrl';
        $params = [];
        foreach ($urls as $key => $url) {
            $params['urls.' . $key] = $url;
        }

        return $this->request('POST', $this->httpUrl, $params);

    }

    /**
     * 刷新目录
     * 1）每一个账号每日可刷新目录 100 条，每次最多可提交20条
     * 2）全网目录刷新生效时间约为 5分钟
     * @param array $dirs
     * @return array|mixed
     */
    public function refreshCdnDir(array $dirs)
    {
        $this->common_params['Action'] = 'RefreshCdnDir';
        $params = [];
        foreach ($dirs as $key => $dir) {
            $params['dirs.' . $key] = $dir;
        }

        return $this->request('POST', $this->httpUrl, $params);
    }

    /**
     * 查看刷新记录
     * @param $startDate
     * @param $endDate
     * @return array|mixed
     */
    public function getCdnRefreshLog($startDate = null, $endDate = null)
    {
        if (is_null($startDate)) $startDate = date('Y-m-d 00:00:00', $this->time);
        if (is_null($endDate)) $endDate = date('Y-m-d 23:59:59', $this->time);
        $this->common_params['Action'] = 'GetCdnRefreshLog';
        $params = [
            'startDate' => $startDate,
            'endDate' => $endDate,
        ];

        return $this->request('POST', $this->httpUrl, $params);
    }

    public function request(string $method, string $url = '', array $params = [])
    {
        try {
            $params = array_merge($this->common_params, $params);
            $params['Signature'] = $this->createSign($method, $params);

            $ret = $method === 'POST' ? Curl::post($url, $params) : Curl::get($url, $params);
            if (!$ret['result']) { //请求失败
                return [
                    'success' => false,
                    'message' => $ret['msg'],
                ];
            }

            $cdnInfo = json_decode($ret['msg'], true);
            return [
                'success' => $cdnInfo['code'] == 0 ? true : false,
                'message' => $cdnInfo['code'] == 0 ? $cdnInfo['codeDesc'] : $cdnInfo['message'],
            ];
        } catch (\Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage(),
            ];
        }
    }

    private function createSign($method, $param)
    {
        $FullHttpUrl = self::URL;
        /***************对请求参数 按参数名 做字典序升序排列，注意此排序区分大小写*************/
        ksort($param);
        /**********************************生成签名原文**********************************
         * 将 请求方法, URI地址,及排序好的请求参数  按照下面格式  拼接在一起, 生成签名原文，此请求中的原文为
         * GETcvm.api.qcloud.com/v2/index.php?Action=DescribeInstances&Nonce=345122&Region=gz
         * &SecretId=AKIDz8krbsJ5yKBZQ    ·1pn74WFkmLPx3gnPhESA&Timestamp=1408704141
         * &instanceIds.0=qcvm12345&instanceIds.1=qcvm56789
         * ****************************************************************************/
        $sigTxt = $method . $FullHttpUrl . "?";
        $isFirst = true;
        foreach ($param as $key => $value) {
            if (!$isFirst) {
                $sigTxt = $sigTxt . "&";
            }
            $isFirst = false;
            /*拼接签名原文时，如果参数名称中携带_，需要替换成.*/
            if (strpos($key, '_')) {
                $key = str_replace('_', '.', $key);
            }
            $sigTxt = $sigTxt . $key . "=" . $value;
        }
        /*********************根据签名原文字符串 $SigTxt，生成签名 Signature******************/
        return base64_encode(hash_hmac('sha1', $sigTxt, $this->secret_key, true));
    }
}