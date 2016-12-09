//
//  ZYChangeNickNameViewController.m
//  InterestingNews
//
//  Created by m n on 16/11/29.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYChangeNickNameViewController.h"

#import "ZYUserInfoViewController.h"

@interface ZYChangeNickNameViewController ()<UITextFieldDelegate>

@end

@implementation ZYChangeNickNameViewController

#pragma mark -  lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    self.tabBarController.tabBar.hidden = YES;
    
    self.changeNickNameTextField.placeholder = self.oldNickName;
    self.changeNickNameTextField.delegate = self;
    [self.changeNickNameTextField addTarget:self action:@selector(keyBoardFallDown:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.changeNickNameTextField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark -  private method
- (void)keyBoardFallDown:(UITextField *)tf
{
    [tf resignFirstResponder];
}

- (void)changeSaveStatus{
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UINavigationController *mainNavController = (UINavigationController *)window.rootViewController;
    UITabBarController *tabBarController = (UITabBarController *)mainNavController.viewControllers[0];
    UINavigationController *mineNavController = (UINavigationController *)tabBarController.viewControllers[2];
    
    NSInteger counts = mineNavController.viewControllers.count;
    ZYUserInfoViewController *userInfoVC = (ZYUserInfoViewController *)mineNavController.viewControllers[counts - 1];
    userInfoVC.saveDataButton.hidden = NO;
    userInfoVC.bottomSaveDataButton.enabled = YES;
    userInfoVC.bottomSaveDataButton.backgroundColor = [UIColor greenColor];
}

#pragma mark - syetemDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.changeNickNameTextField)
    {
        if (textField.placeholder)
        {
            if (textField.text == textField.placeholder) {
                return;
            }else{
                [textField insertText:self.changeNickNameTextField.placeholder];
                textField.placeholder = nil;
            }
            
        }
    }
}



#pragma mark - event response
- (IBAction)clickSaveData:(UIButton *)sender {
    
    self.changeTextBlock(self.changeNickNameTextField.text);
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self changeSaveStatus];
}

- (IBAction)clickGoBack:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self changeSaveStatus];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
