//
//  InterestingImageModel.m
//  BaseProject
//
//  Created by ios－32 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InterestingImageModel.h"

@implementation InterestingImageModel
+(NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    
    if ([propertyName isEqualToString:@"anewCount"]) {
        return @"new_count";
    }
    
    return [propertyName underlineFromCamel];
}
+(NSDictionary *)objectClassInArray
{
    return @{@"items":[InterestingImageItemsModel class]};
}
@end

@implementation InterestingImageLuaVersionsModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"fiveSix":@"56"};
}
@end


@implementation InterestingImageItemsModel

+(NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    return [propertyName underlineFromCamel];
}



@end


