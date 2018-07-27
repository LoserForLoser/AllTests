//
//  FirstView.m
//  playtext
//
//  Created by 宋朝阳 on 2017/5/26.
//  Copyright © 2017年 song. All rights reserved.
//

#import "FirstView.h"

#import "CollectionViewCell.h"

@interface FirstView () <UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout>

@property (strong ,nonatomic) UICollectionView *collection;

@end

@implementation FirstView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置collectionView滚动方向
//    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];//垂直滚动
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];//水平滚动
    
    //设置headerView的尺寸大小
//    [layout setHeaderReferenceSize:CGSizeMake(SCREEN_WIDTH, viewWidthFrame(100))];
    
    //该方法也可以设置itemSize
    [layout setItemSize:CGSizeMake(viewWidthFrame(110), viewWidthFrame(150))];
    
    self.collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, viewHeightFrame(SCREEN_HEIGHT - 48)) collectionViewLayout:layout];
    
    [self.collection setBackgroundColor:[UIColor whiteColor]];
    
    [self.collection setDelegate:self];
    
    [self.collection setDataSource:self];
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    [self.collection registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];

    [self.view addSubview:self.collection];
}

#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

//每个section的item个数
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.cellLabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
    
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(90, 130);
}

//footer的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//header的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    headerView.backgroundColor =[UIColor grayColor];
    UILabel *label = [[UILabel alloc] initWithFrame:headerView.bounds];
    label.text = @"这是collectionView的头部";
    label.font = [UIFont systemFontOfSize:20];
    [headerView addSubview:label];
    return headerView;
}

//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *msg = cell.cellLabel.text;
    NSLog(@"%@",msg);
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
