//
//  ZYTitleListViewController.h
//  InterestingNews
//
//  Created by Mac on 16/11/30.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYTitleListViewController : UIViewController
- (IBAction)editAndCommit:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *lableMyPD;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;


@property (nonatomic,strong)NSMutableArray *titleArry;
@end
