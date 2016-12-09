//
//  ZYUserInfoViewController.h
//  InterestingNews
//
//  Created by m n on 16/11/29.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYUserInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *saveDataButton;

@property (weak, nonatomic) IBOutlet UIButton *bottomSaveDataButton;

@property (weak, nonatomic) IBOutlet UITableView *userInfoTableView;




- (IBAction)clickGoBack:(UIButton *)sender;

- (IBAction)clickSaveUserInfo:(UIButton *)sender;


@end
