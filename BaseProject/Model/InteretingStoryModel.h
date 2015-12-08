//
//  InteretingStoryModel.h
//  BaseProject
//
//  Created by ios－32 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class InteretingStoryLuaVersionsModel;


@interface InteretingStoryModel : BaseModel
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *dataServerUrl;
@property (nonatomic, assign) double vip;
@property (nonatomic, assign) double useAdview;
@property (nonatomic, strong) NSString *inReviewAppVer;
@property (nonatomic, assign) double useLsAdMgr;
@property (nonatomic, assign) double total;
@property (nonatomic, assign) double commentsHidden;
@property (nonatomic, assign) double encrypted;
@property (nonatomic, strong) NSString *ip;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *page;
@property (nonatomic, strong) NSString *pageSize;
@property (nonatomic, strong) NSString *anewCount;
@property (nonatomic, strong) InteretingStoryLuaVersionsModel *luaVersions;
@end

@interface InteretingStoryLuaVersionsModel : NSObject
@property (nonatomic, assign) double miaopai;
@property (nonatomic, assign) double tudou;
@property (nonatomic, assign) double fiveSix;
@property (nonatomic, assign) double sohu;
@property (nonatomic, assign) double youku;
@end

@interface InteretingStoryItemModel : NSObject
@property (nonatomic, strong) NSString *wbody; //主文
@property (nonatomic, strong) NSString *likes;//点赞数（注意是小数，我们要去掉）
@property (nonatomic, strong) NSString *wid;
@property (nonatomic, strong) NSString *wSensitive;
@property (nonatomic, strong) NSString *comments; //评论数
@property (nonatomic, strong) NSString *updateTime;
@end







