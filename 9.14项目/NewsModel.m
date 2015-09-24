//
//  NewsModel.m
//  NOARc
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
- (instancetype)initWithContentDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        // 把字典中的参数设置到属性上
        self.newsId = dic[@"id"];
        self.type = dic[@"type"];
        self.imageUrl = dic[@"image"];
        self.summary = dic[@"summary"];
        self.title = dic[@"title"];
    }
    return self;
}

@end
