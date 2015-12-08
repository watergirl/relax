//
//  TuWanVideoModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class TuWanVideoContentModel1,TuWanVideoRelevantModel1;
@interface TuWanVideoModel1 : BaseModel

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;

@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, strong) NSArray<TuWanVideoRelevantModel1 *> *relevant;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, strong) NSArray<TuWanVideoContentModel1 *> *content;

@property (nonatomic, copy) NSString *desc;

@end
@interface TuWanVideoContentModel1 : BaseModel

@property (nonatomic, copy) NSString *video;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *text;

@end

@interface TuWanVideoRelevantModel1 : BaseModel

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *pubdate;

@end

