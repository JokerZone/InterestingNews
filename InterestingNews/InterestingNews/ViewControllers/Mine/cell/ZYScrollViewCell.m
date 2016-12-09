//
//  ZYScrollViewCell.m
//  InterestingNews
//
//  Created by m n on 16/11/27.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYScrollViewCell.h"
@implementation ZYScrollViewCell

#pragma mark -  lifeCycle
- (void)awakeFromNib {
    // Initialization code
//    [self initImg];
    
    
    NSArray *arr = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"]];
    /**
     *  通过storyboard创建的轮播控件
     */
    _carouselView.imageArray = arr;
    
    //设置分页控件指示器的颜色
    [_carouselView setPageColor:[UIColor blueColor] andCurrentPageColor:[UIColor redColor]];
    //设置图片切换的方式
    _carouselView.changeMode = ChangeModeDefault;
    //用block处理图片点击事件
    _carouselView.imageClickBlock = ^(NSInteger index){
        NSLog(@"点击了第%ld张图片", index);
    };
    _carouselView.time = 2;

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark XRCarouselViewDelegate
- (void)carouselView:(XRCarouselView *)carouselView clickImageAtIndex:(NSInteger)index {
    NSLog(@"点击了第%ld张图片", index);
}


@end
