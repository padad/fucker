//
//  UserModel.m
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

@dynamic auth;
@dynamic gesturePwd;
@dynamic isSaveGesturePwd;
@dynamic account;
@dynamic realName;
@dynamic nickName;
@dynamic phone;
@dynamic bindPhone;
@dynamic email;
@dynamic isActive;
@dynamic isNameAuthorized;
@dynamic address;
@dynamic postCode;
@dynamic birthday;
@dynamic grade;
@dynamic expirationMinutes;
@dynamic loginLocalTime;
@dynamic source;
@dynamic avatarUrl;
-(id)valueForUndefinedKey:(NSString *)key{
    return nil;
}

@end
