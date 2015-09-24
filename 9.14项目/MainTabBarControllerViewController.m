//
//  MainTabBarControllerViewController.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//


#import "MyTabBarController.h"
#import "HomeViewController.h"
#import "MovieViewController.h"
#import "TopViewController.h"
#import "MainTabBarControllerViewController.h"
#import "MoreViewController.h"
#import "BaseNavigationViewController.h"
#import "NewViewController.h"
@interface MainTabBarControllerViewController ()

@end

@implementation MainTabBarControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _initSubViewControllers];
    [self _customTabBar];
    
}
-(void)_customTabBar{
    for (UIView *subView in self.tabBar.subviews) {
        //        移除原有tabbar
        [subView removeFromSuperview];
    }
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all.png"]];
    //    创建背景选中的图片
    _selectedImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 42, 42)];
    //选中时的图片
    _selectedImageView.image = [UIImage imageNamed:@"selectTabbar_bg_all1.png"];
    [self.tabBar addSubview:_selectedImageView];
    // 创建标签栏按钮
    //    获取所有按钮的图片
    NSArray *imageNames = @[@"list_home.png",@"msg_new.png",@"start_top250.png",@"icon_cinema.png",@"more_select_setting.png"];
    NSArray *titles = @[@"首页",@"新闻",@"TOP",@"影院",@"更多"];
    // 创建按钮
    //控件宽度=屏宽/数组中的个数
    float button_width = kScreenWidth / imageNames.count;
    for (int i = 0; i < imageNames.count; i++) {
        // 创建按钮.自定义
        MyTabBarController *item = [[MyTabBarController alloc] initWithFrame:CGRectMake(i * button_width, 0, button_width, 49)];
        // 设置tag
        item.tag = i;
        // 设置标题
        item.titleName = titles[i];
        // 设置图片
        item.imageName = imageNames[i];
        // 添加事件
        [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:item];
        // 如果当前创建的是第一个按钮
        if (i == 0) {
            _selectedImageView.center = item.center;
        }
        
        // 释放
        [item release];
    }
}
//创建子视图控制器
-(void)_initSubViewControllers{
    //    创建首页
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    //    创建新闻
    NewViewController *newVC = [[NewViewController alloc]init];
    //    创建Top
    TopViewController *topVC = [[TopViewController alloc]init];
    //    创建影院
    MovieViewController *cinemaVC = [[MovieViewController alloc]init];
    //    创建更多
    MoreViewController *moreVC = [[MoreViewController alloc]init];
    //    把所有视图控制器存放到数组当中
    NSArray *viewControllers = @[homeVC,newVC,topVC,cinemaVC,moreVC];
    //    根据视图控制器创建导航控制器（数组）
    NSMutableArray *baseNavs = [[NSMutableArray alloc]init];
    //遍历所有c放在viewControl
    for (UIViewController *viewController in viewControllers)
    {
        //    创建导航控制器
        BaseNavigationViewController *baseNav = [[BaseNavigationViewController alloc]initWithRootViewController:viewController];
        //    把导航添加到数组中
        [baseNavs addObject:baseNav];
//            释放
        [baseNav release];
    }
    //    把导航控制器给标签控制器显示
    self.viewControllers = baseNavs;
    //    释放
    [homeVC release];
    [newVC release];
    [topVC release];
    [cinemaVC release];
    [moreVC release];
    [baseNavs release];
    
    
    
}
#pragma mark - 按钮点击事件
-(void)itemAction:(UIButton *)item{
    //    设置选中的子视图视图控制器
    self.selectedIndex = item.tag;
    //    改变选中背景的位置
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.22];
    _selectedImageView.center = item.center;
    [UIView commitAnimations];
    
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
