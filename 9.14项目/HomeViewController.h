//
//  HomeViewController.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "BaseViewController.h"
#import "ListTableView.h"
#import "PosterView.h"
@interface HomeViewController : BaseViewController
{
    PosterView *_posterView;
    ListTableView *_listTableView;
}

@property (strong,nonatomic)UIScrollView * scroll;
@end
