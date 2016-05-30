//
//  UserModel.h
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface UserModel : NSManagedObject


//realName           实名
//nickName           昵称
//phone              ⼿手机号
//bindPhone          绑定⼿手机号,和phone可 能不⼀一样,根据这个字段是否为空来判断⽤用户是否绑定⼿手机
//email              邮箱
//auth               server返回的auth,⺫⽬目前 先不考虑加密
//isActive           是否是激活⽤用户
//isNameAuthorized   是否实名认证
//address            地址(预留)
//postCode           邮政编码(预留)
//birthday           生⽇日(预留)
//grade              用户等级(预留)
//expirationMinutes  server返回auth的过期时 间(预留)
//loginLocalTime     ⽤用户登录时本地时间秒数 (since 1970)(预留, 以后可能以这个时间来算 出auth是否过期)
//source             来源(预留)
//avatarUrl          ⽤用户头像url(预留)
//gesturePwd           手势密码
//isSaveGesturePwd   是否储存手势密码
@property (nonatomic, retain) NSString * auth;
@property (nonatomic, retain) NSString * gesturePwd;
@property (nonatomic, retain) NSNumber * isSaveGesturePwd;
@property (nonatomic, retain) NSString * account;
@property (nonatomic, retain) NSString * realName;
@property (nonatomic, retain) NSString * nickName;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * bindPhone;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSNumber * isActive;
@property (nonatomic, retain) NSNumber * isNameAuthorized;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * postCode;
@property (nonatomic, retain) NSString * birthday;
@property (nonatomic, retain) NSNumber * grade;
@property (nonatomic, retain) NSNumber * expirationMinutes;
@property (nonatomic, retain) NSNumber * loginLocalTime;
@property (nonatomic, retain) NSNumber * source;
@property (nonatomic, retain) NSString * avatarUrl;
-(id)valueForUndefinedKey:(NSString *)key;

@end
