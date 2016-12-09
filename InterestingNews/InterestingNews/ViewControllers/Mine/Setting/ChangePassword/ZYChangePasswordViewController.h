//
//  ZYChangePasswordViewController.h
//  InterestingNews
//
//  Created by m n on 16/11/28.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYChangePasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *pastPassword;
@property (weak, nonatomic) IBOutlet UITextField *newsPassword;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UIButton *showPassword;
@property (weak, nonatomic) IBOutlet UILabel *inputBackgroundLable;

- (IBAction)clickGoBack:(UIButton *)sender;

- (IBAction)clickConfirm:(UIButton *)sender;

- (IBAction)clickShowPassword:(UIButton *)sender;

@end
