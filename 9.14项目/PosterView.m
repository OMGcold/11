//
//  PosterView.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/15.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "PosterView.h"

@implementation PosterView

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self _initViews];
//    }
//    return self;
//}
//// 初始化子视图
//- (void)_initViews
//{
//    // 1. 海报的内容视图
//    [self _initBodyView];
//    
//    // 2.标题视图
//    [self _initTitleBottomView];
//    
//    // 3.创建灯光视图
//    [self _initLightView];
//    
//    // 4.创建遮罩视图
//    [self _initMaskView];
//    
//    // 5.创建头视图
//    [self _initHeaderView];
//    //    6给海报视图添加轻扫手势
//    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
//    //    配置轻扫方向
//    swipe.direction = UISwipeGestureRecognizerDirectionDown;
//    [self addGestureRecognizer:swipe];
////    //6.小海报
////    [self _initSmallBodyView];
//    //下拉按钮
////    self.btnDropDown=[UIButton buttonWithType:UIButtonTypeRoundedRect];
////    self.btnDropDown.frame=CGRectMake(140, 0, 100, 25);
////    [self.btnDropDown addTarget:self action:@selector(DropList) forControlEvents:UIControlEventTouchUpInside];
////    self.btnDropDown.backgroundColor=[UIColor clearColor];
////    [self addSubview:self.btnDropDown];
////    
////    self.btnUpBack=[UIButton buttonWithType:UIButtonTypeRoundedRect];
////    self.btnUpBack.frame=CGRectMake(140, 100, 100, 25);
////    [self.btnUpBack addTarget:self action:@selector(UpBack) forControlEvents:UIControlEventTouchUpInside];
////    self.btnUpBack.backgroundColor=[UIColor clearColor];
////    [self addSubview:self.btnUpBack];
//}
////下拉
////-(void)DropList
////{
////    [_headerView removeFromSuperview];
//////    [self.btnDropDown removeFromSuperview];
////    [self _initSmallBodyView];
////    
//////    [self btnDropDown];
////    [self _initdownHeader];
////    
////    
////    NSLog(@"haha");
//////    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 420, kScreenWidth, 200)];
//////    imageView=[[UIImageView alloc ]initWithImage:[UIImage imageNamed:@"indexBG_home@2x.png"]];
//////    [self addSubview:imageView];
////}//回收
////-(void)UpBack
////{
////    [_headerView removeFromSuperview];
////    [self.btnDropDown removeFromSuperview];
////    [self _initHeaderView];
////    [self btnDropDown];
////    [_smallCollcetionView removeFromSuperview];
////}
//////下移头视图
////-(void)_initdownHeader
////{
////    _headerView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 126)];
////    UIImage *image=[UIImage imageNamed:@"indexBG_home.png"];
////    image=[image stretchableImageWithLeftCapWidth:0 topCapHeight:4];
////    _headerView.image=image;
////    [self addSubview:_headerView];
////}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化子视图
        [self _initViews];
        // 创建头视图和内容视图中心的单元格
        [_headerCollectionView addObserver:self forKeyPath:@"selectedIndexPath" options:NSKeyValueObservingOptionNew context:nil];
        [_bodyCollectionView addObserver:self forKeyPath:@"selectedIndexPath" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

// 初始化子视图
- (void)_initViews
{
    // 设置背景颜色
    self.backgroundColor = [UIColor grayColor];
    // 1. 海报的内容视图
    [self _initBodyView];
    
    // 2.标题视图
    [self _initTitleBottomView];
    
    // 3.创建灯光视图
    [self _initLightView];
    
    // 4.创建遮罩视图
    [self _initMaskView];
    
    // 5.创建头视图
    [self _initHeaderView];
    //    6给海报视图添加轻扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    //    配置轻扫方向
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
    [swipe release];
    
    
}
// 5.创建头视图
- (void)_initHeaderView
{
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -100, kScreenWidth, 126)];
    //开启事件响应
    _headerView.userInteractionEnabled = YES;
    
    // 设置图片
    UIImage *image = [UIImage imageNamed:@"indexBG_home.png"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:4];
    _headerView.image = image;
    [self addSubview:_headerView];
    // 2.创建海报的子视图
    _headerCollectionView  = [[PostHeaderCollectionView alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth, 90)];
    [_headerView addSubview:_headerCollectionView];
    
    
    // 3.创建按钮
    UIButton *headerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    2014
    headerButton.tag = 2014;
    headerButton.frame = CGRectMake((kScreenWidth - 26) / 2.0 + 2, 100, 26, 26);
    // 设置图片
    [headerButton setImage:[UIImage imageNamed:@"down_home.png"] forState:UIControlStateNormal];
    // 添加事件
    [headerButton addTarget:self action:@selector(headerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:headerButton];
    
    
}

// 4.创建遮罩视图
- (void)_initMaskView
{
    _maskView = [[UIView alloc] initWithFrame:self.bounds];
    _maskView.backgroundColor = [UIColor blackColor];
    _maskView.alpha = .0;
    [self addSubview:_maskView];
    //    在B罩视图上添加一个点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [_maskView addGestureRecognizer:tap];
    //    释放
    [tap release];
    
}

