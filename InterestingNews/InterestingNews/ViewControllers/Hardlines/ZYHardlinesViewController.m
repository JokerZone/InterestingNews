//
//  ZYHardlinesViewController.m
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYHardlinesViewController.h"
#import "ZYSearchViewController.h"
#import "ViewController.h"
#import "RequestBase+Hardlines.h"
#import "RequestBase+HeadTitle.h"
#import "RequestHardlinesAll.h"
#import "ZYTitleListViewController.h"


@interface ZYHardlinesViewController ()
@property(nonatomic,strong)HYPageView *pageView;
@property(nonatomic,strong)NSMutableArray *arrData;
@property(nonatomic,strong)NSMutableArray *titleArr;
@property(nonatomic,strong)NSMutableArray *viewControllersArr;
@end

@implementation ZYHardlinesViewController
#pragma mark - Init Or Dealloc


#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self RequestHttpPath];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

#pragma mark - Init Views
- (HYPageView *)MainScrollView {
    float wirth = [UIScreen mainScreen].bounds.size.width;
    float height = [UIScreen mainScreen].bounds.size.height;
    _pageView = [[HYPageView alloc] initWithFrame:CGRectMake(0, 0, wirth, height) withTitles:self.titleArr withViewControllers:self.viewControllersArr withParameters:self.arrData];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [leftButton setImage:[UIImage imageNamed:@"search_history@2x"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 30, 25);
    [leftButton setTintColor:[UIColor grayColor]];
    [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _pageView.leftButton = leftButton;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightButton setImage:[UIImage imageNamed:@"nav_add@2x"] forState:UIControlStateNormal];
    [rightButton setTintColor:[UIColor colorWithRed:0 green:206.0 blue:58.0 alpha:1]];
    rightButton.frame = CGRectMake(0, 0, 40, 20);
    [rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _pageView.rightButton = rightButton;
    
    //_pageView.isAnimated = YES;
    _pageView.selectedColor = [UIColor colorWithRed:18/255 green:196/255. blue:80/255. alpha:1];
    _pageView.unselectedColor = [UIColor blackColor];
    _pageView.font = [UIFont systemFontOfSize:16];
    //[self layoutPageSubView];
    return _pageView;
}

#pragma mark - Network Request
-(void)RequestHttpPath
{
    [RequestBase sendGetHeadTitleRequstWithcompletionHandler:^(id responseObj, NSError *error) {
        if ([responseObj[@"message"] isEqualToString:@"成功"]) {
            int number = 0;
            for (NSDictionary *dic in responseObj[@"data"]) {
                if ([dic[@"id"] integerValue] != 1&&number < 7) {
                    [self.arrData addObject:[RequestHardlinesAll getHardlinesPathCid:[dic[@"id"] integerValue]]];
                    [self.titleArr addObject:dic[@"name"]];
                [self.viewControllersArr addObject:@"ZYHardlinesChildViewController"];
                }
                number += 1;
            }
            [self.view addSubview:[self MainScrollView]];
            ViewController *viewControll = [ViewController new];
            [self presentViewController:viewControll animated:NO completion:^{
                [viewControll dismissViewControllerAnimated:NO completion:nil];
            }];
        }else{
            NSLog(@"请求失败:%@",responseObj[@"message"]);
        }
    }];
}


#pragma mark - System Delegate



#pragma mark - Custom Delegate



#pragma mark - Public Method



#pragma mark - Private Method
-(void)layoutPageSubView
{
    //    [self.pageView makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(20);
    //        make.left.right.equalTo(self.view);
    //        make.bottom.equalTo(self.view);
    //    }];
    
}

#pragma mark - Event Response
-(void)leftButtonAction:(UIButton *)button //搜索
{
    ZYSearchViewController *search = [[ZYSearchViewController alloc] init];
    [self.navigationController pushViewController:search animated:YES];
}
-(void)rightButtonAction:(UIButton *)button //标题列表
{
    ZYTitleListViewController *titleList = [[ZYTitleListViewController alloc] init];
    [self.navigationController pushViewController:titleList animated:YES];
}

#pragma mark - setter__getter
-(NSMutableArray *)arrData
{
    if (!_arrData) {
        _arrData = [[NSMutableArray alloc] init];
    }
    return _arrData;
}
-(NSMutableArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = [[NSMutableArray alloc]init];
    }
    return _titleArr;
}
-(NSMutableArray *)viewControllersArr
{
    if(!_viewControllersArr){
        _viewControllersArr = [[NSMutableArray alloc] init];
    }
    return _viewControllersArr;
}


@end
