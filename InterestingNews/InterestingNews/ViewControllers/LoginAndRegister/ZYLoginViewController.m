//
//  ZYLoginViewController.m
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYLoginViewController.h"

#import "ZYRegisterViewController.h"
#import "ZYMineViewController.h"
#import "ZYHardlinesViewController.h"

#import "RequestBase+Login.h"

@interface ZYLoginViewController ()<UITextFieldDelegate>

@end

@implementation ZYLoginViewController

#pragma mark - dealloc

#pragma mark -  lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark - initViews
- (void)initView{
    //设置边框颜色
    self.inputBackgroundLable.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.showPassword.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.clickRegist.layer.borderColor = [UIColor greenColor].CGColor;
    
    //设置输入框左边图标
    
    UIImageView *phoneLeftIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    phoneLeftIcon.image = [UIImage imageNamed:@"login_phone@2x.png"];
    self.telephone.leftView = phoneLeftIcon;
    self.telephone.leftViewMode = UITextFieldViewModeAlways;
    self.telephone.adjustsFontSizeToFitWidth = YES;
    
    UIImageView *passLeftIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    passLeftIcon.image = [UIImage imageNamed:@"login_pass@2x.png"];
    self.password.leftView = passLeftIcon;
    self.password.leftViewMode = UITextFieldViewModeAlways;
    self.password.adjustsFontSizeToFitWidth = YES;
    
    //设置密码框代理，便于明/暗文密码切换
    self.password.delegate = self;
    
    //添加输入框编辑结束回调
    [self.telephone addTarget:self action:@selector(keyBoardFallDown:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.password addTarget:self action:@selector(keyBoardFallDown:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
}

#pragma mark -  private method
- (void)keyBoardFallDown:(UITextField *)tf
{
    [tf resignFirstResponder];
}

- (void)checkLogin{
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UINavigationController *mainNavController = (UINavigationController *)window.rootViewController;
    UITabBarController *tabBarController = (UITabBarController *)mainNavController.viewControllers[0];
    
    tabBarController.selectedIndex = 0;
    
    [self.navigationController popToViewController:tabBarController animated:YES];
        
}

#pragma mark - event response

- (IBAction)clickGoBack:(UIButton *)sender {
    
    [self checkLogin];

}

- (IBAction)clickLogin:(UIButton *)sender {
    
    NSString *errorMsg = @"";
    // 字符串是否为空
    if ([self.telephone.text isEmpty]) {
        errorMsg = @"手机号不能为空";
    }
    else if ([self.password.text isEmpty])
    {
        errorMsg = @"密码不能为空";
    }
    
    if (errorMsg && ![errorMsg isEmpty]) {
        // 提示
        // 设置显示时间
        [SVProgressHUD setMinimumDismissTimeInterval:1];
        // 默认根据文件长度计算显示时间
        [SVProgressHUD showErrorWithStatus:errorMsg];
        
        return;
    }
    
    // 发请求
    [RequestBase sendLoginRequstWithTelephone:[self.telephone.text integerValue] Password:[self.password.text integerValue] completionHandler:^(id responseObj, NSError *error){
        
        ZYResponseModel *responseModel = (ZYResponseModel *)responseObj;
        ZYAccessToken *token = (ZYAccessToken *)responseModel.data;
        
        if ([responseModel.code integerValue] == 0){
        
            // 1.存
            [ZYAKHelper save:responseModel];
            // 2.跳
            
            UIWindow *window = [UIApplication sharedApplication].delegate.window;
            UINavigationController *mainNavController = (UINavigationController *)window.rootViewController;
            UITabBarController *tabBarController = (UITabBarController *)mainNavController.viewControllers[0];
            [self.navigationController popToViewController:tabBarController animated:YES];
            
            [SVProgressHUD setMinimumDismissTimeInterval:1.0f];
            [SVProgressHUD showSuccessWithStatus:responseModel.message];
            
        }else{
            
            [SVProgressHUD setMinimumDismissTimeInterval:1.0f];
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
    }];

}

- (IBAction)clickRegist:(UIButton *)sender {
    
    ZYRegisterViewController *registerVC = [[ZYRegisterViewController alloc]initWithNibName:@"ZYRegisterViewController" bundle:[NSBundle mainBundle]];
    registerVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self.navigationController pushViewController:registerVC animated:YES];
    
//    [self presentViewController:registerVC animated:YES completion:^{
//        nil;
//    }];
}

- (IBAction)clickShowPassword:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    self.password.secureTextEntry = !sender.selected;
    
    NSString *text = self.password.text;
    self.password.text = @" ";
    self.password.text = text;
    
    if (self.password.secureTextEntry)
    {
        [self.password insertText:self.password.text];
    }
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
}

#pragma mark - syetemDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.password)
    {
        if (textField.secureTextEntry)
        {
            [textField insertText:self.password.text];
        }
    }
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
