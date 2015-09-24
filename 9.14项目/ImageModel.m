//
//  ImageModel.m
//  NOARc
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
// 01 重写初始化方法
//- (id)initWithContentDic:(NSDictionary *)dic
//{
//    self = [super initWithContentDic:dic];
//    if (self) {
//        // 把没有映射的手动写入
//        self.imageId = dic[@"id"];
//    }
//    return self;
//}

// 02 重写夫类映射关系的方法
// 创建映射关系
- (NSDictionary *)valueAndKeyWithContentDic:(NSDictionary *)dic
{
    return @{@"id":@"imageId",
             @"image":@"image",
             @"type":@"type"};
}

@end
