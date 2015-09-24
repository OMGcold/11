//
//  TopCell.m
//  NOARc
//
//  Created by 15751159097 on 15/9/18.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "TopCell.h"

@implementation TopCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.创建图片视图
        _titleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_titleImageView];
        
        // 2.创建文本
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:10];
        [_titleImageView addSubview:_titleLabel];
        
        // 3.创建星星视图
        _ratingView = [[WXRatingView alloc] initWithFrame:CGRectMake(0, 0, 100, 25)];
        [self.contentView addSubview:_ratingView];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 1.设置图片
    _titleImageView.frame = CGRectMake((self.width - 90) / 2.0, 10, 90, 120);
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:self.model.image_medium]];
    
    // 2.设置文本
    _titleLabel.frame = CGRectMake(0, _titleImageView.height - 20, _titleImageView.width, 20);
    _titleLabel.text = self.model.title;
    
    // 3.设置分数
    _ratingView.left = 10;
    _ratingView.top = _titleImageView.bottom + 10;
    _ratingView.scoreNum = self.model.scoreNum;
    
}

@end
