//
//  SmallCollectionView.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/15.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterBodyCell.h"
#import "SmallBodyCell.h"
#import "MovieModel.h"
@interface SmallCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>{
    // 左侧单元格填充的距离
//    float _edge;
}
@property (nonatomic,assign)float  edge;

@property (nonatomic,retain)NSArray *dataList;
@property (nonatomic ,retain)NSIndexPath *selectedIndexPath;
@property(nonatomic,retain)MovieModel *model;
@end
