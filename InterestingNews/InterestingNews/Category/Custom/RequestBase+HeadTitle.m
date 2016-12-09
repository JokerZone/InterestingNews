//
//  RequestBase+HeadTitle.m
//  InterestingNews
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestBase+HeadTitle.h"

@implementation RequestBase (HeadTitle) //获取头条标题

+(void)sendGetHeadTitleRequstWithcompletionHandler:(void (^)(id, NSError *))completionHandler
{
    NSString *path = @"content/getDefaultChannelList";
    NSString *path2 = @"sign=c903ccec81b789ad37848e3324f9c522&time=1479807933.975106&token=1538ScqpZFIa9oX45GLhegXONR5z4g0Y5715Dqk5_qwmWZ2G_kaB4hC-Sr2Cmxeqnm2R4MBcFXqvuqo&version=10204";
    [RequestBase getReuqestWithPath:path Path:path2 parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        completionHandler(responseObj,error);
        
    }];
    
}

@end
