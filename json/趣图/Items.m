//
//  Items.m
//
//  Created by   on 15/11/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Items.h"


NSString *const kItemsComments = @"comments";
NSString *const kItemsWpicSmall = @"wpic_small";
NSString *const kItemsWSensitive = @"w_sensitive";
NSString *const kItemsWpicMWidth = @"wpic_m_width";
NSString *const kItemsIsGif = @"is_gif";
NSString *const kItemsLikes = @"likes";
NSString *const kItemsWpicMiddle = @"wpic_middle";
NSString *const kItemsWpicSHeight = @"wpic_s_height";
NSString *const kItemsWpicLarge = @"wpic_large";
NSString *const kItemsWbody = @"wbody";
NSString *const kItemsWid = @"wid";
NSString *const kItemsWpicMHeight = @"wpic_m_height";
NSString *const kItemsWpicSWidth = @"wpic_s_width";
NSString *const kItemsUpdateTime = @"update_time";


@interface Items ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Items

@synthesize comments = _comments;
@synthesize wpicSmall = _wpicSmall;
@synthesize wSensitive = _wSensitive;
@synthesize wpicMWidth = _wpicMWidth;
@synthesize isGif = _isGif;
@synthesize likes = _likes;
@synthesize wpicMiddle = _wpicMiddle;
@synthesize wpicSHeight = _wpicSHeight;
@synthesize wpicLarge = _wpicLarge;
@synthesize wbody = _wbody;
@synthesize wid = _wid;
@synthesize wpicMHeight = _wpicMHeight;
@synthesize wpicSWidth = _wpicSWidth;
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
            self.comments = [self objectOrNilForKey:kItemsComments fromDictionary:dict];
            self.wpicSmall = [self objectOrNilForKey:kItemsWpicSmall fromDictionary:dict];
            self.wSensitive = [self objectOrNilForKey:kItemsWSensitive fromDictionary:dict];
            self.wpicMWidth = [self objectOrNilForKey:kItemsWpicMWidth fromDictionary:dict];
            self.isGif = [self objectOrNilForKey:kItemsIsGif fromDictionary:dict];
            self.likes = [self objectOrNilForKey:kItemsLikes fromDictionary:dict];
            self.wpicMiddle = [self objectOrNilForKey:kItemsWpicMiddle fromDictionary:dict];
            self.wpicSHeight = [self objectOrNilForKey:kItemsWpicSHeight fromDictionary:dict];
            self.wpicLarge = [self objectOrNilForKey:kItemsWpicLarge fromDictionary:dict];
            self.wbody = [self objectOrNilForKey:kItemsWbody fromDictionary:dict];
            self.wid = [self objectOrNilForKey:kItemsWid fromDictionary:dict];
            self.wpicMHeight = [self objectOrNilForKey:kItemsWpicMHeight fromDictionary:dict];
            self.wpicSWidth = [self objectOrNilForKey:kItemsWpicSWidth fromDictionary:dict];
            self.updateTime = [self objectOrNilForKey:kItemsUpdateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.comments forKey:kItemsComments];
    [mutableDict setValue:self.wpicSmall forKey:kItemsWpicSmall];
    [mutableDict setValue:self.wSensitive forKey:kItemsWSensitive];
    [mutableDict setValue:self.wpicMWidth forKey:kItemsWpicMWidth];
    [mutableDict setValue:self.isGif forKey:kItemsIsGif];
    [mutableDict setValue:self.likes forKey:kItemsLikes];
    [mutableDict setValue:self.wpicMiddle forKey:kItemsWpicMiddle];
    [mutableDict setValue:self.wpicSHeight forKey:kItemsWpicSHeight];
    [mutableDict setValue:self.wpicLarge forKey:kItemsWpicLarge];
    [mutableDict setValue:self.wbody forKey:kItemsWbody];
    [mutableDict setValue:self.wid forKey:kItemsWid];
    [mutableDict setValue:self.wpicMHeight forKey:kItemsWpicMHeight];
    [mutableDict setValue:self.wpicSWidth forKey:kItemsWpicSWidth];
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

    self.comments = [aDecoder decodeObjectForKey:kItemsComments];
    self.wpicSmall = [aDecoder decodeObjectForKey:kItemsWpicSmall];
    self.wSensitive = [aDecoder decodeObjectForKey:kItemsWSensitive];
    self.wpicMWidth = [aDecoder decodeObjectForKey:kItemsWpicMWidth];
    self.isGif = [aDecoder decodeObjectForKey:kItemsIsGif];
    self.likes = [aDecoder decodeObjectForKey:kItemsLikes];
    self.wpicMiddle = [aDecoder decodeObjectForKey:kItemsWpicMiddle];
    self.wpicSHeight = [aDecoder decodeObjectForKey:kItemsWpicSHeight];
    self.wpicLarge = [aDecoder decodeObjectForKey:kItemsWpicLarge];
    self.wbody = [aDecoder decodeObjectForKey:kItemsWbody];
    self.wid = [aDecoder decodeObjectForKey:kItemsWid];
    self.wpicMHeight = [aDecoder decodeObjectForKey:kItemsWpicMHeight];
    self.wpicSWidth = [aDecoder decodeObjectForKey:kItemsWpicSWidth];
    self.updateTime = [aDecoder decodeObjectForKey:kItemsUpdateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_comments forKey:kItemsComments];
    [aCoder encodeObject:_wpicSmall forKey:kItemsWpicSmall];
    [aCoder encodeObject:_wSensitive forKey:kItemsWSensitive];
    [aCoder encodeObject:_wpicMWidth forKey:kItemsWpicMWidth];
    [aCoder encodeObject:_isGif forKey:kItemsIsGif];
    [aCoder encodeObject:_likes forKey:kItemsLikes];
    [aCoder encodeObject:_wpicMiddle forKey:kItemsWpicMiddle];
    [aCoder encodeObject:_wpicSHeight forKey:kItemsWpicSHeight];
    [aCoder encodeObject:_wpicLarge forKey:kItemsWpicLarge];
    [aCoder encodeObject:_wbody forKey:kItemsWbody];
    [aCoder encodeObject:_wid forKey:kItemsWid];
    [aCoder encodeObject:_wpicMHeight forKey:kItemsWpicMHeight];
    [aCoder encodeObject:_wpicSWidth forKey:kItemsWpicSWidth];
    [aCoder encodeObject:_updateTime forKey:kItemsUpdateTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    Items *copy = [[Items alloc] init];
    
    if (copy) {

        copy.comments = [self.comments copyWithZone:zone];
        copy.wpicSmall = [self.wpicSmall copyWithZone:zone];
        copy.wSensitive = [self.wSensitive copyWithZone:zone];
        copy.wpicMWidth = [self.wpicMWidth copyWithZone:zone];
        copy.isGif = [self.isGif copyWithZone:zone];
        copy.likes = [self.likes copyWithZone:zone];
        copy.wpicMiddle = [self.wpicMiddle copyWithZone:zone];
        copy.wpicSHeight = [self.wpicSHeight copyWithZone:zone];
        copy.wpicLarge = [self.wpicLarge copyWithZone:zone];
        copy.wbody = [self.wbody copyWithZone:zone];
        copy.wid = [self.wid copyWithZone:zone];
        copy.wpicMHeight = [self.wpicMHeight copyWithZone:zone];
        copy.wpicSWidth = [self.wpicSWidth copyWithZone:zone];
        copy.updateTime = [self.updateTime copyWithZone:zone];
    }
    
    return copy;
}


@end
