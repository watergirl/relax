//
//  LuaVersions.m
//
//  Created by   on 15/11/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "LuaVersions.h"


NSString *const kLuaVersionsMiaopai = @"miaopai";
NSString *const kLuaVersionsTudou = @"tudou";
NSString *const kLuaVersions56 = @"56";
NSString *const kLuaVersionsSohu = @"sohu";
NSString *const kLuaVersionsYouku = @"youku";


@interface LuaVersions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LuaVersions

@synthesize miaopai = _miaopai;
@synthesize tudou = _tudou;
@synthesize 56 = _56;
@synthesize sohu = _sohu;
@synthesize youku = _youku;


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
            self.miaopai = [[self objectOrNilForKey:kLuaVersionsMiaopai fromDictionary:dict] doubleValue];
            self.tudou = [[self objectOrNilForKey:kLuaVersionsTudou fromDictionary:dict] doubleValue];
            self.56 = [[self objectOrNilForKey:kLuaVersions56 fromDictionary:dict] doubleValue];
            self.sohu = [[self objectOrNilForKey:kLuaVersionsSohu fromDictionary:dict] doubleValue];
            self.youku = [[self objectOrNilForKey:kLuaVersionsYouku fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.miaopai] forKey:kLuaVersionsMiaopai];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tudou] forKey:kLuaVersionsTudou];
    [mutableDict setValue:[NSNumber numberWithDouble:self.56] forKey:kLuaVersions56];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sohu] forKey:kLuaVersionsSohu];
    [mutableDict setValue:[NSNumber numberWithDouble:self.youku] forKey:kLuaVersionsYouku];

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

    self.miaopai = [aDecoder decodeDoubleForKey:kLuaVersionsMiaopai];
    self.tudou = [aDecoder decodeDoubleForKey:kLuaVersionsTudou];
    self.56 = [aDecoder decodeDoubleForKey:kLuaVersions56];
    self.sohu = [aDecoder decodeDoubleForKey:kLuaVersionsSohu];
    self.youku = [aDecoder decodeDoubleForKey:kLuaVersionsYouku];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_miaopai forKey:kLuaVersionsMiaopai];
    [aCoder encodeDouble:_tudou forKey:kLuaVersionsTudou];
    [aCoder encodeDouble:_56 forKey:kLuaVersions56];
    [aCoder encodeDouble:_sohu forKey:kLuaVersionsSohu];
    [aCoder encodeDouble:_youku forKey:kLuaVersionsYouku];
}

- (id)copyWithZone:(NSZone *)zone
{
    LuaVersions *copy = [[LuaVersions alloc] init];
    
    if (copy) {

        copy.miaopai = self.miaopai;
        copy.tudou = self.tudou;
        copy.56 = self.56;
        copy.sohu = self.sohu;
        copy.youku = self.youku;
    }
    
    return copy;
}


@end
