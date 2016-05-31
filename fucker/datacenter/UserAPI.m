//
//  UserAPI.m
//  fucker
//
//  Created by Admin on 16/5/31.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "UserAPI.h"
#import "HRApi.h"

@implementation UserAPI

- (void) userLogin:(UIView *)mthis userName:(NSString *)userName pass:(NSString *)pass loadtype:(LoadingType)loadtype success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    //处理通用数据后，扔给前端处理页面逻辑
    [HRApi login: mthis userName:userName pass:pass loadtype:loadtype
     
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
             success(task,responseObject);
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             failure(task,error);
         }
     
     
     
     ];
    
}

@end
