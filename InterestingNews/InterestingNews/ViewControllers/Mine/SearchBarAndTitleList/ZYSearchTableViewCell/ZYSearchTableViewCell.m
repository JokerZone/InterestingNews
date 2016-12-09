//
//  ZYSearchTableViewCell.m
//  InterestingNews
//
//  Created by Mac on 16/11/30.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYSearchTableViewCell.h"

@implementation ZYSearchTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)tableViewCell {
    ZYSearchTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYSearchTableViewCell" owner:nil options:nil][0];
    return cell;
}
@end
