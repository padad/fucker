//
//  AppConfig.m
//  fucker
//
//  Created by 小咪 on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "AppConfig.h"


const static NSString *test_main_serve_url          =
@"http://zzhuanle.kjtpay.com/zhuanle";     // 测试服务器测试地址 192.168.1.47
const static NSString *form_main_serve_url          =
@"https://zhuanle.kjtpay.com/zhuanle";     // 正式服务器地址


@implementation AppConfig


+ (AppConfig *)formalEnv {
    AppConfig *config = [AppConfig new];
    
    config.mainServerPath = (NSString *)form_main_serve_url;
    

    
    return config;
}

+ (AppConfig *)testEnv {
    AppConfig *config = [AppConfig new];
    
    config.mainServerPath = (NSString *)test_main_serve_url;
    
    
    
    return config;
}

@end
