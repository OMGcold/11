//
//  CinemaDetailViewController.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/19.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "CinemaDetailViewController.h"
#import "CinemaDetailCell.h"
@interface CinemaDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CinemaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _initViews];
    [self _loadData];
    CGRect rect1=CGRectMake(0, 0, 375, 200);
    self.webview=[[UIWebView alloc]initWithFrame:rect1];
//    加载网页
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.iqiyi.com/v_19rrhbbctw.html"]]];
    [self.view addSubview:self.webview];
    
//    UIButton *btnplayer=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 375, 100)];
//    [btnplayer setTitle:@"guankan" forState:UIControlStateNormal];
//    [btnplayer addTarget:self action:@selector(player1) forControlEvents:UIControlEventTouchUpInside];
//    btnplayer.backgroundColor=[UIColor orangeColor];
//    [self.view addSubview:btnplayer];
    NSDictionary *result=[WXDataSerivce getJSONDataWithFileName:@"cinema_list"];
    self.cinemaList=result[@"cinemaList"];
    
    
    
}
-(void)player1
{
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:
                        [NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4"]];
    //    self.moviePlayer.movieControlMode = MPMovieControlStyleDefault;
    self.moviePlayer.controlStyle=MPMovieControlStyleNone;
    [self.moviePlayer.view setFrame:CGRectMake(0, 0, 375, 500)];
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer play];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)_initViews
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, kScreenHeight-100)style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}
-(void)_loadData
{
    NSArray *result=[WXDataSerivce getJSONDataWithFileName:@"readyMovie"];
    self.dataList=[result copy];

    [_tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
//    return _dataList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *iden=@"hah";
    CinemaDetailCell *cell=[tableView dequeueReusableCellWithIdentifier:@"haha"];
    if (cell==nil) {
        cell=[[CinemaDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"haha"];
    }
    NSLog(@"%@",self.dataList[indexPath.row]);
    cell.dic=[self.dataList[indexPath.row] copy];
    
    
    NSDictionary *result=[WXDataSerivce getJSONDataWithFileName:@"cinema_list"];
    
    self.cinemaDic= result[@"cinemaList"][self.n];
    if (indexPath.row==0) {
        UIImageView *imagebg1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        imagebg1.image=[UIImage imageNamed:@"13@2x"];
        
        [cell addSubview:imagebg1];
        UILabel *lblname=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+20, 10, 300, 20)];
        lblname.text=self.cinemaDic[@"name"];
        
        lblname.font=[UIFont systemFontOfSize:14];
        [cell addSubview:lblname];
        
        UILabel *lbladdress=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+5, 25, 200, 40)];
        lbladdress.numberOfLines=2;
        NSString *address=[NSString stringWithFormat:@" %@",self.cinemaDic[@"address"]];
        lbladdress.text=address;
        lbladdress.font=[UIFont systemFontOfSize:11];
        lbladdress.alpha=0.7;
        [cell addSubview:lbladdress];
    }
     else if (indexPath.row==1) {
        UIImageView *imagebg1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        imagebg1.image=[UIImage imageNamed:@"12@2x"];
        
        [cell addSubview:imagebg1];
        UILabel *lblname=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+20, 10, 300, 20)];
        lblname.text=self.cinemaDic[@"name"];
        
        lblname.font=[UIFont systemFontOfSize:14];
        [cell addSubview:lblname];
        
        UILabel *lbladdress=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+5, 25, 200, 40)];
        lbladdress.numberOfLines=2;
        NSString *address=[NSString stringWithFormat:@" %@",self.cinemaDic[@"address"]];
        lbladdress.text=address;
        lbladdress.font=[UIFont systemFontOfSize:11];
        lbladdress.alpha=0.7;
        [cell addSubview:lbladdress];
    }
     else if (indexPath.row==2) {
         UIImageView *imagebg1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
         imagebg1.image=[UIImage imageNamed:@"11@2x"];
         
         [cell addSubview:imagebg1];
         UILabel *lblname=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+20, 10, 300, 20)];
         lblname.text=self.cinemaDic[@"name"];
         
         lblname.font=[UIFont systemFontOfSize:14];
         [cell addSubview:lblname];
         
         UILabel *lbladdress=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+5, 25, 200, 40)];
         lbladdress.numberOfLines=2;
         NSString *address=[NSString stringWithFormat:@" %@",self.cinemaDic[@"address"]];
         lbladdress.text=address;
         lbladdress.font=[UIFont systemFontOfSize:11];
         lbladdress.alpha=0.7;
         [cell addSubview:lbladdress];
    }
    else if (indexPath.row==3) {
        UIImageView *imagebg1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        imagebg1.image=[UIImage imageNamed:@"10@2x"];
        
        [cell addSubview:imagebg1];
        UILabel *lblname=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+20, 10, 300, 20)];
        lblname.text=self.cinemaDic[@"name"];
        
        lblname.font=[UIFont systemFontOfSize:14];
        [cell addSubview:lblname];
        
        UILabel *lbladdress=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+5, 25, 200, 40)];
        lbladdress.numberOfLines=2;
        NSString *address=[NSString stringWithFormat:@" %@",self.cinemaDic[@"address"]];
        lbladdress.text=address;
        lbladdress.font=[UIFont systemFontOfSize:11];
        lbladdress.alpha=0.7;
        [cell addSubview:lbladdress];
    }
     else if (indexPath.row==4) {
         UIImageView *imagebg1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
         imagebg1.image=[UIImage imageNamed:@"9@2x"];
         
         [cell addSubview:imagebg1];
         UILabel *lblname=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+20, 10, 300, 20)];
         lblname.text=self.cinemaDic[@"name"];
         
         lblname.font=[UIFont systemFontOfSize:14];
         [cell addSubview:lblname];
         
         UILabel *lbladdress=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+5, 25, 200, 40)];
         lbladdress.numberOfLines=2;
         NSString *address=[NSString stringWithFormat:@" %@",self.cinemaDic[@"address"]];
         lbladdress.text=address;
         lbladdress.font=[UIFont systemFontOfSize:11];
         lbladdress.alpha=0.7;
         [cell addSubview:lbladdress];
    }
     else if (indexPath.row==5) {
         UIImageView *imagebg1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
         imagebg1.image=[UIImage imageNamed:@"14@2x"];
         
         [cell addSubview:imagebg1];
         UILabel *lblname=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+20, 10, 300, 20)];
         lblname.text=self.cinemaDic[@"name"];
         
         lblname.font=[UIFont systemFontOfSize:14];
         [cell addSubview:lblname];
         
         UILabel *lbladdress=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+5, 25, 200, 40)];
         lbladdress.numberOfLines=2;
         NSString *address=[NSString stringWithFormat:@" %@",self.cinemaDic[@"address"]];
         lbladdress.text=address;
         lbladdress.font=[UIFont systemFontOfSize:11];
         lbladdress.alpha=0.7;
         [cell addSubview:lbladdress];
     }
     else if (indexPath.row==6) {
         UIImageView *imagebg1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
         imagebg1.image=[UIImage imageNamed:@"15@2x"];
         
         [cell addSubview:imagebg1];
         UILabel *lblname=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+20, 10, 300, 20)];
         lblname.text=self.cinemaDic[@"name"];
         
         lblname.font=[UIFont systemFontOfSize:14];
         [cell addSubview:lblname];
         
         UILabel *lbladdress=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+5, 25, 200, 40)];
         lbladdress.numberOfLines=2;
         NSString *address=[NSString stringWithFormat:@" %@",self.cinemaDic[@"address"]];
         lbladdress.text=address;
         lbladdress.font=[UIFont systemFontOfSize:11];
         lbladdress.alpha=0.7;
         [cell addSubview:lbladdress];
     }
     else{
    UIImageView *imagebg1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    imagebg1.image=[UIImage imageNamed:@"7@2x"];
    
    [cell addSubview:imagebg1];
    UILabel *lblname=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+20, 10, 300, 20)];
    lblname.text=self.cinemaDic[@"name"];
    
    lblname.font=[UIFont systemFontOfSize:14];
    [cell addSubview:lblname];
    
    UILabel *lbladdress=[[UILabel alloc] initWithFrame:CGRectMake(imagebg1.right+5, 25, 200, 40)];
    lbladdress.numberOfLines=2;
    NSString *address=[NSString stringWithFormat:@" %@",self.cinemaDic[@"address"]];
    lbladdress.text=address;
    lbladdress.font=[UIFont systemFontOfSize:11];
    lbladdress.alpha=0.7;
    [cell addSubview:lbladdress];
     }
    
    return  cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (indexPath.row == 0) {
    //        return 150;
    //    } else {
    //        return 120;
    //    }
    return 120;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
