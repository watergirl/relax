//
//  TuWanVideoModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanVideoModel1.h"

@implementation TuWanVideoModel1


+ (NSDictionary *)objectClassInArray{
    return @{@"content" : [TuWanVideoContentModel1 class], @"relevant" : [TuWanVideoRelevantModel1 class]};
}
@end
@implementation TuWanVideoContentModel1

@end


@implementation TuWanVideoRelevantModel1

@end


