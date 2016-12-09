//
//  RequestBase.h
//  YiLiao
//
//  Created by Xue on 2016/10/25.
//  Copyright © 2016年 QQ:565007544. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kZYRequestBaseCidKey;
extern NSString * const kZYRequestBaseAKKey;
extern NSString * const kZYRequestBaseContentType;


/// 底层封装AF
@interface RequestBase : NSObject

+ (void)getReuqestWithPath:(NSString *)path Path:(NSString *)path2 parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

+ (void)postReuqestWithPath:(NSString *)path  parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

+ (void)getNotBaseUrlReuqestWithPath:(NSString *)path completionHandler:(void (^)(id responseObj, NSError *error))completionHandler;

@end
