//
//  ZYMineViewController.h
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLoginViewController.h"


@interface ZYMineViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *mineTableView;
@property (nonatomic ,strong) ZYAccessToken *token;



@end
