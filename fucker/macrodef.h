//
//  macrodef.h
//  fucker
//
//  Created by 小咪 on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#ifndef macrodef_h
#define macrodef_h






#define ISDEBUG NO

#define SYSTEM_LOADING 0
#define PAGE_LOADING 1
#define NO_LOADING 2

/* 用户Auth */
#define USER_AUTH       [UserData getAuth]

/* API版本 */
#define API_VERSION     @"2.0"      //API版本号

///* 生产环境配置 */
#define CHANNEL_ID  @"apple_normal"                 //AppStore渠道标识



#define toLogin @"/toLogin"

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


//获取系统版本
#define IOS_VERSION ［[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion ［UIDevice currentDevice] systemVersion]


#endif /* macrodef_h */
