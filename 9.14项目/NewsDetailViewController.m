//
//  NewsDetailViewController.m
//  NOARc
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "AlbumViewController.h"
@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置标题
    self.title = @"新闻详情";
    
    // 显示自定义返回按钮
    self.isBack = YES;
    
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建子视图
    [self _initViews];
    // 5.加载数据
    [self _loadData];

    // Do any additional setup after loading the view.
}
// 5.加载数据
- (void)_loadData
{
    // 1.获取新闻内容数据
    NSDictionary *newDic = [WXDataSerivce getJSONDataWithFileName:@"news_detail"];
    
    // 2.加载新闻模板数据
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    NSString *mHtmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    // 3.拼接完整的html数据
    // 01 获取标题文本
    NSString *title = newDic[@"title"];
    // 02 获取来源文本
    NSString *source = newDic[@"source"];
    // 03 获取时间文本
    NSString *time = newDic[@"time"];
    // 04 获取内容文本
    NSString *content = newDic[@"content"];
    // 05 获取作者文本
    NSString *author = newDic[@"author"];
    // 因为mHtmlString里面有5个占位符，所以后面5个字符串都写入到第一个字符串里面了
    NSString *htmlString = [NSString stringWithFormat:mHtmlString,title,source,time,content,author];
    
    // 4.把数据给webView视图显示
    /*
     baseURL:设置文件的根路径
     */
    NSURL *baseUrl = [[NSBundle mainBundle] resourceURL];
    [_webView loadHTMLString:htmlString baseURL:baseUrl];
}

// 创建子视图
- (void)_initViews
{
    // 创建web视图
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)];
    // 设置代理对象
    _webView.delegate = self;
    // 添加到视图上
    [self.view addSubview:_webView];
    
    // 1.第一种显示数据的方式
    //    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    //    // 开始请求
    //    [_webView loadRequest:urlRequest];
    
    // 2.第二种现实方式加载字符串数据
    // 获取文本文件地址
    /* NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
     NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
     [_webView loadHTMLString:htmlString baseURL:nil];
     
     
     */
}





#pragma mark - UIWebViewDelegate
// 可以监听到当前web页面将要跳转
//  BOOL类型的返回值可以控制器页面是否跳转
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    /* NSLog(@"url:%@",request.URL);
     // 1.获取url的字符串
     NSString *urlString = [request.URL absoluteString];
     
     // 2.判断地址（也就是判断我们点击的是那个按钮）
     if ([urlString isEqualToString:@"click:back"]) {
     [self.navigationController popViewControllerAnimated:YES];
     return NO;
     }
     */
    
    // 1.获取点击图片的地址
    NSString *urlString = [request.URL absoluteString];
    // 2.如果点击图片的地址是以click:开头的
    if ([urlString hasPrefix:@"click:"]) {
        
        /*
         click:http://img31.mtime.cn/CMS/News/2013/08/31/142737.60622977.jpg;
         http://img31.mtime.cn/CMS/News/2013/08/31/142737.60622977.jpg;
         http://img31.mtime.cn/CMS/News/2013/08/31/142834.54337748.jpg;
         http://img31.mtime.cn/CMS/News/2013/08/31/142735.22446758.jpg;
         http://img31.mtime.cn/CMS/News/2013/08/31/142738.86649567.jpg;
         http://img31.mtime.cn/CMS/News/2013/08/31/142856.73878839.jpg;
         http://img31.mtime.cn/CMS/News/2013/08/31/142739.89615182.jpg
         
         */
        // 说明当前点击的是图片
//        NSLog(@"urlString:%@",urlString);
        
        // 01 把字符串分割成数组
        NSArray *array = [urlString componentsSeparatedByString:@";"];
        NSLog(@"array:%@",array);
        
        // 02 获取当前点击图片的url
        NSString *imageUrl = array[0];
        NSString *selectedImageUrl = [imageUrl substringFromIndex:6];
        NSLog(@"selectedImageUrl:%@",selectedImageUrl);
        
        // 03 获取所有图片的Url地址的数组(使用数组截取)
        NSArray *imageUrls = [array subarrayWithRange:NSMakeRange(1, array.count - 1)];
        NSLog(@"imageUrls:%@",imageUrls);
        
        // 04 获取当前点击图片的位置
        int selectedIndex = [imageUrls indexOfObject:selectedImageUrl];
        NSLog(@"selectedIndex:%d",selectedIndex);
        // 05 通过相册控制器显示图片
        AlbumViewController *albumVC = [[AlbumViewController alloc] init];
        albumVC.selectedIndex = selectedIndex;
        albumVC.dataList = imageUrls;
        // 创建导航控制器
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:albumVC];
        navCtrl.navigationBar.barStyle = UIBarStyleBlack;
        [self presentViewController:navCtrl animated:YES completion:nil];
    }
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"加载完成");
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"加载失败");
}

- (void)dealloc
{
    // 释放webView
    [_webView release];
    _webView = nil;
    [super dealloc];
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
