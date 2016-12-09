//
//  ZYHardlinesChildViewController.m
//  InterestingNews
//
//  Created by Mac on 16/11/27.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYHardlinesChildViewController.h"
#import "ZYHardlinesNextPageViewController.h"
#import "ZYHomePageContentTypeCell.h"
#import "ZYHomePageTableViewCell.h"
#import "ZYVidoesModel.h"
#import "ZYVidoesDataModel.h"
#import "RequestBase+Hardlines.h"

@interface ZYHardlinesChildViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *arrData;
@property(nonatomic,assign)NSInteger max_time;
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation ZYHardlinesChildViewController
@synthesize tabViewHardLines = tabViewHardLines;
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tabViewHardLines.dataSource = self;
    self.tabViewHardLines.delegate = self;
    [self HttpRequest];
    [self tableViewAddPullToRefresh];
}

  
#pragma mark - Init Views
-(void)tableViewAddPullToRefresh
{
    __weak ZYHardlinesChildViewController *weakSelf = self;
    [self.tabViewHardLines addPullToRefreshWithActionHandler:^{
            [weakSelf HttpRequest];
    }];
    
    [self.tabViewHardLines.pullToRefreshView setTitle:@"松开刷新" forState:SVPullToRefreshStateAll];
    [self.tabViewHardLines.pullToRefreshView setTextColor:[UIColor grayColor]];
    [self.tabViewHardLines addInfiniteScrollingWithActionHandler:^{
            [weakSelf HttpRequest];
    }];
}

#pragma mark - Network Request
-(void)HttpRequest
{
    if (_path) {
        [RequestBase sendHardlinesRequstWithPath:_path completionHandler:^(id responseObj, NSError *error) {
            ZYVidoesModel *model = responseObj;
            if (model) {
                _max_time = model.max_time;
                if (self.tabViewHardLines.pullToRefreshView.state == SVPullToRefreshStateLoading) {
                    [self.arrData removeAllObjects];
                }
                for (ZYVidoesDataModel *dataModel in model.data) {
                    if ([dataModel.tips isEqualToString:@"广告"]) {}
                    else
                    {
                        [self.arrData addObject:dataModel];
                    }
                }
                if (self.tabViewHardLines.pullToRefreshView.state == SVPullToRefreshStateLoading) {
                    [self pullToRefresh];
                }
                if (self.tabViewHardLines.infiniteScrollingView.state == SVInfiniteScrollingStateLoading) {
                    [self infiniteScrolling];
                }
                [self.tabViewHardLines reloadData];
            }else{
                [SVProgressHUD showErrorWithStatus:@"嗨呀！断网了。"];
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
        UITableViewCell *cell;
    if ([dataModel.cover_show_type isEqualToString:@"1"]) {//一张图片
        cell = [tableView dequeueReusableCellWithIdentifier:@"contentTypeCell"];
        if (!cell) {
            cell = [ZYHomePageContentTypeCell tableViewCell];
        }
        ZYHomePageContentTypeCell *contentTypeCell = (ZYHomePageContentTypeCell *)cell;
        contentTypeCell.lableNewsTitle.text = dataModel.title;
        [contentTypeCell.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:dataModel.cover[0]] placeholderImage:[UIImage imageNamed:@"default_cover_small@2x"]];
        contentTypeCell.lableReadCount.text = dataModel.read_count;
        if (_max_time == [dataModel.publish_time integerValue]) {
            contentTypeCell.lablePublishTime.text = @"刚刚";
        }else{
        NSInteger computeTime = (_max_time - [dataModel.publish_time integerValue])/1000;
            if (computeTime < 60) {
                contentTypeCell.lablePublishTime.text = [NSString stringWithFormat:@"%ld秒前",computeTime];
            }else if (computeTime < 3600){
                 contentTypeCell.lablePublishTime.text = [NSString stringWithFormat:@"%ld分钟前",computeTime/60];
            }else if(computeTime > 3600 && computeTime < 86400){
                contentTypeCell.lablePublishTime.text = [NSString stringWithFormat:@"%ld小时前",computeTime/3600];
            }else{
                NSInteger count = computeTime/3600/24;
                 contentTypeCell.lablePublishTime.text = [NSString stringWithFormat:@"%ld天前",count];
            }
        }
    }
    else if([dataModel.cover_show_type isEqualToString:@"3"])
    {//3张图片
       cell = [tableView dequeueReusableCellWithIdentifier:@"ImgTypeCell"];
        if (!cell) {
            cell = [ZYHomePageTableViewCell tableViewCell];
        }
        ZYHomePageTableViewCell *tableViewCell = (ZYHomePageTableViewCell *)cell;
        tableViewCell.lableNewsTitle.text = dataModel.title;
        [tableViewCell.imageViewOne sd_setImageWithURL:[NSURL URLWithString:dataModel.cover[0]] placeholderImage:[UIImage imageNamed:@"default_cover_small@2x"]];
        [tableViewCell.imageViewTwo sd_setImageWithURL:[NSURL URLWithString:dataModel.cover[1]] placeholderImage:[UIImage imageNamed:@"default_cover_small@2x"]];
        [tableViewCell.imageViewThree sd_setImageWithURL:[NSURL URLWithString:dataModel.cover[2]] placeholderImage:[UIImage imageNamed:@"default_cover_small@2x"]];
        tableViewCell.lableReadCount.text = dataModel.read_count;
        if (_max_time == [dataModel.publish_time integerValue]) {
            tableViewCell.lablePublishTime.text = @"刚刚";
        }else{
            NSInteger computeTime = (_max_time - [dataModel.publish_time integerValue])/1000;
            if (computeTime < 3600) {
                tableViewCell.lablePublishTime.text = [NSString stringWithFormat:@"%ld分钟前",computeTime/60];
            }else{
                tableViewCell.lablePublishTime.text = [NSString stringWithFormat:@"%ld小时前",computeTime/3600];
            }
        }
 
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYVidoesDataModel *dataModel = self.arrData[indexPath.row];
    ZYHardlinesNextPageViewController *nextPageViewController = [[ZYHardlinesNextPageViewController alloc] init];
    nextPageViewController.path = dataModel.url;
    [self presentViewController:nextPageViewController animated:YES completion:^{
        
    }];
}

#pragma mark - Custom Delegate



#pragma mark - Public Method


#pragma mark - Private Method
- (void)pullToRefresh {
    __weak ZYHardlinesChildViewController *weakSelf = self;
    [weakSelf.tabViewHardLines.pullToRefreshView stopAnimating];
    
    
}
- (void)infiniteScrolling
{
    __weak ZYHardlinesChildViewController *weakSelf = self;
    [weakSelf.tabViewHardLines.infiniteScrollingView stopAnimating];
}


#pragma mark - Event Response



#pragma mark - setter__getter
-(NSMutableArray *)arrData
{
    if (!_arrData) {
        _arrData = [NSMutableArray new];
    }
    return  _arrData;
}


@end
