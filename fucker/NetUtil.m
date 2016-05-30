//
//  NetUtil.m
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "NetUtil.h"
#import "Toast.h"
#import "GetBinAsyncTask.h"

@implementation NetUtil


+ (void) getBin:(UIView *)mthis :(NSString *)url :(NSDictionary *)params :(int)loadtype :(double)cacheTime{
    
    GetBinAsyncTask *gt = [[GetBinAsyncTask alloc] initWith:mthis url:url params:params loadtype:loadtype cacheTime:cacheTime];
    [gt execute];
    
    
}




@end
