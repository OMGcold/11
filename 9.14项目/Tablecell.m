//
//  Tablecell.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/19.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "Tablecell.h"
#import "CinemaCell.h"
@implementation Tablecell

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)styles
{
    self = [super initWithFrame:frame style:styles];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        // 设置表视图的背景颜色
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main.png"]];
        self.backgroundView = nil;
    }return self;
    
}
#pragma mark - UITableViewDataSoure
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"ListCellId";
    //    在表视图的闲置池里面查找闲置的单元格
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[CinemaCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        
    }
    //    获取当前单元格对应的字典
    cell.dic = self.dataList[indexPath.row];
    //    NSDictionary *dic = self.dataList[indexPath.row];
    //    cell.textLabel.text = dic[@"subject"][@"title"];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}


@end
