//
//  RequestBase+Vieos.m
//  InterestingNews
//
//  Created by Mac on 16/11/25.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestBase+Vieos.h"
#import "ZYVidoesModel.h"

@implementation RequestBase (Vieos)

+(void)sendVidoesRequstWithPath:(NSString *)path completionHandler:(void (^)(id responseObj, NSError *error))completionHandler
{
    [RequestBase getNotBaseUrlReuqestWithPath:path completionHandler:^(id responseObj, NSError *error) {
        ZYVidoesModel *vidoesModel = [ZYVidoesModel yy_modelWithDictionary:responseObj[@"data"]];
        completionHandler(vidoesModel,error);
    }];
}

@end
