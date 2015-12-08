//
//  NewsModel.h
//  BaseProject
//
//  Created by iOS－30 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class NewsAdintroModel,NewsItemlistModel,NewsItemListStdimageModel;
@interface NewsModel : BaseModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<NewsAdintroModel *> *adIntro;

@property (nonatomic, copy) NSString *pubDate;

@property (nonatomic, assign) NSInteger channelId;

@property (nonatomic, strong) NSArray<NewsItemlistModel *> *itemList;

@end
@interface NewsAdintroModel : NSObject

@property (nonatomic, copy) NSString *picV4;

@property (nonatomic, copy) NSString *Id;

@property (nonatomic,copy)  NSString * caption;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *url;

@end

@interface NewsItemlistModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *coverImg;

@property (nonatomic, assign) NSInteger supportCount;

@property (nonatomic, assign) NSInteger isOutsideLink;

@property (nonatomic, strong) NSArray<NewsItemListStdimageModel *> *stdImage;

@property (nonatomic, copy) NSString *coverImgCaption;

@property (nonatomic, strong) NSArray *extImage;

@property (nonatomic, copy) NSString *pubDate;

@property (nonatomic, strong) NSArray<NSString *> *content;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger opposeCount;

@property (nonatomic, assign) NSInteger isVote;

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, strong) NSArray *related;

@property (nonatomic, copy) NSString *weburl;

@property (nonatomic, strong) NSArray *video;

@end

@interface NewsItemListStdimageModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *caption;

@property (nonatomic, copy) NSString *isShowInContent;

@end

