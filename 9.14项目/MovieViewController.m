//
//  MovieViewController.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "MovieViewController.h"
#import "CinemaModel.h"
#import "CinemaCell.h"
#import "CinemaDetailViewController.h"
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
@interface MovieViewController ()<DOPDropDownMenuDataSource,DOPDropDownMenuDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"影院";
    self.columen1=@[@"影院",@"今日新单",@"电影",@"类型"];
    self.columen2=@[@"全城",@"芙蓉区",@"雨花区",@"天心区",@"开福区",@"岳麓区"];
    self.columen3=@[@"默认排序",@"离我最近",@"好评优先",@"人气优先",@"最新发布"];
    self.cates = @[@"嘉华国际影城",@"首都电影院西单店",@"保利国际影城",@"搜秀影城",@"北京悠扬国际影城",@"橙天嘉禾影城吉彩店"];
    self.movices = @[@"内地剧",@"港台剧",@"英美剧"];
    self.hostels = @[@"动作片",@"悬疑片",@"古装片",@"爱情片",@"喜剧片"];
    
//    [self initMaskView];
    // 添加下拉菜单
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:44];
    
    menu.delegate = self;
    menu.dataSource = self;
    [self.view addSubview:menu];
    [self _initViews];
    [self _loadData];
}
-(void)_initViews
{
    // 创建表视图
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, kScreenHeight - 120) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    // 设置背景颜色
//    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main.png"]];
    [self.view addSubview:_tableView];
    
    CGRect rect1=CGRectMake(0, 0, 370, 150);
        self.webview=[[UIWebView alloc]initWithFrame:rect1];
//    加载网页
//        [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.iqiyi.com/v_19rrhbbctw.html"]]];
//        [self.view addSubview:self.webview];
        UIButton *btnplayer=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 50)];
        [btnplayer setTitle:@"观看MP4文件" forState:UIControlStateNormal];
        [btnplayer addTarget:self action:@selector(player1) forControlEvents:UIControlEventTouchUpInside];
        btnplayer.backgroundColor=[UIColor orangeColor];
