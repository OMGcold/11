//
//  CinemaDetailCell.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/20.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "CinemaDetailCell.h"

@implementation CinemaDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.创建子视图
        [self _initViews];
//        [self layoutSubviews];
        // 2.设置背景为透明的
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = nil;
    }
    return self;
}
-(void)_initViews
{
    _image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
    [self.contentView addSubview:_image];
    _id=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    _id.textColor=[UIColor orangeColor];
    [self.contentView addSubview:_id ];
    _title=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    [self.contentView addSubview:_title ];
    _releaseData=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    [self.contentView addSubview:_releaseData ];
    _type=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    [self.contentView addSubview:_type ];
    _director=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    [self.contentView addSubview:_director ];
    _wantedCount=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    [self.contentView addSubview:_wantedCount ];
}
//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    NSLog(@"1111%@",self.dic);
//    NSString *image=self.dic[@"image"];
//    [_image sd_setImageWithURL:[NSURL URLWithString:image]];
//    _id.text=self.dic[@"id"];
//    NSLog(@"+++++%@",self.dic[@"id"]);
//
//    
//    _title.text=self.dic[@"title"];
//    _releaseData.text=self.dic[@"releaseDate"];
//    _type.text=self.dic[@"type"];
//    _director.text=self.dic[@"director"];
//    _wantedCount.text=self.dic[@"wantCount"];
//    
//}

//-(void)drawRect:(CGRect)rect{
//    NSLog(@"1111%@",self.dic);
//////    NSString *image=self.dic[@"image"];
//    [_image sd_setImageWithURL:[NSURL URLWithString:self.dic[@"image"]]];
//    if ([self.dic[@"id"] isEqual:[NSNull null]])
//    {
//        //判断是否为空
//    }
//    else{
//        _id.text=self.dic[@"id"];
//    }
////    _id.text=self.dic[@"id"];
//    NSLog(@"+++++%@",self.dic[@"id"]);
    
    
//    _title.text=self.dic[@"title"];
//    _releaseData.text=self.dic[@"releaseDate"];
//    _type.text=self.dic[@"type"];
//    _director.text=self.dic[@"director"];
//    _wantedCount.text=self.dic[@"wantCount"];
//}

//- (void)setDic:(NSDictionary *)dic {
//    
//    NSLog(@"%@",dic);
//    _dic=dic;
//    NSLog(@"1111%@",self.dic);
//    NSString *image=self.dic[@"image"];
//    [_image sd_setImageWithURL:[NSURL URLWithString:image]];
//    _id.text=self.dic[@"id"];
//    NSLog(@"+++++%@",self.dic[@"id"]);
//    
//    
//    //    _title.text=self.dic[@"title"];
//    //    _releaseData.text=self.dic[@"releaseDate"];
//    //    _type.text=self.dic[@"type"];
//    //    _director.text=self.dic[@"director"];
//    //    _wantedCount.text=self.dic[@"wantCount"];
//}

@end
