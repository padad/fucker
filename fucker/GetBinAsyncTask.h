//
//  GetBinAsyncTask.h
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^success) (NSURLSessionDataTask *, id);
typedef void(^failure) (NSURLSessionDataTask *, NSError *);

@interface GetBinAsyncTask : NSObject

@property (nonatomic,copy) NSString *url;
@property (nonatomic,assign) UIView *mthis;
@property (nonatomic,assign)BOOL isPost;
@property (nonatomic,assign)int loadtype;
@property (nonatomic,copy) NSDictionary *params;
@property (nonatomic,assign) double cacheTime;
@property (nonatomic,copy)success success;
@property (nonatomic,copy)failure failure;


-(id)initWith:(UIView *)mthis
          url:(NSString *)url
       params:(NSDictionary *)params
     loadtype:(int)loadtype
    cacheTime:(double) cacheTime
      success:(void (^)(NSURLSessionDataTask *, id))success
      failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;




- (void)execute;

@end
