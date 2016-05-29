//
//  UrlUtil.m
//  fucker
//  切换开发环境
//
//  Created by 小咪 on 16/5/29.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "UrlUtil.h"

@implementation UrlUtil


+ (NSString *) getServiceUrl : (NSString *)url{
    
    if(ISDEBUG){
        return [[AppConfig testEnv].mainServerPath stringByAppendingString:url];
    }
    else{
        return [[AppConfig formalEnv].mainServerPath stringByAppendingString:url];
    }
        
    
}

@end
