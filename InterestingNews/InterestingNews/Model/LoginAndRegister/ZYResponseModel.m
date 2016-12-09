//
//  ZYResponseModel.m
//  InterestingNews
//
//  Created by m n on 16/11/23.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYResponseModel.h"

@interface ZYResponseModel ()
@end

@implementation ZYResponseModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{
             @"data" : [ZYAccessToken class],
             };
}

@end
