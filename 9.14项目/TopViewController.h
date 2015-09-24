//
//  TopViewController.h
//  NOARc
//
//  Created by 15751159097 on 15/9/18.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "BaseViewController.h"
#import "TopModel.h"
#import "TopCell.h"
#import "MovieDetailViewController.h"
@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_collectionView;
    
}
@property (nonatomic,retain) NSArray *dataList;

@end
