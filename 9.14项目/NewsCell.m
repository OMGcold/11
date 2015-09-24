//
//  NewsCell.m
//  NOARc
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.创建子视图
        [self _initViews];
        
        // 2.设置背景为透明的
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = nil;
    }
    return self;
}

// 1.创建子视图
- (void)_initViews
{
    // 1.创建标题图片
    _titleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_titleImageView];
    
    // 2.创建标题文本
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textColor = [UIColor orangeColor];
    [self.contentView addSubview:_titleLabel];
    
    // 3.创建类型图片
    _typeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_typeImageView];
    
    // 4.创建简介文本
    _summaryLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _summaryLabel.font = [UIFont systemFontOfSize:20];
    _summaryLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_summaryLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 1.设置新闻栏图片
    _titleImageView.frame = CGRectMake(10, 5, 120, 70);
    //图片的解析
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:self.model.imageUrl]];
    
    // 2.设置标题文本
    _titleLabel.frame = CGRectMake(_titleImageView.right + 10, 15, kScreenWidth - 100, 20);
    _titleLabel.text = self.model.title;
    
    // 3.设置新闻类型图片
    if ([self.model.type intValue] == 0) {
        // 普通新闻(没有类型图片)
        _typeImageView.hidden = YES;
    } else if ([self.model.type intValue] == 1) {
        // 图片新闻（显示图片）
        _typeImageView.hidden = NO;
        _typeImageView.frame = CGRectMake(_titleImageView.right + 10, _titleLabel.bottom + 10, 16, 12);
        _typeImageView.image = [UIImage imageNamed:@"sctpxw.png"];
    } else {
        // 视频新闻（显示图片）
        _typeImageView.hidden = NO;
        _typeImageView.frame = CGRectMake(_titleImageView.right + 10, _titleLabel.bottom + 10, 16, 12);
        _typeImageView.image = [UIImage imageNamed:@"scspxw.png"];
    }
    
    // 4.设置新闻详情文本
    float x = 0;
    float width = 0;
    if ([self.model.type intValue] == 0) {
        // 没有类型图片时文本详情的位置和宽度
        x = _titleImageView.right + 10;
        width = kScreenWidth - 100;
    } else {
        // 有类型图片时文本详情的位置和宽度
        x = _titleImageView.right ;//+30
        width = kScreenWidth - 80;//-100
    }
    _summaryLabel.frame = CGRectMake(x, _titleLabel.bottom + 10, width, 14);
    _summaryLabel.text = self.model.summary;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
