//
//  ZYTitleListViewController.m
//  InterestingNews
//
//  Created by Mac on 16/11/30.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYTitleListViewController.h"
#import "ZYCollectionViewCell.h"


@interface ZYTitleListViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSMutableArray *arrData;
@property (nonatomic,strong)NSMutableArray *arrMove;
@property (nonatomic,assign)BOOL orFlag;
@property (nonatomic,strong)UIButton *lustButtoned;
@end

@implementation ZYTitleListViewController
#pragma mark - Init Or Dealloc

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self addPlistData];
    [self initButton];
}
//static dispatch_once_t predicate;
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"频道管理";
    
}

#pragma mark - Init Views
- (void)initButton
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home_content_back@2x"] style:UIBarButtonItemStyleDone target:self action:@selector(barButtonItemWithAction)];
    [barButtonItem setTintColor:[UIColor blackColor]];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    self.collectionViewFlowLayout.itemSize = CGSizeMake(70, 30);
    self.collectionViewFlowLayout.minimumInteritemSpacing = 10;
    self.collectionViewFlowLayout.minimumLineSpacing = 10;
    self.collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlelongGesture:)];
    [_collectionView addGestureRecognizer:longGesture];
}

#pragma mark - Network Request


#pragma mark - System Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return _arrData.count;
    }
    return _arrMove.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UINib *nib = [UINib nibWithNibName:@"ZYCollectionViewCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"collectCell"];
    
    ZYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectCell" forIndexPath:indexPath];
    if (indexPath.section==0) {
        [cell.button setTitle:self.arrData[indexPath.item] forState:UIControlStateNormal];
    }else{
        [cell.button setTitle:self.arrMove[indexPath.item] forState:UIControlStateNormal];
    }
    
        if (indexPath.item == 0&&indexPath.section==0) {
            [cell.button setTintColor:RGB(0, 196, 0)];
            [cell.button setBackgroundImage:[UIImage imageNamed:@"channel_item_select5@2x"] forState:UIControlStateNormal];
            _lustButtoned = cell.button;
        }else{
            [cell.button setBackgroundImage:[UIImage imageNamed:@"channel_item_normal5@2x"] forState:UIControlStateNormal];
            [cell.button setTintColor:[UIColor grayColor]];
        }
        [cell.button addTarget:self action:@selector(sortButtonsWithChilk:) forControlEvents:UIControlEventTouchUpInside];
         cell.button.indexpath = indexPath;
        if (_orFlag) {
            cell.imageViewDelect.image = [UIImage imageNamed:@"home_channel_del@2x"];
        }else{
            cell.imageViewDelect.image = nil;
        }
   
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return CGSizeZero;
    }
    return CGSizeMake(375, 30);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
 UICollectionReusableView *reusView;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        reusView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        reusView.backgroundColor = [UIColor grayColor];
    }
    return reusView;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYCollectionViewCell *cell = (ZYCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSIndexPath *indexPathed = [NSIndexPath indexPathForItem:self.arrData.count inSection:0];
    NSString *str = cell.button.titleLabel.text;
    [self.arrData addObject:str];
    [self.arrMove removeObjectAtIndex:indexPath.item];
    [collectionView moveItemAtIndexPath:indexPath toIndexPath:indexPathed];
    [cell.button setUserInteractionEnabled:YES];
    [self.collectionView reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath{
    id objc = [_arrData objectAtIndex:sourceIndexPath.item];
    [_arrData removeObject:objc];
    [_arrData insertObject:objc atIndex:destinationIndexPath.item];
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


#pragma mark - Custom Delegate


#pragma mark - Public Method
- (void)addPlistData
{
    NSString *string = [[NSBundle mainBundle] pathForResource:@"titleEdit" ofType:@"plist"];
    _arrData = [NSMutableArray arrayWithContentsOfFile:string];
}

#pragma mark - Private Method


#pragma mark - Event Response
- (void)barButtonItemWithAction
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}
- (IBAction)editAndCommit:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"编辑"]) {
        [sender setTitle:@"完成" forState:UIControlStateNormal];
        self.lableMyPD.text = @"可拖动下方按钮调整顺序";
        _orFlag = YES;
        [self.collectionView reloadData];
    }
    if ([sender.titleLabel.text isEqualToString:@"完成"]) {
        [sender setTitle:@"编辑" forState:UIControlStateNormal];
        self.lableMyPD.text = @"我的频道";
        _orFlag = NO;
        [self.collectionView reloadData];
    }
}

- (void)sortButtonsWithChilk:(UIButton *)button
{
    if (_orFlag == NO) {
        if ([button.tintColor isEqual:[UIColor grayColor]]) {
            [_lustButtoned setTintColor:[UIColor grayColor]];
            [_lustButtoned setBackgroundImage:[UIImage imageNamed:@"channel_item_normal5@2x"] forState:UIControlStateNormal];
            
            [button setTintColor:RGB(0, 196, 0)];
            [button setBackgroundImage:[UIImage imageNamed:@"channel_item_select5@2x"] forState:UIControlStateNormal];
            _lustButtoned = button;
        }
    }else{
        NSIndexPath *indexPaths  = [NSIndexPath indexPathForItem:0 inSection:1];
        NSString *str = button.titleLabel.text;
        ZYCollectionViewCell *cell = (ZYCollectionViewCell *)button.superview;
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:cell.frame.origin];
        [self.arrMove insertObject:str atIndex:0];
    [self.arrData removeObjectAtIndex:indexPath.item];
        [_collectionView moveItemAtIndexPath:button.indexpath toIndexPath:indexPaths];
        [button setUserInteractionEnabled:NO];
        [self.collectionView reloadData];
    }
}

- (void)handlelongGesture:(UILongPressGestureRecognizer *)longGesture {
    if (_orFlag) {
        //判断手势状态
        switch (longGesture.state) {
            case UIGestureRecognizerStateBegan:{
                //判断手势落点位置是否在路径上
                NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[longGesture locationInView:self.collectionView]];
                if (indexPath == nil) {
                    break;
                }
                //在路径上则开始移动该路径上的cell
                [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
            }
                break;
            case UIGestureRecognizerStateChanged:
                //移动过程当中随时更新cell位置
                [self.collectionView updateInteractiveMovementTargetPosition:[longGesture locationInView:self.collectionView]];
                break;
            case UIGestureRecognizerStateEnded:
                //移动结束后关闭cell移动
                [self.collectionView endInteractiveMovement];
                break;
            default:
                [self.collectionView cancelInteractiveMovement];
                break;
        }

    }
}



#pragma mark - setter__getter
-(NSMutableArray *)titleArry
{
    if (!_titleArry) {
        _titleArry = [NSMutableArray new];
    }
    return _titleArry;
}
-(NSMutableArray *)arrMove
{
    if (!_arrMove) {
        _arrMove = [NSMutableArray new];
    }
    return _arrMove;
}
@end
