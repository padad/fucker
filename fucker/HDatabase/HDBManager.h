//
//  HDBManager.h
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSManagedObject;
@interface HDBManager : NSObject

//查询所对应类名的名字
+(NSArray *)selectDatasWithModelName:(NSString *)name;
//查询by条件
+(NSArray *)selectDatasWithModelNameByKey:(NSString *)name key:(id)key;
//插入数据 name为对应的数据类名   dic为需要插入数据
+(BOOL)insertDataWithModelName:(NSString *)name andDic:(NSDictionary *)dic;
//更新对应类名的对应的属性的值； 针对一个数据表中只有一条数据使用
+(BOOL)setDataWithModelName:(NSString *)name andkey:(NSString *)key andValue:(id)value;
//清除这个类名内的所有数据
+(BOOL)deleteWithModelName:(NSString *)name;
//添加一条数据，name为类名
+(NSManagedObject *)addDataWithName:(NSString *)name;
//提交修改
+(BOOL)commit;

@end
