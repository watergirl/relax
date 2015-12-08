//
//  NewsViewModel.m
//  BaseProject
//
//  Created by iOS－30 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsViewModel.h"
#import "NewsNetModel.h"
@implementation NewsViewModel

- (instancetype)initWithNewsModel:(NewsModel *)model
{
    if (self = [super init]) {
        _model = model;
    }
    return self;
}
-(NSMutableArray *)headImgUrl
{
    if (!_headImgUrl) {
        _headImgUrl = [NSMutableArray new];
    }
    return _headImgUrl;
}

//预防性编程，防止没有使用initWithType初始化
- (id)init{
    if (self = [super init]) {
        //如果使用此方法初始化，那么崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __func__);
    }
    return self;
}
- (instancetype)initWithNewsType:(NewsType)type
{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

- (NSInteger)rowNumber
{
    return self.dataArr.count;
}

-(NSInteger)indexPicNumber
{
    return self.headImgUrl.count;
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [NewsNetModel getNewsType:_type completionHandle:^(NewsModel *model, NSError *error) {
        if (!error) {
            [self.dataArr removeAllObjects];
            [self.headImgUrl removeAllObjects];
            [self.dataArr addObjectsFromArray:model.itemList];
            [self.dataArr removeObjectAtIndex:0];
            [self.headImgUrl addObject:model.itemList[0]];
            [self.headImgUrl addObjectsFromArray:model.adIntro];
        }
        completionHandle(error);
    }];
}
- (NewsItemlistModel *)NewsItemListModelForRow:(NSInteger)row
{
    return self.dataArr[row];
}

//某行的图片
- (NSURL *)coverImgURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self NewsItemListModelForRow:row].coverImg];
}
/** 某行的标题 */
- (NSString *)titleForRow:(NSInteger)row
{
    return [self NewsItemListModelForRow:row].title;
}
/** 某行的详情 */
- (NSString *)descForRow:(NSInteger)row
{
    return [self NewsItemListModelForRow:row].desc;
}

/** 滚动展示栏的图片 */
- (NSURL *)iconURLForRowInIndexPic:(NSInteger)row
{

    if (row == 0) {
        NewsItemlistModel * list = (NewsItemlistModel*)self.headImgUrl[0];
        NSURL *url = [NSURL URLWithString:list.coverImg];
        return url;
    }
    else 
    {
        NewsAdintroModel *intro = (NewsAdintroModel*)self.headImgUrl[row];
        NSURL *url = [NSURL URLWithString:intro.pic];
        return url;
    }
    
}
/** 滚动展示栏的文字 */
- (NSString *)titleForRowInIndexPic:(NSInteger)row
{
    if (self.headImgUrl.count>0) {
        if (row == 0) {
            
            NewsItemlistModel *list = (NewsItemlistModel *)self.headImgUrl[0];
            return list.title;
        }
        else{
            NewsAdintroModel *intro = (NewsAdintroModel*)self.headImgUrl[row];
            return intro.caption;
        }

    }
    else
        return @"";
    
    
}

- (NSURL *)htmlURLForRowInIndexPic:(NSInteger)row
{
    
        
        if (row == 0) {
            
            NewsItemlistModel *list = (NewsItemlistModel *)self.headImgUrl[0];
            NSURL *url = [NSURL URLWithString:list.weburl];
            return url;
            
        }
        else{
            NewsAdintroModel *intro = (NewsAdintroModel*)self.headImgUrl[row];
            NSURL *url = [NSURL URLWithString:intro.url];
            return url;
        }
        
 
}

-(NSURL *)htmlURLForRowIndata:(NSInteger)row
{
    NSURL *url =[NSURL URLWithString:[self NewsItemListModelForRow:row].weburl];
    return url;
}




@end
