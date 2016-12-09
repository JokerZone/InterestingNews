//
//  RequestBase+Login.m
//  InterestingNews
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestBase+Login.h"

@implementation RequestBase (Login)  //登录

+(void)sendLoginRequstWithTelephone:(NSInteger)phone Password:(NSInteger)password completionHandler:(void (^)(id, NSError *))completionHandler
{
    
    NSString *path2 = [NSString stringWithFormat:@"http://api.1sapp.com/member/login?OSVersion=10.0.2&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58342714905195&lon=103.9878802142734&network=WIFI&password=%ld&sign=6acfc40a4236e6abd06b107f21ff828d&telephone=%ld&time=1479808992.194383&token=1538ScqpZFIa9oX45GLhegXONR5z4g0Y5715Dqk5_qwmWZ2G_kaB4hC-Sr2Cmxeqnm2R4MBcFXqvuqo&version=10204",password,phone];
    
    [RequestBase getNotBaseUrlReuqestWithPath:path2 completionHandler:^(id responseObj, NSError *error) {
        
        if (!error)
        {
//            NSLog(@"responseStr__%@", ZYData2String(responseObj));
            ZYResponseModel *responseModel = [ZYResponseModel yy_modelWithJSON:responseObj];
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
