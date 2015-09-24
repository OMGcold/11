//
//  Tablecell.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/19.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tablecell : UITableView<UITableViewDataSource,UITableViewDelegate>
//表视图所要现实的数据
@property(nonatomic,retain)NSArray *dataList;

@end
