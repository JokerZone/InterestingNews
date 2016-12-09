//
//  ZYTransitionHelper.m
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYTransitionHelper.h"

#import "ZYLoginViewController.h"
#import "ZYHardlinesViewController.h"
#import "ZYVideosViewController.h"
#import "ZYMineViewController.h"

@interface ZYTransitionHelper ()<UITabBarDelegate>

//@property (nonatomic, strong) UITabBarItem *recentlySelectedItem;

@end

@implementation ZYTransitionHelper

#pragma mark -  lifeCycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    
}


+(void)initViews{
    UIWindow *window = (UIWindow *)[UIApplication sharedApplication].delegate.window;
    // tabbar
    
    //Hardlines
    ZYHardlinesViewController *hardlinesVC = [[ZYHardlinesViewController alloc]initWithNibName:@"ZYHardlinesViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *hardlinesNav = [[UINavigationController alloc] initWithRootViewController:hardlinesVC];
    
    // Videos
    ZYVideosViewController *videosVC = [[ZYVideosViewController alloc]initWithNibName:@"ZYVideosViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *videosNav = [[UINavigationController alloc] initWithRootViewController:videosVC];
 
    // Mine
    ZYMineViewController *mineVC = [[ZYMineViewController alloc]initWithNibName:@"ZYMineViewController" bundle:[NSBundle mainBundle]];
    
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    hardlinesVC.title = @"刷新";
    videosVC.title = @"视频";
    mineVC.title = @"我的";
    
    UITabBarController *tabbarController = [self new];
    tabbarController.viewControllers = @[hardlinesNav, videosNav, mineNav];
    
//    window.rootViewController =tabbarController;
    
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    window.rootViewController = mainNav;
    
    UITabBar *tabbar = tabbarController.tabBar;
    UITabBarItem *item1 = [tabbar.items objectAtIndex:0];
    UITabBarItem *item2 = [tabbar.items objectAtIndex:1];
    UITabBarItem *item3 = [tabbar.items objectAtIndex:2];
    
    item1.selectedImage = [[UIImage imageNamed:@"tab_home_select@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"tab_home_normal@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [[UIImage imageNamed:@"tab_video_select@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"tab_video_normal@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.selectedImage = [[UIImage imageNamed:@"tab_user_select@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"tab_user_normal@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:RGB(0, 196, 0) forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];
    
}

# pragma mark  UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
    UITabBarItem *item1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item3 = [tabBar.items objectAtIndex:2];
    if (item == item1) {  //头条
        item.title = @"刷新";
        
        return;
    }
    if (item == item2) {  //视频
        item1.title = @"头条";
        
        return;
    }
    if (item == item3) {  //我的
        item1.title = @"头条";
        if ([ZYAKHelper isValid]) {
            
            return;
            
        }else{
            
            [ZYAKHelper clearAk];
            ZYLoginViewController *loginVC = [[ZYLoginViewController alloc]initWithNibName:@"ZYLoginViewController" bundle:[NSBundle mainBundle]];
            
            UIWindow *window = [UIApplication sharedApplication].delegate.window;
            UINavigationController *mainNavController = (UINavigationController *)window.rootViewController;
            [mainNavController pushViewController:loginVC animated:YES];
            
        }
    }
}

@end
