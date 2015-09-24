//
//  SmallBodyCell.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/15.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "SmallBodyCell.h"

@implementation SmallBodyCell
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

/*
 在layoutSubviews 做两件事：
 1.设置视图位置
 2.设置视图尺寸
 // 在UICollectionViewCell里面系统不会自动的调用layoutSubviews方法，要手动的调用
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    // 设置图片的大小和位置
    _imageView.frame = CGRectMake(5, 0, 60, 90);
    NSURL *imageUrl = [NSURL URLWithString:self.model.image_medium];
    [_imageView sd_setImageWithURL:imageUrl];
    
}
@end
