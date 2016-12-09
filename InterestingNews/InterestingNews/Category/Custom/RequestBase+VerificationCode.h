//
//  RequestBase+VerificationCode.h
//  InterestingNews
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestBase.h"

@interface RequestBase (VerificationCode)

+ (void)sendVerificationCodeRequstWithTelephone:(NSInteger)phone Img_captcha:(NSInteger)img_captcha Img_captcha_id:(NSInteger)img_captcha_id completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

@end
