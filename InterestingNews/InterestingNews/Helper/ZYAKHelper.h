//
//  ZYAKHelper.h
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZYResponseModel.h"

@class ZYResponseModel;

@interface ZYAKHelper : NSObject

+ (void)save:(ZYResponseModel *)ak;

+ (NSString *)ak;

+ (BOOL)isValid;

+ (void)clearAk;

@end
