//
//  ZYVidoesModel.m
//  InterestingNews
//
//  Created by Mac on 16/11/25.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYVidoesModel.h"
#import "ZYVidoesDataModel.h"

@implementation ZYVidoesModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"data" : [ZYVidoesDataModel class]};
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"top"]) {
    
    }
}

@end
