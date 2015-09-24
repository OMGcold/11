//
//  PosterBodyCollectionView.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/15.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterBodyCell.h"
@interface PosterBodyCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>
@property (retain,nonatomic)NSArray * dataList;

@property (assign,nonatomic)float  edge;//单元格填充距离
@property (retain,nonatomic)NSIndexPath * selectedIndexPath;//单元格显示在中心

@end
