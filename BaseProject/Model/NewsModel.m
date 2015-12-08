//
//  NewsModel.m
//  BaseProject
//
//  Created by iOS－30 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel





+ (NSDictionary *)objectClassInArray{
    return @{@"adIntro" : [NewsAdintroModel class], @"itemList" : [NewsItemlistModel class]};
}
@end


@implementation NewsAdintroModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"id":@"ID"};
}

+(NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    return [propertyName underlineFromCamel];
}
@end


@implementation NewsItemlistModel

+ (NSDictionary *)objectClassInArray{
    return @{@"stdImage" : [NewsItemListStdimageModel class]};
}
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"id":@"Id",@"desc":@"description"};
}

@end


@implementation NewsItemListStdimageModel
+(NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    return [propertyName underlineFromCamel];
}

@end


