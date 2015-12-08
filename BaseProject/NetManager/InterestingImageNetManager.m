//
//  InterestingImageNetManager.m
//  BaseProject
//
//  Created by ios－31 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InterestingImageNetManager.h"
#import "InterestingImageModel.h"
@implementation InterestingImageNetManager
+(id)Getpage:(NSInteger)page Size:(NSInteger)size NsstringPath:(NSString *)path completetionHandle:(void (^)(InterestingImageModel * model, NSError *error))compleretionHandle
{
    NSString * pathp =[NSString stringWithFormat:@"http://120.55.151.67/weibofun/weibo_list.php?apiver=10701&category=weibo_pics&page=%@&page_size=%@&max_timestamp=%@&platform=iphone&appver=1.9&buildver=1.9.4&udid=D76910CC-84AA-40C3-882F-301907C588E2&sysver=8.3",@(page),@(size),path];
   return  [self GET:pathp parameters:nil completionHandler:^(id responseObj, NSError *error) {
        compleretionHandle([InterestingImageModel objectWithKeyValues:responseObj],error);
    }];
    
}
    

@end
