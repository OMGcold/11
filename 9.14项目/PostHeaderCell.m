//
//  PostHeaderCell.m
//  WXMovie
//
//  Created by 赵宇飞 on 15/4/10.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "PostHeaderCell.h"

@implementation PostHeaderCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.创建图片视图
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_imageView];

    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置图片的大小和位置
    _imageView.frame = CGRectMake(5, 0, 70, 90);
    NSURL *imageUrl = [NSURL URLWithString:self.model.image_large];
    [_imageView sd_setImageWithURL:imageUrl];
}

@end
