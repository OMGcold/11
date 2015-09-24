//
//  ListCell.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXRatingView.h"
@interface ListCell : UITableViewCell

@property (strong,nonatomic)UIImageView * titleImageVie;
@property (strong,nonatomic)UILabel * titleLabel;
@property (strong,nonatomic)UILabel * yearLabel;
@property (strong,nonatomic)NSDictionary * dic;
//评分
@property (strong,nonatomic)WXRatingView *wx;
@end
