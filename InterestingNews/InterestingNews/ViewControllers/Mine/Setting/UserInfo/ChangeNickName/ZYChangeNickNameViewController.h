//
//  ZYChangeNickNameViewController.h
//  InterestingNews
//
//  Created by m n on 16/11/29.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYChangeNickNameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *changeNickNameTextField;

@property (nonatomic, strong) NSString *oldNickName;

@property (nonatomic ,copy) void(^changeTextBlock)(NSString *);



- (IBAction)clickSaveData:(UIButton *)sender;

- (IBAction)clickGoBack:(UIButton *)sender;

@end
