//
//  NewsNetModel.h
//  BaseProject
//
//  Created by iOS－30 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "NewsModel.h"

typedef NS_ENUM(NSUInteger,NewsType) {
    NewsTypeFocus,      //推荐
    NewsTypeRealtime,   //即时快讯
    NewsTypeFeatures,   //独家
    NewsTypeFinance,    //财经
    NewsTypeEnt,        //文娱
    NewsTypeInfographic,//图个明白
    NewsTypeLivenews,   //动态新闻
    NewsTypeZhengshi,   //政事儿
    NewsTypeBook,       //书评周刊
    NewsTypeOpinion,     //评论
    NewsTypeXjbjzd,      //教之道
    NewsTypeNotes,       //记者手记
    NewsTypeBeijingHouse,//V房产
    NewsTypeXjbcmyj,     //新京报传媒研究
    NewsTypeXjbmaker,    //中国创客
    NewsTypeXjbxinshipin,//绿松鼠
    NewsTypeXjbyueche,   //阅车
    NewsTypeXjbs,        //染色体
    NewsTypeBeijingnews2003,//摩登WEEKLY
    NewsTypeXjbxuejie,       //学习公社
    NewsTypeXjbjiangkang     //趣健康
    
};

@interface NewsNetModel : BaseNetManager

+ (id)getNewsType:(NewsType)type completionHandle:(void(^)(NewsModel *model,NSError *error))completionHandle;
@end
