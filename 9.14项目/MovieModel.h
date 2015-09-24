//
//  MovieModel.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/15.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject
@property (nonatomic ,assign) float scoreNum;       // 电影评分
@property (nonatomic ,copy) NSString *image_small;    // 海报图片（小）
@property (nonatomic ,copy) NSString *image_medium;   // 海报图片（中）
@property (nonatomic ,copy) NSString *image_large;    // 海报图片（大）
@property (nonatomic ,copy) NSString *title;          // 电影标题
@property (nonatomic ,copy) NSString *subtype;        // 电影类型
@property (nonatomic ,copy) NSString *year;               // 电影年份
@property (nonatomic ,copy) NSString *original_title; // 英文标题

// 自定义初始化方法
- (instancetype)initWithContentOfDic:(NSDictionary *)contentDic;

@end
