//
//  LuaVersions.h
//
//  Created by   on 15/11/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LuaVersions : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double miaopai;
@property (nonatomic, assign) double tudou;
@property (nonatomic, assign) double 56;
@property (nonatomic, assign) double sohu;
@property (nonatomic, assign) double youku;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
