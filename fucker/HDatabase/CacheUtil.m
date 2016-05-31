//
//  CacheUtil.m
//  fucker
//
//  Created by Admin on 16/5/31.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "CacheUtil.h"
#import "HDBManager.h"
#import "CacheBin.h"

@implementation CacheUtil

+ (NSString *) getCacheBin:(NSString *)key{
    
    
    NSArray *result=[HDBManager selectDatasWithModelNameByKey:@"CacheBin" key:key];
    if (result.count>0) {
        CacheBin *cache=[result objectAtIndex:0];
        return cache.value;
    }
    return @"";
    
    
}

+ (void) saveCacheBin:(NSString *)key cacheTime:(double)cacheTime value:(NSString *)value{
    
    
    NSMutableDictionary *nd = [[NSMutableDictionary alloc] init];
    [nd setObject:key forKey:@"key"];
    [nd setObject:value forKey:@"value"];
    [nd setObject:@"1" forKey:@"type"];
    [nd setObject:[NSNumber numberWithDouble:cacheTime] forKey:@"validity_duration"];
    [nd setObject:[NSNumber numberWithDouble:300] forKey:@"saved_time"];
    
    
   // NSDictionary *ds = [cache toDictionary];
    
    [HDBManager insertDataWithModelName:@"CacheBin" andDic:nd];
    
   
    
}



@end
