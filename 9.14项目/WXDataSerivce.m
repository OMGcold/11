//
//  WXDataSerivce.m
//  WXMovie
//
//  Created by 齐鸣宇 on 15/4/8.
//  Copyright (c) 2015年 齐鸣宇. All rights reserved.
//

#import "WXDataSerivce.h"

@implementation WXDataSerivce
+(id)getJSONDataWithFileName:(NSString *)fileName
{
//    获取文件路径
    NSString *filePath = [[NSBundle mainBundle]pathForResource:fileName ofType:@"json"];
//    获取文件内容
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
//    使用系统的jsong格式解析
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    return result;
    
    
}
@end
