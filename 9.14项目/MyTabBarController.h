//
//  MyTabBarController.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarController : UIButton

@property (strong,nonatomic)UIImageView * myTitleImageView;
@property (strong,nonatomic)UILabel * myTitlelabel;
@property (copy,nonatomic)NSString * titleName;
@property (copy,nonatomic)NSString * imageName;

@end
