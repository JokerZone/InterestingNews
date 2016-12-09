//
//  ZYAccessToken.m
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYAccessToken.h"

@implementation ZYAccessToken

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _captcha_id = value;
    }
}

@end
