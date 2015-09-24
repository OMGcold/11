//
//  ImageNewsViewController.h
//  NOARc
//
//  Created by 齐鸣宇 on 15/9/9.
//  Copyright (c) 2015年 SXJY. All rights reserved.
//

#import "BaseViewController.h"

@interface ImageNewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}

@property (nonatomic ,retain) NSArray *dataList;
@property (nonatomic ,retain) NSArray *imageModels;


@end
