<?php
/**
 * User: xiaoqing Email: liuxiaoqing437@gmail.com
 * Date: 2017/11/7
 * Time: 下午5:12
 * 推送服务类
 */

namespace Framework;


class Push
{
    const HOST = 'http://sdk.open.api.igexin.com/apiex.htm';

    private $app_path = '';
    private $cfg = []; //推送配置

    private $app_name = ''; //个推应用名
    private $app_key = '';
    private $app_id = '';
    private $master_secret = '';

    /**
     * 初始化推送
     * @param array $messageCfg 推送消息配置
     * @param array $appCfg 个推应用配置
     */
    public function __construct(array $messageCfg, array $appCfg)
    {
        $this->app_path = FRAME_ROOT . '/Lib/Getui/';

        //设置推送应用配置
        $this->app_name = $appCfg['getui_app_name'];
        $this->app_key = $appCfg['getui_app_key'];
        $this->app_id = $appCfg['getui_app_id'];
        $this->master_secret = $appCfg['getui_mastersecret'];

        //设置推送消息配置
        $this->cfg = $messageCfg;
        $this->cfg['is_ios'] = $appCfg['is_ios'];
        $this->cfg['is_offline'] = $messageCfg['is_offline'] ?? '0';
        $this->cfg['timer_time'] = $messageCfg['timer_time'] ?? '';
        $this->cfg['offline_time'] = $messageCfg['offline_time'] ?? 3;

        require_once($this->app_path . 'IGt.Push.php');
        require_once($this->app_path . 'igetui/IGt.AppMessage.php');
        require_once($this->app_path . 'igetui/IGt.APNPayload.php');
        require_once($this->app_path . 'igetui/template/IGt.BaseTemplate.php');
        require_once($this->app_path . 'IGt.Batch.php');
        require_once($this->app_path . 'igetui/utils/AppConditions.php');
    }


    /**
     * 单推用户接口
     * @param $cid 个推ID
     * @return array
     */
    public function pushMessageToSingle($cid)
    {
        $igt = new \IGeTui(self::HOST, $this->app_key, $this->master_secret);

        if ((bool)$this->cfg['is_ios']) {
            $template = $this->IGtTransmissionTemplateDemo();
        } else {
            $template = $this->IGtNotificationTemplateDemo();
        }

        //个推信息体
        $message = new \IGtSingleMessage();
        if ($this->cfg['is_offline'] == 0) {
            $message->set_isOffline(false);//是否离线

        } else {
            $message->set_isOffline(true);//是否离线
            $message->set_offlineExpireTime(3600 * $this->cfg['offline_time'] * 1000);//离线时间
        }
        $message->set_data($template);//设置推送消息类型
        //$message->set_PushNetWorkType(0);//设置是否根据WIFI推送消息，1为wifi推送，0为不限制推送
        //接收方
        $target = new \IGtTarget();
        $target->set_appId($this->app_id);
        $target->set_clientId($cid);
        //$target->set_alias(Alias);

        try {
            $rep = $igt->pushMessageToSingle($message, $target);
            return $rep;
        } catch (\RequestException $e) {
            $requstId = $e->getRequestId();
            $rep = $igt->pushMessageToSingle($message, $target, $requstId);
            return $rep;
        }
    }

    /**
     * 对指定用户列表发送消息
     * @param array $users 用户
     * @return Array
     * @throws Exception
     */
    public function pushMessageToList($users)
    {
        putenv("gexin_pushList_needDetails=true");
        putenv("gexin_pushList_needAsync=true");

        $igt = new \IGeTui(self::HOST, $this->app_key, $this->master_secret);

        if ((bool)$this->cfg['is_ios']) {
            $template = $this->IGtTransmissionTemplateDemo();
        } else {
            $template = $this->IGtNotificationTemplateDemo();
        }

        //个推信息体
        $message = new \IGtListMessage();

        if ($this->cfg['is_offline'] == 0) {
            $message->set_isOffline(false);//是否离线

        } else {
            $message->set_isOffline(true);//是否离线
            $message->set_offlineExpireTime(3600 * $this->cfg['offline_time'] * 1000);//离线时间
        }
        $message->set_data($template);//设置推送消息类型

        $contentId = $igt->getContentId($message);

        //接收方
        $targetList = array();
        foreach ($users as $cid) {
            $target = new \IGtTarget();
            $target->set_appId($this->app_id);
            $target->set_clientId($cid);
            //$target1->set_alias(Alias);
            $targetList[] = $target;
        }

        $rep = $igt->pushMessageToList($contentId, $targetList);
        return $rep;

    }

