//
//  MoreViewController.h
//  NOARc
//
//  Created by 齐鸣宇 on 15/9/8.
//  Copyright (c) 2015年 SXJY. All rights reserved.
//

#import "BaseViewController.h"

@interface MoreViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UITableView *_tableView;
    
}
@property (nonatomic , retain) NSArray *imageNames;
@property (nonatomic , retain) NSArray *titles;

@end
