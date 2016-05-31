//
//  Utils.h
//  fucker
//
//  Created by 小咪 on 16/5/28.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ProgressValue)(NSProgress *);

@interface Toast : NSObject
@property (nonatomic,copy)ProgressValue progressValue;


+ (void) showTips : (UIView *) mthis : (NSString *)msg;

+ (id) showProgressDialog: (UIView *)mthis;




@end
