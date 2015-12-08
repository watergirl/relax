//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanViewModel : BaseViewModel
@property(nonatomic) NSInteger rowNumber;
@property(nonatomic) NSInteger start;
/** 当前数据类型是图片 pic*/
- (BOOL)isPicInListForRow:(NSInteger)row;
/** 返回某行数据的Aid */
- (NSString *)aidInListForRow:(NSInteger)row;
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle;
@end












