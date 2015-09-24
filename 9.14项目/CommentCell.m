//
//  CommentCell.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/18.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

-(void)layoutSubviews
{
    [super layoutSubviews];
    [_userImageView sd_setImageWithURL:[NSURL URLWithString:self.model.userImage]];
    _ratingLabel.text=self.model.rating;
    _contentLabel.text=self.model.content;
    _nickNameLabel.text=self.model.nickname;
}
-(void)dealloc
{
    [_userImageView release];
    [_bgImageView release];
    [_nickNameLabel release];
    [_ratingLabel release];
    [_contentLabel release];
    [_userImageView release];
    [_nickNameLabel release];
    [_nickNameLabel release];
    [_contentLabel release];
    [_ratingLabel release];
    [_bgImageView release];
    [super dealloc];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
