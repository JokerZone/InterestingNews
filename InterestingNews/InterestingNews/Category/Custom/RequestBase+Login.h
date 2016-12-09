//
//  RequestBase+Login.h
//  InterestingNews
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestBase.h"

@interface RequestBase (Login)

+ (void)sendLoginRequstWithTelephone:(NSInteger)phone Password:(NSInteger)password completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

@end
