//
//  AlbumCell.h
//  NOARc
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumCell : UICollectionViewCell<UIScrollViewDelegate>
{
    // 有一个滑动视图
    UIScrollView *_scrollView;
    // 图片视图
    UIImageView *_imageView;
}
@property (nonatomic ,copy) NSString *imageName;

@end
