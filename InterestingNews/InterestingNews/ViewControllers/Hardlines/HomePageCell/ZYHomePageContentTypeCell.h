//
//  ZYHomePageContentTypeCell.h
//  InterestingNews
//
//  Created by m n on 16/11/26.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYHomePageContentTypeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewPhoto;
@property (weak, nonatomic) IBOutlet UILabel *lableNewsTitle;
@property (weak, nonatomic) IBOutlet UILabel *lableReadCount;
@property (weak, nonatomic) IBOutlet UILabel *lablePublishTime;


+(instancetype)tableViewCell;
@end
