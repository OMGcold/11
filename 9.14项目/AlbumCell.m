//
//  AlbumCell.m
//  NOARc
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "AlbumCell.h"

@implementation AlbumCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化子视图
        self.backgroundColor = [UIColor whiteColor];
        // 1.创建滑动视图
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth, kScreenHeight)];
        _scrollView.minimumZoomScale = 1.0;
        _scrollView.maximumZoomScale = 1.5;
        _scrollView.delegate = self;
        [self.contentView addSubview:_scrollView];
        
        // 2.创建图片视图
        _imageView = [[UIImageView alloc] initWithFrame:_scrollView.bounds];
        // 设置图片显示的方法
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_scrollView addSubview:_imageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 1.设置滑动视图的缩放比例
    _scrollView.zoomScale = 2.0;
    
    
    // 2.设置图片
    // 设置内容
    [_imageView sd_setImageWithURL:[NSURL URLWithString:self.imageName]];
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
