//
//  UIButton+ZYIndexPath.m
//  InterestingNews
//
//  Created by Mac on 16/12/4.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "UIButton+ZYIndexPath.h"
#import <objc/message.h>

void * const kWidthKey = @"kWidthKey";
@implementation UIButton (ZYIndexPath)

-(void)setIndexpath:(NSIndexPath *)indexpath
{
     objc_setAssociatedObject(self, kWidthKey, indexpath, OBJC_ASSOCIATION_COPY);
}
-(NSIndexPath *)indexpath
{
    id obj = objc_getAssociatedObject(self, kWidthKey);
    
    return obj;
}
@end
