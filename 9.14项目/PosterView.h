//
//  PosterView.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/15.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PosterBodyCollectionView.h"
//#import "SmallCollectionView.h"
#import "PostHeaderCollectionView.h"
@interface PosterView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>
{
    //海报内容视图
    PosterBodyCollectionView *_bodyCollectionView;
    //小海报
//    SmallCollectionView *_smallCollcetionView;
    PostHeaderCollectionView *_headerCollectionView;
    //标题视图
    UILabel *_titleLabel;
    
    //灯光视图
    UIImageView *_leftLightImageView;
    UIImageView *_rightLightImageView;
    //半透明视图
    UIView *_maskView;
    //头视图
    UIImageView *_headerView;
}
@property (retain,nonatomic)NSArray * dataList;

@property (strong,nonatomic)UIButton * btnDropDown;
@property (strong,nonatomic)UIButton * btnUpBack;
@end
