//
//  ZYOtherSetViewController.h
//  InterestingNews
//
//  Created by m n on 16/12/1.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYOtherSetViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *publicWebView;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (nonatomic,strong) NSString *requestPath;


@property (nonatomic, assign) NSInteger selectedBtnIndex;
@property (nonatomic, copy) void(^fontSizeBtnBlock)(NSInteger );



@property (weak, nonatomic) IBOutlet UIView *fontSetView;

@property (weak, nonatomic) IBOutlet UIButton *normalFontSizeButton;

@property (weak, nonatomic) IBOutlet UIView *clipNormalFontSizeView;

@property (weak, nonatomic) IBOutlet UIButton *bigFontSizeButton;

@property (weak, nonatomic) IBOutlet UIView *clipsuperFontSizeView;

@property (weak, nonatomic) IBOutlet UIButton *superBigFontSizeButton;


- (IBAction)clickGoBack:(UIButton *)sender;

- (IBAction)clickSetNormalFontSize:(UIButton *)sender;

- (IBAction)clickSetBigFontSize:(UIButton *)sender;

- (IBAction)clickSetSuperBigFontSize:(UIButton *)sender;

- (IBAction)clickChangeFontSize:(UIButton *)sender;

@end
