//
//  HRApi.m
//  fucker
//
//  Created by 小咪 on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "HRApi.h"
#import "UrlUtil.h"
#import "GetBinAsyncTask.h"

@implementation HRApi

+(void)login:(UIView *)mthis userName:(NSString *)userName pass:(NSString *)pass loadtype:(LoadingType)loadtype success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    
    
    NSString *url = [UrlUtil getServiceUrl:toLogin];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //[params setValue:<#(nullable id)#> forKeyPath:<#(nonnull NSString *)#>]
    
    [params setValue:userName forKey:@"account"];
    [params setValue:pass forKey:@"password"];
    
    GetBinAsyncTask *gt = [[GetBinAsyncTask alloc] initWith:mthis url:url params:params loadtype:loadtype cacheTime:300 success:success failure:failure];
    [gt execute];
    
}

@end
