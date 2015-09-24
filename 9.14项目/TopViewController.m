//
//  TopViewController.m
//  NOARc
//
//  Created by 15751159097 on 15/9/18.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "TopViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TOP250";
    // 1.创建子视图
    [self _initViews];
    
    // 2.请求数据刷新视图
    [self _loadData];

    // Do any additional setup after loading the view.
}
// 1.创建子视图
- (void)_initViews
{
    // 01 创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置单元格的大小和间距
    flowLayout.itemSize = CGSizeMake(kScreenWidth / 3.0, 180);
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.minimumLineSpacing = 0;
    // 创建瀑布流视图
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    // 设置单元格的复用类
    [_collectionView registerClass:[TopCell class] forCellWithReuseIdentifier:@"topCellId"];
    
    [self.view addSubview:_collectionView];
}

// 2.请求数据刷新视图
- (void)_loadData
{
    NSDictionary *result = [WXDataSerivce getJSONDataWithFileName:@"top250"];
    NSArray *subjects = result[@"subjects"];
    // 转换数据原型对象
    NSMutableArray *models = [NSMutableArray array];
    for (NSDictionary *subDic in subjects) {
        // 创建数据原型对象
        TopModel *model = [[TopModel alloc] initWithContentOfDic:subDic];
        // 把数据原型对象添加到数组里面
        [models addObject:model];
        [model release];
    }
    
    // 把数据保存到全局的数据中
    self.dataList = models;
    NSLog(@"ddd");
    // 刷新视图
    [_collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCellId" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    // 设置数据
    cell.model = self.dataList[indexPath.row];
    // 刷新
    [cell setNeedsLayout];
    return cell;
    
}
// 单元格的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"dds");
    // 需要跳转到电影详情页面
    MovieDetailViewController *movieDetailVC = [[MovieDetailViewController alloc] init];
    // 导航时要收起底部的标签栏
    movieDetailVC.hidesBottomBarWhenPushed = YES;
    // 获取当前单元格的内容
    TopModel *model = self.dataList[indexPath.row];
    // 设置标题
    movieDetailVC.title = model.title;
    [self.navigationController pushViewController:movieDetailVC animated:YES];
    
}

@end
