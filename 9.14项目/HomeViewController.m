//
//  HomeViewController.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "HomeViewController.h"
#import "WXRatingView.h"
#import "MovieModel.h"
#import "SmallCollectionView.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1   设置标题
    self.title =@"首页";
    // 2   创建右侧导航按钮
    [self _initRightBarButtonItem];
    
    // 3.创建子视图
    [self _initViews];
    // 4   加载数据
    [self _loadData];
    
   
}

//加载数据
-(void)_loadData
{
    // 1   获取电影列表数据
    NSDictionary *result = [WXDataSerivce getJSONDataWithFileName:@"us_box"];
    NSArray *subjects = result[@"subjects"];
    //  2  把数据个表视图
    _listTableView.dataList = subjects;
    //    刷新列表视图
    [_listTableView reloadData];
    // 03 把数据给海报视图去显示
    // 使用数据模型对象开始整理数据
    // 创建一个可变数组存放所有的数据模型
    NSMutableArray *models = [[NSMutableArray alloc] init];
    // 遍历原有数据
    for (NSDictionary *subDic in subjects) {
        // 通过电影信息字典创建数据模型对象
        MovieModel *movieModel = [[MovieModel alloc] initWithContentOfDic:subDic];
        // 把模型对象存放到数组中
        [models addObject:movieModel];
        
        // 释放
        [movieModel release];
    }
    
    // 把整理好的数据给海报视图对象
    _posterView.dataList = models;
    
    // 释放了
    [models release];
}
//创建子视图
-(void)_initViews
{
    //    创建列表视图
    _listTableView = [[ListTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49)style:UITableViewStylePlain];
    [self.view addSubview:_listTableView];
    //    创建海报视图
    _posterView = [[PosterView alloc]initWithFrame:_listTableView.bounds];
    _posterView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_posterView];
    
    
    
//    WXRatingView *ratingView = [[WXRatingView alloc] initWithFrame:CGRectMake(100, 60, 300, 40)];
//    ratingView.backgroundColor = [UIColor grayColor];
//    ratingView.scoreNum = 3;
//    [self.view addSubview:ratingView];
}
//创建右侧导航按钮
-(void)_initRightBarButtonItem{
    UIView *rightButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 49, 25)];
    //    创建海报按钮
    UIButton *posterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    posterButton.frame = rightButtonView.bounds;
    //    创建标题图片
    [posterButton setImage:[UIImage imageNamed:@"poster_home.png"] forState:UIControlStateNormal];
    //    创建背景图片
    [posterButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home.png"] forState:UIControlStateNormal];
    //    添加事件
    [posterButton addTarget:self action:@selector(postButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //    按钮添加到右侧按钮视图上
    [rightButtonView addSubview:posterButton];
    //    创建列表按钮
    UIButton *listButton = [UIButton buttonWithType:UIButtonTypeCustom];
    listButton.frame = rightButtonView.bounds;
    //    设置标题图片
    [listButton setImage:[UIImage imageNamed:@"list_home.png"] forState:UIControlStateNormal];
    //    设置背景图片
    [listButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home.png"] forState:UIControlStateNormal];
    //    添加事件
    [listButton addTarget:self action:@selector(listButtonAction:) forControlEvents:UIControlEventTouchUpInside
     ];
    [rightButtonView addSubview:listButton];
    //    创建导航按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButtonView];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 导航按钮的点击事件
//点过去
-(void)postButtonAction:(UIButton *)button{
    //   切换按钮的动画
    [self exChangedSubviewAnimationWithSuperView:button.superview isFromLeft:NO];
    //    切换海报视图
    
    [self exChangedSubviewAnimationWithSuperView:self.view isFromLeft:NO];
}
//转回来
-(void)listButtonAction:(UIButton *)button
{
    // 切换按钮动画
    [self exChangedSubviewAnimationWithSuperView:button.superview isFromLeft:YES];
    //    海报视图切换
    [self exChangedSubviewAnimationWithSuperView:self.view isFromLeft:YES];
    
}
//设置视图切换动画
-(void)exChangedSubviewAnimationWithSuperView:(UIView *)superview isFromLeft:(BOOL)fromLeft{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.35];
    //    切换当前视图的子视图
    [UIView setAnimationTransition:fromLeft ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight forView:superview cache:YES];
    // 切换当前视图的子视图索引位置
    [superview exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    [UIView commitAnimations];
    
    
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
