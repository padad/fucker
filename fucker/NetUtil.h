//
//  NetUtil.h
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger{
    System_Loading = 0,
    Page_Loading,
    No_Loading
    
}LoadingType;


@interface NetUtil : NSObject


+ (void) getBin : (UIView *)mthis : (NSString *)url : (NSDictionary *)params : (int) loadtype : (double) cacheTime;

@end
