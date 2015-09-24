//
//  PosterBodyCell.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/15.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "PosterBodyCell.h"
#import "MovieModel.h"
@implementation PosterBodyCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //        // 1.创建图片视图
        //        _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        //        [self.contentView addSubview:_imageView];
        //        // 2.设置背景颜色
        //        self.backgroundColor = [UIColor greenColor];
        //        self.backgroundView = nil;
        // 1.创建内容的大视图（装有所有的内容视图）
        _baseView = [[UIView alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_baseView];
        // 1.创建图片视图
        _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_imageView];
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_baseView addSubview:_imageView];
        
        // 3.创建电影详情视图
        _detalView = [[UIView alloc] initWithFrame:CGRectZero];
        _detalView.backgroundColor = [UIColor whiteColor];
        [_baseView insertSubview:_detalView atIndex:0];
        // 添加点击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [_baseView addGestureRecognizer:tap];
        [tap release];
        // 创建电影详情视图的子视图
        // 01 图片
        _dImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_detalView addSubview:_dImageView];
        // 02 标题文本
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.textColor = [UIColor blackColor];
        [_detalView addSubview:_titleLabel];
        // 03 英文标题
        _dETitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _dETitleLabel.font = [UIFont boldSystemFontOfSize:14];
        _dETitleLabel.textColor = [UIColor blackColor];
        [_detalView addSubview:_dETitleLabel];
        // 04 年份文本
        _yearLabel= [[UILabel alloc] initWithFrame:CGRectZero];
        _yearLabel.font = [UIFont systemFontOfSize:14];
        _yearLabel.textColor = [UIColor blackColor];
        [_detalView addSubview:_yearLabel];
        // 05 评分
        _ratingView = [[WXRatingView alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
        [_detalView addSubview:_ratingView];
        
        // 3.设置背景颜色
        self.backgroundColor = [UIColor grayColor];
        
        self.backgroundView = nil;
        //观看
        btnlook=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnlook.frame=CGRectMake(150, 60, 100, 40);
        [btnlook setTitle:@"点击观看" forState:UIControlStateNormal];
        [btnlook addTarget:self action:@selector(url) forControlEvents:UIControlEventTouchUpInside];
        btnlook.backgroundColor=[UIColor cyanColor];
        [_detalView addSubview:btnlook];
        
    }return self;
    
}
-(void)url
{
    NSLog(@"ss");
    CGRect rect1=CGRectMake(0, 0, 370, 667);
    self.webview=[[UIWebView alloc]initWithFrame:rect1];
    //加载网页
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.iqiyi.com/v_19rrhbbctw.html"]]];
    [_detalView addSubview:self.webview];
}
/*
 在layoutSubviews 做两件事：
 1.设置视图位置
 2.设置视图尺寸
 // 在UICollectionViewCell里面系统不会自动的调用layoutSubviews方法，要手动的调用
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    //    //    设置图片大小和尺寸
    //    _imageView.frame = CGRectMake(10, 0, self.width - 20, self.height);
    //    NSURL *imageUrl = [NSURL URLWithString:self.model.image_large];
    //    [_imageView sd_setImageWithURL:imageUrl];
    // 需要重置单元格的坐标系统
    _baseView.transform = CGAffineTransformIdentity;
    
    // 1.设置大的内容视图的尺寸
    _baseView.frame = CGRectMake(10, 0, self.width - 20, self.height);
    
    //    设置图片大小和尺寸
    _imageView.frame = _baseView.bounds;
    NSURL *imageUrl = [NSURL URLWithString:self.model.image_large];
    [_imageView sd_setImageWithURL:imageUrl];
    // 3.设置电影详情视图的大小和内容
    _detalView.frame = _imageView.bounds;
    // 设置电影详情视图的子视图
    // 01 图片
    _dImageView.frame = CGRectMake(20, 40, 60, 90);
    [_dImageView sd_setImageWithURL:[NSURL URLWithString:self.model.image_medium]];
    // 02 标题文本
    _titleLabel.frame=CGRectMake(_dImageView.right+10, 60, 150, 30);
    _titleLabel.textColor=[UIColor grayColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    
    _titleLabel.text = self.model.title;
    // 03 英文标题
    _dETitleLabel.frame = CGRectMake(_dImageView.right + 5, _titleLabel.bottom -10, 100, 35);
    _dETitleLabel.text = self.model.original_title;
    // 04 年份文本
    _yearLabel.frame = CGRectMake(100, _dImageView.bottom + -10, 150, 20);
    _yearLabel.text = self.model.year;
    // 设置分数
    _ratingView.frame=CGRectMake(20, _dImageView.height+40, 150, 60);
    _ratingView.scoreNum = self.model.scoreNum;
    
    
}
#pragma mark - baseView 的点击事件
- (void)tapAction:(UITapGestureRecognizer *)tap
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.35];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_baseView cache:YES];
    [_baseView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView commitAnimations];
}
@end