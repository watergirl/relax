//
//  TuWanModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class TuWanDataModel1,TuWanDataIndexpicModel1,TuWanDataIndexpicInfochildModel1,TuWanDataIndexpicShowitemModel1,TuWanDataIndexpicShowitemInfoModel1;
@interface TuWanModel1: BaseModel

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) TuWanDataModel1 *data;

@property (nonatomic, copy) NSString *code;

@end
@interface TuWanDataModel1 : BaseModel

@property (nonatomic, strong) NSArray<TuWanDataIndexpicModel1 *> *indexpic;

@property (nonatomic, strong) NSArray<TuWanDataIndexpicModel1 *> *list;

@end

@interface TuWanDataIndexpicModel1 : BaseModel

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

@property (nonatomic, strong) TuWanDataIndexpicInfochildModel1 *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, strong) NSArray<TuWanDataIndexpicShowitemModel1 *> *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *desc;

@end

@interface TuWanDataIndexpicInfochildModel1 : BaseModel

@property (nonatomic, copy) NSString *later;

@property (nonatomic, copy) NSString *cn;

@property (nonatomic, copy) NSString *facial;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, copy) NSString *shoot;

@end

@interface TuWanDataIndexpicShowitemModel1 : BaseModel

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) TuWanDataIndexpicShowitemInfoModel1 *info;

@end

@interface TuWanDataIndexpicShowitemInfoModel1 : BaseModel

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;

@end


