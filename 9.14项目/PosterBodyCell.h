//
//  PosterBodyCell.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/15.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "WXRatingView.h"
@interface PosterBodyCell : UICollectionViewCell
{
    UIImageView *_imageView;
    //海报内容视图
    UIView *_detalView;
    //内容子视图
    UIImageView *_dImageView;
    UILabel *_titleLabel;//反页名字
    UILabel *_yearLabel;//反页年份
    // 03 英文标题
    UILabel *_dETitleLabel;
    WXRatingView *_ratingView;
    UIButton *btnlook;//观看
    
}
@property(retain,nonatomic)NSDictionary *dic;//读取信息
@property (retain,nonatomic)MovieModel * model;
@property (retain,nonatomic)UIView * baseView;//单元格内容父视图
@property (strong,nonatomic)UIWebView * webview;//网页


@end
