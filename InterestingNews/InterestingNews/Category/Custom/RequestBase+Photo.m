//
//  RequestBase+Photo.m
//  InterestingNews
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestBase+Photo.h"

@implementation RequestBase (Photo)  //获取图片码

+(void)sendPhotoRequstWithcompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = @"captcha/getImgCaptcha2";
    NSString *path2 = @"sign=93f189c1bb6ecb2f3324c2d23e4dd14a&time=1479808655.62258&token=1538ScqpZFIa9oX45GLhegXONR5z4g0Y5715Dqk5_qwmWZ2G_kaB4hC-Sr2Cmxeqnm2R4MBcFXqvuqo&version=10204";
    [RequestBase getReuqestWithPath:path Path:path2 parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        if (!error)
        {
//                        NSLog(@"responseStr__%@", ZYData2String(responseObj));
            ZYResponseModel *responseModel = [ZYResponseModel yy_modelWithDictionary:responseObj];
            
            if ([responseModel.code integerValue] != 0) {
                // 构建error对象 并且把返回的error信息放入error的userinfo中
                error = [NSError errorWithDomain:NSCocoaErrorDomain code:99999 userInfo:@{NSLocalizedDescriptionKey : responseModel.message}];
            }
            completionHandler(responseModel, error);
        }
        else
        {
            completionHandler(nil, error);
        }
        
    }];
}

@end
