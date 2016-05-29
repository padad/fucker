//
//  HRApi.m
//  fucker
//
//  Created by 小咪 on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "HRApi.h"
#import <AFNetworking/AFNetworking.h>
#import "UrlUtil.h"

@implementation HRApi

+ (void) login:(NSString *)userName :(NSString *)pass{
    
    NSString *url = [UrlUtil getServiceUrl:toLogin];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             NSLog(@"这里打印请求成功要做的事");
             
         }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             
             NSLog(@"%@",error);  //这里打印错误信息
             
         }];
    
    
    
}

@end
