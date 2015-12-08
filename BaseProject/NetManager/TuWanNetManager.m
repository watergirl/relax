//
//  TuWanNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanNetManager.h"



#define kBeautifulGirlPath @"http://cache.tuwan.com/app/"

#define kBeautifulGirlPicPath @"http://api.tuwan.com/app/"



@implementation TuWanNetManager

+ (id)getBeautifulGirlWithstart:(NSInteger)start kCompletionHandle{

    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"appid":@(1),@"class":@"heronews",@"mod":@"美女",@"classmore":@"indexpic",@"typechild":@"cos1",@"appid":@(1),@"appver":@(2.1),@"start":@(start)}];

    NSString *path = [self percentPathWithPath:kBeautifulGirlPath params:params];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuWanModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getPicDetailWithId:(NSString *)aid kCompletionHandle{
    return [self GET:[self percentPathWithPath:kBeautifulGirlPicPath params:@{@"appid":@(1), @"aid": aid}] parameters:nil completionHandler:^(id responseObj, NSError *error) {
        //这里一定要用firstObj方法来取，不能用[0]。 如果数组为空  第一种不会崩溃，值为nil。  第二种会数组越界
        completionHandle([TuWanPicModel objectArrayWithKeyValuesArray:responseObj].firstObject, error);
    }];
}

@end
