// 3.创建灯光视图
- (void)_initLightView
{
    // 1.创建左侧灯光视图
    _leftLightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 124, 204)];
    _leftLightImageView.image = [UIImage imageNamed:@"light.png"];
    [self addSubview:_leftLightImageView];
    
    // 2.创建右侧灯光视图
    _rightLightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 124, 204)];
    _rightLightImageView.right = kScreenWidth - 20;
    _rightLightImageView.image = [UIImage imageNamed:@"light.png"];
    [self addSubview:_rightLightImageView];
}

// 2.标题视图
- (void)_initTitleBottomView
{
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - 35, kScreenWidth, 35)];
    _titleLabel.text = @"双枪";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home.png"]];
    [self addSubview:_titleLabel];
}
// 1. 海报的内容视图
- (void)_initBodyView
{
    //  创建瀑布流视图对象
    _bodyCollectionView = [[PosterBodyCollectionView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, self.height - 100)];
    [self addSubview:_bodyCollectionView];
}



//    // 01 创建布局对象
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    // 设置单元格的大小
//    flowLayout.itemSize = CGSizeMake(200 , self.height - 100);
//    // 设置滑动方向
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    // 02 创建瀑布流视图对象
//    _bodyCollectionView = [[PosterBodyCollectionView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, self.height - 100)];
//    [self addSubview:_bodyCollectionView];
//
//
//    // 标题视图
//    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - 35, kScreenWidth, 35)];
//    _titleLabel.text = @"双枪";
//    _titleLabel.textColor = [UIColor whiteColor];
//    _titleLabel.textAlignment = NSTextAlignmentCenter;
//    _titleLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home.png"]];
//    [self addSubview:_titleLabel];
//    //    // 灯光视图
//    //    UIImageView *_leftLightImageView;
//    //    UIImageView *_rightLightImageView;
//    //    // 半透明的遮罩视图
//    //    UIView *_maskView;
//    //    // 头视图
//    //    UIView *_headerView;

#pragma mark - 重写set方法
- (void)setDataList:(NSArray *)dataList
{
    if ( _dataList!= dataList) {
        [_dataList release];
        _dataList = [dataList retain];
        
        // 拿到数据后马上给内容视图显示
        _bodyCollectionView.dataList = _dataList;
        // 刷新视图
        [_bodyCollectionView reloadData];
        // 2.同时在给头列表视图显示
        _headerCollectionView.dataList = _dataList;
        [_headerCollectionView reloadData];
    }
}
#pragma mark - 头视图按钮事件
- (void)headerButtonAction:(UIButton *)button
{
    //    _headerView.top = _headerView.top == 0 ? -100 : 0;
    
    // 创建属性动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.35];
    // 设置动画结束调用的方法
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop)];
    
    
    if (_headerView.top == 0) {
        // 当前是放下状态，需要执行收起
        _headerView.top = -100;
        // 隐藏遮罩
        _maskView.alpha = .0;
    } else {
        // 当前是收起状态，需要执行放下
        _headerView.top = 0;
        // 显示遮罩
        _maskView.alpha = .5;
    }
    // 提交动画
    [UIView commitAnimations];
}
#pragma mark - 点击手势事件
- (void)tapAction:(UITapGestureRecognizer *)tap
{
    // 手动让按钮执行点击事件
    UIButton *headerButton = (UIButton *)[_headerView viewWithTag:2014];
    // 代码控制按钮被点击了
    [headerButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

// 动画执行完毕，做按钮的旋转功能
- (void)animationDidStop
{
    NSLog(@"动画执行完毕");
    // 执行按钮视图的旋转
    // 1.获取按钮
    UIButton *headerButton = (UIButton *)[_headerView viewWithTag:2014];
    // 2.判断动画结束时头视图的位置，按钮视图采用相对应的图片效果
    if (_headerView.top == 0) {
        // 现在已经在放下的状态
        headerButton.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    } else {
        headerButton.imageView.transform = CGAffineTransformIdentity;
    }
}
#pragma mark - 下拉手势
- (void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    // 手动让按钮执行点击事件
    UIButton *headerButton = (UIButton *)[_headerView viewWithTag:2014];
    // 代码控制按钮被点击了
    [headerButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _headerCollectionView) {
        // 当前头视图中心单元格的位置
        NSIndexPath *indexPath = change[@"new"];
        
        // 让内容的单元格和头视图的单元格位置一样
        if (indexPath.row != _bodyCollectionView.selectedIndexPath.row) {
            // 让内容单元格滑动到指定位置
            float x = indexPath.row * (kScreenWidth * .7) - _bodyCollectionView.edge;
            [_bodyCollectionView setContentOffset:CGPointMake(x, 0) animated:YES];
            // 记录当前中心的单元格索引
            _bodyCollectionView.selectedIndexPath = indexPath;
        }
    } else {
        // 是内容视图的单元格发生了改变
        // 1.获取当前内容单元格的选中位置
        NSIndexPath *indexPath = change[@"new"];
        // 2.和头视图的单元格中心位置进行比较
        if (indexPath.row != _headerCollectionView.selectedIndexPath.row) {
            // 3.让头视图单元格滑动到指定位置
            float x = indexPath.row * 70 - _headerCollectionView.edge;
            [_headerCollectionView setContentOffset:CGPointMake(x, 0) animated:YES];
            // 4.头视图记录单元格的中心位置
            _headerCollectionView.selectedIndexPath = indexPath;
        }
    }
    
    // 设置标题的内容
    NSIndexPath *indexPath = change[@"new"];
    MovieModel *model = self.dataList[indexPath.row];
    _titleLabel.text = model.original_title;
    
    
}

@end
