//
//  CinemaDetailViewController.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/19.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface CinemaDetailViewController : UIViewController
{
    UITableView *_tableView;
    MPMoviePlayerController *_moviePlayer;
}

@property (nonatomic ,retain) NSArray *dataList;


@property (strong,nonatomic)UIWebView * webview;//网页
@property (retain, nonatomic) MPMoviePlayerController *moviePlayer;

@property(strong,nonatomic)NSArray *cinemaList;
@property(strong,nonatomic) NSDictionary *cinemaDic;
@property(assign,nonatomic) int n;

@end
