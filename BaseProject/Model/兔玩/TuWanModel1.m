//
//  TuWanModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanModel1.h"

@implementation TuWanModel1

@end

@implementation TuWanDataModel1

+ (NSDictionary *)objectClassInArray{
    return @{@"indexpic" : [TuWanDataIndexpicModel1 class], @"list" : [TuWanDataIndexpicModel1 class]};
}

@end


@implementation TuWanDataIndexpicModel1

+ (NSDictionary *)objectClassInArray{
    return @{@"showitem" : [TuWanDataIndexpicShowitemModel1 class]};
}

@end


@implementation TuWanDataIndexpicInfochildModel1

@end


@implementation TuWanDataIndexpicShowitemModel1

@end


@implementation TuWanDataIndexpicShowitemInfoModel1

@end


