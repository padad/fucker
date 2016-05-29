//
//  AppConfig.h
//  fucker
//
//  Created by 小咪 on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppConfig : NSObject

/**
 *  主业务服务器
 */
@property (nonatomic, copy) NSString *mainServerPath;


/**
 *  正式环境
 */
+ (AppConfig *)formalEnv;


/**
 *  测试环境
 */
+ (AppConfig *)testEnv;

@end
