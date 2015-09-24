//
//  ImageNewsViewController.m
//  NOARc
//
//  Created by 齐鸣宇 on 15/9/9.
//  Copyright (c) 2015年 SXJY. All rights reserved.
//

#import "ImageNewsViewController.h"
#import "ImageModel.h"
#import "ImageNewsCell.h"
@interface ImageNewsViewController ()

@end

@implementation ImageNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    // 1.创建子视图
    [self _initViews];
    
    // 2.获取数据
    [self _loadData];
    // 3.使用自定义返回按钮
    self.isBack = YES;
}
// 1.创建子视图
- (void)_initViews
{
    // 创建表视图
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

// 2.获取数据
- (void)_loadData
{
    // 01 获取当前所有图片
    NSArray *image_list = [WXDataSerivce getJSONDataWithFileName:@"image_list"];
    // 02 整理数据
    NSMutableArray *imageModels = [NSMutableArray array];
    for (NSDictionary *subDic in image_list) {
        // 创建数据原型对象
        ImageModel *model = [[ImageModel alloc] initWithContentDic:subDic];
        // 把数据原型添加到数组中
        [imageModels addObject:model];
        
        [model release];
    }
    
    
    
    // 01 创建一个大数组
    NSMutableArray *array = [NSMutableArray array];
    // 定义小数组的指针
    NSMutableArray *array2d = nil;
    // 02 遍历一维数组的数据
    for (int i = 0; i < imageModels.count; i++) {
        // 每4次就要创建一个小数组
        if (i % 4 == 0) {
            array2d = [NSMutableArray array];
            // 把小数组添加到大数组中
            [array addObject:array2d];
        }
        
        // 把元素添加到小数组中
        [array2d addObject:imageModels[i]];
    }
    
    self.imageModels = imageModels;
    self.dataList = array;
    
    // 刷新表视图
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"imageNewsCellId";
    ImageNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[ImageNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    // 获取当前单元格对应的小数组
    cell.array2d = self.dataList[indexPath.row];
    
    cell.rowIndex = (int)indexPath.row;
    cell.dataList = self.imageModels;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height = (kScreenWidth - 5 * 10) / 4.0 + 10;
    return height;
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
