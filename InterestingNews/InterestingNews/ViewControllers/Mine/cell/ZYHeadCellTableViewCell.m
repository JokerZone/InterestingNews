//
//  ZYHeadCellTableViewCell.m
//  InterestingNews
//
//  Created by m n on 16/11/24.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYHeadCellTableViewCell.h"

#import "ZYSettingViewController.h"
#import "ZYMineViewController.h"

@implementation ZYHeadCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)clickShowMessage:(UIButton *)sender {
}

- (IBAction)clickToSetting:(UIButton *)sender {
    
    ZYSettingViewController *setingVC = [[ZYSettingViewController alloc]initWithNibName:@"ZYSettingViewController" bundle:[NSBundle mainBundle]];
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UITabBarController *tabbarController = (UITabBarController *)window.rootViewController;
    ZYMineViewController *mineVC = (ZYMineViewController *)tabbarController.viewControllers[2];
    
    [mineVC.navigationController popToViewController:setingVC animated:YES];

}
@end
