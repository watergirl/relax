//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _start += 11;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [TuWanNetManager getBeautifulGirlWithstart:_start completionHandle:^(TuWanModel *model, NSError *error) {
                [self.dataArr removeAllObjects];
        
                [self.dataArr addObjectsFromArray:model.data.list];
        
                completionHandle(error);
    }];
}
- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (TuWanDataIndexpicModel *)modelForArr:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}

/** 当前数据类型是图片 pic*/
- (BOOL)isPicInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"pic"];
}
/** 返回某行数据的Aid */
- (NSString *)aidInListForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].aid;
}


@end












