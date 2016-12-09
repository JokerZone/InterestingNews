//
//  ZYAccessToken.h
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYAccessToken : NSObject

@property (nonatomic, strong) NSString * token;
@property (nonatomic, strong) NSString * is_first;
@property (nonatomic, strong) NSString * member_id;


@property (nonatomic, strong) NSString *captcha_id;
@property (nonatomic, strong) NSString *data;

@end
