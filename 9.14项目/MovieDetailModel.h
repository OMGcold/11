//
//  MovieDetailModel.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/18.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "BaseModel.h"

@interface MovieDetailModel : BaseModel
@property (nonatomic ,copy) NSString *image;
@property (nonatomic ,copy) NSString *titleCn;
@property (nonatomic ,copy) NSString *titleEn;
@property (nonatomic ,copy) NSString *rating;
@property (nonatomic ,copy) NSString *year;
@property (nonatomic ,copy) NSString *content;
@property (nonatomic ,retain) NSArray *type;
@property (nonatomic ,retain) NSArray *directors;
@property (nonatomic ,retain) NSArray *actors;
@property (nonatomic ,copy) NSString *url;
@property (nonatomic ,copy) NSString *locationDate;
@property (nonatomic ,copy) NSNumber *imageCount;
@property (nonatomic ,retain) NSArray *images;
@property (nonatomic ,copy) NSNumber *videoCount;
@property (nonatomic ,retain) NSArray *videos;
@property (nonatomic ,copy) NSNumber *personCount;

@property(nonatomic,copy)NSString *mp4;

// 自定义初始化方法
- (instancetype)initWithContentOfDic:(NSDictionary *)contentDic;
@end
