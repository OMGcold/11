//
//  ImageNewsCell.m
//  NOARc
//
//  Created by 赵宇飞 on 15/9/9.
//  Copyright (c) 2015年 赵宇飞. All rights reserved.
//

#import "ImageNewsCell.h"
#import "ImageModel.h"
#import "AlbumViewController.h"
#import    "UIView+ViewController.h"
@implementation ImageNewsCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 创建子视图
        float imageWidth = (kScreenWidth - 5 * 10) / 4.0;
        
        for (int i = 0; i < 4; i++) {
            // 创建图片视图
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 + i * (imageWidth + 10), 5, imageWidth, imageWidth)];
            // 设置tag
            imageView.tag = 100 + i;
            // 添加到当前的单元格上
            [self.contentView addSubview:imageView];
            // 释放
            [imageView release];
            // ------给图片视图添加事件------
            // 01 图片视图需要支持事件
            imageView.userInteractionEnabled = YES;
            // 02 创建点击手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            [imageView addGestureRecognizer:tap];
            [tap release];
            
        }
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 隐藏所有的图片视图
    for (int i = 0; i < 4; i++) {
        UIImageView *imageView = (UIImageView *)[self.contentView viewWithTag:100 + i];
        // 隐藏
        imageView.hidden = YES;
    }
    
    // 获取所有的图片视图
    for (int i = 0; i < self.array2d.count; i++) {
        // 01 获取当前数据对应的视图
        UIImageView *imageView = (UIImageView *)[self.contentView viewWithTag:100 + i];
        // 有内容就显示该视图
        imageView.hidden = NO;
        // 设置图片（获取当前图片的数据模型对象）
        ImageModel *model = self.array2d[i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
#pragma mark - 图片的点击事件
- (void)tapAction:(UITapGestureRecognizer *)tap
{
    // 执行PUSH到另一个视图控制器
    /*
     要现实图片效果必须要两个参数
     1.图片的索引位置
     2.所有图片的数据
     */
    
    // 1.创建相册控制器
    AlbumViewController *albumVC = [[AlbumViewController alloc] init];
    
    // 2.设置相册控制器连个必须给的参数
    // 01 设置我们所点击图片的位置
    // 当前单元格图片的位置
    int imageView_index = (int)tap.view.tag - 100;
    albumVC.selectedIndex = self.rowIndex * 4 + imageView_index;
    
    // 02 把图片的数组给相册控制器
    /*
     1.因为相册这个页面可能被多次使用
     2.相册所需要的主要数据就是图片的地址
     3.当前我们要是把imageModel的数组传过去两个类之间的关系太紧密
     */
    // 创建一个可变的数组，存放所有图片地址
    NSMutableArray *imageUrls = [NSMutableArray array];
    for (int i = 0; i < self.dataList.count; i++) {
        // 读取数组中的model
        ImageModel *model = self.dataList[i];
        [imageUrls addObject:model.image];
    }
    
    albumVC.dataList = imageUrls;
    
    // 2.创建一个导航控制器，包含相册控制器
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:albumVC];
    navCtrl.navigationBar.barStyle = UIBarStyleBlack;
    
    // 2.跳转到相册控制器
    
    [self.ViewController presentViewController:navCtrl animated:YES completion:nil];
    
    
}


@end
