//
//  ZYCollectionViewCell.m
//  InterestingNews
//
//  Created by Mac on 16/12/2.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYCollectionViewCell.h"

@implementation ZYCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
}


+ (instancetype)tableViewCell {
    ZYCollectionViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYCollectionViewCell" owner:nil options:nil][0];
    return cell;
}

@end