//        btnplayer.background=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"movie_cinema@2x"]];
        [self.view addSubview:btnplayer];
}
-(void)player1
{
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:
                        [NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4"]];
    //    self.moviePlayer.movieControlMode = MPMovieControlStyleDefault;
    self.moviePlayer.controlStyle=MPMovieControlStyleNone;
    [self.moviePlayer.view setFrame:CGRectMake(0, 0, 375, 150)];
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer play];
    
}
-(void)_loadData
{
    //model读取
//    NSArray *cinemaList = [WXDataSerivce getJSONDataWithFileName:@"cinema_list"];
//    // 把数据中的字典转化成数据模型对象
//    NSMutableArray *newsModels = [[NSMutableArray alloc] init];
//    for (NSDictionary *newsDic in cinemaList) {
//        // 创建数据原型对象
//        CinemaModel *model=[[CinemaModel alloc]initWithContentDic:newsDic];
//        [newsModels addObject:model];
//        [model release];
//    }
//    
//    self.dataList = newsModels;
//    // 刷新表视图
//    [_tableView reloadData];
//    // 释放数组
//    [newsModels release];
    
    
    //    获取电影列表数据
    NSDictionary *result = [WXDataSerivce getJSONDataWithFileName:@"cinema_detail"];
    NSArray *subjects = result[@"movieList" ];
    self.dataList=subjects;
    
    
//    _tablecell.dataList = subjects;//
//    //    刷新列表视图
//    [_tablecell reloadData];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.列表单元格
    static NSString *identifier = @"cinemaCellId";
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CinemaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //优惠劵
    UIImageView *imageV2;
    
    imageV2=[[UIImageView alloc] initWithFrame:CGRectMake(130, 90, 20, 20)];
    // 设置裁剪
    imageV2.layer.masksToBounds = YES;
    //  设置描边
    imageV2.layer.borderColor = [UIColor colorWithRed:0 green:200/255.0 blue:0 alpha:0.7].CGColor;
    imageV2.layer.borderWidth = 2;
    
    UILabel *lblquan=[[UILabel alloc] initWithFrame:CGRectMake(2, 2, 10, 10)];
    lblquan.textColor=[UIColor colorWithRed:0 green:200/255.0 blue:0 alpha:0.9];
    lblquan.text=@"券";
    lblquan.font=[UIFont systemFontOfSize:12];
    [imageV2 addSubview:lblquan];
    [cell addSubview:imageV2];
    //团购
    UIImageView *imageV4;
    
        imageV4=[[UIImageView alloc] initWithFrame:CGRectMake(150, 90, 20, 20)];
        imageV4.layer.masksToBounds = YES;
        imageV4.layer.borderColor = [UIColor colorWithRed:0 green:200/255.0 blue:0 alpha:0.7].CGColor;
        imageV4.layer.borderWidth = 2;
        
        UILabel *lbltuan=[[UILabel alloc] initWithFrame:CGRectMake(2, 2, 10, 10)];
        lbltuan.textColor=[UIColor redColor];
        lbltuan.text=@"团";
        lbltuan.font=[UIFont systemFontOfSize:12];
        [imageV4 addSubview:lbltuan];
        [cell addSubview:imageV4];
    NSDictionary *result=[WXDataSerivce getJSONDataWithFileName:@"cinema_list"];
    self.cinemaDic= result[@"cinemaList"][self.n];
    //票价
    UILabel *lblTel=[[UILabel alloc] initWithFrame:CGRectMake(250, 90, 100, 20)];
    lblTel.text=self.cinemaDic[@"tel"];
    lblTel.textColor=[UIColor colorWithRed:0 green:230/255.0 blue:0 alpha:0.9];
    lblTel.font=[UIFont systemFontOfSize:14];
    [cell addSubview:lblTel];
    UILabel *lblLowPrice=[[UILabel alloc] initWithFrame:CGRectMake(250, 70, 100, 30)];
    NSString *lowprice;
    if ([self.cinemaDic[@"lowPrice"] isEqual:[NSNull null]]) {
        lowprice=@"最低价: ￥ 0.00";
    }
    else
    {
        lowprice=[NSString stringWithFormat:@"最低价: ￥ %@",self.cinemaDic[@"lowPrice"]];
    }
    lblLowPrice.text=lowprice;
    lblLowPrice.font=[UIFont systemFontOfSize:11];
    lblLowPrice.textColor=[UIColor redColor];
    [cell addSubview:lblLowPrice];

    // 获取当前单元格对应的数据
    
    cell.dic = self.dataList[indexPath.row];
    return cell;
    
    
//    else
//    {
//        imageV2=[[UIImageView alloc] initWithFrame:CGRectMake(imageV1.right, 60, 0, 14)];
//        [cell addSubview:imageV2];
//        
//    }

}
//单元格点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CinemaDetailViewController *detailvc=[[CinemaDetailViewController alloc]init];
//    detailvc.title=self.dic[@"name"];
    [self.navigationController pushViewController:detailvc animated:YES];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row == 0) {
//        return 150;
//    } else {
//        return 120;
//    }
    return 120;
}
-(void)initMaskView
{
//    _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 64+40, screen_width, screen_height-64-40-49)];
//    //    _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 64+40, screen_width, 0)];
//    _maskView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:_maskView];
//    _maskView.hidden = YES;
//    
//    //添加手势
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hand)];
//    tap.delegate = self;
//    [_maskView addGestureRecognizer:tap];
    
    //
    

}


- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.columen1.count;
    }else if (column == 1){
        return self.columen2.count;
    }else {
        return self.columen3.count;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.columen1[indexPath.row];
    } else if (indexPath.column == 1){
        return self.columen2[indexPath.row];
    } else {
        return self.columen3[indexPath.row];
    }
}
- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (self.columen1[indexPath.row]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"欢迎" message:@"是否进入影院查看详情" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
        [alert show];
    }else {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"欢迎" message:@"是否进入影院查看详情" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
        [alert show];
    }
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column
{
    if (column == 0) {
        if (row == 0) {
            return self.cates.count;
        } else if (row == 2){
            return self.movices.count;
        } else if (row == 3){
            return self.hostels.count;
        }
    }
    return 0;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        if (indexPath.row == 0) {
            return self.cates[indexPath.item];
        } else if (indexPath.row == 2){
            return self.movices[indexPath.item];
        } else if (indexPath.row == 3){
            return self.hostels[indexPath.item];
        }
    }
    return nil;
}

@end
