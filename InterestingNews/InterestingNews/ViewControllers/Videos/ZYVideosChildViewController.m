//
//  ZYVideosChildViewController.m
//  InterestingNews
//
//  Created by Mac on 16/11/23.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYVideosChildViewController.h"
#import "ViewController.h"
#import "ZYTableViewCell.h"
#import "ZYVidoesModel.h"
#import "ZYVidoesDataModel.h"
#import "RequestBase+Vieos.h"
#import "ZYVidoesNextPageViewController.h"

@interface ZYVideosChildViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *arrData;
@end

@implementation ZYVideosChildViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableViewController.dataSource = self;
    self.tableViewController.delegate = self;
     [self HttpRequest];
     [self tableViewAddPullToRefresh];
}


#pragma mark - Init Views
-(void)tableViewAddPullToRefresh
{
    __weak ZYVideosChildViewController *weakSelf = self;
    [self.tableViewController addPullToRefreshWithActionHandler:^{
        [weakSelf HttpRequest];
    }];
    
    [self.tableViewController.pullToRefreshView setTitle:@"松开刷新" forState:SVPullToRefreshStateAll];
    [self.tableViewController.pullToRefreshView setTextColor:[UIColor grayColor]];
    [self.tableViewController addInfiniteScrollingWithActionHandler:^{
        [weakSelf HttpRequest];
    }];
}


#pragma mark - Network Request
-(void)HttpRequest
{
    if (_path) {
        [RequestBase sendVidoesRequstWithPath:_path completionHandler:^(id responseObj, NSError *error) {
            ZYVidoesModel *model = responseObj;
            if (model) {
                if (self.tableViewController.pullToRefreshView.state == SVPullToRefreshStateLoading) {
                    [self.arrData removeAllObjects];
                }
                for (ZYVidoesDataModel *dataModel in model.data) {
                    if ([dataModel.tips isEqualToString:@"广告"]) {}
                    else
                    {
                        [self.arrData addObject:dataModel];
                    }
                }
                if (self.tableViewController.pullToRefreshView.state == SVPullToRefreshStateLoading) {
                    [self pullToRefresh];
                }
                if (self.tableViewController.infiniteScrollingView.state == SVInfiniteScrollingStateLoading) {
                    [self infiniteScrolling];
                }

                [self.tableViewController reloadData];
            }else{
                [SVProgressHUD showErrorWithStatus:@"嗨呀！断网了"];
            }
        }];
    }
}

#pragma mark - System Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYVidoesDataModel *dataModel;
    if (_arrData.count != 0) {
        dataModel = self.arrData[indexPath.row];
    }
    ZYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shiPinCell"];
    if (!cell) {
        cell = [ZYTableViewCell tableViewCell];
    }
    if (_arrData.count != 0) {
        cell.lableTitle.text = dataModel.title;
        [cell.imageViewTitlePhoto sd_setImageWithURL:[NSURL URLWithString:dataModel.cover[0]] placeholderImage:[UIImage imageNamed:@"default_cover_small@2x"]];
        cell.lablePlayCount.text = [NSString stringWithFormat:@"%@次播放",dataModel.read_count];
        cell.imageViewlittlePlay.image = [UIImage imageNamed:@"video_play@2x"];
        cell.imageViewBigPlay.image = [UIImage imageNamed:@"video_identifier_icon@2x"];
        
         [cell.buttonCollect addTarget:self action:@selector(buttonCollectWithAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.buttonShare setBackgroundImage:[UIImage imageNamed:@"video_content_share@2x"] forState:UIControlStateNormal];
        [cell.buttonShare addTarget:self action:@selector(buttonShareWithAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYVidoesDataModel *dataModel = self.arrData[indexPath.row];
    ZYVidoesNextPageViewController *nextPageViewController = [[ZYVidoesNextPageViewController alloc] init];
     nextPageViewController.path = dataModel.url;
    [self presentViewController:nextPageViewController animated:YES completion:^{
    }];
}

#pragma mark - Custom Delegate



#pragma mark - Public Method


#pragma mark - Private Method
- (void)pullToRefresh {
    __weak ZYVideosChildViewController *weakSelf = self;
    [weakSelf.tableViewController.pullToRefreshView stopAnimating];
    
}
- (void)infiniteScrolling
{
    __weak ZYVideosChildViewController *weakSelf = self;
    [weakSelf.tableViewController.infiniteScrollingView stopAnimating];
}


#pragma mark - Event Response
-(void)buttonCollectWithAction:(UIButton *)button
{
    if ([button.titleLabel.text isEqualToString:@"未收藏"]) {
    [button setTitle:@"已收藏" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"video_content_collect@2x"] forState:UIControlStateNormal];
        [SVProgressHUD showImage:[UIImage imageNamed:@"home_content_like@2x"] status:@"收藏成功哟！"];
    }
    if ([button.titleLabel.text isEqualToString:@"已收藏"]) {
    [button setTitle:@"未收藏" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"video_content_uncollect@2x"] forState:UIControlStateNormal];
        [SVProgressHUD showImage:[UIImage imageNamed:@"home_content_complain@2x"] status:@"取消成功"];
    }
}

-(void)buttonShareWithAction:(UIButton *)button
{
    
}

#pragma mark - setter__getter
-(NSMutableArray *)arrData
{
    if (!_arrData) {
        _arrData = [NSMutableArray new];
    }
    return  _arrData;
}

@end
