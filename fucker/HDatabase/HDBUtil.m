//
//  HDBUtil.m
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "HDBUtil.h"
#import "HDBManager.h"
#import "UserModel.h"

@implementation HDBUtil

+(BOOL)setAuth:(NSString *)auth{
    return [HDBManager setDataWithModelName:@"UserModel" andkey:@"auth" andValue:auth];
}

+(NSString *)getAuth{
    NSArray *result=[HDBManager selectDatasWithModelName:@"UserModel"];
    if (result.count>0) {
        UserModel *user=[result objectAtIndex:0];
        return user.auth;
    }
    return @"";
}

@end
