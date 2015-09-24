//
//  MovieDetailModel.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/18.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "MovieDetailModel.h"

@implementation MovieDetailModel

- (id)initWithContentDic:(NSDictionary *)dic
{
    self = [super initWithContentDic:dic];
    if (self) {
        // 手动写入
        self.locationDate = [NSString stringWithFormat:@"%@ %@",dic[@"release"][@"location"],dic[@"release"][@"date"]];
    }
    
    return self;
}
-(instancetype)initWithContentOfDic:(NSDictionary *)contentDic
{
    self=[super init];
    if (self) {
        self.mp4=contentDic[@"videos"][@"url"];
    }
    return self;
}
@end
