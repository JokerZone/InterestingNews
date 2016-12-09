//
//  ZYRegisterViewController.h
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYRegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *inputBackgroundLable;
@property (weak, nonatomic) IBOutlet UIButton *showPassword;
@property (weak, nonatomic) IBOutlet UIImageView *showImgCode;




@property (weak, nonatomic) IBOutlet UITextField *telephone;
@property (weak, nonatomic) IBOutlet UITextField *pictureNum;
@property (weak, nonatomic) IBOutlet UITextField *verificationCode;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)clickShowPassword:(UIButton *)sender;

- (IBAction)clickRegist:(UIButton *)sender;

- (IBAction)clickRefreshImgCode:(UIButton *)sender;

- (IBAction)clickGetVerificationCode:(UIButton *)sender;

- (IBAction)clickReadAgreement:(UIButton *)sender;

- (IBAction)clickGoBack:(UIButton *)sender;

@end
