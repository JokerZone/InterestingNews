//
//  ZYTableViewCell.m
//  InterestingNews
//
//  Created by Mac on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYTableViewCell.h"

@implementation ZYTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)tableViewCell {
    ZYTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYTableViewCell" owner:nil options:nil][0];
    return cell;
}
@end
