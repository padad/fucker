//
//  HCoreData.m
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "HCoreData.h"

@implementation HCoreData


+ (NSManagedObjectModel *)managedObjectModel
{
    static NSManagedObjectModel *managedObjectModel = nil;
    static dispatch_once_t managedObjectModelOnceToken;
    dispatch_once(&managedObjectModelOnceToken, ^{
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DataModel" withExtension:@"momd"];
        managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    });
    return managedObjectModel;
}

+ (NSManagedObjectContext *)managedObjectContext{
    
    
    static NSManagedObjectContext *managedObjectContext = nil;
    static dispatch_once_t managedObjectContextOnceToken;
    dispatch_once(&managedObjectContextOnceToken, ^{
        NSPersistentStoreCoordinator *coordinator = [HCoreData persistentStoreCoordinator];
        if (coordinator) {
            managedObjectContext = [[NSManagedObjectContext alloc] init];
            [managedObjectContext setPersistentStoreCoordinator:coordinator];
        }
    });
    return managedObjectContext;
    
}

+ (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    
    static NSPersistentStoreCoordinator *persistentStoreCoordinator = nil;
    static dispatch_once_t persistentStoreCoordinatorOnceToken;
    
    dispatch_once(&persistentStoreCoordinatorOnceToken, ^{
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES],NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES],NSInferMappingModelAutomaticallyOption, nil];
        
        
        persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
        NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"HaiRY.sqlite"];
        
#ifdef ONLINE_DEV
        NSUserDefaults *userdefault=[NSUserDefaults standardUserDefaults];
        NSString *version=[userdefault valueForKey:@"appVersion"];
        if (![version isEqualToString:[HDevice getAppBulid]]) {
            NSFileManager *fileManager=[NSFileManager defaultManager];
            [fileManager removeItemAtURL:storeURL error:nil];
            [userdefault setObject:[HDevice getAppBulid] forKey:@"appVersion"];
            [userdefault synchronize];
        }
#endif
        NSError *error = nil;
        NSString *failureReason = @"There was an error creating or loading the application's saved data.";
        if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
            // Report any error we got.
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
            dict[NSLocalizedFailureReasonErrorKey] = failureReason;
            dict[NSUnderlyingErrorKey] = error;
            error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    });
    return persistentStoreCoordinator;
    
}

+ (NSURL *)applicationDocumentsDirectory {
    NSURL *filePath=[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSLog(@"filePath==%@",filePath);
    return filePath;
}

+(void)saveContext {
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
