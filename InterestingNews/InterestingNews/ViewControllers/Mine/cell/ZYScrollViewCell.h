//
//  ZYScrollViewCell.h
//  InterestingNews
//
//  Created by m n on 16/11/27.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ZYScrollViewCell : UITableViewCell<UIScrollViewDelegate>
@property (nonatomic, retain) NSTimer *tim;
@property (weak, nonatomic) IBOutlet XRCarouselView *carouselView;

@end
