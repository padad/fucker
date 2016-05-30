//
//  GLReachability.h
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

//定义网络状态
typedef NS_ENUM(NSInteger, GLNetWorkStatus){
    GLNetWorkStatusNotReachable=0,
    GLNetWorkStatus2G,
    GLNetWorkStatusEdge,
    GLNetWorkStatus3G,
    GLNetWorkStatus4G,
    GLNetWorkStatusWifi,
};

@interface GLReachability : NSObject

//@property(nonatomic,strong)Reachability *reachability;

/* 获取网络状态，返回GLNetWorkStatus类型 */
+(GLNetWorkStatus)networkStatus;

/* 获取网络状态，返回字符串状态 */
+(NSString *)stringWithNetWorkStatus;

/* 判断是否是WIFI */
+(BOOL)isWifiEnable;

/* 获取运营商标识 */
+ (NSString *) getOperator;

/* 获取运营商名称 */
+ (NSString *) getCarrierName;


@end
