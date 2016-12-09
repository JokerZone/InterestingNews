//
//  ZYMineViewController.m
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYMineViewController.h"

#import "ZYHeadCellTableViewCell.h"
#import "ZYFirstTableViewCell.h"
#import "ZYThePublicTableViewCell.h"
#import "ZYScrollViewCell.h"

#import "ZYSettingViewController.h"
#import "ZYOtherSetViewController.h"

@interface ZYMineViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZYMineViewController

#pragma mark - dealloc


#pragma mark -  lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [[UIApplication sharedApplication] setStatusBarHidden:TRUE];//隐藏状态栏
    [self.navigationController setNavigationBarHidden:YES];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}

#pragma mark - requestNetWork


#pragma mark - systemDelegate



#pragma mark -- Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 170.0;
    }else if (indexPath.section == 1) {
        return 60.0;
    }
    return 44;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0 | section == 1 | section == 4) {
        
        return 1;
    }else if (section == 2){
        
        return 3;
    }else if (section == 3) {
        
        return 4;
    }else{
        
        return 2;
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        ZYHeadCellTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYHeadCellTableViewCell" owner:nil options:nil][0];
        
        for (int i; i < 2; i++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.backgroundColor = [UIColor blackColor];
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 10;
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [cell.contentView addSubview:btn];
            UIImageView *imgView = [[UIImageView alloc] init];
            [cell.contentView addSubview:imgView];
            
            if (i == 0) {
                
                btn.frame = CGRectMake(-6, 25, 75, 20);
                [btn setTitle:@"      消息" forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(clickShowMessage:) forControlEvents:UIControlEventTouchUpInside];
                
                imgView.frame = CGRectMake(12, 27, 18, 17);
                imgView.image = [UIImage imageNamed:@"personal_message.png"];
                
            }
            if (i == 1) {
                
                btn.frame = CGRectMake(310, 25, 75, 20);
                [btn setTitle:@"      设置" forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(clickToSetting:) forControlEvents:UIControlEventTouchUpInside];
                
                imgView.frame = CGRectMake(327, 27, 18, 17);
                imgView.image = [UIImage imageNamed:@"personal_setting.png"];
                
            }
            
        }
        
        return cell;
    }else if (indexPath.section == 1){
        
        ZYFirstTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYFirstTableViewCell" owner:nil options:nil][0];
        
        return cell;
    }else if (indexPath.section == 2){
        
        ZYThePublicTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYThePublicTableViewCell" owner:nil options:nil][0];
        
        if (indexPath.row == 0) {
            
            return cell;
        }else if (indexPath.row == 1){
            cell.cellDescribeLabel.text = @"输入邀请码";
            cell.cellIntroductionLabel.text = @"再领取0.5元红包";
            
            return cell;
        }else{
            cell.cellDescribeLabel.text = @"绑定微信";
            cell.cellIntroductionLabel.text = @"首次绑定+300金币";
            
            return cell;
        }
        
    }else if (indexPath.section == 3){
        
        ZYThePublicTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYThePublicTableViewCell" owner:nil options:nil][0];
        
        if (indexPath.row == 0) {
            cell.cellDescribeLabel.text = @"任务系统";
            cell.cellIntroductionLabel.textColor = [UIColor lightGrayColor];
            cell.cellIntroductionLabel.text = @"签到领金币、拆宝箱";
            
            return cell;
        }else if (indexPath.row == 1){
            cell.cellDescribeLabel.text = @"收入明细";
            
            cell.cellIntroductionLabel.text = @"看看昨天赚了多少";
            
            return cell;
        }else if (indexPath.row == 2){
            cell.cellDescribeLabel.text = @"收入排行";
            cell.cellIntroductionLabel.textColor = [UIColor lightGrayColor];
            cell.cellIntroductionLabel.text = @"哪位趣友更给力";
            
            return cell;
        }else{
            cell.cellDescribeLabel.text = @"游戏中心";
            cell.cellIntroductionLabel.textColor = [UIColor redColor];
            cell.cellIntroductionLabel.text = @"玩游戏赢大奖";
            
            return cell;
        }
        
    }else if (indexPath.section == 5){
        
        ZYThePublicTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYThePublicTableViewCell" owner:nil options:nil][0];
        
        if (indexPath.row == 0) {
            cell.cellDescribeLabel.text = @"兑换&提现";
            cell.cellIntroductionLabel.textColor = [UIColor redColor];
            cell.cellIntroductionLabel.text = @"零钱提现&兑换";
            
            return cell;
        }else{
            cell.cellDescribeLabel.text = @"趣学堂";
            cell.cellIntroductionLabel.textColor = [UIColor lightGrayColor];
            cell.cellIntroductionLabel.text = @"视频教程、常见问题";
            
            return cell;
        }
        
    }else if (indexPath.section == 6){
        
        ZYThePublicTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYThePublicTableViewCell" owner:nil options:nil][0];
        
        if (indexPath.row == 0) {
            cell.cellDescribeLabel.text = @"我的收藏";
            cell.cellIntroductionLabel.text = @"";
            
            return cell;
        }else{
            cell.cellDescribeLabel.text = @"历史记录";
            cell.cellIntroductionLabel.text = @"";
            
            return cell;
        }
        
    }else if(indexPath.section == 4){
        
        ZYScrollViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZYScrollViewCell" owner:nil options:nil][0];
        
            return cell;
    }

    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        
        ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
        [otherSetVC view];
        otherSetVC.titleLable.text = @"邀请收徒";
        otherSetVC.fontSetView.hidden = YES;
        otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/yq3.html?r=64";
        
        [self.navigationController pushViewController:otherSetVC animated:YES];
    }
    if (indexPath.section == 2) {
        
        if (indexPath.row == 0) {
            
            ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
            [otherSetVC view];
            otherSetVC.titleLable.text = @"新手任务";
            otherSetVC.fontSetView.hidden = YES;
            otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/qd.html?scroll=guide&r=63";
            
            [self.navigationController pushViewController:otherSetVC animated:YES];

        }
        if (indexPath.row == 1) {
            
            ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
            [otherSetVC view];
            otherSetVC.titleLable.text = @"邀请好友";
            otherSetVC.fontSetView.hidden = YES;
            otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/yqcode.html";
            
            [self.navigationController pushViewController:otherSetVC animated:YES];
            
        }
    }
    if (indexPath.section == 3) {
        
        if (indexPath.row == 0) {
            
            ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
            [otherSetVC view];
            otherSetVC.titleLable.text = @"任务系统";
            otherSetVC.fontSetView.hidden = YES;
            otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/qd.html?r=50";
            
            [self.navigationController pushViewController:otherSetVC animated:YES];
            
        }
        if (indexPath.row == 1) {
            
            ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
            [otherSetVC view];
            otherSetVC.titleLable.text = @"收入明细";
            otherSetVC.fontSetView.hidden = YES;
            otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/income.html?r=2";
            
            [self.navigationController pushViewController:otherSetVC animated:YES];
            
        }
        if (indexPath.row == 2) {
            
            ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
            [otherSetVC view];
            otherSetVC.titleLable.text = @"收入排行";
            otherSetVC.fontSetView.hidden = YES;
            otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/top.html";
            
            [self.navigationController pushViewController:otherSetVC animated:YES];
            
        }
    }
    if (indexPath.section == 5) {
        
        if (indexPath.row == 0) {
            
            ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
            [otherSetVC view];
            otherSetVC.titleLable.text = @"兑换&&提现";
            otherSetVC.fontSetView.hidden = YES;
            otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/mall.html?r=4";
            
            [self.navigationController pushViewController:otherSetVC animated:YES];
            
        }
        if (indexPath.row == 1) {
            
            ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
            [otherSetVC view];
            otherSetVC.titleLable.text = @"趣学堂";
            otherSetVC.fontSetView.hidden = YES;
            otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan_other/question/index.h";
            
            [self.navigationController pushViewController:otherSetVC animated:YES];
            
        }
    }
    if (indexPath.section == 6) {
        
        if (indexPath.row == 0) {
            
            ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
            [otherSetVC view];
            otherSetVC.titleLable.text = @"我的收藏";
            otherSetVC.fontSetView.hidden = YES;
            otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan_other/question/index.h";
            
            [self.navigationController pushViewController:otherSetVC animated:YES];
            
        }
        if (indexPath.row == 1) {
            
            ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
            [otherSetVC view];
            otherSetVC.titleLable.text = @"历史记录";
            otherSetVC.fontSetView.hidden = YES;
            otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/hsy.html?clientPage=hsy&r=13";
            
            [self.navigationController pushViewController:otherSetVC animated:YES];
            
        }
    }
}

#pragma mark - private method

- (void)clickShowMessage:(UIButton *)sender {
    
    ZYOtherSetViewController *otherSetVC = [[ZYOtherSetViewController alloc]initWithNibName:@"ZYOtherSetViewController" bundle:[NSBundle mainBundle]];
    [otherSetVC view];
    otherSetVC.titleLable.text = @"消息记录";
    otherSetVC.fontSetView.hidden = YES;
    otherSetVC.requestPath = @"http://h5ssl.1sapp.com/qukan/message.html?clientPage=message/u0026r=19";
    
    [self.navigationController pushViewController:otherSetVC animated:YES];
}

- (void)clickToSetting:(UIButton *)sender {
    
    ZYSettingViewController *setingVC = [[ZYSettingViewController alloc]initWithNibName:@"ZYSettingViewController" bundle:[NSBundle mainBundle]];
    
    [self.navigationController pushViewController:setingVC animated:YES];
    
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
