//
//  CacheUtil.h
//  fucker
//
//  Created by Admin on 16/5/31.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheUtil : NSObject

+(NSString *) getCacheBin : (NSString *)key;

+(void) saveCacheBin : (NSString *)key cacheTime:(double)cacheTime value:(NSString *)value;

@end
