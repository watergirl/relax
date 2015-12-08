//
//  Items.m
//
//  Created by   on 15/11/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Items.h"


NSString *const kItemsWbody = @"wbody";
NSString *const kItemsLikes = @"likes";
NSString *const kItemsWid = @"wid";
NSString *const kItemsWSensitive = @"w_sensitive";
NSString *const kItemsComments = @"comments";
NSString *const kItemsUpdateTime = @"update_time";


@interface Items ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Items

@synthesize wbody = _wbody;
@synthesize likes = _likes;
@synthesize wid = _wid;
@synthesize wSensitive = _wSensitive;
@synthesize comments = _comments;
@synthesize updateTime = _updateTime;


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
            self.wbody = [self objectOrNilForKey:kItemsWbody fromDictionary:dict];
            self.likes = [self objectOrNilForKey:kItemsLikes fromDictionary:dict];
            self.wid = [self objectOrNilForKey:kItemsWid fromDictionary:dict];
            self.wSensitive = [self objectOrNilForKey:kItemsWSensitive fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kItemsComments fromDictionary:dict];
            self.updateTime = [self objectOrNilForKey:kItemsUpdateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.wbody forKey:kItemsWbody];
    [mutableDict setValue:self.likes forKey:kItemsLikes];
    [mutableDict setValue:self.wid forKey:kItemsWid];
    [mutableDict setValue:self.wSensitive forKey:kItemsWSensitive];
    [mutableDict setValue:self.comments forKey:kItemsComments];
    [mutableDict setValue:self.updateTime forKey:kItemsUpdateTime];

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

    self.wbody = [aDecoder decodeObjectForKey:kItemsWbody];
    self.likes = [aDecoder decodeObjectForKey:kItemsLikes];
    self.wid = [aDecoder decodeObjectForKey:kItemsWid];
    self.wSensitive = [aDecoder decodeObjectForKey:kItemsWSensitive];
    self.comments = [aDecoder decodeObjectForKey:kItemsComments];
    self.updateTime = [aDecoder decodeObjectForKey:kItemsUpdateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_wbody forKey:kItemsWbody];
    [aCoder encodeObject:_likes forKey:kItemsLikes];
    [aCoder encodeObject:_wid forKey:kItemsWid];
    [aCoder encodeObject:_wSensitive forKey:kItemsWSensitive];
    [aCoder encodeObject:_comments forKey:kItemsComments];
    [aCoder encodeObject:_updateTime forKey:kItemsUpdateTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    Items *copy = [[Items alloc] init];
    
    if (copy) {

        copy.wbody = [self.wbody copyWithZone:zone];
        copy.likes = [self.likes copyWithZone:zone];
        copy.wid = [self.wid copyWithZone:zone];
        copy.wSensitive = [self.wSensitive copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.updateTime = [self.updateTime copyWithZone:zone];
    }
    
    return copy;
}


@end
