//
//  TopCell.h
//  NOARc
//
//  Created by 15751159097 on 15/9/18.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXRatingView.h"
#import "TopModel.h"
@interface TopCell : UICollectionViewCell{
    UIImageView *_titleImageView;
    UILabel *_titleLabel;
    WXRatingView *_ratingView;
    
}
@property (nonatomic ,retain) TopModel *model;

@end
