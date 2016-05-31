//
//  GetBinAsyncTask.m
//  fucker
//
//  Created by Admin on 16/5/30.
//  Copyright © 2016年 tp. All rights reserved.
//

/* 网络超时时间 */
static double REQUEST_TIME_OUT = 15;

#import "GetBinAsyncTask.h"
#import "UserData.h"
#import "HDevice.h"

@implementation GetBinAsyncTask


+(AFHTTPSessionManager *)shareHttpManager
{
    static AFHTTPSessionManager *httpManager;
    static dispatch_once_t httpOnceToken;
    dispatch_once(&httpOnceToken, ^{
        httpManager=[AFHTTPSessionManager manager];
        // 申明返回的数据是json类型
        httpManager.responseSerializer = [AFJSONResponseSerializer serializer];
        // 申明请求的数据是json类型
        httpManager.requestSerializer=[AFJSONRequestSerializer serializer];
        
//        httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json;text/html;charset=UTF-8", nil];
        
        httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/javascript", @"text/html", nil];
    });
    [self setRequestSerialize:httpManager.requestSerializer];
    return httpManager;
}

+(void)setRequestSerialize:(AFHTTPRequestSerializer *)requestSerializer
{
    /* 超时时间 */
    [requestSerializer setTimeoutInterval:REQUEST_TIME_OUT];
    /* 登录Auth */
    [requestSerializer setValue:[UserData getAuth] forHTTPHeaderField:@"X-KJT-Auth"];
    /* 设备信息 */
    [requestSerializer setValue:[HDevice getMobileDescription] forHTTPHeaderField:@"X-KJT-Agent"];
    /* API版本号 */
    [requestSerializer setValue:API_VERSION forHTTPHeaderField:@"X-API-VER"];
    
//    [requestSerializer setValue:@"application/json;text/html;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    
}

/**
 *  设置Https请求
 */
+ (AFSecurityPolicy*)shareSecurityPolicy {
    static AFSecurityPolicy *securityPolicy;
    static dispatch_once_t policyOnceToken;
    dispatch_once(&policyOnceToken, ^{
        /**** SSL Pinning ****/
        securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [securityPolicy setAllowInvalidCertificates:NO];
#ifdef ONLINE_DEV       //如果不是生产环境不用https
        [securityPolicy setAllowInvalidCertificates:YES];
#endif
        /**** SSL Pinning ****/
    });
    return securityPolicy;
}

-(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

- (id)initWith:(UIView *)mthis url:(NSString *)url params:(NSDictionary *)params loadtype:(int)loadtype cacheTime:(double)cacheTime success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    
    self.mthis = mthis;
    self.url = url;
    self.isPost = YES;
    self.params = params;
    self.loadtype = loadtype;
    self.cacheTime = cacheTime;
    self.success = success;
    self.failure = failure;
    
    
    return self;
    
}

- (void) execute{
    
    [self onPreExecute];
    
    AFHTTPSessionManager *manager = [GetBinAsyncTask shareHttpManager];
    
    // 设置Https请求
    [manager setSecurityPolicy:[GetBinAsyncTask shareSecurityPolicy]];
    //@"http://www.weather.com.cn/data/sk/101010100.html"
    [manager POST:self.url parameters:self.params
     
         progress:^(NSProgress * _Nonnull downloadProgress) {
        
         }
          //success:self.success
     
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             NSLog(@"这里打印请求成功要做的事");
             
             self.success(task,responseObject);
             
             
             
//             WeatherResponseModel *dict = [[WeatherResponseModel alloc] initWithDictionary:responseObject error:nil];
//             
//             NSString *g = dict.weatherinfo.city;
//             NSLog(g);
             
         }
         // failure:self.failure
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             
             NSLog(@"%@",error);  //这里打印错误信息
             self.failure(task,error);
             
         }];
    
}

- (void) onPostExecute{
    
    
    
}

- (void) onPreExecute{
    
    //加载loading样式
    switch (self.loadtype) {
        case SYSTEM_LOADING:
            
            [Toast showProgressDialog: self.mthis];
            
            break;
        case PAGE_LOADING:
            [Toast showProgressDialog: self.mthis];
            break;
        case NO_LOADING:
            break;
            
        default:
            break;
    }
    
    
    
}

@end
