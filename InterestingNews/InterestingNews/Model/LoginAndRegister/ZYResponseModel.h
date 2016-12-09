//
//  ZYResponseModel.h
//  InterestingNews
//
//  Created by m n on 16/11/23.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYAccessToken.h"
@interface ZYResponseModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSString * currentTime;
@property (nonatomic, strong) ZYAccessToken * data;


@end
