//
//  ZYHomePageTableViewCell.h
//  InterestingNews
//
//  Created by m n on 16/11/26.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYHomePageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lableNewsTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOne;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewThree;

@property (weak, nonatomic) IBOutlet UILabel *lableReadCount;
@property (weak, nonatomic) IBOutlet UILabel *lablePublishTime;

+(instancetype)tableViewCell;
@end
