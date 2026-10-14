<?php
/**
 * User: zhenhua
 * Date: 2018/6/7
 * Time: 下午5:18
 * 埋点日志
 */

namespace Modules;

use Framework\Api;
use Framework\Db;

class Launch
{

    public static function dashboard()
    {
        $stat_time = date('Y-m-d H:i:s', Api::getInt('SYMD'));
        $end_time = date('Y-m-d H:i:s', Api::getInt('EYMD'));
        $diff = floor((strtotime($end_time) - strtotime($stat_time)) / 86400);
        if ($diff < 0 || $diff > 93){
            Api::out(true, '查询时间超过要求范围或者查询时间出错');
        }
        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($date_time . '&p!3icWlMEZ9kdvskXFme4cdhwTdqZTcaVDG0gow')) Api::out(false, 'sign error');

        $sql = sprintf("SELECT YMD,NPNUM,NPUSER,PNUM,GID,PID,NEUSER,PUSER,NADEV,NEDEV,DAU,PMONEY,NPMONEY FROM gm_data_interface WHERE YMD BETWEEN '%s' AND '%s'", $stat_time, $end_time);

        $data = Db::getInstance()->getAll($sql);
        if ($data) {
            Api::out(true, $data);
        } else {
            Api::out(true, '查询失败');
        }

    }
}