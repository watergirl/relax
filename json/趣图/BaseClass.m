//
//  BaseClass.m
//
//  Created by   on 15/11/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Items.h"
#import "LuaVersions.h"


NSString *const kBaseClassCategory = @"category";
NSString *const kBaseClassDataServerUrl = @"data_server_url";
NSString *const kBaseClassUseAdview = @"use_adview";
NSString *const kBaseClassVip = @"vip";
NSString *const kBaseClassInReviewAppVer = @"in_review_app_ver";
NSString *const kBaseClassUseLsAdMgr = @"use_ls_ad_mgr";
NSString *const kBaseClassTotal = @"total";
NSString *const kBaseClassCommentsHidden = @"comments_hidden";
NSString *const kBaseClassEncrypted = @"encrypted";
NSString *const kBaseClassIp = @"ip";
NSString *const kBaseClassItems = @"items";
NSString *const kBaseClassPage = @"page";
NSString *const kBaseClassNewCount = @"new_count";
NSString *const kBaseClassLuaVersions = @"lua_versions";
NSString *const kBaseClassPageSize = @"page_size";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize category = _category;
@synthesize dataServerUrl = _dataServerUrl;
@synthesize useAdview = _useAdview;
@synthesize vip = _vip;
@synthesize inReviewAppVer = _inReviewAppVer;
@synthesize useLsAdMgr = _useLsAdMgr;
@synthesize total = _total;
@synthesize commentsHidden = _commentsHidden;
@synthesize encrypted = _encrypted;
@synthesize ip = _ip;
@synthesize items = _items;
@synthesize page = _page;
@synthesize newCount = _newCount;
@synthesize luaVersions = _luaVersions;
@synthesize pageSize = _pageSize;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.category = [self objectOrNilForKey:kBaseClassCategory fromDictionary:dict];
            self.dataServerUrl = [self objectOrNilForKey:kBaseClassDataServerUrl fromDictionary:dict];
            self.useAdview = [[self objectOrNilForKey:kBaseClassUseAdview fromDictionary:dict] doubleValue];
            self.vip = [[self objectOrNilForKey:kBaseClassVip fromDictionary:dict] doubleValue];
            self.inReviewAppVer = [self objectOrNilForKey:kBaseClassInReviewAppVer fromDictionary:dict];
            self.useLsAdMgr = [[self objectOrNilForKey:kBaseClassUseLsAdMgr fromDictionary:dict] doubleValue];
            self.total = [[self objectOrNilForKey:kBaseClassTotal fromDictionary:dict] doubleValue];
            self.commentsHidden = [[self objectOrNilForKey:kBaseClassCommentsHidden fromDictionary:dict] doubleValue];
            self.encrypted = [[self objectOrNilForKey:kBaseClassEncrypted fromDictionary:dict] doubleValue];
            self.ip = [self objectOrNilForKey:kBaseClassIp fromDictionary:dict];
    NSObject *receivedItems = [dict objectForKey:kBaseClassItems];
    NSMutableArray *parsedItems = [NSMutableArray array];
    if ([receivedItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedItems addObject:[Items modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedItems isKindOfClass:[NSDictionary class]]) {
       [parsedItems addObject:[Items modelObjectWithDictionary:(NSDictionary *)receivedItems]];
    }

    self.items = [NSArray arrayWithArray:parsedItems];
            self.page = [self objectOrNilForKey:kBaseClassPage fromDictionary:dict];
            self.newCount = [self objectOrNilForKey:kBaseClassNewCount fromDictionary:dict];
            self.luaVersions = [LuaVersions modelObjectWithDictionary:[dict objectForKey:kBaseClassLuaVersions]];
            self.pageSize = [self objectOrNilForKey:kBaseClassPageSize fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.category forKey:kBaseClassCategory];
    [mutableDict setValue:self.dataServerUrl forKey:kBaseClassDataServerUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.useAdview] forKey:kBaseClassUseAdview];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vip] forKey:kBaseClassVip];
    [mutableDict setValue:self.inReviewAppVer forKey:kBaseClassInReviewAppVer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.useLsAdMgr] forKey:kBaseClassUseLsAdMgr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kBaseClassTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsHidden] forKey:kBaseClassCommentsHidden];
    [mutableDict setValue:[NSNumber numberWithDouble:self.encrypted] forKey:kBaseClassEncrypted];
    [mutableDict setValue:self.ip forKey:kBaseClassIp];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kBaseClassItems];
    [mutableDict setValue:self.page forKey:kBaseClassPage];
    [mutableDict setValue:self.newCount forKey:kBaseClassNewCount];
    [mutableDict setValue:[self.luaVersions dictionaryRepresentation] forKey:kBaseClassLuaVersions];
    [mutableDict setValue:self.pageSize forKey:kBaseClassPageSize];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.category = [aDecoder decodeObjectForKey:kBaseClassCategory];
    self.dataServerUrl = [aDecoder decodeObjectForKey:kBaseClassDataServerUrl];
    self.useAdview = [aDecoder decodeDoubleForKey:kBaseClassUseAdview];
    self.vip = [aDecoder decodeDoubleForKey:kBaseClassVip];
    self.inReviewAppVer = [aDecoder decodeObjectForKey:kBaseClassInReviewAppVer];
    self.useLsAdMgr = [aDecoder decodeDoubleForKey:kBaseClassUseLsAdMgr];
    self.total = [aDecoder decodeDoubleForKey:kBaseClassTotal];
    self.commentsHidden = [aDecoder decodeDoubleForKey:kBaseClassCommentsHidden];
    self.encrypted = [aDecoder decodeDoubleForKey:kBaseClassEncrypted];
    self.ip = [aDecoder decodeObjectForKey:kBaseClassIp];
    self.items = [aDecoder decodeObjectForKey:kBaseClassItems];
    self.page = [aDecoder decodeObjectForKey:kBaseClassPage];
    self.newCount = [aDecoder decodeObjectForKey:kBaseClassNewCount];
    self.luaVersions = [aDecoder decodeObjectForKey:kBaseClassLuaVersions];
    self.pageSize = [aDecoder decodeObjectForKey:kBaseClassPageSize];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_category forKey:kBaseClassCategory];
    [aCoder encodeObject:_dataServerUrl forKey:kBaseClassDataServerUrl];
    [aCoder encodeDouble:_useAdview forKey:kBaseClassUseAdview];
    [aCoder encodeDouble:_vip forKey:kBaseClassVip];
    [aCoder encodeObject:_inReviewAppVer forKey:kBaseClassInReviewAppVer];
    [aCoder encodeDouble:_useLsAdMgr forKey:kBaseClassUseLsAdMgr];
    [aCoder encodeDouble:_total forKey:kBaseClassTotal];
    [aCoder encodeDouble:_commentsHidden forKey:kBaseClassCommentsHidden];
    [aCoder encodeDouble:_encrypted forKey:kBaseClassEncrypted];
    [aCoder encodeObject:_ip forKey:kBaseClassIp];
    [aCoder encodeObject:_items forKey:kBaseClassItems];
    [aCoder encodeObject:_page forKey:kBaseClassPage];
    [aCoder encodeObject:_newCount forKey:kBaseClassNewCount];
    [aCoder encodeObject:_luaVersions forKey:kBaseClassLuaVersions];
    [aCoder encodeObject:_pageSize forKey:kBaseClassPageSize];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.category = [self.category copyWithZone:zone];
        copy.dataServerUrl = [self.dataServerUrl copyWithZone:zone];
        copy.useAdview = self.useAdview;
        copy.vip = self.vip;
        copy.inReviewAppVer = [self.inReviewAppVer copyWithZone:zone];
        copy.useLsAdMgr = self.useLsAdMgr;
        copy.total = self.total;
        copy.commentsHidden = self.commentsHidden;
        copy.encrypted = self.encrypted;
        copy.ip = [self.ip copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.page = [self.page copyWithZone:zone];
        copy.newCount = [self.newCount copyWithZone:zone];
        copy.luaVersions = [self.luaVersions copyWithZone:zone];
        copy.pageSize = [self.pageSize copyWithZone:zone];
    }
    
    return copy;
}


@end
