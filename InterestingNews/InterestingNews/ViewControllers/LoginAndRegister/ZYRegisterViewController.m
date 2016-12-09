//
//  ZYRegisterViewController.m
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYRegisterViewController.h"

#import "Base64.h"
#import "RequestBase+Photo.h"
#import "RequestBase+Register.h"
#import "RequestBase+VerificationCode.h"

#import "ZYOtherSetViewController.h"

@interface ZYRegisterViewController ()<UITextFieldDelegate>
@property (nonatomic, assign) NSInteger captcha_id;

@end

@implementation ZYRegisterViewController

#pragma mark - dealloc

#pragma mark -  lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self refreshImgCode];
    
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - initViews
- (void)initView{
    
    //设置边框颜色
    self.inputBackgroundLable.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.showPassword.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    //设置输入框左边图标
    
    for (int i; i < 4; i++) {
        
        if (i == 0) {
            [self loadLeftIconWithInputfield:self.telephone andImgName:@"login_phone@2x.png"];
        }else if (i == 1){
            [self loadLeftIconWithInputfield:self.pictureNum andImgName:@"register_code@2x"];
        }else if (i == 2){
            [self loadLeftIconWithInputfield:self.verificationCode andImgName:@"register_code@2x"];
        }else if (i == 3){
            [self loadLeftIconWithInputfield:self.password andImgName:@"login_pass@2x.png"];
        }
    }
}

#pragma mark -  private method
- (void)keyBoardFallDown:(UITextField *)tf
{
    [tf resignFirstResponder];
}

- (void)loadLeftIconWithInputfield:(UITextField *)tf andImgName:(NSString *)name{
    
    UIImageView *LeftIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    LeftIcon.image = [UIImage imageNamed:name];
    tf.leftView = LeftIcon;
    tf.leftViewMode = UITextFieldViewModeAlways;
    tf.adjustsFontSizeToFitWidth = YES;
    
    //添加输入框编辑结束回调
    [tf addTarget:self action:@selector(keyBoardFallDown:) forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (void)refreshImgCode{
    
    [RequestBase sendPhotoRequstWithcompletionHandler:^(id responseObj, NSError *error) {
        ZYResponseModel *responseModel = (ZYResponseModel *)responseObj;
        [SVProgressHUD setMinimumDismissTimeInterval:1];
        if (!error)
        {
            [SVProgressHUD showSuccessWithStatus:responseModel.message];
            //解密返回数据，获得加密的图片码
            self.captcha_id = [responseModel.data.captcha_id integerValue];
            NSString *imgCode = responseModel.data.data;
            NSData *enCode = [imgCode base64DecodedData];
            self.showImgCode.image = [UIImage imageWithData:enCode];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
    }];
}


#pragma mark - event response

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

- (IBAction)clickRegist:(UIButton *)sender {
    
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
    
    // 使用网络请求API发起请求
    
    [RequestBase sendRegisterRequstWithTelephone:[self.telephone.text integerValue] Password:[self.password.text integerValue] Captcha:[self.verificationCode.text integerValue] completionHandler:^(id responseObj, NSError *error) {
        
        ZYResponseModel *responseModel = (ZYResponseModel *)responseObj;
        [SVProgressHUD setMinimumDismissTimeInterval:1];
        if (!error)
        {
            [SVProgressHUD showSuccessWithStatus:responseModel.message];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
        
    }];

}

- (IBAction)clickRefreshImgCode:(UIButton *)sender {
    
    [self refreshImgCode];
}

- (IBAction)clickGetVerificationCode:(UIButton *)sender {
    
    //测试数据：img_captcha=4690；img_captcha_id=25973942
    [RequestBase sendVerificationCodeRequstWithTelephone:[self.telephone.text integerValue] Img_captcha:[self.pictureNum.text integerValue] Img_captcha_id:self.captcha_id completionHandler:^(id responseObj, NSError *error) {
        
        ZYResponseModel *responseModel = (ZYResponseModel *)responseObj;
        [SVProgressHUD setMinimumDismissTimeInterval:1];
        if (!error)
        {
            //成功发送验证码到手机，并友好提示
            [SVProgressHUD showSuccessWithStatus:responseModel.message];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
    }];
    
}

- (IBAction)clickReadAgreement:(UIButton *)sender {
    
    ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
    [otherSetVC view];
    otherSetVC.titleLable.text = @"协议";
    otherSetVC.fontSetView.hidden = YES;
    otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/protocol.html";
    
    [self.navigationController pushViewController:otherSetVC animated:YES];
}

- (IBAction)clickGoBack:(UIButton *)sender {
    
//    [self dismissViewControllerAnimated:YES completion:^{
//        nil;
//    }];
    
    [self.navigationController popViewControllerAnimated:YES];
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
