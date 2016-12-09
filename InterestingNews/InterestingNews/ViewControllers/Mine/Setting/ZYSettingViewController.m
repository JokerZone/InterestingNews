//
//  ZYSettingViewController.m
//  InterestingNews
//
//  Created by m n on 16/11/28.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYSettingViewController.h"

#import "ZYChangePasswordViewController.h"
#import "ZYUserInfoViewController.h"
#import "ZYOtherSetViewController.h"


@interface ZYSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UILabel *cache;
@property (nonatomic,assign) NSInteger selectedFontSizeBtnIndex;
@end

@implementation ZYSettingViewController
#pragma mark -  lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
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

#pragma mark -- Table view delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0 | section == 3) {
        
        return 2;
    }else if (section == 2) {
        
        return 4;
    }else{
        
        return 1;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 23, 14, 15, 15)];
        imgView.image = [UIImage imageNamed:@"personal_back_gray.png"];
        [cell.contentView addSubview:imgView];
        
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"修改密码";
            }else{
                cell.textLabel.text = @"完善资料";
            }
        }else if (indexPath.section == 1){
            cell.textLabel.text = @"字体大小";
        }else if (indexPath.section == 2){
            if (indexPath.row == 0) {
                cell.textLabel.text = @"清除缓存";
                
                self.cache = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 123, 9, 90, 25)];
                self.cache.text = [NSString stringWithFormat:@"%.2f KB", [self getCacheSize]];
                self.cache.textColor = [UIColor redColor];
                self.cache.textAlignment = NSTextAlignmentRight;
                self.cache.adjustsFontSizeToFitWidth = YES;
                [cell.contentView addSubview:self.cache];
                
            }else if (indexPath.row == 1) {
                cell.textLabel.text = @"给趣头条评分";
            }else if (indexPath.row == 2) {
                cell.textLabel.text = @"建议与反馈";
            }else if (indexPath.row == 3) {
                cell.textLabel.text = @"隐私协议";
            }
        }if (indexPath.section == 3) {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"检查更新";
            }else{
                cell.textLabel.text = @"关于我们";
            }
        }else if (indexPath.section == 4) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
            btn.backgroundColor = [UIColor redColor];
            [btn setTitle:@"退出登录" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(clickExit:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:btn];
            
            [imgView removeFromSuperview];
            
        }
        
        return cell;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        ZYChangePasswordViewController *changePasswordVC = [[ZYChangePasswordViewController alloc]initWithNibName:@"ZYChangePasswordViewController" bundle:[NSBundle mainBundle]];
        
        [self.navigationController pushViewController:changePasswordVC animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        ZYUserInfoViewController *changeUserInfoVC = [[ZYUserInfoViewController alloc]initWithNibName:@"ZYUserInfoViewController" bundle:[NSBundle mainBundle]];
        
        [self.navigationController pushViewController:changeUserInfoVC animated:YES];
        
    }
    if (indexPath.section == 1) {
        
        ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
        [otherSetVC view];
        otherSetVC.titleLable.text = @"字体大小";
        otherSetVC.selectedBtnIndex = self.selectedFontSizeBtnIndex;
        otherSetVC.fontSizeBtnBlock = ^(NSInteger fontSizeBtnIndex){
            self.selectedFontSizeBtnIndex = fontSizeBtnIndex;
        };
        
        otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/fontsize_demo.html?r=1";
        
        [self.navigationController pushViewController:otherSetVC animated:YES];
    }
    if (indexPath.section == 2 && indexPath.row == 0) {
    
        [self clearCache];
        
        self.cache.text = @"0.0 KB";
    }
    if (indexPath.section == 2 && indexPath.row == 1) {
        
        ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
        [otherSetVC view];
        otherSetVC.titleLable.text = @"评分";
        otherSetVC.fontSetView.hidden = YES;
        otherSetVC.requestPath = @"https://itunes.apple.com/cn/app/qu-tou-tiao-kan-zi-xun-zhuan/id1113268900?mt=8";

        [self.navigationController pushViewController:otherSetVC animated:YES];
    }
    if (indexPath.section == 2 && indexPath.row == 2) {
        
        ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
        [otherSetVC view];
        otherSetVC.titleLable.text = @"反馈";
        otherSetVC.fontSetView.hidden = YES;
        otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/feedback.html?r=3";
        
        [self.navigationController pushViewController:otherSetVC animated:YES];
    }
    if (indexPath.section == 2 && indexPath.row == 3) {
        
        ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
        [otherSetVC view];
        otherSetVC.titleLable.text = @"协议";
        otherSetVC.fontSetView.hidden = YES;
        otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/protocol.html";
        
        [self.navigationController pushViewController:otherSetVC animated:YES];
    }
    if (indexPath.section == 3 && indexPath.row == 0) {
        
        return;
    }
    if (indexPath.section == 3 && indexPath.row == 1) {
        
        ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
        
        [otherSetVC view];
        otherSetVC.titleLable.text = @"关于";
        otherSetVC.fontSetView.hidden = YES;
        otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/about.html?r=7";
        
        [self.navigationController pushViewController:otherSetVC animated:YES];
        
    }
    
}

#pragma mark -  private method

- (void)clickExit:(UIButton *)btn{
    
    NSLog(@"退出登录");
    
    [ZYAKHelper clearAk];
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UINavigationController *mainNavController = (UINavigationController *)window.rootViewController;
    UITabBarController *tabBarController = (UITabBarController *)mainNavController.viewControllers[0];
    tabBarController.selectedIndex = 0;
    
    [self.navigationController popToRootViewControllerAnimated:YES];    
    
}

- (float)getCacheSize
{
    NSUInteger size = [[SDImageCache sharedImageCache] getSize];
    return size/1024.0;
}

- (void)clearCache
{
    [[SDImageCache sharedImageCache] clearDisk];
}

#pragma mark - event response
- (IBAction)clickGoBack:(UIButton *)sender {
    
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
