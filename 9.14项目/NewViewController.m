//
//  NewViewController.m
//  NOARc
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "NewViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"
#import "ImageNewsViewController.h"
#import "NewsDetailViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻";
    
    // 1.创建子视图
    [self _initViews];
    
    // 2.请求数据
    [self _loadData];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 1.创建子视图
- (void)_initViews
{
    // 创建表视图
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    // 设置背景颜色
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main.png"]];
    [self.view addSubview:_tableView];
}

// 2.请求数据
- (void)_loadData
{
    NSArray *newsList = [WXDataSerivce getJSONDataWithFileName:@"news_list"];
    // 把数据中的字典转化成数据模型对象
    NSMutableArray *newsModels = [[NSMutableArray alloc] init];
    for (NSDictionary *newsDic in newsList) {
        // 创建数据原型对象
        NewsModel *model = [[NewsModel alloc] initWithContentDic:newsDic];
        // 把模型对象添加到数组中
        [newsModels addObject:model];
        // 释放对象
        [model release];
    }
    
    self.dataList = newsModels;
    // 刷新表视图
    [_tableView reloadData];
    // 释放数组
    [newsModels release];
    
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // 1.创建大的单元格
        static NSString *identifier = @"newsHeaderCellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            // 创建单元格的子视图
            // 1.创建图片
            UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
            // 设置tag
            titleImageView.tag = 100;
            [cell.contentView addSubview:titleImageView];
            
            // 2.创建标题文本
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150 - 20, kScreenWidth, 20)];
            titleLabel.textColor = [UIColor whiteColor];
            titleLabel.font = [UIFont systemFontOfSize:18];
            // 设置tag
            titleLabel.tag = 101;
            [cell.contentView addSubview:titleLabel];
        }
        // 获取当前单元格对应的数据
        NewsModel *model = self.dataList[indexPath.row];
        // 1.设置图片
        UIImageView *titleImageView = (UIImageView *)[cell.contentView viewWithTag:100];
        [titleImageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl]];
        
        // 2.设置标题
        UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:101];
        titleLabel.text = model.title;
        
        return cell;
    } else {
        // 1.列表单元格
        static NSString *identifier = @"newsCellId";
        NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        // 获取当前单元格对应的数据
        NewsModel *model = self.dataList[indexPath.row];
        cell.model = model;
        
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 150;
    } else {
        return 80;
    }
}

// 单元格点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取该单元格显示的数据
    NewsModel *model = self.dataList[indexPath.row];
    // 获取获取单元格的类型
    if ([model.type intValue] == 0) {
        // 当前点击的是普通新闻单元格
        // 1.创建普通新闻控制器
        NewsDetailViewController *newsDetailVC = [[NewsDetailViewController alloc] init];
        // push的时候隐藏标签栏
        newsDetailVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:newsDetailVC animated:YES];
        // 释放
        [newsDetailVC release];
        
        // 当前点击的是普通新闻单元格
    } else if ([model.type intValue] == 1) {
        // 当前点击的是图片新闻
        // 1.创建图片新闻控制器
        ImageNewsViewController *imageNewsVC = [[ImageNewsViewController alloc] init];
        imageNewsVC.title = model.title;
        // 设置隐藏标签控制器
        imageNewsVC.hidesBottomBarWhenPushed = YES;
        // 2.导航
        [self.navigationController pushViewController:imageNewsVC animated:YES];
    } else {
        // 当前点击的是视频新闻
    }
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
