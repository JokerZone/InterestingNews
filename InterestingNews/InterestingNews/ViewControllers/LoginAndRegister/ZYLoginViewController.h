//
//  ZYLoginViewController.h
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *inputBackgroundLable;
@property (weak, nonatomic) IBOutlet UIButton *showPassword;
@property (weak, nonatomic) IBOutlet UIButton *clickRegist;



@property (weak, nonatomic) IBOutlet UITextField *telephone;
@property (weak, nonatomic) IBOutlet UITextField *password;


- (IBAction)clickGoBack:(UIButton *)sender;

- (IBAction)clickLogin:(UIButton *)sender;

- (IBAction)clickRegist:(UIButton *)sender;

- (IBAction)clickShowPassword:(UIButton *)sender;

@end
