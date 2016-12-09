//
//  ZYHomePageContentTypeCell.m
//  InterestingNews
//
//  Created by m n on 16/11/26.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYHomePageContentTypeCell.h"

@implementation ZYHomePageContentTypeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)tableViewCell
{
    ZYHomePageContentTypeCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYHomePageContentTypeCell" owner:nil options:nil][0];
    return cell;
}
@end
