//
//  TopModel.m
//  NOARc
//
//  Created by 齐鸣宇 on 15/9/9.
//  Copyright (c) 2015年 SXJY. All rights reserved.
//

#import "TopModel.h"

@implementation TopModel
- (instancetype)initWithContentOfDic:(NSDictionary *)contentDic
{
    self = [super init];
    if (self) {
        // 把内容写入到内部
        self.scoreNum = [contentDic[@"rating"][@"average"] floatValue];
        self.image_small = contentDic[@"images"][@"small"];
        self.image_medium = contentDic[@"images"][@"medium"];
        self.image_large = contentDic[@"images"][@"large"];
        self.title = contentDic[@"title"];
        self.subtype = contentDic[@"subtype"];
        self.year = contentDic[@"year"];
        self.original_title = contentDic[@"original_title"];
        
    }
    return self;
}


@end
