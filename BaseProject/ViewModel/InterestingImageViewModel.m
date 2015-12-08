//
//  InterestingImageViewModel.m
//  BaseProject
//
//  Created by ios－31 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InterestingImageViewModel.h"
#import "InterestingImageViewModel.h"
@implementation InterestingImageViewModel

-(InterestingImageItemsModel *)InterestingImageItemsrow:(NSInteger )row
{
    return self.dataArr[row];
}
-(NSString *)wbodyForRow:(NSInteger)row//照片标题

{
    return  [self InterestingImageItemsrow:row].wbody;
}
//喜欢个数
-(NSString *)LikesForRow:(NSInteger)row
{
    return [self InterestingImageItemsrow:row].likes;
}
-(NSString *)heightForRow:(NSInteger)row
{
    return [self InterestingImageItemsrow:row].wpicMHeight;
}
-(NSString *)widthForRow:(NSInteger)row
{
    return  [self InterestingImageItemsrow:row].wpicMWidth;
}
//评论数
-(NSString *)commentsForRow:(NSInteger)row
{
    return [self InterestingImageItemsrow:row].comments;
}
//图片
-(NSURL *)iconForRow:(NSInteger)row
{
    return  [NSURL URLWithString:[self InterestingImageItemsrow:row].wpicMiddle];
    
}


-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page+=1;
    _size =15;
    
    InterestingImageItemsModel *model = self.dataArr.lastObject;
    _PathNSString = model.updateTime;
    _PathNSString = [_PathNSString stringByAppendingString:@"&latest_viewed_ts=-1"];
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [InterestingImageNetManager Getpage:_page Size:_size NsstringPath:_PathNSString completetionHandle:^(InterestingImageModel *model, NSError *error) {
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
    _PathNSString = @"-1&latest_viewed_ts=1446719400";
    [self getDataFromNetCompleteHandle:completionHandle];
}


@end
