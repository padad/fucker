//
//  UserData.m
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "UserData.h"
#import "HDBUtil.h"


static NSString *auth=@"";
@implementation UserData

+(NSString *)getAuth
{
    if ([StringUtil emptyOrNull:auth]) {
        auth = [HDBUtil getAuth];
    }
    if ([StringUtil emptyOrNull:auth]) {
        auth=@"";
    }
    return auth;
}

+(void)setAuth:(NSString *)authStr{
    auth = authStr;
    [HDBUtil setAuth:authStr];
}

@end
