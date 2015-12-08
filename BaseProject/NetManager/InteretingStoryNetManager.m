//
//  InteretingStoryNetManager.m
//  BaseProject
//
//  Created by ios－31 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InteretingStoryNetManager.h"

@implementation InteretingStoryNetManager
+(id)getPage:(NSInteger)page size:(NSInteger)size NSString:(NSString *)PathNSString completetionHandle:(void (^)(InteretingStoryModel * model, NSError * error))compleretionHandle
{
   NSString * path = [NSString stringWithFormat:@"http://120.55.151.67/weibofun/weibo_list.php?apiver=10701&category=weibo_jokes&page=%@&page_size=%@&max_timestamp=%@platform=iphone&appver=1.9&buildver=1.9.4&udid=D76910CC-84AA-40C3-882F-301907C588E2&sysver=8.3",@(page),@(size),PathNSString];
    return  [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        compleretionHandle([InteretingStoryModel objectWithKeyValues:responseObj],error);
    }];
    
    
    
}
@end
