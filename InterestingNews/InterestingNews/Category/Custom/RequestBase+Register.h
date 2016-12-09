//
//  RequestBase+Register.h
//  InterestingNews
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestBase.h"

@interface RequestBase (Register)

+ (void)sendRegisterRequstWithTelephone:(NSInteger)phone Password:(NSInteger)password Captcha:(NSInteger)captcha completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

@end
