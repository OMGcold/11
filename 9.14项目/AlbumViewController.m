//
//  AlbumViewController.m
//  NOARc
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved..
//

#import "AlbumViewController.h"
#import "AlbumCell.h"
@interface AlbumViewController ()

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
//    NSLog(@"index:%d",_selectedIndex);
//    NSLog(@"%@",_dataList);
    
    // 1.使用自定义导航按钮
    self.isBack = YES;
    
    // 2.创建子视图
    [self _initViews];
    
    // 3.设置标题
    self.title = @"图片展示";
    
    // 4.创建点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}
// 2.创建子视图
- (void)_initViews
{
    
    // 1.创建视图的布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置滑动方向   相册中每张图的设置-----------------
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(kScreenWidth + 20, kScreenHeight);
    //间距    kScreenWidth + 20, kScreenHeight
    flowLayout.minimumLineSpacing = 10;
    // 2.创建瀑布流视图
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(-10, 0, kScreenWidth + 120, kScreenHeight) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    // 设置翻页效果
    _collectionView.pagingEnabled = YES;
    // 设置单元格的复用类
    [_collectionView registerClass:[AlbumCell class] forCellWithReuseIdentifier:@"Album"];
    [self.view addSubview:_collectionView];
    
    // 设置当前瀑布流的位置
    _collectionView.contentOffset = CGPointMake(self.selectedIndex * (kScreenWidth + 20), 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Album" forIndexPath:indexPath];
    // 把图片的名字给单元格
//    cell.imageName = self.dataList[indexPath.row];
    cell.imageName = self.dataList[indexPath.row];
    // 手动的调用cell 的 layoutSubViews方法
    [cell setNeedsLayout];
    return cell;
    
}

#pragma mark - 重写父类的返回方法
- (void)backAction:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 单机手势
- (void)tapAction:(UITapGestureRecognizer *)tap
{
    //重点:配置info.plist的字段
    
    // 隐藏或现实状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:!self.navigationController.navigationBarHidden withAnimation:UIStatusBarAnimationSlide];
    // 隐藏或显示导航栏
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:YES];
    
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
