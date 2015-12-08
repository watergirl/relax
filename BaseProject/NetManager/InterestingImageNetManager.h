//
//  InterestingImageNetManager.h
//  BaseProject
//
//  Created by ios－31 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "InterestingImageModel.h"
@interface InterestingImageNetManager : BaseNetManager
+(id)Getpage:(NSInteger)page Size:(NSInteger)size NsstringPath:(NSString *)path completetionHandle:(void(^)(InterestingImageModel * model,NSError * error))compleretionHandle;


@end
