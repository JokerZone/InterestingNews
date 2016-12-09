//
//  ZYVideosViewController.m
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYVideosViewController.h"
#import "ViewController.h"
#import "ZYVideosChildViewController.h"
#import "RequestBase.h"
#import "RequestVieosAll.h"

@interface ZYVideosViewController ()
@property(nonatomic,strong)NSMutableArray *arrData;
@property(nonatomic,strong)NSMutableArray *titleArr;
@property(nonatomic,strong)NSMutableArray *viewControllersArr;
@property(nonatomic,strong)HYPageView *pageView;

@end

@implementation ZYVideosViewController
#pragma mark - Init Or Dealloc


#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
   [self RequestHttpPath];
}

#pragma mark - Init Views
- (HYPageView *)MainScrollView {
    float wirth = [UIScreen mainScreen].bounds.size.width;
    float height = [UIScreen mainScreen].bounds.size.height;
    _pageView = [[HYPageView alloc] initWithFrame:CGRectMake(0, 0, wirth, height) withTitles:self.titleArr withViewControllers:self.viewControllersArr withParameters:self.arrData];
    _pageView.isAnimated = YES;
    
    _pageView.selectedColor = [UIColor colorWithRed:18/255 green:196/255. blue:80/255. alpha:1];
    _pageView.unselectedColor = [UIColor blackColor];
    _pageView.font = [UIFont systemFontOfSize:16];
   // [self layoutPageSubView];
    return _pageView;
}

#pragma mark - Network Request
-(void)RequestHttpPath
{
    NSString *path = @"content/getDefaultChannelList";
    NSString *path2 = @"from=video&sign=673f12e52c58f71fa8c42c4515664d6b&time=1479807933.978446&token=1538ScqpZFIa9oX45GLhegXONR5z4g0Y5715Dqk5_qwmWZ2G_kaB4hC-Sr2Cmxeqnm2R4MBcFXqvuqo&version=10204";
    [RequestBase getReuqestWithPath:path Path:path2 parameters:nil completionHandler:^(id responseObj, NSError *error) {
        if ([responseObj[@"message"] isEqualToString:@"成功"]) {
            int i = 0;
            for (NSDictionary *dic in responseObj[@"data"]) {
                if (i<5) {
                    [self.arrData addObject:[RequestVieosAll getVieosPathCid:[dic[@"id"] integerValue]]];
                    [self.titleArr addObject:dic[@"name"]];
                    [self.viewControllersArr addObject:@"ZYVideosChildViewController"];
                 }
                i++;
            }
            [self.view addSubview:[self MainScrollView]];
            ViewController *viewController = [ViewController new];
            [self presentViewController:viewController animated:NO completion:^{
                [viewController dismissViewControllerAnimated:NO completion:nil];
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
