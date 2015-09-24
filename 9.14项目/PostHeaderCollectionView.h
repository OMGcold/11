//
//  PostHeaderCollectionView.h
//  WXMovie
//
//  Created by 赵宇飞 on 15/4/10.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostHeaderCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>{
    // 左侧单元格填充的距离
//    float _edge;
}
@property (nonatomic ,assign) float edge;
@property (nonatomic,retain)NSArray *dataList;
@property (nonatomic ,retain)NSIndexPath *selectedIndexPath;
@end
