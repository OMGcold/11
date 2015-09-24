//
//  MovieDetailViewController.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/18.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "BaseViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface MovieDetailViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    UIView *_headerView;
    UIImageView  *_titleImageView;
    UILabel *_titleLabel;
    UILabel *_authorLabel;
    UILabel *_locTimeLabel;
    UILabel *_typeLabel;
    UILabel *_actorLabel;
    MPMoviePlayerController *_moviePlayer;//视频播放
    
}
@property (nonatomic ,assign)int commentCount;
@property (nonatomic,retain)NSArray *dataList;
@property (strong,nonatomic)UIWebView * webview;//网页
@property (retain, nonatomic) MPMoviePlayerController *moviePlayer; 
@end
