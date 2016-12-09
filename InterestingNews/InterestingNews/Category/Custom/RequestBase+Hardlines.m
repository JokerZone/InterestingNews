//
//  RequestBase+Hardlines.m
//  InterestingNews
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestBase+Hardlines.h"
#import "ZYVidoesModel.h"

@implementation RequestBase (Hardlines)

+(void)sendHardlinesRequstWithPath:(NSString *)path completionHandler:(void (^)(id, NSError *))completionHandler{
   
    [RequestBase getNotBaseUrlReuqestWithPath:path  completionHandler:^(id responseObj, NSError *error) {
        ZYVidoesModel *vidoesModel = [ZYVidoesModel yy_modelWithDictionary:responseObj[@"data"]];
        completionHandler(vidoesModel,error);
        
    }];
}

@end
