//
//  ZYHeadCellTableViewCell.h
//  InterestingNews
//
//  Created by m n on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYHeadCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *headButton;

@property (weak, nonatomic) IBOutlet UILabel *nickNameLable;

@property (weak, nonatomic) IBOutlet UILabel *goldNum;

@property (weak, nonatomic) IBOutlet UILabel *coinNum;



- (IBAction)clickShowMessage:(UIButton *)sender;
- (IBAction)clickToSetting:(UIButton *)sender;

@end
