//
//  GLReachability.m
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "GLReachability.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation GLReachability


/**
 *  判断网络状态：包含2G,Edge,3G,4G可用和wifi可用和网络不可用
 *
 *  @return 网络状态
 */
+(GLNetWorkStatus)networkStatus
{
    //wifi可用
    if([self isWifiEnable])
        return GLNetWorkStatusWifi;
    //蜂窝移动网络可用,再具体细分(2G,3G,4G,2.75G(Edge))
    else if([self isCarrierConnectEnable])
        //运营商网络判断
        return [self carrierStatus];
    //网络不可用
    else
        return GLNetWorkStatusNotReachable;
}

/**
 *  获取网络状态
 *
 *  @return 网络状态
 */
+(NSString *)stringWithNetWorkStatus{
    NSString *strStatus = @"网络不可用";
    GLNetWorkStatus status=[GLReachability networkStatus];
    switch (status) {
        case GLNetWorkStatus2G:
        {
            strStatus = @"2G";
            break;
        }
        case GLNetWorkStatusEdge:
        {
            strStatus = @"2.75G";
            break;
        }
        case GLNetWorkStatus3G:
        {
            strStatus = @"3G";
            break;
        }
        case GLNetWorkStatus4G:
        {
            strStatus = @"4G";
            break;
        }
        case GLNetWorkStatusWifi:
        {
            strStatus = @"WIFI";
            break;
        }
        case GLNetWorkStatusNotReachable:
        {
            strStatus = @"网络不可用";
            break;
        }
        default:
            break;
    }
    return strStatus;
}

//wifi是否可用
+(BOOL)isWifiEnable
{
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus]==ReachableViaWiFi);
}

//蜂窝移动网络是否可用
+(BOOL)isCarrierConnectEnable
{
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus]==ReachableViaWWAN);
}

/**
 *  运营商网络状态
 */
+(GLNetWorkStatus)carrierStatus
{
    CTTelephonyNetworkInfo *info=[CTTelephonyNetworkInfo new];
    NSString *status=info.currentRadioAccessTechnology;
    
    if([status isEqualToString:CTRadioAccessTechnologyCDMA1x]||[status isEqualToString:CTRadioAccessTechnologyGPRS])
        return GLNetWorkStatus2G;
    else if([status isEqualToString:CTRadioAccessTechnologyEdge])
        return GLNetWorkStatusEdge;
    else if([status isEqualToString:CTRadioAccessTechnologyLTE])
        return GLNetWorkStatus4G;
    else
        return GLNetWorkStatus3G;
}

/**
 *  获取运营商名称
 */
+ (NSString *) getCarrierName{
    CTTelephonyNetworkInfo *NetworkInfo = [[CTTelephonyNetworkInfo alloc]init];
    return  [[NetworkInfo subscriberCellularProvider] carrierName];
}

/**
 *  获取运营商标识
 */
+ (NSString *) getOperator{
    CTTelephonyNetworkInfo *NetworkInfo = [[CTTelephonyNetworkInfo alloc]init];
    
    NSString *NetworkCode = [[NetworkInfo subscriberCellularProvider] mobileNetworkCode];
    NSString *operatorName=@"";
    if ([NetworkCode isEqualToString:@"00"]) {
        operatorName=@"CMCC";//@"China Mobile";
    }else if([NetworkCode isEqualToString:@"01"]){
        operatorName=@"CUCC";//@"China Unicom";
    }else if([NetworkCode isEqualToString:@"02"]){
        operatorName=@"CMCC";//@"China Mobile";
    }else if([NetworkCode isEqualToString:@"03"]){
        operatorName=@"CTCC";//@"China Telecom";
    }else if([NetworkCode isEqualToString:@"05"]){
        operatorName=@"CTCC";//@"China Telecom";
    }else if([NetworkCode isEqualToString:@"06"]){
        operatorName=@"CUCC";//@"China Unicom";
    }else if([NetworkCode isEqualToString:@"07"]){
        operatorName=@"CMCC";//@"China Mobile";
    }else if([NetworkCode isEqualToString:@"80"]){
        operatorName=@"China Tietong";
    }
    return  operatorName;
}

@end
