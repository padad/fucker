//
//  UserAPI.h
//  fucker
//
//  Created by Admin on 16/5/31.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HRApi.h"

@interface UserAPI : NSObject

//用户登录
- (void) userLogin : (UIView *)mthis
           userName:(NSString *)userName
               pass:(NSString *)pass
           loadtype:(LoadingType)loadtype
            success:(void (^)(NSURLSessionDataTask *, id))success
            failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;
//用户注册
- (void) userRegister: (NSString *)userName pass:(NSString *)pass ma:(NSString *)ma;

@end
