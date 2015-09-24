//
//  SmallBodyCell.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/15.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
@interface SmallBodyCell : UICollectionViewCell
{
    UIImageView *_imageView;
}
@property(nonatomic,retain)MovieModel *model;
@end
