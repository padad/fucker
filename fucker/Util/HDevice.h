//
//  HDevice.h
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDevice : NSObject

+ (NSString *) getBundleIdentifier;
+ (NSString *) getAppVersion;
+ (NSString *) getAppBulid;
+ (CGFloat) getScreenScale;
+ (NSString *) getUDID;
+ (NSString *) getDeviceString;
+ (NSString *) getMobileDescription;
/**
 *  获取广告标示符ADFA
 *
 *  @return ADFA字符串
 */
+ (NSString *) getIDFA;
/**
 *  获取Mac地址
 *
 *  @param isColon 是否需要带“:”符号
 *
 *  @return mac地址字符串
 */
+ (NSString *) getMacAddress:(BOOL)isColon;
/**
 *  获取状态栏网络
 *
 *  @return 返回网络类型（2G、3G、4G、WIFI）
 */
+(NSString *)getNetWorkStatus;
/** 屏幕宽度 */
+ (CGFloat)getScreenWidth;
/** 屏幕高度 */
+ (CGFloat)getScreenHeight;
/** 屏幕实际分辨率跨度 */
+ (CGFloat)getScreenScaleWidth;
/** 屏幕实际分辨率高度 */
+ (CGFloat)getPhoneScaleHeight;



@end
