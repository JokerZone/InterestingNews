//
//  ZYSearchViewController.m
//  InterestingNews
//
//  Created by Mac on 16/11/29.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYSearchViewController.h"
#import "ZYSearchTableViewCell.h"

@interface ZYSearchViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZYSearchViewController
#pragma mark - Init Or Dealloc

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tabBarController.tabBar.hidden = YES;
    [self initResultViewController];
    
}

#pragma mark - Init Views
- (void)initResultViewController
{
    self.definesPresentationContext = YES;
     _searchBar.delegate = self;
    _tableSearch.delegate = self;
    _tableSearch.dataSource = self;
    _searchBar.placeholder = @"大家都在搜";
    _searchBar.showsCancelButton = YES;
    _searchBar.showsSearchResultsButton = YES;
    [_searchBar becomeFirstResponder];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerWithAction)];
    [self.tableSearch addGestureRecognizer:tapGesture];
}

#pragma mark - Network Request


#pragma mark - System Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
    if (!cell) {
        cell = [ZYSearchTableViewCell tableViewCell];
    }
    return cell;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - Custom Delegate


#pragma mark - Public Method


#pragma mark - Private Method


#pragma mark - Event Response
- (void)tapGestureRecognizerWithAction
{
    [self.view endEditing:YES];
}

#pragma mark - setter__getter

@end
