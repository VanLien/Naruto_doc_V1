<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/11/1
 * Time: 上午10:49
 * 阿里大鱼短信接口
 */

namespace Framework;

require FRAME_ROOT . '/Lib/Alidayu/autoload.php';

use Flc\Alidayu\Client;
use Flc\Alidayu\App;
use Flc\Alidayu\Requests\AlibabaAliqinFcSmsNumSend;

class Alidayu
{
    /**
     *  发送验证码
     * @param int $phoneNumber 手机号
     * @param array $parameter 数组形式将短信中携带的参数传入
     * 如短信模板中 验证码${code}，您正在登录${product}，若非本人操作，请勿泄露。  则传入['code'=>'XXX','product'=>'XXXX']
     * @param string $tpl 短信模版
     * @return bool 返回短信发送成功失败，true成功，false失败
     */
    public static function sendSms($phoneNumber, array $parameter = [], $tpl = 'SMS_69965569')
    {
        $cfg = $GLOBALS['cfg']['alidayu'];

        try {
            $req = new AlibabaAliqinFcSmsNumSend;
            $req->setRecNum($phoneNumber)
                ->setSmsParam($parameter)
                ->setSmsFreeSignName($cfg['signName'])
                ->setSmsTemplateCode($tpl);

            $client = new Client(new App([
                'app_key' => $cfg['appkey'],
                'app_secret' => $cfg['secret'],
            ]));

            $resp = $client->execute($req);
            if (isset($resp->result->err_code) && ($resp->result->err_code == 0)) {
                return true;
            } else {
                Api::log($resp, 'alidayu-sms', 'error:' . $phoneNumber);
            }

            return false;
        } catch (\Exception $e) {
            //记录失败信息
            Api::log(sprintf('phoneNumber:%s, Exception: %s', $phoneNumber, $e->getMessage()), 'alidayu-sms');
            return false;
        }
    }
}