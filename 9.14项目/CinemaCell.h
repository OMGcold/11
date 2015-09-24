//
//  CinemaCell.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/19.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"
#import "WXRatingView.h"
@interface CinemaCell : UITableViewCell
{
    UIImageView *_image;
    UILabel *_lowPrice;
    UILabel *_grade;
    UILabel *_name;
    UILabel *_address;
    UILabel *_tel;
    UILabel *_circleName;
    WXRatingView *_ratingView;
}


@property (nonatomic,retain)CinemaModel * model;

@property (nonatomic,retain)NSDictionary *dic;
@end
