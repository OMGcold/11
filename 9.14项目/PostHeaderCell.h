//
//  PostHeaderCell.h
//  WXMovie
//
//  Created by 赵宇飞 on 15/4/10.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
@interface PostHeaderCell : UICollectionViewCell
{
    UIImageView *_imageView;
}
@property(nonatomic,retain)MovieModel *model;
@end
