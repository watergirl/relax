//
//  NewsNetModel.m
//  BaseProject
//
//  Created by iOS－30 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsNetModel.h"
#define kNewsPath   @"http://app.bjnews.com.cn/m/json/%@.json"
@implementation NewsNetModel
+ (id)getNewsType:(NewsType)type completionHandle:(void (^)(NewsModel *, NSError *))completionHandle
{
    NSString *path = nil;
    switch (type) {
        case NewsTypeFocus:
            path = [NSString stringWithFormat:kNewsPath,@"focus"];
            break;
        case NewsTypeRealtime:
             path = [NSString stringWithFormat:kNewsPath,@"realtime"];
            break;
        case NewsTypeFeatures:
             path = [NSString stringWithFormat:kNewsPath,@"features"];
            break;
        case NewsTypeFinance:
             path = [NSString stringWithFormat:kNewsPath,@"finance"];
            break;
        case NewsTypeEnt:
             path = [NSString stringWithFormat:kNewsPath,@"ent"];
            break;
        case NewsTypeInfographic:
             path = [NSString stringWithFormat:kNewsPath,@"infographic"];
            break;
        case NewsTypeLivenews:
             path = [NSString stringWithFormat:kNewsPath,@"livenews"];
            break;
        case NewsTypeZhengshi:
             path = [NSString stringWithFormat:kNewsPath,@"zhengshi_test"];
            break;
        case NewsTypeBook:
             path = [NSString stringWithFormat:kNewsPath,@"book"];
            break;
        case NewsTypeOpinion:
             path = [NSString stringWithFormat:kNewsPath,@"opinion"];
            break;
        case NewsTypeXjbjzd:
             path = [NSString stringWithFormat:kNewsPath,@"Xjbjzd"];
            break;
        case NewsTypeBeijingHouse:
             path = [NSString stringWithFormat:kNewsPath,@"beijing_house"];
            break;
        case NewsTypeXjbcmyj:
             path = [NSString stringWithFormat:kNewsPath,@"xjbcmyj"];
            break;
        case NewsTypeXjbmaker:
             path = [NSString stringWithFormat:kNewsPath,@"xjbmaker"];
            break;
        case NewsTypeXjbxinshipin:
             path = [NSString stringWithFormat:kNewsPath,@"xjbxinshipin"];
            break;
        case NewsTypeXjbs:
             path = [NSString stringWithFormat:kNewsPath,@"xjb-sports"];
            break;
        case NewsTypeBeijingnews2003:
            path = [NSString stringWithFormat:kNewsPath,@"beijingnews2003"];
            break;
        case NewsTypeXjbxuejie:
            path = [NSString stringWithFormat:kNewsPath,@"xjbxuejie"];
            break;
        case NewsTypeXjbjiangkang:
            path = [NSString stringWithFormat:kNewsPath,@"xjbjiangkang"];
            break;

        default:
            break;
    }
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([NewsModel objectWithKeyValues:responseObj],error);
    }];
}
@end
