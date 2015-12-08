//
//  InteretingStoryModel.m
//  BaseProject
//
//  Created by ios－32 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InteretingStoryModel.h"

@implementation InteretingStoryModel
+(NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    
    if ([propertyName isEqualToString:@"anewCount"]) {
        return @"new_count";
    }
    
    return [propertyName underlineFromCamel];
}
+(NSDictionary *)objectClassInArray
{
    return @{@"items":[InteretingStoryItemModel class]};
}
@end

@implementation InteretingStoryLuaVersionsModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"fiveSix":@"56"};
}

@end

@implementation InteretingStoryItemModel

+(NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    return [propertyName underlineFromCamel];
}
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"updateTime":@"update_time"};
}

@end

//