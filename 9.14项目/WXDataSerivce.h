//
//  WXDataSerivce.h
//  WXMovie
//
//  Created by 齐鸣宇 on 15/4/8.
//  Copyright (c) 2015年 齐鸣宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXDataSerivce : NSObject
/*
 参数： fileName本地文件的名字
 返回值：json解析成功的数据
 使用： 通过文件的名字直接解析成数组或字典的对象
 */
+ (id)getJSONDataWithFileName:(NSString *)fileName;



@end
