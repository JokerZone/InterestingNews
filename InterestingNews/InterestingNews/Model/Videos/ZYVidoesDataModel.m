//
//  ZYVidoesDataModel.m
//  InterestingNews
//
//  Created by Mac on 16/11/25.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYVidoesDataModel.h"

@implementation ZYVidoesDataModel

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{@"user_id" : @"id"};
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"cover"]) {
        _cover = value;
    }
    if ([key isEqualToString:@"tag"]) {
        _tag = value;
    }
}
@end
