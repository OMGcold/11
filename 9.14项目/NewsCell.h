//
//  NewsCell.h
//  NOARc
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface NewsCell : UITableViewCell
{
    UIImageView *_titleImageView;
    UILabel *_titleLabel;
    UIImageView *_typeImageView;
    UILabel *_summaryLabel;
}
@property (nonatomic ,retain)NewsModel *model;
@end
