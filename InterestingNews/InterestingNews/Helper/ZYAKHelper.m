//
//  ZYAKHelper.m
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYAKHelper.h"


NSString *const kZYTimeKey = @"time";
NSString *const kZYAccessTokenKey = @"accessToken";

@implementation ZYAKHelper

+ (void)save:(ZYResponseModel *)ak
{
    [ZYUserDefaults setObject:ak.data.token forKey:kZYAccessTokenKey];
    NSDate *invalidDate = [NSDate dateWithTimeIntervalSinceNow:[ak.currentTime doubleValue]];
    [ZYUserDefaults setObject:invalidDate forKey:kZYTimeKey];
}

+ (NSString *)ak
{
    return [ZYUserDefaults objectForKey:kZYAccessTokenKey];
}

+ (BOOL)isValid
{
    NSString *ak = [ZYUserDefaults objectForKey:kZYAccessTokenKey];
    if (!ak) {
        return NO;
    }
    if ([ak isEqualToString:@""]) {
        return NO;
    }
    
    NSDate *invalidDate = [ZYUserDefaults objectForKey:kZYTimeKey];
    NSDate *now = [NSDate date];
    NSTimeInterval interval = [now timeIntervalSinceDate:invalidDate];
    if (interval >= 0) {
        return NO;
    }
    
    return YES;
}

+ (void)clearAk
{
    [ZYUserDefaults setObject:@"" forKey:kZYAccessTokenKey];
}


@end
