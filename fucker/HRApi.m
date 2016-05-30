//
//  HRApi.m
//  fucker
//
//  Created by 小咪 on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "HRApi.h"
#import "UrlUtil.h"
#import "NetUtil.h"

@implementation HRApi

+ (void) login: (UIView *)mthis :(NSString *)userName :(NSString *)pass{
    
    NSString *url = [UrlUtil getServiceUrl:toLogin];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //[params setValue:<#(nullable id)#> forKeyPath:<#(nonnull NSString *)#>]
    
    [params setValue:userName forKey:@"account"];
    [params setValue:pass forKey:@"password"];
    
    [NetUtil getBin:mthis :url :params :SYSTEM_LOADING :0];
    
    
    
    
    
}

@end
