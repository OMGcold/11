//
//  NewsModel.h
//  NOARc
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
@property (nonatomic ,copy) NSNumber *newsId;
@property (nonatomic ,copy) NSNumber *type;
@property (nonatomic ,copy) NSString *imageUrl;
@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *summary;


- (instancetype)initWithContentDic:(NSDictionary *)dic;
@end
