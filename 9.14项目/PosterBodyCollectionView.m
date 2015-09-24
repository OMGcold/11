//
//  PosterBodyCollectionView.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/15.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "PosterBodyCollectionView.h"

@implementation PosterBodyCollectionView

//重写
- (instancetype)initWithFrame:(CGRect)frame
{
//    self = [super initWithFrame:frame];
    //创建布局对象
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        //设置样式   375
        flowLayout.itemSize=CGSizeMake(450, frame.size.height-260);
        // 设置单元格之间的间距
        flowLayout.minimumLineSpacing = 10;
        //滑动方向
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        self=[super initWithFrame:frame collectionViewLayout:flowLayout];
        if (self) {
            //设置代理
            self.delegate=self;
            self.dataSource=self;
        //使用那个类创建单元格
        [self registerClass:[PosterBodyCell class] forCellWithReuseIdentifier:@"bodyCellId"];
            // 3.设置背景颜色为透明的
            self.backgroundColor = [UIColor clearColor];
            self.backgroundView = nil;
            
            // 4.取消滑动指示器
            self.showsHorizontalScrollIndicator = NO;
            
            // 5.设置内填充
            //单元格填充的距离
            _edge = kScreenWidth * .3 / 2.0;
            self.contentInset = UIEdgeInsetsMake(0, _edge, 0, _edge);
            // 6.记录当前中心单元格的位置
            self.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    return self;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     1.首先视图去闲置池里面找闲置的单元格，如果没找到，系统自动用你所指定的类去创建
     */
    PosterBodyCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bodyCellId" forIndexPath:indexPath];
    cell.model = self.dataList[indexPath.row];
    //竖条
    cell.backgroundColor = [UIColor grayColor];
    // 手动调用单元格的layoutSubViews
    [cell setNeedsLayout];
    return cell;
}
-(void)drawRect:(CGRect)rect
{
    [self scrollViewDidScroll:self];
}
//视图滚动方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 1.获取当前所显示的单元格索引集合
    NSArray *indexPaths = [self indexPathsForVisibleItems];
    
    NSLog(@"------------");
    // 2.遍历索引集合
    for (NSIndexPath *indexPath in indexPaths) {
        // 1.通过单元格索引位置获取该单元格
        PosterBodyCell *cell = (PosterBodyCell *)[self cellForItemAtIndexPath:indexPath];
        
        // 2.计算当前单元格距离中心点的长度
        // 01 当前单元格在中心时视图的偏移量 ＝ 单元格的索引位置 * 单元格的宽度 - 内填充
        float contentOffSet_x = indexPath.row * (kScreenWidth * .7) - _edge;
        // 02 当前单元格到中心点的距离＝ 当前视图的偏移量 - contentOffSet_x
        float lenght = self.contentOffset.x - contentOffSet_x;
        NSLog(@"lenght:%f",lenght);
        // 03 设置距离中心点越近图片越大
        /*
         lenght  0 - 224
         scale  1  - .9
         */
        //        float scale = 1 - ABS(lenght) / 225.0 * .1;
        //        NSLog(@"scale:%f",scale);
        //        cell.baseView.transform = CGAffineTransformMakeScale(scale, scale);
        // 04 3d旋转
        /*
         设置弧度 M_PI_4 / 2  ～ 0
         lenght  224  ~ 0
         */
        float rotate = lenght / 224.0 * (M_PI_4 / 2);
        
        CATransform3D transform3dScale = CATransform3DMakeScale(.95, .95,.95);
        // 设置远近效果
        transform3dScale.m34 = -.002f;
        // 设置旋转
        CATransform3D transform3d = CATransform3DRotate(transform3dScale, rotate, 0, 1, 0);
        cell.baseView.layer.transform = transform3d;
}
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    // 获取单元格的宽度
    float rowWidth = kScreenWidth * .7;
    
    // 1.要获取当前那个单元格需要在中心现实
    
    if (velocity.x >= 0.3) {
        // 当手指离开视图的时候，惯性足够大的时候我们就让它滑动到下一个视图
        // 获取滑动之前单元格位置
        int beforeRow = self.selectedIndexPath.row;
        // 记录新单元格位置
        self.selectedIndexPath = [NSIndexPath indexPathForRow:beforeRow + 1 inSection:0];
        targetContentOffset->x = (beforeRow + 1) * rowWidth - _edge;
    } else if (velocity.x <= -0.3) {
        // 回到上一个
        int beforeRow = self.selectedIndexPath.row;
        // 记录新单元格位置
        self.selectedIndexPath = [NSIndexPath indexPathForRow:beforeRow - 1 inSection:0];
        targetContentOffset->x = (beforeRow - 1) * rowWidth - _edge;
    } else {
        // 获取单元格手指离开时候的中心单元格
        int pageIndex =(int)(scrollView.contentOffset.x + _edge + rowWidth / 2.0) / (int)rowWidth;
        
        NSLog(@"pageIndex:%d",pageIndex);
        // 记录当前单元格
        self.selectedIndexPath = [NSIndexPath indexPathForRow:pageIndex inSection:0];
        
        targetContentOffset->x = -_edge + pageIndex * rowWidth;
    }
    
    //NSLog(@"velocity:%f",velocity.x);
}

@end
