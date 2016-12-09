//
//  ZYCollectionViewCell.h
//  InterestingNews
//
//  Created by Mac on 16/12/2.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+ZYIndexPath.h"

@interface ZYCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewDelect;

+ (instancetype)tableViewCell;
@end
