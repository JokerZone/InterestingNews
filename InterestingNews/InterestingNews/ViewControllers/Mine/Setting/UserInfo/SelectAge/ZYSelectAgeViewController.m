//
//  ZYSelectAgeViewController.m
//  InterestingNews
//
//  Created by m n on 16/11/29.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYSelectAgeViewController.h"


#import "ZYUserInfoViewController.h"
#import "ZYPresentationController.h"

@interface ZYSelectAgeViewController ()
//<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) NSString *constellation;
@property (nonatomic, assign) NSInteger age;

@end

@implementation ZYSelectAgeViewController
#pragma mark -  lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
    [self changeDatePickerStatus];
    
    self.view.frame = CGRectMake(0, 0, 300, 320);
    
    
    //self.transitioningDelegate = self;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

#pragma mark - initView
- (void)changeDatePickerStatus{
    if (self.date != nil) {
        self.userDatePicker.date = self.date;
        NSDateFormatter *formmatter = [[NSDateFormatter alloc] init];
        [formmatter setDateFormat:@"yyyy年MM月dd日"];
        self.showDateLable.text = [formmatter stringFromDate:self.date];
        self.showWeekDay.text = [self showWeekDayWithDate:self.date];
    }else{
        NSDateFormatter *formmatter = [[NSDateFormatter alloc] init];
        [formmatter setDateFormat:@"yyyy年MM月dd日"];
        self.showDateLable.text = [formmatter stringFromDate:self.userDatePicker.date];
        self.showWeekDay.text = [self showWeekDayWithDate:self.userDatePicker.date];
    }
    self.userDatePicker.maximumDate = [NSDate date];
    self.userDatePicker.datePickerMode = UIDatePickerModeDate;
    self.userDatePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    [self.userDatePicker addTarget:self action:@selector(selectDate:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark -  private method

- (void)selectDate:(UIDatePicker *)pick {
    NSDate *date = pick.date;
    
    [self changeUserInfoShowsWithDate:date];

}

- (void)changeUserInfoShowsWithDate:(NSDate *)date{
    
    self.showWeekDay.text = [self showWeekDayWithDate:date];
    
    self.age = [self ageWithDateOfBirth:date];
    
    self.constellation = [self getAstroWithWithDate:date];
    
    self.dateBlock(date,self.age,self.constellation);
}

- (NSString *)showWeekDayWithDate:(NSDate *)date{
    
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:date];
    
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    
    return weekStr;
}

- (NSInteger)ageWithDateOfBirth:(NSDate *)date;
{
    // 出生日期转换 年月日
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    NSInteger brithDateYear  = [components1 year];
    NSInteger brithDateDay   = [components1 day];
    NSInteger brithDateMonth = [components1 month];
    
    // 获取系统当前 年月日
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];
    
    // 计算年龄
    NSInteger iAge = currentDateYear - brithDateYear - 1;
    if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
        iAge++;
    }
    
    return iAge;
}

- (NSString *)getAstroWithWithDate:(NSDate *)date
{
 
    NSDateFormatter *formmatter = [[NSDateFormatter alloc] init];
    //DD表示这一月有多少天
    [formmatter setDateFormat:@"yyyy年MM月dd日"];
    self.showDateLable.text = [formmatter stringFromDate:date];
    
    NSInteger month = 0;
    NSString *clipMonth = [self.showDateLable.text substringWithRange:NSMakeRange(5,2)];
    if ([[clipMonth substringToIndex:0] isEqualToString:@"0"]) {
        month = [[clipMonth substringFromIndex:1] integerValue];
    }else{
        month = [clipMonth integerValue];
    }
    NSInteger day = 0;
    NSString *clipDay = [self.showDateLable.text substringWithRange:NSMakeRange(8,2)];
    if ([[clipDay substringToIndex:0] isEqualToString:@"0"]) {
        day = [[clipDay substringFromIndex:1] integerValue];
    }else{
        day = [clipDay integerValue];
    }
    
    NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *astroFormat = @"102223444433";
    NSString *result;
    if (month < 1 || month > 12 || day < 1 || day > 31)
    {
        return @"错误日期格式!";
    }
    if(month == 2 && day > 29)
    {
        return @"错误日期格式!!";
    }
    else if (month == 4 || month == 6 || month == 9 || month == 11)
    {
        if (day > 30)
        {
            return @"错误日期格式!!!";
        }
    }
    result=[NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(month * 2-(day < [[astroFormat substringWithRange:NSMakeRange((month - 1), 1)] intValue] - (-19)) * 2,2)]];
    return result;
}

- (void)changeSaveStatus{
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UINavigationController *mainNavController = (UINavigationController *)window.rootViewController;
    UITabBarController *tabBarController = (UITabBarController *)mainNavController.viewControllers[0];
    UINavigationController *mineNavController = (UINavigationController *)tabBarController.viewControllers[2];
    
    NSInteger counts = mineNavController.viewControllers.count;
    ZYUserInfoViewController *userInfoVC = (ZYUserInfoViewController *)mineNavController.viewControllers[counts - 1];
    userInfoVC.saveDataButton.hidden = NO;
    userInfoVC.bottomSaveDataButton.enabled = YES;
    userInfoVC.bottomSaveDataButton.backgroundColor = [UIColor greenColor];
}

#pragma mark - systemDelegate
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[ZYPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

#pragma mark - event response

- (IBAction)clickComplete:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self changeUserInfoShowsWithDate:self.userDatePicker.date];
    
    if (self.userDatePicker.date == self.date) {
        return;
    }else{
        [self changeSaveStatus];
    }
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
