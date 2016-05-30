//
//  UserData.h
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject

/**
 *  获取用户auth
 *
 *  @return 用户auth
 */
+(NSString *)getAuth;

/**
 *  设置用户auth
 *
 *  @param authStr 用户auth
 */
+(void)setAuth:(NSString *)authStr;

@end
