//
//  PostHeaderCollectionView.m
//  WXMovie
//
//  Created by 赵宇飞 on 15/4/10.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "PostHeaderCollectionView.h"
#import "PostHeaderCell.h"
@implementation PostHeaderCollectionView
- (instancetype)initWithFrame:(CGRect)frame
{
    // 1.设置布局样式
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置单元格的大小
    flowLayout.itemSize = CGSizeMake(70, 90);
    //    取消单元格间距
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    

    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        // 2.设置代理对象
        self.delegate= self;
        self.dataSource = self;
        
        // 3.设置单元格复用类
        [self registerClass:[PostHeaderCell class] forCellWithReuseIdentifier:@"postHeaderCellId"];
        //        设置背景颜色
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = nil;
        //        取消滑动指示器
        self.showsHorizontalScrollIndicator =NO;
        //        6设置滑动视图的内填充
        _edge = (kScreenWidth - 70)/2.0;
        self.contentInset = UIEdgeInsetsMake(0, _edge, 0, _edge);
        //        7记录当前中心单元格
        self.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        //        8设置加速效果
        self.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    return self;
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PostHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"postHeaderCellId" forIndexPath:indexPath];
    // 把电影信息给单元格
    cell.model = self.dataList[indexPath.row];
    // 手动调用单元格的layoutSubViews
    [cell setNeedsLayout];
    return cell;
}
#pragma mark - UIScrollViewDelegate
// 手指离开屏幕的时候调用的协议方法
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //    decelerate 是否有加速
    if (decelerate == NO) {
        //    如果没有加速，就计算那单元格在中心点，滑动到该单元格的中心位置
        int pageIndex = (int)(scrollView.contentOffset.x + _edge + 35)/70;
        NSLog(@"pageIndex:%d",pageIndex);
        [scrollView setContentOffset:CGPointMake(pageIndex * 70 - _edge, 0) animated:YES];
        
    }
}
// 滑动视图由惯性滑动停止的时候调用的协议方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //中心位置判断！！！————————————————————————————————————————————
    // 如果没有加速，就计算那个单元格在中心点，滑动到该单元格的中心位置
    int pageIndex = (int)(scrollView.contentOffset.x + _edge + 35) / 70;
    NSLog(@"pageIndex:%d",pageIndex);
    // 让某一个单元格滑动到指定位置
    [scrollView setContentOffset:CGPointMake(pageIndex * 70 - _edge, 0) animated:YES];

}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    // 获取单元格的宽度
    float rowWidth =70;
    
    // 1.要获取当前那个单元格需要在中心现实
    
    if (velocity.x >= 0.3) {
        // 当手指离开视图的时候，惯性足够大的时候我们就让它滑动到下一个视图
        // 获取滑动之前单元格位置
        int beforeRow = self.selectedIndexPath.row;
        if (beforeRow<10) {
            // 记录新单元格位置
        self.selectedIndexPath = [NSIndexPath indexPathForRow:beforeRow + 1 inSection:0];
        targetContentOffset->x = (beforeRow + 1) * rowWidth - _edge;

        }
            } else if (velocity.x <= -0.3) {
        // 回到上一个
        int beforeRow = self.selectedIndexPath.row;
        // 记录新单元格位置
            if (beforeRow>1) {
                    self.selectedIndexPath = [NSIndexPath indexPathForRow:beforeRow - 1 inSection:0];
        targetContentOffset->x = (beforeRow - 1) * rowWidth - _edge;
                }
        
    } else {
        // 获取单元格手指离开时候的中心单元格
        int pageIndex =(int)(scrollView.contentOffset.x + _edge + rowWidth / 2.0) / (int)rowWidth;
        
        NSLog(@"pageIndex:%d",pageIndex);
        // 记录当前单元格
        self.selectedIndexPath = [NSIndexPath indexPathForRow:pageIndex inSection:0];
        
        targetContentOffset->x = -_edge + pageIndex * rowWidth;
    }
    
//    NSLog(@"velocity:%f",velocity.x);
}

@end
