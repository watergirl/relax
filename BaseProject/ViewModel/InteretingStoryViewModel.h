//
//  InteretingStoryViewModel.h
//  BaseProject
//
//  Created by ios－31 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "InteretingStoryNetManager.h"
@interface InteretingStoryViewModel : BaseViewModel

@property (nonatomic)NSInteger  rowNumber;
@property (nonatomic,assign)NSInteger page;
@property (nonatomic,assign)NSInteger size;
@property (nonatomic,strong)NSString * PathNSString;
-(NSString *)likesForRow:(NSInteger)row;
-(NSString *)wbodyForRow:(NSInteger)row;
-(NSString *)commentsForRow:(NSInteger)row;
-(NSString *)update_timeForRow:(NSInteger)row;


@end
