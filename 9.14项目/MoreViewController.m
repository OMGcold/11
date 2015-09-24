//
//  MoreViewController.m
//  NOARc
//
//  Created by 齐鸣宇 on 15/9/8.
//  Copyright (c) 2015年 SXJY. All rights reserved.
//

#import "MoreViewController.h"
#import "WXRatingView.h"
#import "SDImageCache.h"
//#import "RETableViewManager.h"


#define SectionHeaderHeight 42
#define SectionFooterHeight 0.5
@interface MoreViewController ()
@end

@implementation MoreViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    self.view.backgroundColor = [UIColor redColor];
//    WXRatingView *ratingView = [[WXRatingView alloc] initWithFrame:CGRectMake(10, 100, 300, 40)];
//    ratingView.backgroundColor = [UIColor greenColor];
//    ratingView.scoreNum = 3;
//    [self.view addSubview:ratingView];
    // Do any additional setup after loading the view.
    
    
    self.titles = @[@"清除缓存",@"haha",@"个人设置",@"版本",@"欢迎页",@"关于"];
    self.imageNames = @[@"moreClear.png",
                        @"moreScore.png",
                        @"moreBusiness.png",
                        @"moreVersion.png",
                        @"moreWelcome.png",
                        @"moreAbout.png"];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main.png"]];
    [self.view addSubview:_tableView];
    
    
    // 创建RETableViewManager管理类
//    self.manager = [[RETableViewManager alloc]init];
//    self.manager.style.cellHeight = 36;
//    // 添加意见反馈
//    [self Suggest];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"moreCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer] autorelease];
        // 清空单元格的背景颜色
        cell.backgroundColor = [UIColor clearColor];
        cell.backgroundView = nil;
        // 设置单元格文本的颜色
        cell.textLabel.textColor = [UIColor whiteColor];
        
        // 给单元格创建创建文本
        UILabel *sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 100 - 20, 12, 100, 20)];
        sizeLabel.textAlignment = NSTextAlignmentRight;
        sizeLabel.font = [UIFont systemFontOfSize:12];
        sizeLabel.textColor = [UIColor whiteColor];
        sizeLabel.tag = 100;
        [cell.contentView addSubview:sizeLabel];
    }
    // 设置标题
    cell.textLabel.text = _titles[indexPath.row];
    // 设置标题图片
    cell.imageView.image = [UIImage imageNamed:_imageNames[indexPath.row]];
    
    // 显示缓存大小的文本
    UILabel *sizeLabel = (UILabel *)[cell.contentView viewWithTag:100];
    if (indexPath.row == 0) {
        sizeLabel.hidden = NO;
        sizeLabel.text = [self getImageCaCheSize];
    } else {
        sizeLabel.hidden = YES;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // 我们点击的是清除缓存
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"清除缓存" message:@"是否确定清除？" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
        [alert show];
    }
}
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        // 使用SDWebImage内部的方法进行清楚缓存
        [[SDImageCache sharedImageCache] clearDisk];
        // 刷新表视图
        [_tableView reloadData];
    }
}

#pragma mark - 计算当前应用程序缓存图片的大小
- (NSString *)getImageCaCheSize
{
    long long sum = 0;
    
    // 1.获取缓存图片所在的文件地址
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/com.hackemist.SDWebImageCache.default"];
    // 2.计算文件的大小
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 01 获取当前文件夹下所有的文件
    NSArray *subPaths = [fileManager subpathsAtPath:filePath];
    // 遍历所有图片的路径
    for (NSString *subPath in subPaths) {
        // 获取图片的完整路径
        NSString *imagePath = [filePath stringByAppendingPathComponent:subPath];
        // 获取当前图片的大小
        NSDictionary *imageDic = [fileManager attributesOfItemAtPath:imagePath error:nil];
        sum += [imageDic fileSize];
    }
    
    
    return [NSString stringWithFormat:@"%.2fM",sum / (1000.0 *1000.0)];
}

@end
