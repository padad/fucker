//
//  HRApi.h
//  fucker
//
//  Created by 小咪 on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger{
    System_Loading = 0,
    Page_Loading,
    No_Loading
    
}LoadingType;

@interface HRApi : NSObject

+ (void) login : (UIView *)mthis
       userName:(NSString *)userName
           pass:(NSString *)pass
       loadtype:(LoadingType)loadtype
        success:(void (^)(NSURLSessionDataTask *, id))success
        failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end
