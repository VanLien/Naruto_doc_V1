%% 应用程序信息文件
{application, merge_main, [
        {description, "merge server"}
        ,{vsn, "0.1"}
        ,{modules, [merge_main]}
        ,{registered, []}
        ,{applications, [kernel, stdlib]}
        ,{mod, {merge_main, []}}
        ,{start_phases, []}
        ,{env, [
                {merge_type, zone} %% zone | center
                %% 服务器信息
                ,{merge_target, [
                        "127.0.0.1"             %% 地址
                        ,3306                   %% 端口号
                        ,"root"                 %% 用户名
                        ,"0YTAqIbEhI36Go7p"               %% 密码
                        ,"jstm_ewan_1_3"         %% 库名
                        ,utf8                   %% 编码
                        ,10                     %% 最小连接数
                        ,30                     %% 最大连接数
                    ]
                }
                ,{merge_src_list, [
                        {
                            "ewan"              %% 平台
                            ,1
                            ,"127.0.0.1"        %% 地址
                            ,3306               %% 端口号
                            ,"root"             %% 用户名
                            ,"0YTAqIbEhI36Go7p"               %% 密码
                            ,"jstm_ewan_1"      %% 库名
                            ,utf8               %% 编码
                            ,10                 %% 最小连接数
                            ,30                 %% 最大连接数
                            ,1000               %% 阵营值
                        }
                        ,{
                            "ewan"              %% 平台
                            ,2
                            ,"127.0.0.1"        %% 地址
                            ,3306               %% 端口号
                            ,"root"             %% 用户名
                            ,"0YTAqIbEhI36Go7p"               %% 密码
                            ,"jstm_ewan_2"      %% 库名
                            ,utf8               %% 编码
                            ,10                 %% 最小连接数
                            ,30                 %% 最大连接数
                            ,1001               %% 阵营值
                        }
                        ,{
                            "ewan"              %% 平台
                            ,3
                            ,"127.0.0.1"        %% 地址
                            ,3306               %% 端口号
                            ,"root"             %% 用户名
                            ,"0YTAqIbEhI36Go7p"               %% 密码
                            ,"jstm_ewan_3"      %% 库名
                            ,utf8               %% 编码
                            ,10                 %% 最小连接数
                            ,30                 %% 最大连接数
                            ,1001               %% 阵营值
                        }
                    ]
                }
            ]
        }
    ]
}.
