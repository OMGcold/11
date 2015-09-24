//
//  MovieViewController.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "BaseViewController.h"
#import "DOPDropDownMenu.h"
#import "Tablecell.h"
#import <MediaPlayer/MediaPlayer.h>
@interface MovieViewController : BaseViewController
{
    UIView *filterView;
    UIView *_maskView;
    UITableView *_tableView;
    Tablecell *_tablecell;
}

@property (nonatomic ,retain) NSArray *dataList;
@property(strong,nonatomic)NSArray *columen1;
@property(strong,nonatomic)NSArray *columen2;
@property(strong,nonatomic)NSArray *columen3;
@property(nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, strong) NSArray *movices;
@property (nonatomic, strong) NSArray *hostels;

@property (strong,nonatomic)UIWebView * webview;//网页
@property (retain, nonatomic) MPMoviePlayerController *moviePlayer;
@property(strong,nonatomic) NSDictionary *cinemaDic;
@property(assign,nonatomic) int n;


@end
