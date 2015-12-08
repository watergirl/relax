//
//  InteretingStoryViewModel.m
//  BaseProject
//
//  Created by ios－31 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InteretingStoryViewModel.h"

@implementation InteretingStoryViewModel

-(InteretingStoryItemModel *)InteretingStoryItemNetManagerForRow:(NSInteger)row
{  
    return self.dataArr[row];
}
-(NSString *)likesForRow:(NSInteger)row
{

    return [self InteretingStoryItemNetManagerForRow:row].likes;
}
-(NSString *)wbodyForRow:(NSInteger)row
{
     
    return  [self InteretingStoryItemNetManagerForRow:row].wbody;
}
-(NSString *)commentsForRow:(NSInteger)row
{
    return  [self InteretingStoryItemNetManagerForRow:row].comments;
}
-(NSString *)update_timeForRow:(NSInteger)row
{
    return [self InteretingStoryItemNetManagerForRow:row].updateTime;
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
 
    _page +=1;
    _size = 15;
 
    InteretingStoryItemModel *model = (InteretingStoryItemModel *)self.dataArr.lastObject;
    _PathNSString = model.updateTime;
    _PathNSString = [_PathNSString stringByAppendingString:@"&latest_viewed_ts=-1"];
      [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [InteretingStoryNetManager getPage:_page size:_size NSString:_PathNSString completetionHandle:^(InteretingStoryModel *model, NSError *error) {
        if(_page ==0)
        {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.items];
        completionHandle(error);
    
    }];
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{

    _page = 0;
    _size = 30;
    _PathNSString = [NSString stringWithFormat:@"latest_viewed_ts=1446719040"];
    [self getDataFromNetCompleteHandle:completionHandle];
    
}


@end
