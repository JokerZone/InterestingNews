//
//  ZYTableViewCell.h
//  InterestingNews
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewTitlePhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewBigPlay;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewlittlePlay;
@property (weak, nonatomic) IBOutlet UILabel *lablePlayCount;

@property (weak, nonatomic) IBOutlet UIButton *buttonCollect;

@property (weak, nonatomic) IBOutlet UIButton *buttonShare;

@property (weak, nonatomic) IBOutlet UILabel *lableTitle;


+(instancetype)tableViewCell;
@end
