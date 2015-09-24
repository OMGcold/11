//
//  CinemaModel.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/19.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaModel : NSObject
@property (nonatomic ,copy) NSNumber *lowPrice;
@property (nonatomic ,assign)float scoreNum;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *address;
@property (nonatomic ,copy) NSString *tel;
@property (nonatomic ,copy) NSString *circleName;


- (instancetype)initWithContentDic:(NSDictionary *)dic;
@end
