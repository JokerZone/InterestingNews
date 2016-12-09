//
//  RequestBase+Register.m
//  InterestingNews
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestBase+Register.h"

@implementation RequestBase (Register)

+(void)sendRegisterRequstWithTelephone:(NSInteger)phone Password:(NSInteger)password Captcha:(NSInteger)captcha completionHandler:(void (^)(id, NSError *))completionHandler
{
    NSString *path = @"http://api.1sapp.com/member/register";
    NSDictionary *paraments = @{@"OSVersion" : @"10.0.2",
                                @"deviceCode" : @"00000000-0000-0000-0000-000000000000",
                                @"dtu" : @"100",
                                @"lat" : @"30.58349384583792",
                                @"lon" : @"103.9879067958657",
                                @"network" : @"WIFI",
                                @"version" : @10204,
                                @"captcha" : @(captcha),
                                @"telephone" : @(phone),
                                @"password" : @(password),
                                @"sign" : @"a4dcacb3d5650715d274ee2d75afc887",
                                @"time" : @(1479786069.892987),
                                @"token" : @"96743aKghG0sXqamxnHRtbBc1pM2J5AjOtDuVPNuQ10UIdvxFKfvwwSicBUKfd09RqWUAY8SvRnD0s4"};
    
   [RequestBase postReuqestWithPath:path parameters:paraments completionHandler:^(id responseObj, NSError *error) {
       
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
