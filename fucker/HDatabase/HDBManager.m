//
//  HDBManager.m
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "HDBManager.h"
#import "HCoreData.h"

@implementation HDBManager


+(NSArray *)selectDatasWithModelName:(NSString *)name{
    NSManagedObjectContext *context=[HCoreData managedObjectContext];
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:name inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects=[context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"\n数据库查询错误:\n%@", [error localizedDescription]);
    }
    [HDBManager commit];
    return fetchedObjects;
}

+(NSArray *)selectDatasWithModelNameByKey:(NSString *)name key:(id)key{
    NSManagedObjectContext *context=[HCoreData managedObjectContext];
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] init];
    
    // 3. 条件查询，通过谓词来实现的
    //    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"age < 60 && name LIKE '*五'"];
    // 在谓词中CONTAINS类似于数据库的 LIKE '%王%'
    //    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"phoneNo CONTAINS '1'"];
    // 如果要通过key path查询字段，需要使用%K
    //fetchRequest.predicate = [NSPredicate predicateWithFormat:@"key", key];
    
    NSPredicate *predicate= [NSPredicate predicateWithFormat:@"key = %@ ",key];
    
    NSEntityDescription *entity=[NSEntityDescription entityForName:name inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    NSError *error;
    NSArray *fetchedObjects=[context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"\n数据库查询错误:\n%@", [error localizedDescription]);
    }
    [HDBManager commit];
    return fetchedObjects;
}

+(BOOL)insertDataWithModelName:(NSString *)name andDic:(NSDictionary *)dic{
    NSManagedObject *info=[HDBManager addDataWithName:name];
    NSArray *keys=[dic allKeys];
    for (NSString *key in keys) {
        id value=[dic objectForKey:key];
        if (![value isKindOfClass:[NSNull class]]) {
            [info setValue:value forKey:key];
        }
    }
    return [HDBManager commit];
    
}

+(BOOL)setDataWithModelName:(NSString *)name andkey:(NSString *)key andValue:(id)value
{
    NSArray *datas=[HDBManager selectDatasWithModelName:name];
    NSManagedObjectContext *context=[HCoreData managedObjectContext];
    NSManagedObject *info;
    if (datas.count>0) {
        info=[datas objectAtIndex:0];
        [info setValue:value forKey:key];
    }else{
        info=[NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:context];
        [info setValue:value forKey:key];
    }
    return [HDBManager commit];
}

+(BOOL)deleteWithModelName:(NSString *)name{
    NSManagedObjectContext *context=[HCoreData managedObjectContext];
    NSArray *resultArray=[HDBManager selectDatasWithModelName:name];
    
    for (NSManagedObject *info in resultArray) {
        [context deleteObject:info];
    }
    return [HDBManager commit];
    
}

//添加一条数据，name为类名
+(NSManagedObject *)addDataWithName:(NSString *)name{
    NSManagedObjectContext *context=[HCoreData managedObjectContext];
    NSManagedObject *info=[NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:context];
    [HDBManager commit];
    return info;
}


//提交修改
+(BOOL)commit{
    NSManagedObjectContext *context=[HCoreData managedObjectContext];
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"\n数据库插入错误:\n%@", [error localizedDescription]);
        return NO;
    }
    return YES;
}

@end
