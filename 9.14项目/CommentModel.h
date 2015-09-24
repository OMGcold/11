//
//  CommentModel.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/18.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "BaseModel.h"

@interface CommentModel : BaseModel
@property (nonatomic ,copy) NSString *userImage;
@property (nonatomic ,copy) NSString *nickname;
@property (nonatomic ,copy) NSString *rating;
@property (nonatomic ,copy) NSString *content;
@end
