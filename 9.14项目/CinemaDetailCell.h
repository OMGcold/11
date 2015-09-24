//
//  CinemaDetailCell.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/20.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaDetailCell : UITableViewCell

{
    UIImageView *_image;
    UILabel *_id;
    UILabel *_title;
    UILabel *_releaseData;
    UILabel *_type;
    UILabel *_director;
    UILabel *_wantedCount;
}

@property (nonatomic,retain)NSDictionary *dic;
@end
