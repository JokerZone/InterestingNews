//
//  ZYPresentationController.m
//  InterestingNews
//
//  Created by m n on 16/11/29.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYPresentationController.h"

@implementation ZYPresentationController

{
    UIView *dimmingView;
}

-(id) initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    if(self){
        
        dimmingView = [[UIView alloc] init];
        dimmingView.backgroundColor = [UIColor grayColor];
        dimmingView.alpha = 0.0;
    }
    return self;
}

- (void)presentationTransitionWillBegin
{
    dimmingView.frame = self.containerView.bounds;
    [self.containerView addSubview:dimmingView];
    [self.containerView addSubview:self.presentedView];
    
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentingViewController.transitionCoordinator;
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        dimmingView.alpha = 0.5;
    } completion:nil];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    if(!completed){
        [dimmingView removeFromSuperview];
    }
}

- (void)dismissalTransitionWillBegin
{
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentingViewController.transitionCoordinator;
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        dimmingView.alpha = 0.0;
    } completion:nil];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    if(completed){
        [dimmingView removeFromSuperview];
    }
}

- (CGRect)frameOfPresentedViewInContainerView
{
    return CGRectMake(37.5f, 173.5f, 300.f, 320.f);
}

@end
