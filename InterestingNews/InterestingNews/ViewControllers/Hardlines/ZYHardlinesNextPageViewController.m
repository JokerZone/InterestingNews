//
//  ZYHardlinesNextPageViewController.m
//  InterestingNews
//
//  Created by Mac on 16/11/28.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYHardlinesNextPageViewController.h"

@interface ZYHardlinesNextPageViewController ()

@end

@implementation ZYHardlinesNextPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.path]];
    [self.webViewHardlines loadRequest:request];
}

- (IBAction)backButton:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
    
    }];
}


@end
