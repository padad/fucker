//
//  CacheBin.h
//  fucker
//
//  Created by Admin on 16/5/31.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <objc/message.h>

@interface CacheBin : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, assign) double saved_time;
@property (nonatomic, assign) double validity_duration;
@property (nonatomic, retain) NSString * value;
@property (nonatomic, retain) NSString * key;


@end
