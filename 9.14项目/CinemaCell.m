//
//  CinemaCell.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/19.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "CinemaCell.h"
#import "MoreViewController.h"
@implementation CinemaCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.创建子视图
        [self _initViews];
        [self layoutSubviews];
        // 2.设置背景为透明的
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = nil;
    }
    return self;
}
-(void)_initViews
{
    _name=[[UILabel alloc]initWithFrame:CGRectMake(120, 0, 150, 30)];
    _name.textColor=[UIColor orangeColor];
    [self.contentView addSubview:_name];
    _circleName=[[UILabel alloc]initWithFrame:CGRectMake(280, 0, 50, 30)];
    [self.contentView addSubview:_circleName];
    _address=[[UILabel alloc]initWithFrame:CGRectMake(120, 25, 250, 20)];
    [self.contentView addSubview:_address];
    _image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
    [self.contentView addSubview:_image];
    _ratingView = [[WXRatingView alloc] initWithFrame:CGRectMake(120, 50, 100, 25)];
    [self.contentView addSubview:_ratingView];
    
    _tel=[[UILabel alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:_tel];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
//    _name.frame = CGRectMake(10, 15, kScreenWidth - 100, 20);
//    _name.text = self.model.name;
//    
//    _circleName.frame = CGRectMake(10, 15, kScreenWidth - 100, 20);
//    _circleName.text = self.model.circleName;
//    
//    _address.frame = CGRectMake(10, 15, kScreenWidth - 100, 20);
//    _address.text = self.model.address;
//    
//    _lowPrice.frame = CGRectMake(10, 15, kScreenWidth - 100, 20);
//    _lowPrice.text = self.model.lowPrice;
//    
//    _ratingView.scoreNum=self.model.scoreNum;
//    
//    _tel.frame = CGRectMake(10, 15, kScreenWidth - 100, 20);
//    _tel.text = self.model.tel;
    
      _name.text=self.dic[@"name"];
    _circleName.textColor=[UIColor orangeColor];
     if ([self.dic[@"id"] isEqual:[NSNull null]])
     {
         //判断是否为空
     }
     else{
             _circleName.text=self.dic[@"id"];
     }
      _address.text=self.dic[@"highlight"];
    NSString *image=self.dic[@"logo"];
    [_image sd_setImageWithURL:[NSURL URLWithString:image]];
      _ratingView.scoreNum=[self.dic[@"grade"]floatValue ];
    //      _lowPrice.text=self.dic[@"id"];
}

//- (void)setDic:(NSDictionary *)dic {
//    
//    if (_dic != dic) {
//        [_dic release];
//        _dic = [dic retain];
//        
//        _name.text=self.dic[@"name"];
//        _name. textColor = [UIColor redColor];
//        NSLog(@"%@",_name.text);
//        
//        
//        _circleName.text=self.dic[@"circleName"];
//        _address.text=self.dic[@"cinemaList"][@"address"];
//        _lowPrice.text=self.dic[@"cinemaList"][@"lowPrice"];
//        _ratingView.scoreNum=[self.dic[@"cinemaList"][@"grade"]floatValue ];
//    }
//    
//}
@end
