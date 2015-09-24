//
//  MovieDetailViewController.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/18.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieDetailModel.h"
#import "CommentCell.h"
#import "CommentModel.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isBack=YES;
    [self _initViews];
    [self _loadData];
}
-(void)_loadData
{
    /**
     *  json解析
     */
    // 1.请求头视图数据
    NSDictionary *result = [WXDataSerivce getJSONDataWithFileName:@"movie_detail"];
    
    // 转换成数据原型对象
    MovieDetailModel *model = [[MovieDetailModel alloc] initWithContentDic:result];
    // 设置头视图数据
    [self setHeaderViewContentWithModel:model];
    //2.评论
    NSDictionary *commentDic=[WXDataSerivce getJSONDataWithFileName:@"movie_comment"];
    self.commentCount=[commentDic[@"count"]intValue];//获取评论数
    
    NSArray *list=commentDic[@"list"];//评论列表
    //遍历，转换   评论列表->dic中->commentModel->nsmutablearray的models中-> dataList里
    NSMutableArray *models=[NSMutableArray array];
    for (NSDictionary *dic in list) {
        CommentModel *commentModel=[[CommentModel alloc]initWithContentDic:dic];
        [models addObject:commentModel];
        [commentModel release];
    }
    self.dataList=models;
    [_tableView reloadData];
    NSLog(@"333333333%@",_authorLabel.text);
}
-(void)_initViews
{
    //表视图
    self.view.backgroundColor=[UIColor grayColor];
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 250, kScreenWidth, kScreenHeight-60)style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    //头视图
//    _tableView.tableHeaderView=_headerView;
    
    //背景视图
    UIImageView *bgImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, _locTimeLabel.bottom+150, kScreenWidth-20, 100)];
    
    //视图设置为圆角 半径
    bgImageView.layer.cornerRadius=20;
    //设置裁剪
    bgImageView.layer.masksToBounds=YES;
    //描边
    bgImageView.layer.borderColor=[UIColor orangeColor].CGColor;
    bgImageView.layer.borderWidth=2;
    //背景放到头视图
    [self.view addSubview:bgImageView];
    
    
    // 2.2 创建4个图片视图
    // 图片之间的空隙
    float spaceWidth = (bgImageView.width - 70 * 4) / 5.0;
    for (int i = 0; i < 4; i++) {
        // 创建图片
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceWidth + i * (70 + spaceWidth), 160, 70, 70)];
        // 设置tag
        imageView.tag = 100 + i;
        imageView.backgroundColor = [UIColor redColor];
        [self.view addSubview:imageView];
    }

}


//头视图的内容 方法
- (void)setHeaderViewContentWithModel:(MovieDetailModel *)model
{
    UIButton *btnplayer=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    [btnplayer addTarget:self action:@selector(player) forControlEvents:UIControlEventTouchUpInside];
    btnplayer.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnplayer];
    
    _titleImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    [self.view addSubview:_titleImageView];
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(156, 0, 150, 30)];
     _titleLabel.text=model.titleCn;
    _titleLabel.textColor=[UIColor orangeColor];
//    _titleLabel.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:_titleLabel ];
    
   
     //通过，号分割数据
    _authorLabel=[[UILabel alloc]initWithFrame:CGRectMake(156, 40, 150, 20)];
//    _authorLabel.backgroundColor=[UIColor orangeColor];
     _authorLabel.text = [model.directors componentsJoinedByString:@"、"];
    [self.view addSubview:_authorLabel];
    _actorLabel=[[UILabel alloc]initWithFrame:CGRectMake(156, 60, 150, 30)];
//    _actorLabel.backgroundColor=[UIColor orangeColor];
    _actorLabel.text=[model.actors componentsJoinedByString:@";"];
    [self.view addSubview:_actorLabel];
    _typeLabel=[[UILabel alloc]initWithFrame:CGRectMake(156, 90, 150, 30)];
    _typeLabel.text=[model.type componentsJoinedByString:@","];
//    _typeLabel.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:_typeLabel];
    _locTimeLabel=[[UILabel alloc]initWithFrame:CGRectMake(156, 120, 150, 30)];
//    _locTimeLabel.backgroundColor=[UIColor orangeColor];
    _locTimeLabel.text=model.locationDate;
    [self.view addSubview:_locTimeLabel];
    
    for (int i=0; i<model.videos.count; i++) {
        //获取电影内容
        NSDictionary *subDic=model.videos[i];
        //现实的图片
        NSString *imageName=subDic[@"image"];
        //对应的视图
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 155, 350, 50)];
        imageView = (UIImageView *)[self.view viewWithTag:100 + i];
        // 设置图片
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageName]];
        [self.view addSubview:imageView];
        
    }
//    _moviePlayer=model.videos[@"videos"][@"url"];
    
}
-(void)player
{
//    CGRect rect1=CGRectMake(0, 0, 370, 667);
//    
//    self.webview=[[UIWebView alloc]initWithFrame:rect1];
//    //加载网页
//    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.iqiyi.com/dianying/20121018/e8ae9201a05e345b.html?vfm=2008_aldbd"]]];
//    [self.view addSubview:self.webview];
        //本地路径
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929" ofType:@"mp4"];
//    NSURL *sourceMovieURL = [NSURL fileURLWithPath:filePath];
//    
//    _moviePlayer = [[MPMoviePlayerController alloc] init];
//    _moviePlayer.view.frame=CGRectMake(0, 0, 375, 667);
//    _moviePlayer.controlStyle=MPMovieControlStyleNone;
//
//    // Play the movie!
//    [self.view addSubview:moviePlayer.view];
    
//

    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:
                        [NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4"]];
//    self.moviePlayer.movieControlMode = MPMovieControlStyleDefault;
     self.moviePlayer.controlStyle=MPMovieControlStyleNone;
    [self.moviePlayer.view setFrame:CGRectMake(0, 0, 375, 500)];
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer play];
    
}
//跳转页面的数量
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;//tableview高度
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *iden=@"commentCellId";
    CommentCell *cell=[tableView dequeueReusableCellWithIdentifier:iden];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"CommentCell" owner:nil options:nil]lastObject];
    }
    //内容给单元格显示
    cell.model=self.dataList[indexPath.row];
    
    return cell;
}
-(void)dealloc
{
    [_headerView release];
    [_titleImageView release];
    [_titleLabel release];
    [_authorLabel release];
    [_actorLabel release];
    [_typeLabel release];
    [_locTimeLabel release];
    [_moviePlayer release];
    [super dealloc];
}


@end
