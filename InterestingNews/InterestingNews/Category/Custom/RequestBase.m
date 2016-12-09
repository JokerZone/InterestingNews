//
//  RequestBase.m
//  YiLiao
//
//  Created by Xue on 2016/10/25.
//  Copyright © 2016年 QQ:565007544. All rights reserved.
//

#import "RequestBase.h"

NSString * const kSQRequestBaseContentType = @"content_type";
NSString * const kSQRequestBaseCidKey = @"cid";
NSString * const kSQRequestBaseAKKey = @"token";


@implementation RequestBase

+ (void)getReuqestWithPath:(NSString *)path Path:(NSString *)path2 parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler
{

    [self sendRequestWithRequestType:@"GET" path:path path:(NSString *)path2 parameters:parameters completionHandler:completionHandler];
}

+ (void)postReuqestWithPath:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler
{
    [self sendRequestWithRequestType:@"POST" path:path path:nil parameters:parameters completionHandler:completionHandler];
}

+ (void)sendRequestWithRequestType:(NSString *)type path:(NSString *)path path:(NSString *)path2 parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   // manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if ([type isEqualToString:@"GET"])
    {
        path = BaseURL(path,path2);
        [manager GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            completionHandler(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            completionHandler(nil, error);
        }];
    }
    else if([type isEqualToString:@"POST"])
    {
        [manager POST:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            completionHandler(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completionHandler(nil, error);
        }];
    }
}

+(void)getNotBaseUrlReuqestWithPath:(NSString *)path completionHandler:(void (^)(id responseObj, NSError *error))completionHandler
{
     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completionHandler(nil, error);
    }];

    
}

@end
