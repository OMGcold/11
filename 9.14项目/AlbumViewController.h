//
//  AlbumViewController.h
//  NOARc
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "BaseViewController.h"

@interface AlbumViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_collectionView;
}
@property (nonatomic ,assign) int selectedIndex;
@property (nonatomic ,retain) NSArray *dataList;

@end
