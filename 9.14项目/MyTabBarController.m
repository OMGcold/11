//
//  MyTabBarController.m
//  9.14项目
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "MyTabBarController.h"

@implementation MyTabBarController

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //        创建子视图
        //       1 创建图片视图
        _myTitleImageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 22) / 2.0, 7, 22, 20)];
        _myTitleImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_myTitleImageView];
        
        //  2 创建文本
        _myTitlelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 28, frame.size.width, 20)];
        _myTitlelabel.font = [UIFont systemFontOfSize:10];
        _myTitlelabel.textColor= [UIColor whiteColor];
        _myTitlelabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_myTitlelabel];
        
        
    }return self;
}
//set方法赋值
-(void)setTitleName:(NSString *)titleName{
    if (_titleName != titleName) {
        [_titleName release];
        _titleName = [titleName copy];
        _myTitlelabel.text = _titleName;
        
        
    }
}
-(void)setImageName:(NSString *)imageName{
    if (_imageName != imageName) {
        [_imageName release];
        _imageName = [imageName copy];
        _myTitleImageView.image = [UIImage imageNamed:_imageName];
        
    }
}

@end
