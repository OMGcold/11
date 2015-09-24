//
//  CommentCell.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/18.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
@interface CommentCell : UITableViewCell
{
     UIImageView *_userImageView;
     UILabel *_nickNameLabel;
    
     UILabel *_contentLabel;
    
     UILabel *_ratingLabel;
    
     UIImageView *_bgImageView;
}
@property (nonatomic ,retain)CommentModel *model;
@end
