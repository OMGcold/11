//
//  ListTableView.h
//  9.14项目
//
//  Created by 15751159097 on 15/9/14.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListCell.h"
@interface ListTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
//表视图所要现实的数据
@property (strong,nonatomic)NSArray * dataList;
@end
