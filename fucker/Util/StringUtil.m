//
//  StringUtil.m
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "StringUtil.h"

@implementation StringUtil

/**
 * 判断字串是否为空
 * @param str
 * @return
 */
+(bool) emptyOrNull:(NSString *)str
{
    return str == nil || (NSNull *)str == [NSNull null] || str.length == 0||[str isKindOfClass:[NSNull class]];
}

@end
