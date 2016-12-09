//
//  ZYUserInfoViewController.m
//  InterestingNews
//
//  Created by m n on 16/11/29.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYUserInfoViewController.h"

#import "ZYChangeNickNameViewController.h"
#import "ZYSelectAgeViewController.h"

#import "ZYUserHeaderTableViewCell.h"
#import "ZYUserDataTableViewCell.h"

#import "ASIFormDataRequest.h"

@interface ZYUserInfoViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImageView *headerImageView;

@property (weak, nonatomic) NSString *nickName;

@property (nonatomic, strong) NSString *constellation;

@property (nonatomic, assign) NSInteger age;

@property (nonatomic, strong) NSDate *userDate;


@end

@implementation ZYUserInfoViewController

#pragma mark -  lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.saveDataButton.hidden = YES;
    self.bottomSaveDataButton.enabled = NO;
    self.bottomSaveDataButton.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - systemDelegate
#pragma mark -- TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 80.0;
    }
    
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        ZYUserHeaderTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYUserHeaderTableViewCell" owner:nil options:nil][0];
        if (self.headerImageView.image != nil) {
            cell.userHeader.image = self.headerImageView.image;
        }
        return cell;
    }else if (indexPath.row == 1) {
        ZYUserDataTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYUserDataTableViewCell" owner:nil options:nil][0];
        
        return cell;
    }else{
        
        ZYUserDataTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYUserDataTableViewCell" owner:nil options:nil][0];
        cell.frontTextLable.text = @"年龄";
        
        if (self.constellation == nil) {
            cell.userInfoTextLable.hidden = YES;
        }else{
            cell.userInfoTextLable.hidden = NO;
            cell.userInfoTextLable.text = [NSString stringWithFormat:@"%@座 %ld岁",self.constellation,(long)self.age];
        }
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        [self uploadPhoto];
        
    }
    
    if (indexPath.row == 1) {
        
        ZYUserDataTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        self.nickName = cell.userInfoTextLable.text;
        
        ZYChangeNickNameViewController *changeNickNamVC = [[ZYChangeNickNameViewController alloc]initWithNibName:@"ZYChangeNickNameViewController" bundle:[NSBundle mainBundle]];
        changeNickNamVC.oldNickName = self.nickName;
        changeNickNamVC.changeTextBlock = ^(NSString *changeNickName){
            
            self.nickName = changeNickName;
            cell.userInfoTextLable.text = self.nickName;
        };
    
        [self.navigationController pushViewController:changeNickNamVC animated:YES];
        
    }
    
    if (indexPath.row == 2) {
        
        ZYSelectAgeViewController *selectAgeVC = [[ZYSelectAgeViewController alloc]initWithNibName:@"ZYSelectAgeViewController" bundle:[NSBundle mainBundle]];
        
        selectAgeVC.date = self.userDate;
        selectAgeVC.dateBlock = ^(NSDate *date,NSInteger userAge,NSString *constellation){
            self.userDate = date;
            self.age = userAge;
            self.constellation = constellation;
            [tableView reloadData];
        };
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
            selectAgeVC.modalPresentationStyle = UIModalPresentationCustom;
            selectAgeVC.modalTransitionStyle =  UIModalTransitionStyleFlipHorizontal;
        }else{
            selectAgeVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            selectAgeVC.modalPresentationStyle = UIModalPresentationFormSheet;
        }
        
        [self presentViewController:selectAgeVC animated:YES completion:nil];
        
//        CGPoint frameSize = CGPointMake(SCREEN_WIDTH*0.8f, SCREEN_HEIGHT*0.85f);
//        selectAgeVC.preferredContentSize = CGSizeMake(frameSize.x, frameSize.y);
//        selectAgeVC.view.center = self.view.center;
        
    }
}

#pragma mark -- UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
//    NSLog(@"%@", info);
    self.headerImageView = [[UIImageView alloc]init];
    _headerImageView.image = info[@"UIImagePickerControllerEditedImage"];
    
    [self.userInfoTableView reloadData];

    [self changeSaveStatus];
    
    // 图片选择器消失
    [self dismissViewControllerAnimated:YES completion:nil];

#warning 上传请求应生效
//    [self uploadRequest];
}

#pragma mark -- UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 9_0){
    if (buttonIndex == 1) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        
        return;
    };
    
}

#pragma mark -  private method

- (void)changeSaveStatus{
    
    self.saveDataButton.hidden = NO;
    self.bottomSaveDataButton.enabled = YES;
    self.bottomSaveDataButton.backgroundColor = [UIColor greenColor];
}

- (void)uploadPhoto
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    //设置允许编辑图片
    imagePickerController.allowsEditing = YES;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)uploadRequest
{

#warning 请求链接应修改
    
    NSString *urlStr = [NSString stringWithFormat:@"%@", [ZYAKHelper ak]];
    
    NSData *imgData = UIImagePNGRepresentation(_headerImageView.image);
    
    // asi 发post请求使用ASIFormDataRequest
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    //将上传的数据追加到请求数据区
    [request appendPostData:imgData];
    
    __weak ASIFormDataRequest *weakRequest = request;
    //设置请求结束block
    [request setCompletionBlock:^{
        
        NSLog(@"responseString:%@", weakRequest.responseString);
        
    }];
    //设置请求失败block
    [request setFailedBlock:^{
        NSLog(@"error:%@", weakRequest.error);
    }];
    //开始异步请求
    [request startAsynchronous];

}

#pragma mark - event response
- (IBAction)clickGoBack:(UIButton *)sender {
    
    if (self.saveDataButton.hidden == NO) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"资料还未保存，确认返回?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        
        [alert show];
        
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    };
    
}

- (IBAction)clickSaveUserInfo:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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
