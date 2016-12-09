//
//  ZYSelectAgeViewController.h
//  InterestingNews
//
//  Created by m n on 16/11/29.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYSelectAgeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *showDateLable;

@property (weak, nonatomic) IBOutlet UILabel *showWeekDay;

@property (weak, nonatomic) IBOutlet UIDatePicker *userDatePicker;

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, copy) void (^dateBlock)(NSDate *,NSInteger,NSString *);


- (IBAction)clickComplete:(UIButton *)sender;

@end
