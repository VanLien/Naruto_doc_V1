<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/6/19
 * Time: 下午4:14
 * curl 模块封装
 */

namespace Framework;


class Curl
{
    /**
     * @static
     * 获取一个URL地址返回的内容
     * @param string $url
     * @param array $otherCurlOpt 设置CURL选项
     * @param int $httpCode 返回http code
     * @param string $error
     * @return mixed 成功则返回string，否则返回false 或者错误信息
     */
    public static function fetch($url, $otherCurlOpt = array(), &$httpCode = 0, &$error = '')
    {
        $curlOpt = [
            CURLOPT_URL => $url,
            CURLOPT_AUTOREFERER => true, //自动添加referer链接
            CURLOPT_RETURNTRANSFER => true, //true: curl_exec赋值方式，false：curl_exec直接输出结果
            CURLOPT_FOLLOWLOCATION => false, //自动跟踪301,302跳转
            CURLOPT_SSL_VERIFYPEER => false, //兼容https的服务器
            CURLOPT_SSL_VERIFYHOST => false,
            //CURLOPT_HTTPGET => TRUE, //默认为GET，无需设置
            //CURLOPT_POST => TRUE,
            //CURLOPT_POSTFIELDS => 'username=abc&passwd=bcd',//也可以为数组array('username'=>'abc','passwd'=>'bcd')
            CURLOPT_CONNECTTIMEOUT => 5, //秒
            CURLOPT_TIMEOUT => 10, //秒
            CURLOPT_USERAGENT => 'JecSpider Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)',
            //CURLOPT_COOKIE => '',
        ];

        if ($otherCurlOpt)
            foreach ($otherCurlOpt as $key => $val)
                $curlOpt[$key] = $val;

        //curl传数组时，组建URL不正确，经常有些奇怪的问题导致无法正常请求
        if (isset($otherCurlOpt[CURLOPT_POSTFIELDS]) && is_array($otherCurlOpt[CURLOPT_POSTFIELDS]))
            $curlOpt[CURLOPT_POSTFIELDS] = http_build_query($otherCurlOpt[CURLOPT_POSTFIELDS]);

        $ch = curl_init();
        curl_setopt_array($ch, $curlOpt);
        $contents = curl_exec($ch);
        if ($contents === false) $error = curl_error($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        return $contents;
    }

    /**
     * post方式请求资源
     * @param string $url 请求地址
     * @param array|string $params 请求参数
     * @param array|string $opt curl设置项
     * @return mixed
     */
    public static function post($url, $params = [], $opt = [])
    {
        $query = is_array($params) ? http_build_query($params) : $params;
        $ret = self::fetch($url, [
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => $query, //注意CURL无法转换数组成为name[]=value&这种格式
        ] + $opt, $httpCode, $error);

        if (false === $ret || !empty($error) || $httpCode != 200) {
            return [
                'result' => false,
                'msg' => sprintf("[HTTP CODE: %s ]远程返回数据异常：%s", $httpCode, $error),
            ];
        } else {
            return [
                'result' => true,
                'msg' => $ret,
            ];
        }
    }

    /**
     * get方式请求资源
     * @param string $url 请求地址
     * @param array|string $params 请求参数
     * @param array|string $opt curl设置项
     * @return array
     */
    public static function get($url, $params = [], $opt = [])
    {
        $query = is_array($params) ? http_build_query($params) : $params;
        if (!empty($query)) {
            if (strpos($url, '?') !== false) {
                $url = $url . '&' . $query;
            } else {
                $url = $url . '?' . $query;
            }
        }
        $ret = self::fetch($url, $opt, $httpCode, $error);

        if (false === $ret || !empty($error) || $httpCode != 200) {
            return [
                'result' => false,
                'msg' => sprintf("[HTTP CODE: %s ]远程返回数据异常：%s", $httpCode, $error),
            ];
        } else {
            return [
                'result' => true,
                'msg' => $ret,
            ];
        }
    }
}