//
//  ZYVidoesNextPageViewController.m
//  InterestingNews
//
//  Created by Mac on 16/11/27.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYVidoesNextPageViewController.h"
#import "ZYVideosChildViewController.h"

@interface ZYVidoesNextPageViewController ()

@end

@implementation ZYVidoesNextPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.path]];
    [self.webViewVidoes loadRequest:request];
}

- (IBAction)backButtom:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
