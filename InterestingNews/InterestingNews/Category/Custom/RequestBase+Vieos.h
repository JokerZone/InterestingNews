//
//  RequestBase+Vieos.h
//  InterestingNews
//
//  Created by Mac on 16/11/25.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestBase.h"

@interface RequestBase (Vieos)

+ (void)sendVidoesRequstWithPath:(NSString *)path  completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

@end
