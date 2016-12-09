//
//  ZYChangePasswordViewController.m
//  InterestingNews
//
//  Created by m n on 16/11/28.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYChangePasswordViewController.h"

@interface ZYChangePasswordViewController ()<UITextFieldDelegate>

@end

@implementation ZYChangePasswordViewController

#pragma mark -  lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}

#pragma mark - initViews
- (void)initView{
    //设置边框颜色
    self.inputBackgroundLable.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.showPassword.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    //设置输入框左边图标
    
    for (int i; i < 3; i++) {
        UIImageView *passLeftIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        passLeftIcon.image = [UIImage imageNamed:@"login_pass@2x.png"];
        if (i == 0) {
            self.pastPassword.leftView = passLeftIcon;
            self.pastPassword.leftViewMode = UITextFieldViewModeAlways;
            self.pastPassword.adjustsFontSizeToFitWidth = YES;
        }else if (i == 1){
            self.newsPassword.leftView = passLeftIcon;
            self.newsPassword.leftViewMode = UITextFieldViewModeAlways;
            self.newsPassword.adjustsFontSizeToFitWidth = YES;
        }else{
            self.confirmPassword.leftView = passLeftIcon;
            self.confirmPassword.leftViewMode = UITextFieldViewModeAlways;
            self.confirmPassword.adjustsFontSizeToFitWidth = YES;
        }
    }
    
    //设置密码框代理，便于明/暗文密码切换
    self.confirmPassword.delegate = self;
    
    //添加输入框编辑结束回调
    [self.pastPassword addTarget:self action:@selector(keyBoardFallDown:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.newsPassword addTarget:self action:@selector(keyBoardFallDown:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.confirmPassword addTarget:self action:@selector(keyBoardFallDown:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
}

#pragma mark -  private method
- (void)keyBoardFallDown:(UITextField *)tf
{
    [tf resignFirstResponder];
}

#pragma mark - syetemDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.confirmPassword)
    {
        if (textField.secureTextEntry)
        {
            [textField insertText:self.confirmPassword.text];
        }
    }
}


#pragma mark - event response
- (IBAction)clickGoBack:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickConfirm:(UIButton *)sender {
}

- (IBAction)clickShowPassword:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    self.confirmPassword.secureTextEntry = !sender.selected;
    
    NSString *text = self.confirmPassword.text;
    self.confirmPassword.text = @" ";
    self.confirmPassword.text = text;
    
    if (self.confirmPassword.secureTextEntry)
    {
        [self.confirmPassword insertText:self.confirmPassword.text];
    }
    
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
