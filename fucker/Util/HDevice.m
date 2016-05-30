//
//  HDevice.m
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "HDevice.h"
#import "GLReachability.h"
#import "KeychainItemWrapper.h"
#import <sys/utsname.h>
#import <AdSupport/ASIdentifierManager.h>

#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import "GLReachability.h"

@implementation HDevice

#pragma mark 获取版本
+ (NSString *) getBundleIdentifier{
    return [[NSBundle mainBundle] bundleIdentifier];
}
+(NSString *)getAppVersion
{
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    if (version.length == 0) {
        version = @"";
    }
    return version;
}
+(NSString *)getAppBulid
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return app_build;
    
}
+(CGFloat)getScreenScale{
    return [UIScreen mainScreen].scale;
}
+(NSString *)getUDID{
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:[[NSBundle mainBundle] bundleIdentifier] accessGroup:nil];
    NSString *uniqueIdentifier = [wrapper objectForKey:(id)CFBridgingRelease(kSecAttrAccount)];
    if ([StringUtil emptyOrNull:uniqueIdentifier]) {
        uniqueIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [wrapper setObject:uniqueIdentifier forKey:(id)CFBridgingRelease(kSecAttrAccount)];
    }
    return uniqueIdentifier;
}
+(NSString *)getDeviceString{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString* deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceString;
}
+(NSString *)getMobileDescription{
    //    X-KJT-Auth: auth string
    //    X-KJT-Agent:  IMEI;IMES;操作系统名称和版本;订制系统名称和版本;网络运行商;手机型号;渠道编号;App版本号
    //
    //eg:
    //    X-KJT-Agent: 1234;3333;Android4.4;MIUI7.1;CMCC;Nexus5;001002
    NSString *IMEI=[HDevice getUDID];
    NSString *IMES=@"1111111111111111111111111";
    NSString *osVersion  =[NSString stringWithFormat:@"IOS %@",[[UIDevice currentDevice] systemVersion]];
    NSString *reOsVersion  =[NSString stringWithFormat:@"IOS %@",[[UIDevice currentDevice] systemVersion]];
    NSString *operator=[GLReachability getOperator];
    NSString *mobelName=[HDevice getDeviceString];
    NSString *channel=CHANNEL_ID;
    NSString *appVersion = [HDevice getAppVersion];
    NSString *networkStatus = [GLReachability stringWithNetWorkStatus];
    NSString *adfa = [HDevice getIDFA];
    //    NSString *mobileDescription=[NSString stringWithFormat:@"%@;%@;%@;%@;%@;%@;%@;%@",IMEI,IMES,osVersion,reOsVersion,operator,mobelName,channel,appVersion];
    //    NSString *mobileDescription=[NSString stringWithFormat:@"%@;%@;%@;%@;%@;%@;%@;%@",IMEI,IMES,osVersion,reOsVersion,operator,mobelName,channel,appVersion];
    NSString *mobileDescription=[NSString stringWithFormat:@"%@;%@;%@;%@;%@;%@;%@;%@;%@;%@",IMEI,IMES,osVersion,reOsVersion,operator,mobelName,channel,appVersion,networkStatus,adfa];
    return mobileDescription;
    
}
+(NSString *)getIDFA{
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:[[NSBundle mainBundle] bundleIdentifier] accessGroup:nil];
    NSString *advertisingIdentifier = [wrapper objectForKey:(id)CFBridgingRelease(kSecAttrComment)];
    if ([StringUtil emptyOrNull:advertisingIdentifier]) {
        //        if (![[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]){
        //            advertisingIdentifier = @"";
        //        }else{
        advertisingIdentifier = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        //        }
        [wrapper setObject:advertisingIdentifier forKey:(id)CFBridgingRelease(kSecAttrComment)];
    }
    if ([StringUtil emptyOrNull:advertisingIdentifier]) {
        advertisingIdentifier = @"";
    }
    return advertisingIdentifier;
}
//mac地址,冒号
+ (NSString *) getMacAddress:(BOOL)isColon
{
    int                    mib[6];
    size_t                len;
    char                *buf;
    unsigned char        *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl    *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = @"";
    if (isColon)
        outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    else
        outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    if ([StringUtil emptyOrNull:outstring]) {
        outstring = @"";
    }
    return [outstring uppercaseString];
    
}
/**
 *  获取状态栏网络
 *
 *  @return 返回网络类型（2G、3G、4G、WIFI）
 */
+(NSString *)getNetWorkStatus{
    return [GLReachability stringWithNetWorkStatus];
}

/** 屏幕宽度 */
+ (CGFloat)getScreenWidth{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    return size.width;
}
/** 屏幕高度 */
+ (CGFloat)getScreenHeight{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    return size.height;
}
/** 屏幕实际分辨率跨度 */
+ (CGFloat)getScreenScaleWidth{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    return size.width * scale;
}
/** 屏幕实际分辨率高度 */
+ (CGFloat)getPhoneScaleHeight{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    return size.height * scale;
}


@end
