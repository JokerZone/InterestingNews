//
//  NSString+Additions.m
//  YiLiao
//
//  Created by Xue on 2016/10/25.
//  Copyright © 2016年 QQ:565007544. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

- (BOOL)isEmpty
{
    NSLog(@"self___%@", self);
    if (![self isKindOfClass:[NSString class]])
    {
        return YES;
    }
    if (!self)
    {
        return YES;
    }
    if ([self isEqualToString:@"null"]) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if ([self isEqualToString:@"(null)"])
    {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
    {
        return YES;
    }
    
    return NO;
}

@end
