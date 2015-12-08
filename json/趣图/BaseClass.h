//
//  BaseClass.h
//
//  Created by   on 15/11/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LuaVersions;

@interface BaseClass : NSObject <NSCoding, NSCopying>

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
@property (nonatomic, strong) NSString *newCount;
@property (nonatomic, strong) LuaVersions *luaVersions;
@property (nonatomic, strong) NSString *pageSize;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
