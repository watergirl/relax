//
//  TuWanPicViewModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewModel1.h"
#import "TuWanNetManager1.h"

@implementation TuWanPicViewModel1

- (id)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}
/** 防御性编程，不允许使用init初始化 */
- (id)init{
    if (self = [super init]) {
//%s->__func__  会显示 哪个类中的哪个方法
        NSAssert1(NO, @"%s 必须使用initWithAid初始化", __func__);
    }
    return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [TuWanNetManager1 getPicDetailWithId:_aid completionHandle:^(TuWanPicModel1 *model, NSError *error) {
        self.picModel = model;
        completionHandle(error);
    }];
}
- (NSInteger)rowNumber{
    return self.picModel.content.count;
}
- (NSURL *)picURLForRow:(NSInteger)row{
    TuWanPicContentModel1 *model = self.picModel.content[row];
    return [NSURL URLWithString:model.pic];
}

@end











