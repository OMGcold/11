//
//  ListCell.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell
// 重写我们创建单元格时使用的初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //去背景色
        self.backgroundColor=[UIColor clearColor];
        self.backgroundView=nil;
    
    //创建子视图
    [self initViews];
    }
    return self;
}

-(void)initViews
{
    // 01 创建标题图片
    self.titleImageVie=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 90)];
    [self.contentView addSubview:self.titleImageVie];
    // 02 创建标题文本
    self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(70, 15, 150, 20)];
    self.titleLabel.font=[UIFont boldSystemFontOfSize:14];
    self.titleLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:self.titleLabel];
    // 03 创建年份文本
    self.yearLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.titleLabel.left, 80, 150, 20)];
    self.yearLabel.font=[UIFont boldSystemFontOfSize:12];
    self.yearLabel.textColor=[UIColor orangeColor];
    [self.contentView addSubview:self.yearLabel];
    // 04 创建评分文本
    self.wx=[[WXRatingView alloc]initWithFrame:CGRectMake(100, 60, 200, 40)];
    
    [self.contentView addSubview:self.wx];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    //子视图内容
    //1.图片
    NSString *urlString=self.dic[@"subject"][@"images"][@"medium"];
    NSLog(@"%@",urlString);
    // 把字符串转换成路径
    NSURL *url = [NSURL URLWithString:urlString];
    [self.titleImageVie  sd_setImageWithURL:url];
    /*
     此代码可以获取网络图片，不过会堵塞主线程（在程序中绝对不能堵塞主线程）
     NSData *imageData = [NSData dataWithContentsOfURL:url];
     _titleImageView.image = [UIImage imageWithData:imageData];
     */
    
    // 2.设置标题
    _titleLabel.text = self.dic[@"subject"][@"title"];
    // 3.设置年份
    _yearLabel.text = self.dic[@"subject"][@"year"];
    //4.评分
    
    
    NSString *scroe=self.dic[@"subject"][@"rating"][@"average"];
    [self.wx setScoreNum:[scroe floatValue]];
    
}
- (void)setScoreNum:(float)scoreNum
{
    if (scoreNum != scoreNum) {
        scoreNum = scoreNum;
        
//        // 改变黄色星星视图的宽度
//        _yellowView.width = grayView.width * scoreNum * .1;
//        // 设置文本
//        scoreLabel.text = [NSString stringWithFormat:@"%.1f",scoreNum];
    }
    
}

@end