    //对应用下的所有用户进行推送，可根据省份，标签，机型过滤推送
    public function pushMessageToApp()
    {
        $igt = new \IGeTui(self::HOST, $this->app_key, $this->master_secret);
        if ((bool)$this->cfg['is_ios']) {
            $template = $this->IGtTransmissionTemplateDemo();
            $pone = 'IOS';
        } else {
            $template = $this->IGtNotificationTemplateDemo();
            $pone = 'ANDROID';
        }

        $message = new \IGtAppMessage();

        if ($this->cfg['is_offline'] == 0) {
            $message->set_isOffline(false);//是否离线

        } else {
            $message->set_isOffline(true);//是否离线
            $message->set_offlineExpireTime(3600 * $this->cfg['offline_time'] * 1000);//离线时间单位为毫秒，例，两个小时离线为3600*1000*2
        }
        $message->set_data($template);

        $message->set_appIdList(array($this->app_id));
        $message->set_phoneTypeList(array($pone)); //设置机型

        $rep = $igt->pushMessageToApp($message);//根据TaskId设置组名，支持下划线，中文，英文，数字

        return $rep;
    }

    /**
     * 点击通知打开应用模板
     * @return IGtNotificationTemplate
     * @throws Exception
     */
    private function IGtNotificationTemplateDemo()
    {
        $template = new \IGtNotificationTemplate();
        $template->set_appId($this->app_id);//应用appid
        $template->set_appkey($this->app_key);//应用appkey
        $template->set_transmissionType(1);//透传消息类型
        $template->set_transmissionContent($this->cfg['title']);//透传内容
        $template->set_title($this->cfg['title']);//通知栏标题
        $template->set_text($this->cfg['content']);//通知栏内容
        $template->set_logo("app_icon.png"); //通知栏logo
        //$template->set_logoURL("http://wwww.igetui.com/logo.png"); //通知栏logo链接
        $template->set_isRing(true);//是否响铃
        $template->set_isVibrate(true);//是否震动
        $template->set_isClearable(true);//通知栏是否可清除
        //设置通知定时展示时间，结束时间与开始时间相差需大于6分钟，消息推送后，客户端将在指定时间差内展示消息（误差6分钟）
        if ($this->cfg['type'] == 2) {
            $begin = $this->cfg['timer_time'];
            $end = date("Y-m-d H:i:s", strtotime($begin) + 365);
            $template->set_duration($begin, $end);
        }
        return $template;
    }

    /**
     * 透传功能模板
     * @return IGtTransmissionTemplate
     * @throws Exception
     */
    private function IGtTransmissionTemplateDemo()
    {
        $template = new \IGtTransmissionTemplate();
        $template->set_appId($this->app_id);//应用appid
        $template->set_appkey($this->app_key);//应用appkey
        $template->set_transmissionType(1);//透传消息类型
        $template->set_transmissionContent($this->cfg['content']);//透传内容

        if ($this->cfg['type'] == 2) {
            $begin = $this->cfg['timer_time'];
            $end = date("Y-m-d H:i:s", strtotime($begin) + 365);
            $template->set_duration($begin, $end);
        }
        //APN高级推送
        $alertmsg = new \DictionaryAlertMsg();
        $alertmsg->locKey = $this->cfg['content'];

        //IOS8.2 支持
        $alertmsg->title = $this->cfg['title'];
        $alertmsg->titleLocKey = $this->cfg['title'];
        $alertmsg->titleLocArgs = array("TitleLocArg");

        $apn = new \IGtAPNPayload();
        $apn->alertMsg = $alertmsg;
        $apn->badge = 0;
        $apn->contentAvailable = 0;

        $template->set_apnInfo($apn);

        return $template;
    }
}