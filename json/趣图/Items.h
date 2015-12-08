//
//  Items.h
//
//  Created by   on 15/11/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Items : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *wpicSmall;
@property (nonatomic, strong) NSString *wSensitive;
@property (nonatomic, strong) NSString *wpicMWidth;
@property (nonatomic, strong) NSString *isGif;
@property (nonatomic, strong) NSString *likes;
@property (nonatomic, strong) NSString *wpicMiddle;
@property (nonatomic, strong) NSString *wpicSHeight;
@property (nonatomic, strong) NSString *wpicLarge;
@property (nonatomic, strong) NSString *wbody;
@property (nonatomic, strong) NSString *wid;
@property (nonatomic, strong) NSString *wpicMHeight;
@property (nonatomic, strong) NSString *wpicSWidth;
@property (nonatomic, strong) NSString *updateTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
