//
//  InterestingImageModel.h
//  BaseProject
//
//  Created by ios－32 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class InterestingImageLuaVersionsModel;


@interface InterestingImageModel : BaseModel

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *dataServerUrl;
@property (nonatomic, assign) double useAdview;
@property (nonatomic, assign) double vip;
@property (nonatomic, strong) NSString *inReviewAppVer;
@property (nonatomic, assign) double useLsAdMgr;
@property (nonatomic, assign) double total;
@property (nonatomic, assign) double commentsHidden;
@property (nonatomic, assign) double encrypted;
@property (nonatomic, strong) NSString *ip;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *page;
@property (nonatomic, strong) NSString *anewCount;
@property (nonatomic, strong) InterestingImageLuaVersionsModel *luaVersions;
@property (nonatomic, strong) NSString *pageSize;
@end

@interface InterestingImageLuaVersionsModel : NSObject

@property (nonatomic, assign) double miaopai;
@property (nonatomic, assign) double tudou;
@property (nonatomic, assign) double fiveSix;
@property (nonatomic, assign) double sohu;
@property (nonatomic, assign) double youku;

@end

@interface InterestingImageItemsModel : NSObject
@property (nonatomic, strong) NSString *comments;//评论数
@property (nonatomic, strong) NSString *wpicSmall;
@property (nonatomic, strong) NSString *wSensitive;
@property (nonatomic, strong) NSString *wpicMWidth;
@property (nonatomic, strong) NSString *isGif;//是不是动图
@property (nonatomic, strong) NSString *likes;
@property (nonatomic, strong) NSString *wpicMiddle;//中图地址
@property (nonatomic, strong) NSString *wpicSHeight;//小图地址
@property (nonatomic, strong) NSString *wpicLarge;//大图地址
@property (nonatomic, strong) NSString *wbody;//title
@property (nonatomic, strong) NSString *wid;
@property (nonatomic, strong) NSString *wpicMHeight;
@property (nonatomic, strong) NSString *wpicSWidth;
@property (nonatomic, strong) NSString *updateTime;

@end