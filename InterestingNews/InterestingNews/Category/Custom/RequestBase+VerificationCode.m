//
//  RequestBase+VerificationCode.m
//  InterestingNews
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestBase+VerificationCode.h"

@implementation RequestBase (VerificationCode)  //获取验证码

+(void)sendVerificationCodeRequstWithTelephone:(NSInteger)phone Img_captcha:(NSInteger)img_captcha Img_captcha_id:(NSInteger)img_captcha_id completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = @"captcha/getSmsCaptcha";
    NSString *path2 = [NSString stringWithFormat:@"telephone=%ld&img_captcha=%ld&img_captcha_id=%ld&sign=a7488657a0ae5f04f1d95f92a18e8810&time=1479808882.397879&token=1538ScqpZFIa9oX45GLhegXONR5z4g0Y5715Dqk5_qwmWZ2G_kaB4hC&use_way=1&version=10204",phone,img_captcha,img_captcha_id];
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
