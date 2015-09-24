//
//  MovieModel.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/15.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel

-(instancetype)initWithContentOfDic:(NSDictionary *)contentDic
{
    self=[super init];
    if (self) {
        self.scoreNum=[contentDic[@"subject"][@"rating"][@"average"]floatValue];
        self.image_small=contentDic[@"subject"][@"images"][@"small"];
        self.image_medium=contentDic[@"subject"][@"images"][@"medium"];
        self.image_large=contentDic[@"subject"][@"images"][@"large"];
        self.title=contentDic[@"subject"][@"title"];
        self.subtype=contentDic[@"subject"][@"subtype"];
        self.year=contentDic[@"subject"][@"year"];
        self.original_title=contentDic[@"subject"][@"original_title"];
    }
    return self;
}
@end
